import Joi from "joi";

const type = Joi.string().min(2);
const value = Joi.string();

const createMetricSchema = Joi.object({
  type,
  value: value.required(),
});

export { createMetricSchema };
