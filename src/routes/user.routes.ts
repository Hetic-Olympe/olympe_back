import express from "express";
import athletesRoutes from "../controllers/user/athletes.controller";
import usersRoutes from "../controllers/user/users.controller";

const router = express.Router();

router.use("/users", usersRoutes);
router.use("/athletes", athletesRoutes);

export default router;
