import mosca from "mosca";
import redis from "redis";
import db from "./config/db";

console.log(db);

var settings = {
  port: db.port,
  backend: {
    type: "redis",
    redis,
    db: db.database,
    port: db.port,
    return_buffers: true,
    host: db.host,
  },
  persistence: {
    factory: mosca.persistence.Redis,
    host: db.host,
    port: db.port,
  },
};

const setup = () => {
  console.log("Mosca server is up and running");
};

const server = new mosca.Server(settings);

server.on("clientConnected", (client) => {
  console.log("client connected", client.id);
});

// fired when a message is received
server.on("published", (packet, client) => {
  console.log("Published", packet.payload);
});

server.on("ready", setup);

/* import debug from "debug";
import mosca from "mosca";
import redis from "redis";
import chalk from "chalk";
import db from "platziverse-db";

const backend = {
  type: "redis",
  redis,
  return_buffers: true,
};

const settings = {
  port: 1883,
  backend,
};

const config = {
  database: process.env.DB_NAME || "platziverse",
  username: process.env.DB_USER || "platzi",
  password: process.env.DB_PASS || "platzi",
  host: process.env.DB_HOST || "localhost",
  dialect: "postgres",
  logging: (s) => debug(s),
};

const server = new mosca.Server(settings);

let Agent, Metric;

server.on("clientConnected", (client) => {
  debug(`Client Connected: ${client.id}`);
});

server.on("clientDisconnected", (client) => {
  debug(`Client Disconnected: ${client.id}`);
});

server.on("published", (packet, client) => {
  debug(`Received: ${packet.topic}`);
  debug(`Payload: ${packet.payload}`);
});

server.on("ready", async () => {
  const services = await db(config).catch(handleFatalError);

  Agent = services.Agent;
  Metric = services.Metric;

  console.log(`${chalk.green("[platziverse-mqtt]")} server is running`);
});

server.on("error", handleFatalError);

function handleFatalError(err) {
  console.error(`${chalk.red("[fatal error]")} ${err.message}`);
  console.error(err.stack);
  process.exit(1);
}

process.on("uncaughtException", handleFatalError);
process.on("unhandledRejection", handleFatalError);
 */
