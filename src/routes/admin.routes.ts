import express from "express";
import rolesRoutes from "../controllers/admin/roles.controller";
import athletesRoutes from "../controllers/admin/athletes.controller";
import countriesRoutes from "../controllers/admin/countries.controller";
import usersRoutes from "../controllers/admin/users.controller";

const router = express.Router();

router.use("/roles", rolesRoutes);
router.use("/athletes", athletesRoutes);
router.use("/countries", countriesRoutes);
router.use("/users", usersRoutes);

export default router;
