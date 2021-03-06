import { prisma } from '@cend/commons/prisma'
import { RecordProduct, RecordEquity } from '@prisma/client'
import { format } from 'date-fns'
import { Decimal } from '@prisma/client/runtime';
import { TotalResult } from './TotalResult'

async function snapshotInventory(target: Date) {
  const [ { total: hpp } ] = await prisma.$queryRaw<TotalResult>`
    select sum(p.available * p."sellPrice") total from "Product" p`

  await prisma.recordProduct.deleteMany({
    where: {
      date: target
    }
  })
  await prisma.recordProduct.create({
    data: {
      date: target,
      hpp: hpp ? hpp : 0
    }
  })
}

async function snapshotEquity(target: Date) {
  // Get previous snaphshot of equity
  let initial = new Decimal('0')
  let t0 = new Date(2015, 0, 1)
  const t1 = target
  const previousRecord = await prisma.recordEquity.findFirst({
    where: {
      createdAt: {
        lt: target
      }
    },
    orderBy: {
      createdAt: 'desc'
    }
  })
  if (previousRecord) {
    initial = initial.plus(previousRecord.nominal)
    t0 = previousRecord.createdAt
  }

  const [ { total: totalCredit } ] = await prisma.$queryRaw<TotalResult>`
    select coalesce(sum(t_credit.nominal), 0) as total 
      from "EquityChange" as ec 
      left join "Transaction" as t_credit on t_credit."equityChangeId" = ec.id and t_credit."type" = 'CREDIT'
      where ec."createdAt" > ${t0} and ec."createdAt" <= ${t1}
  `

  const [ { total: totalDebit } ] = await prisma.$queryRaw<TotalResult>`
    select coalesce(sum(t_debit.nominal), 0) as total 
      from "EquityChange" as ec 
      left join "Transaction" as t_debit on t_debit."equityChangeId" = ec.id and t_debit."type" = 'DEBIT'
      where ec."createdAt" > ${t0} and ec."createdAt" <= ${t1}
  `

  const total = new Decimal(totalCredit).sub(new Decimal(totalDebit))

  const nominal = initial.plus(total)

  await prisma.recordEquity.deleteMany({
    where: {
      createdAt: target
    }
  })
  await prisma.recordEquity.create({
    data: {
      createdAt: target,
      nominal
    }
  })
}

export async function snapshot(target: Date) {
  await snapshotEquity(target)
  await snapshotInventory(target)
}
