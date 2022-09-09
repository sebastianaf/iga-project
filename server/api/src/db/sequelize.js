import { Sequelize } from "sequelize";
import db from "../config/db";
import { setupModels } from "./models";

const { database, host, password, port, user } = db;

const sequelize = new Sequelize(database, user, password, {
  dialect: "postgres",
  logging: false,
  host,
  port,
});

/**
 * Setup the models to Sequelize
 */
console.log(`Septing up models... OK`);
setupModels(sequelize);

/**
 * Sync the models with the database
 */
sequelize.sync({ force: false });
console.log(`Syncing models... OK`);

export default sequelize;
