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

router.post("/update", async (req: Request, res: Response) => {
  try {
    const countryId = req.body.id;
    const country = await service.getCountryById(countryId);
    if (country === null) {
      throw new Error("Country not find");
    }
    const updateCountry = { ...country, isParticipate: !country.isParticipate };
    console.log(updateCountry);
    await service.updateCountry(updateCountry);
    res.status(200).send({ success: "Country successfuly updated" });
  } catch (error) {
    res.status(500).send({ error: "An error occurred" });
  }
});

export default router;
