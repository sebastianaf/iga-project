import { Model, DataTypes, Sequelize } from "sequelize";
import { METRIC_TYPE_TABLE } from "./metricType.model";

const METRIC = "metrics";

const MetricSchema = {
  id: {
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
    type: DataTypes.INTEGER,
  },
  value: {
    allowNull: false,
    type: DataTypes.DOUBLE,
  },
  metricTypeId: {
    type: DataTypes.INTEGER,
    field: "metric_type_id",
    allowNull: false,
    references: {
      model: METRIC_TYPE_TABLE,
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
      tableName: METRIC,
      modelName: "Metrics",
      timestamps: false,
    };
  }
}

export { METRIC, MetricSchema, Metric };
