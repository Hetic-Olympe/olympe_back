import express, { Request, Response } from "express";
import * as service from "../../services/athletes.service";

const router = express.Router();

router.get("/", async (req: Request, res: Response) => {
  try {
    const { athletes } = await service.getAthletes({}, 0, 0, {});
    const formattedAthletes = athletes.map((athlete) => {
      const athleteSportTab = athlete.athleteSports;
      const sportField =
        athleteSportTab.length > 0 ? athlete.athleteSports[0].sport.label : "";

      return {
        id: athlete.id,
        firstname: athlete.firstname,
        lastname: athlete.lastname,
        age: athlete.age,
        gender: athlete.gender,
        pictureProfile: athlete.pictureProfile,
        country: athlete.country.name,
        sportField: sportField,
      };
    });
    res.status(200).send(formattedAthletes);
  } catch (error) {
    res.status(500).send({ error: "An error occurred" });
  }
});

router.get("/:id", async (req: Request, res: Response) => {
  try {
    const id = req.params.id;
    const athlete = await service.getOneAthleteById(id);
    res.status(200).send(athlete);
  } catch (error) {
    res.status(500).send({ error: "An error occurred" });
  }
});

export default router;
