import { DataSource } from "typeorm";
import { Role } from "../models/Role";
import { User } from "../models/User";
import { Country } from "../models/Country";
import { EventCategory } from "../models/EventCategory";
import { Medal } from "../models/Medal";
import { Athlete } from "../models/Athlete";
import { AthleteSport } from "../models/AtheleteSport";
import { Sport } from "../models/Sport";
import { SportField } from "../models/SportField";
import { Event } from "../models/Event";
import { Participation } from "../models/Participation";
import { Like } from "../models/Like";
import { Interest } from "../models/Interest";
import { Continent } from "../models/Continent";

export const AppDataSource = new DataSource({
  type: "postgres",
  host: process.env.DB_HOST,
  port: 5432,
  username: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
  database: process.env.POSTGRES_DB,
  synchronize: true,
  logging: true,
  entities: [
    User,
    Role,
    Continent,
    Country,
    EventCategory,
    Medal,
    Athlete,
    AthleteSport,
    Sport,
    SportField,
    Event,
    Participation,
    Like,
    Interest,
  ],
  subscribers: [],
  migrations: [],
});
