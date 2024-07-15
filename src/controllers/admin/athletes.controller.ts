import express, { Request, Response } from "express";
import * as service from "../../services/athletes.service";

const router = express.Router();

router.get("/", async (req: Request, res: Response) => {
  try {
    const athletes = await service.getAthletes();
    res.status(200).send(athletes);
  } catch (error) {
    res.status(500).send({ error: "An error occurred" });
  }
});

router.get("/:id", async (req: Request, res: Response) => {
  const { id } = req.params;
  try {
    const athletes = await service.getOneAthleteById(id);
    res.status(200).send(athletes);
  } catch (error) {
    res.status(500).send({ error: "An error occurred" });
  }
});

router.patch("/:id", async (req: Request, res: Response) => {
  const { id } = req.params;
  const data = req.body;
  try {
    const athletes = await service.updateAthlete(id, data);
    res.status(200).send(athletes);
  } catch (error) {
    res.status(500).send({ error: "An error occurred" });
  }
});

export default router;
