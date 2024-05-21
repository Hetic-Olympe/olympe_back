import { AppDataSource } from "../database/data-source";
import { Continent } from "../models/Continent";
import { Country } from "../models/Country";

const countryRepository = AppDataSource.getRepository(Country);

export const getCountries = async (where: any): Promise<Country[]> => {
  const countries = await countryRepository.find({
    where,
    relations: ["continent"],
    select: {
      id: true,
      iso: true,
      nicename: true,
      isParticipate: true,
      continent: {
        name: true,
      },
    },
    order: {
      iso: "ASC",
    },
  });
  return countries;
};

export const updateCountry = async (country: Country): Promise<Country> => {
  const updatedCountry = await countryRepository.save(country);
  return updatedCountry;
};

export const getCountryById = async (id: number): Promise<Country | null> => {
  const country = await countryRepository.findOneOrFail({ where: { id } });
  return country;
};
