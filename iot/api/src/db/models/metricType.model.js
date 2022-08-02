import { Model, DataTypes, Sequelize } from "sequelize";

const METRIC_TYPE_TABLE = "metric_types";

const MetricTypeSchema = {
  id: {
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
    type: DataTypes.INTEGER,
  },
  value: {
    allowNull: false,
    type: DataTypes.STRING,
  },
  createAt: {
    allowNull: true,
    field: "created_at",
    type: DataTypes.DATE,
    defaultValue: Sequelize.NOW,
  },
};

class MetricType extends Model {
  static associate(models) {
    this.hasMany(models.Metric, { as: "metrics", foreignKey: "metricTypeId" });
  }

  static config(sequelize) {
    return {
      sequelize,
      tableName: METRIC_TYPE_TABLE,
      modelName: "MetricTypes",
      timestamps: false,
    };
  }
}

export { METRIC_TYPE_TABLE, MetricTypeSchema, MetricType };
