import { Model, DataTypes, Sequelize } from "sequelize";

const AGENT_TABLE = "agents";

const AgentSchema = {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    allowNull: false,
    primaryKey: true,
  },
  uuid: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  alias: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
  },
  name: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
  },
  hostname: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  pid: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  connected: {
    type: DataTypes.BOOLEAN,
    allowNull: false,
    defaultValue: false,
  },
  createAt: {
    allowNull: true,
    field: "created_at",
    type: DataTypes.DATE,
    defaultValue: Sequelize.NOW,
  },
};

class Agent extends Model {
  static associate(models) {
    this.hasMany(models.Metric, { as: "metrics", foreignKey: "agentId" });
  }

  static config(sequelize) {
    return {
      sequelize,
      tableName: AGENT_TABLE,
      modelName: "Agent",
      timestamps: false,
    };
  }
}

export { AGENT_TABLE, AgentSchema, Agent };
