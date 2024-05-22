import { AppDataSource } from "../database/data-source";
import { User } from "../models/User";
import { Role } from "../models/Role";

const roleRepository = AppDataSource.getRepository(Role);
const userRepository = AppDataSource.getRepository(User);

const FIELDS_TO_SELECT: (keyof User)[] = [
  "id",
  "email",
  "firstname",
  "lastname",
  "phone",
  "isConnected",
  "createdAt"
];

const getUserWithRelations = async (conditions: any, relations: string[]): Promise<User | null> => {
  const user = await userRepository.findOne({
    where: conditions,
    relations: relations,
    select: FIELDS_TO_SELECT,
  });
  return user ?? null;
};

export const createUser = async (data: User): Promise<User> => {
  const newUser = await userRepository.save(data);
  return newUser;
};

export const getUsers = async (): Promise<User[]> => {
  const users = await userRepository.find({
    relations: ["role", "interests", "likes"],
    select: FIELDS_TO_SELECT,
  });
  return users;
};

export const getUserDetail = async (id: string): Promise<User | null> => {
  return await getUserWithRelations({ id }, ["role", "interests", "likes"]);
};

export const updateUser = async (id: string, fieldsToUpdate: Partial<User>): Promise<User | null> => {
  const userToUpdate = await userRepository.findOne({ where: { id: id } });
  if (!userToUpdate) {
    return null;
  }

  Object.assign(userToUpdate, fieldsToUpdate);

  if (fieldsToUpdate.role && typeof fieldsToUpdate.role === 'object' && fieldsToUpdate.role.id) {
    const role = await roleRepository.findOne({ where: { id: fieldsToUpdate.role.id } });
    if (role) {
      userToUpdate.role = role;
    }
  }

  await userRepository.save(userToUpdate);
  return await getUserWithRelations({ id }, ["role", "interests", "likes"]);
};


export const getUserByEmail = async (email: string): Promise<User | null> => {
  try {
    const user = await userRepository.findOneOrFail({
      where: { email },
      relations: ["role"],
    });
    return user;
  } catch (error) {
    return null;
  }
};

export const getUserById = async (id: string): Promise<User | null> => {
  try {
    const user = await userRepository
      .createQueryBuilder("user")
      .leftJoinAndSelect("user.role", "role")
      .where("user.id = :id", { id })
      .select(["user.email", "user.id", "role.label"])
      .getOneOrFail();
    return user;
  } catch (error) {
    return null;
  }
};
