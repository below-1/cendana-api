import { FastifyInstance } from 'fastify';
import { labaRugi, neraca, arusKas, perubahanModal } from './service'
import * as handlers from './finance.handler'
import * as DTO from './finance.dto'

export async function plugin(fastify: FastifyInstance) {

  fastify.post('/report', {
    schema: {
      tags: ['finance'],
      body: DTO.CreateReport.Obj
    },
    handler: handlers.postReport
  })

  fastify.get('/report', {
    schema: {
      tags: ['finance'],
      querystring: DTO.FindReport.Obj
    },
    handler: handlers.getReport
  })

  fastify.get<{ Querystring: DTO.LabaRugi.Marker }>('/laba-rugi', {
    schema: {
      tags: ['finance'],
      querystring: DTO.LabaRugi.Obj
    },
    handler: async (request, reply) => {
      const options = request.query
      const report = await labaRugi(options)
      const fname = `laba_rugi_${options.year}_${options.month}.docx`
      if (options.respType == 'WORD') {
        reply
          .header('Content-Type', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document')
          .header('Content-Disposition', `attachment; filename=${fname}`)
          .send(report)
      } else {
        reply.send(report)
      }
    }
  })

  fastify.get<{ Querystring: DTO.Neraca.Marker }>('/neraca', {
    schema: {
      tags: ['finance'],
      querystring: DTO.Neraca.Obj
    },
    handler: async (request, reply) => {
      const options = request.query
      const report = await neraca(options)
      const fname = `neraca_${options.year}_${options.month}.docx`
      if (options.respType == 'WORD') {
        reply
          .header('Content-Type', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document')
          .header('Content-Disposition', `attachment; filename=${fname}`)
          .send(report)
      } else {
        reply.send(report)
      }
    }
  })

  fastify.get<{ Querystring: DTO.ArusKas.Marker }>('/arus-kas', {
    schema: {
      tags: ['finance'],
      querystring: DTO.ArusKas.Obj
    },
    handler: async (request, reply) => {
      const options = request.query
      const report = await arusKas(options)
      const fname = `arus_kas_${options.year}_${options.month}.docx`
      if (options.respType == 'WORD') {
        reply
          .header('Content-Type', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document')
          .header('Content-Disposition', `attachment; filename=${fname}`)
          .send(report)
      } else {
        reply.send(report)
      }
    }
  })

  fastify.get<{ Querystring: DTO.PerubahanModal.Marker }>('/perubahan-modal', {
    schema: {
      tags: ['finance'],
      querystring: DTO.PerubahanModal.Obj
    },
    handler: async (request, reply) => {
      const options = request.query
      const report = await perubahanModal(options)
      const fname = `perubahan_modal_${options.year}_${options.month}.docx`
      if (options.respType == 'WORD') {
        reply
          .header('Content-Type', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document')
          .header('Content-Disposition', `attachment; filename=${fname}`)
          .send(report)
      } else {
        reply.send(report)
      }
    }
  })

}
