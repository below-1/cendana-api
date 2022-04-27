import { prisma } from '@cend/commons/prisma'
import { format } from 'date-fns'
import { id as localeId } from 'date-fns/locale'
import * as DTO from '../finance.dto'
import { print } from '@cend/components/printer'
import { findReport } from './find-report.service'

export async function perubahanModal(options: DTO.PerubahanModal.Marker) : Promise<any | Buffer> {
  const { respType, ...opts } = options
  const report = await findReport(opts)
  if (respType == 'JSON') {
    return report
  } else {
    const d = new Date()
    d.setMonth(options.month)
    d.setFullYear(options.year)
    const data = {
      ...report,
      periode: format(d, 'dd MMMM yyyy', { locale: localeId })
    }
    const result = await print({ path: 'perubahan-modal.docx', data })
    return result
  }
}

