import express from "express";

import MetricService from "../services/metric.service";
import { createMetricSchema } from "../schemas/metric.schema";
import validatorHandler from "../middlewares/validator.handler";

const router = express.Router();
const service = new MetricService();

router.post(
  "/",
  validatorHandler(createMetricSchema, `body`),
  async (req, res, next) => {
    try {
      const newMetric = await service.register(req.body);
      res.status(201).json(newMetric);
    } catch (error) {
      next(error);
    }
  }
);

export default router;
