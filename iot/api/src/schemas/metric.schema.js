import Joi from "joi";

const value = Joi.number();
const type = Joi.number().integer().min(1).max(4);

const createMetricSchema = Joi.object({
  value: value.required(),
  type: type.required(),
});

export { createMetricSchema };
