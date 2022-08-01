import Joi from "joi";

const uuid = Joi.string();
const name = Joi.string().min(2);
const alias = Joi.string().min(2);
const password = Joi.string().min(2);

const createUserSchema = Joi.object({
  uuid: uuid.required(),
  name: name.required(),
  alias: alias.required(),
  password: password.required(),
});

const updateUserSchema = Joi.object({
  uuid: uuid.required(),
  alias,
  name,
  password,
});

const getUserSchema = Joi.object({
  uuid: uuid.required(),
});

const loginUserSchema = Joi.object({
  alias: alias.required(),
  password: password.required(),
});

export { createUserSchema, updateUserSchema, getUserSchema, loginUserSchema };
