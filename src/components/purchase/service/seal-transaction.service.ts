import { prisma } from '@cend/commons/prisma';
import {
  OrderStatus, 
  OrderType, 
  DelayType,
  TransactionStatus, 
  TransactionType, 
  PaymentMethod 
} from '@prisma/client';
import { Decimal } from '@prisma/client/runtime';

type DelayData = {
  dueDate: string;
}

export type SealTransactionPayload = {
  orderId: number;
  authorId: number;
  nominal: string;
  status: TransactionStatus;
  paymentMethod: PaymentMethod;
  delay?: DelayData;
}

export async function sealTransaction(payload: SealTransactionPayload) {
  const { orderId } = payload;
  const order = await prisma.order.findFirst({ 
    where: { AND: [
      { id: orderId },
      { orderType: OrderType.BUY }
    ]},
    include: {
      stockItems: true
    }
  })
  if (!order) {
    throw new Error(`can't find purchase with id=${orderId}`);
  }
  const { stockItems } = order;

  let statements = [];

  for (let stockItem of stockItems) {
    // Sync each product's stocks
    const syncProduct = prisma.product.update({
      where: {
        id: stockItem.productId
      },
      data: {
        available: {
          increment: stockItem.available
        },
        defect: {
          increment: stockItem.defect
        },
        returned: {
          increment: stockItem.returned
        },
        buyPrice: stockItem.buyPrice,
        sellPrice: stockItem.sellPrice,
        discount: stockItem.discount,
      }
    })
    statements.push(syncProduct);
  }

  // Seal Order
  const sealOrderStatement = prisma.order.update({
    where: {
      id: orderId
    },
    data: {
      orderStatus: OrderStatus.SEALED
    }
  });
  statements.push(sealOrderStatement);

  // Create Transaction
  const createTransStatement = prisma.transaction.create({
    data: {
      orderId,
      authorId: payload.authorId,
      type: TransactionType.CREDIT,
      status: payload.status,
      paymentMethod: payload.paymentMethod,
      nominal: payload.nominal,
      createdAt: order.createdAt
    }
  });
  statements.push(createTransStatement);

  const decimalNominal = new Decimal(payload.nominal);

  if (decimalNominal.lessThan(order.grandTotal)) {
    if (!payload.delay) {
      throw new Error(`Due Date of payment is not provided`);
    }
    const createDelayStatement = prisma.delay.create({
      data: {
        complete: false,
        authorId: payload.authorId,
        type: DelayType.PAYABLE,
        orderId,
        dueDate: new Date(payload.delay.dueDate),
        total: order.grandTotal.sub(decimalNominal).toString()
      }
    });
    statements.push(createDelayStatement);
  }
  
  await prisma.$transaction(statements);
}
