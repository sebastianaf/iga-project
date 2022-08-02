import { User, UserSchema } from "./user.model";
import { Metric, MetricSchema } from "./metric.model";
import { MetricType, MetricTypeSchema } from "./metricType.model";

const setupModels = (sequelize) => {
  User.init(UserSchema, User.config(sequelize));
  Metric.init(MetricSchema, Metric.config(sequelize));
  MetricType.init(MetricTypeSchema, MetricType.config(sequelize));
  /**
   * 
   * Here the other models
   * 
   */
};

export { setupModels };
