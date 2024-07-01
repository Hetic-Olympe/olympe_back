import { AppDataSource } from "../database/data-source";
import { Athlete } from "../models/Athlete";

const athleteRepository = AppDataSource.getRepository(Athlete);

export interface PaginateAthletes {
  athletes: Athlete[];
  total: number;
}

export const getAthletes = async (
  where: any,
  skip: number,
  take: number,
  order: any
): Promise<PaginateAthletes> => {
  const [athletes, total] = await athleteRepository.findAndCount({
    where,
    relations: ["country", "athleteSports", "athleteSports.sport"],
    select: {
      id: true,
      firstname: true,
      lastname: true,
      age: true,
      gender: true,
      pictureProfile: true,
      country: {
        name: true,
      },
      athleteSports: {
        sport: {
          label: true,
        },
      },
    },
    skip,
    take,
    order: { ...order },
  });
  return { athletes, total };
};

export const getOneAthleteById = async (id: string): Promise<Athlete> => {
  const athlete = await athleteRepository.findOneOrFail({
    where: { id },
    relations: ["country", "athleteSports", "athleteSports.sport"],
  });
  return athlete;
};

export const updateAthlete = async (
  id: string,
  data: Partial<Athlete>
): Promise<Athlete> => {
  await athleteRepository.update(id, data);
  const athlete = await athleteRepository.findOneOrFail({
    where: { id },
    relations: ["country", "athleteSports", "athleteSports.sport"],
  });
  return athlete;
};
