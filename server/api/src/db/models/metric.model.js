import { Model, DataTypes, Sequelize } from "sequelize";
import { AGENT_TABLE } from "./agent.model";

const METRIC_TABLE = "metrics";

const MetricSchema = {
  type: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  value: {
    type: DataTypes.TEXT,
    allowNull: false,
  },
  agentId: {
    type: DataTypes.INTEGER,
    field: "agent_id",
    allowNull: true,
    references: {
      model: AGENT_TABLE,
      key: "id",
    },
    onUpdate: "CASCADE",
    onDelete: "SET NULL",
  },
  createAt: {
    allowNull: true,
    field: "created_at",
    type: DataTypes.DATE,
    defaultValue: Sequelize.NOW,
  },
};

class Metric extends Model {
  static associate() {}

  static config(sequelize) {
    return {
      sequelize,
      tableName: METRIC_TABLE,
      modelName: "Metric",
      timestamps: false,
    };
  }
}

export { METRIC_TABLE, MetricSchema, Metric };
