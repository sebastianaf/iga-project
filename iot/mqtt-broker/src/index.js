import mosca from "mosca";
import redis from "redis";
import db from "./config/db";

var settings = {
  port: 1883,
  backend: {
    type: "redis",
    db: 12,
    redis,
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

const server = new mosca.Server(settings);

server.on("clientConnected", (client) => {
  console.log(`client connected ${client.id}`);
});

server.on("clientdisconnected", (client) => {
  console.log(`client disconnected ${client.id}`);
});

server.on("published", (packet, client) => {
  console.log(`Received ${packet.topic}`);
  console.log(`Payload ${packet.payload}`);
});

server.on("ready", () => {
  console.log("Mosca server is up and running");
});

const fatalError = (error) => {
  console.log(error.message);
  process.exit(1);
};

server.on("error", fatalError);
process.on("uncaughtException", fatalError);
process.on("unhandledRejection", fatalError);