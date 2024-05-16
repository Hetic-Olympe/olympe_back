import express, { Request, Response } from "express";
import * as service from "../services/athletes.service";

const router = express.Router();

router.get("/", async (req: Request, res: Response) => {
  try {
    const athletes = await service.getAthletes();
    res.status(200).send(athletes);
  } catch (error) {
    res.status(500).send({ error: "An error occurred" });
  }
});

export default router;
