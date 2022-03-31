import { prisma } from '@cend/commons/prisma'
import { TotalResult } from './TotalResult'

export async function hpp(date: String) {
  const [ { total: result } ] = await prisma.$queryRaw<TotalResult>`
    select sum(rp.available * rp."sellPrice") total from "RecordProduct" rp where rp."date" = '${date}'`
  return result
}