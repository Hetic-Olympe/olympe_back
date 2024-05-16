import { AppDataSource } from "../database/data-source";
import { Athlete } from "../models/Athlete";

const athleteRepository = AppDataSource.getRepository(Athlete);

export const getAthletes = async (): Promise<Athlete[]> => {
  const athletes = await athleteRepository.find({
    relations: ["country", "athleteSports"],
    select: {
      id: true,
      firstname: true,
      lastname: true,
      country: {
        iso: true,
        nicename: true,
      },
      createdAt: true,
      athleteSports: true,
    },
  });
  return athletes;
};
