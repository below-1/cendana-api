import { Static, Type } from '@sinclair/typebox';
import { DelayType } from '@prisma/client';
import { FindOptions } from '@cend/commons/find';

export namespace Find {
  export const Obj = Type.Intersect([
    Type.Object({
      complete: Type.Optional(Type.Boolean({ default: false })),
      type: Type.Optional(Type.Enum(DelayType))
    }),
    FindOptions.Obj
  ])

  export type Marker = Static<typeof Obj>;
}

export namespace DueToday {
  export const Obj = Type.Object({
    date: Type.Optional(Type.String({ format: 'date-time' })),
    kind: Type.Union([Type.Literal('PAYABLE'), Type.Literal('RECEIVABLE'), Type.Literal('ALL')])
  })

  export type Marker = Static<typeof Obj>
}
