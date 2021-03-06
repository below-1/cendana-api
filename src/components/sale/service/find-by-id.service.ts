import { prisma } from '@cend/commons/prisma';
import { OrderType } from '@prisma/client';

export async function findById(id: number) {
  const purchase = await prisma.order.findFirst({
    where: {
      AND: [
        { id },
        { orderType: OrderType.SALE }
      ]
    },
    include: {
      targetUser: true,
      author: true,
      delay: true,
      transaction: true
    }
  });
  if (!purchase) {
    throw new Error(`Sale(id=${id}) can't be found`);
  }
  return purchase;
}
