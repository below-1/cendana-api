import carbone from 'carbone'
import { join } from 'path'

interface PrintOptions {
  path: string;
  data: any;
}

export async function print(options: PrintOptions) {
  const fullPath = join(process.cwd(), 'report', options.path)
  return new Promise<Buffer>((resolve, reject) => {
    const carb_options = {
      lang: 'id',
      timezone: 'Asia/Makassar',
      currency: {
        source: 'IDR',
        target: 'IDR'
      }
    }
    const now = (new Date()).toISOString()
    const data = {
      ...options.data,
      now
    }
    carbone.render(fullPath, data, carb_options, (err, result) => {
      if (err) {
        reject(err)
        return
      }
      resolve(result as Buffer)
    })
  })
}
