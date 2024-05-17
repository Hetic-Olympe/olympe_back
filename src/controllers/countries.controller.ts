import express, { Request, Response } from "express";
import * as service from "../services/countries.service";
import { authMiddleware } from "../middlewares/authMiddleware";
import { RoleEnum } from "../enums/RoleEnum";

const router = express.Router();

router.get(
  "/",
  authMiddleware([RoleEnum.ADMIN]),
  async (req: Request, res: Response) => {
    try {
      const countries = await service.getCountries();
      res.status(200).send(countries);
    } catch (error) {
      res.status(500).send({ error: "An error occurred" });
    }
  }
);

export default router;
