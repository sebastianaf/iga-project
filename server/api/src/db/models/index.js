import { Agent, AgentSchema } from "./agent.model";
import { Metric, MetricSchema } from "./metric.model";
import { User, UserSchema } from "./user.model";

const setupModels = (sequelize) => {
  User.init(UserSchema, User.config(sequelize));
  Agent.init(AgentSchema, Agent.config(sequelize));
  Metric.init(MetricSchema, Metric.config(sequelize));

  /**
   *
   * Here the other models
   *
   */

  Agent.associate(sequelize.models)
  /**
   *
   * Here the other associations
   *
   */

};

export { setupModels };
