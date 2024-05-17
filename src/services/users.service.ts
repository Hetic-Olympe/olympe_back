import { AppDataSource } from "../database/data-source";
import { User } from "../models/User";

const userRepository = AppDataSource.getRepository(User);

export const getUsers = async (): Promise<User[]> => {
  const users = await userRepository.find();
  return users;
};

export const createUser = async (data: User): Promise<User> => {
  const newUser = await userRepository.save(data);
  return newUser;
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
