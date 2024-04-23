import * as userService from "../services/users.service";
import * as roleService from "../services/roles.service";
import { RoleEnum } from "../enums/RoleEnum";
import { Role } from "../models/Role";
import { User } from "../models/User";
import bcrypt from "bcryptjs";

async function seedDatabase() {
  const isDatabaseUpdated = await isScriptExist();
  if (!isDatabaseUpdated) {
    await updateDatabase();
    console.log("Database seeded");
  } else {
    console.log("Database already up to date");
  }
}

async function updateDatabase(): Promise<void> {
  try {
    await createRoles();
    await createAdmin();
  } catch (error) {
    console.log(error);
  }
}

async function createAdmin(): Promise<void> {
  const admin = new User();

  if (!process.env.OLYMPE_ADMIN_EMAIL) {
    throw new Error("Olympe admin email not provide");
  }

  if (!process.env.OLYMPE_ADMIN_PASSWORD) {
    throw new Error("Olympe admin password not provide");
  }

  admin.email = process.env.OLYMPE_ADMIN_EMAIL;
  const hashedPassword = await bcrypt.hash(
    process.env.OLYMPE_ADMIN_PASSWORD,
    10
  );

  admin.password = hashedPassword;

  const roleAdmin = await roleService.getRoleByLibel(RoleEnum.ADMIN);

  if (roleAdmin === null) {
    throw new Error();
  }

  admin.role = roleAdmin;

  await userService.createUser(admin);
}

async function createRoles(): Promise<void> {
  const roleAdmin = new Role();
  const roleUser = new Role();
  await roleService.createRole({ ...roleAdmin, libel: RoleEnum.ADMIN });
  await roleService.createRole({ ...roleUser, libel: RoleEnum.USER });
}

async function isScriptExist(): Promise<boolean> {
  try {
    const roles = await roleService.getRoles();
    if (roles.length === 0) {
      throw new Error("No roles in database");
    }
    return true;
  } catch (error) {
    return false;
  }
}

export default seedDatabase;
