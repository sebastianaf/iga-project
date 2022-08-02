import sequelize from "../db/sequelize";
import boom from "@hapi/boom";
import bcryptjs from "bcryptjs";

import errorCodes from "../config/errorCodes";

const { models } = sequelize;

class MetricService {
  constructor() {}

  async register(data) {
    try {
      const { type, value } = data;
      const newUser = models.Metric.create({
        type,
        value,
      });
      return newUser;
    } catch (error) {
      console.log(error);
      return boom.badRequest(error);
    }
  }
}

export default MetricService;
