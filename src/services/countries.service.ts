import { AppDataSource } from "../database/data-source";
import { Country } from "../models/Country";

const countryRepository = AppDataSource.getRepository(Country);

export const getCountries = async (): Promise<Country[]> => {
  const countries = await countryRepository.find({
    select: {
      id: true,
      iso: true,
      nicename: true,
      isParticpate: true,
    },
  });
  return countries;
};
