import express, { Request, Response } from "express";
import { ILike } from "typeorm";
import * as service from "../../services/athletes.service";
import { extractPaginationFromFilters } from "../../utils/extractPaginationFromFilters";
import { extractSortsFromFilters } from "../../utils/extractSortsFromFilters";

const router = express.Router();

router.get("/", async (req: Request, res: Response) => {
  try {
    const where: any = {};
    const filters = req.query;
    const { page, limit, skip } = extractPaginationFromFilters(req);

    // Filter
    if (filters.firstname) {
      where.firstname = ILike(`%${filters.firstname}%`);
    }
    if (filters.lastname) {
      where.lastname = ILike(`%${filters.lastname}%`);
    }
    if (filters.country) {
      where.country = { name: ILike(`%${filters.country}%`) };
    }
    if (filters.sportField) {
      where.athleteSports = {
        sport: { label: ILike(`%${filters.sportField}%`) },
      };
    }

    const sortableKey = [
      { paramsKey: "firstname", accessKey: "firstname" },
      { paramsKey: "lastname", accessKey: "lastname" },
      { paramsKey: "country", accessKey: "country.name" },
      { paramsKey: "sportField", accessKey: "athleteSports.sport.label" },
    ];

    const { order } = extractSortsFromFilters(req, sortableKey);

    const { athletes, total } = await service.getAthletes(
      where,
      skip,
      limit,
      order
    );

    const totalPages = Math.ceil(total / limit);

    res.status(200).send({ athletes, total, page, totalPages });
  } catch (error) {
    res.status(500).send({ error: "An error occurred" });
  }
});

router.get("/:id", async (req: Request, res: Response) => {
  const { id } = req.params;
  try {
    const athlete = await service.getOneAthleteById(id);
    res.status(200).send(athlete);
  } catch (error) {
    res.status(500).send({ error: "An error occurred" });
  }
});

router.patch("/:id", async (req: Request, res: Response) => {
  const { id } = req.params;
  const data = req.body;
  try {
    const athlete = await service.updateAthlete(id, data);
    res.status(200).send(athlete);
  } catch (error) {
    res.status(500).send({ error: "An error occurred" });
  }
});

export default router;
