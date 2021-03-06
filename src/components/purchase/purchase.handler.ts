import { FastifyRequest as Request, FastifyReply as Reply } from 'fastify';
import * as DTO from './purchase.dto';
import * as services from './service';
import { ID } from '@cend/commons/request'

type PostRequest = Request<{ Body: DTO.Create.Marker }>;
type PutRequest = Request<{ Params: ID.Marker, Body: DTO.Update.Marker }>;
type FindOneRequest = Request<{ Params: ID.Marker }>;
type FindRequest = Request<{ Querystring: DTO.Find.Marker }>;
type SealRequest = Request<{ Params: ID.Marker, Body: DTO.SealTransaction.Marker }>;
type DelRequest = Request<{ Params: ID.Marker }>;

export async function post(request: PostRequest, reply: Reply) {
  const payload = request.body;
  const purchase = await services.create(payload);
  reply.send(purchase);
}

export async function put(request: PutRequest, reply: Reply) {
  const payload = request.body
  const { id } = request.params
  const result = await services.update(id, payload)
  reply.send(result);
}

export async function getOne(request: FindOneRequest, reply: Reply) {
  const purchase = await services.findById(request.params.id)
  reply.send(purchase);
}

export async function find(request: FindRequest, reply: Reply) {
  const {
    keyword,
    year,
    month,
    ...options
  } = request.query
  const conditions = {
    keyword,
    year,
    month
  }
  try {
    const result = await services.find(conditions, options);
    reply.send(result);
  } catch (err) {
    console.log(err);
    throw err;
  }
}

export async function seal(request: SealRequest, reply: Reply) {
  const { id } = request.params;
  const payload = {
    orderId: id,
    ...request.body
  };
  const result = await services.sealTransaction(payload);
  reply.send(result);
}

export async function remove(request: DelRequest, reply: Reply) {
  const { id } = request.params;
  const purchase = await services.remove(id);
  reply.send(purchase);
}
