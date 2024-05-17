import express from "express";
import rolesRoutes from "../controllers/admin/roles.controller";
import athletesRoutes from "../controllers/admin/roles.controller";

const router = express.Router();

router.use("/roles", rolesRoutes);
router.use("/athletes", athletesRoutes);

export default router;
