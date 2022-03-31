import { PrismaClient } from '@prisma/client'

const log: any = ['query', 'info', `warn`, `error`]

export const prisma = new PrismaClient({
  log: [
    {
      emit: "event",
      level: "query"
    }
  ]
});

prisma.$on('query', async (e) => {
  console.log(`${e.query} ${e.params}`)
})
