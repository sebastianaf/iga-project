import express from "express";

/**
 * Import Routes
 */
import userRouter from "./user.router";
import metricRouter from "./metric.router";

const routerAPI = (app) => {
  const router = express.Router();
  app.use("/api", router);

  /**
   * Routes
   */
  router.use("/users", userRouter);
  router.use("/metrics", metricRouter);
};

export default routerAPI;
