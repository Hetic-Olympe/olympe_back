import express, { Request, Response } from "express";
import * as service from "../../services/countries.service";

const router = express.Router();

router.get("/", async (req: Request, res: Response) => {
  try {
    const countries = await service.getCountries();
    res.status(200).send(countries);
  } catch (error) {
    res.status(500).send({ error: "An error occurred" });
  }
});

export default router;
