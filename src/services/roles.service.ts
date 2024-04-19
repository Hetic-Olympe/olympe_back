import { AppDataSource } from "../database/data-source";
import { Role } from "../models/Role";

const roleRepository = AppDataSource.getRepository(Role);

export const getRoles = async (): Promise<Role[]> => {
  const roles = await roleRepository.find();
  return roles;
};

export const getRoleByLibel = async (libel: string): Promise<Role | null> => {
  try {
    const roleFinded = await roleRepository.findOneOrFail({
      where: { libel },
    });
    return roleFinded;
  } catch (error) {
    return null;
  }
};

export const createRole = async (data: Role): Promise<Role> => {
  const newrole = await roleRepository.save(data);
  return newrole;
};

/* export const getroles = async (): Promise<role[]> => {
  const [rows] = await mysqlPool.query<RowDataPacket[]>("SELECT * FROM roles");
  return rows as role[];
};

export const getroleById = async (id: number): Promise<role | undefined> => {
  const [rows] = await mysqlPool.query<RowDataPacket[]>(
    "SELECT * FROM roles WHERE id = ?",
    [id]
  );
  return rows[0] as role | undefined;
};



export const deleteroleById = async (id: number): Promise<number> => {
  const [result] = await mysqlPool.query<ResultSetHeader>(
    "DELETE FROM roles WHERE id = ?",
    [id]
  );
  return result.affectedRows;
};

export const createrole = async (data: role): Promise<number> => {
  const [result] = await mysqlPool.query<ResultSetHeader>(
    "INSERT INTO roles (full_name, password, email) VALUES (?, ?, ?)",
    [data.full_name, data.password, data.email]
  );
  return result.affectedRows;
};

export const updaterole = async (data: role, id: number): Promise<number> => {
  const [result] = await mysqlPool.query<ResultSetHeader>(
    "UPDATE roles SET full_name = ?, email = ?, password = ?, token = ? WHERE id = ?",
    [data.full_name, data.email, data.password, data.token, id]
  );
  return result.affectedRows;
};
 */
