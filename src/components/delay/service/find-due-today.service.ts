import { startOfDay, endOfDay } from 'date-fns'
import { prisma } from '@cend/commons/prisma'
import {
  DelayType
} from '@prisma/client';


type Kind = 'PAYABLE' | 'RECEIVABLE' | 'ALL'

export async function findDueToday(kind: Kind, date: Date) {
  const t0 = startOfDay(date)
  const t1 = endOfDay(date)
  // const _items = await prisma.delay.findMany()
  // console.log(_items)
  // console.log(new Date(2021, 0, 24))
  const items = await prisma.delay.findMany({
    where: {
      dueDate: {
        gte: t0,
        lte: t1
      }
    },
    include: {
      order: {
        include: {
          targetUser: true
        }
      }
    }
  })
  return items
}