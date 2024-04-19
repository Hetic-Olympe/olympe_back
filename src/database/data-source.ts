import { DataSource } from "typeorm";
import { Role } from "../models/Role";
import { User } from "../models/User";

export const AppDataSource = new DataSource({
  type: "postgres",
  host: "postgres",
  port: 5432,
  username: "user",
  password: "password",
  database: "db_olympe",
  synchronize: true,
  logging: true,
  entities: [User, Role],
  subscribers: [],
  migrations: [],
});
