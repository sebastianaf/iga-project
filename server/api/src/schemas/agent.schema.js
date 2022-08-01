import Joi from "joi";

const id = Joi.number().integer();
const uuid = Joi.string();
const alias = Joi.string().min(2);
const name = Joi.string().min(2);
const hostname = Joi.string();
const pid = Joi.number().min(0);
const connected = Joi.bool();

const createAgentSchema = Joi.object({
  id: id.required(),
  alias,
  alias,
  name,
  hostname,
  pid,
  connected,
});

const updateAgentSchema = Joi.object({
  id: id.required(),
  uuid,
  alias,
  name,
  hostname,
  pid,
  connected,
});

const getAgentSchema = Joi.object({
  id: id.required(),
  uuid,
});

export { createAgentSchema, updateAgentSchema, getAgentSchema };
