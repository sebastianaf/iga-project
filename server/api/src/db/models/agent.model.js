import { Model, DataTypes, Sequelize } from "sequelize";

const AGENT_TABLE = "agents";

const AgentSchema = {
  uuid: {
    type: DataTypes.STRING,
    allowNull: false,
    primaryKey: true,
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
};

class Agent extends Model {
  static associate() {}

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
