import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { User } from "./User";

export enum RoleEnum {
  USER = "user",
  ADMIN = "admin",
}

@Entity()
export class Role {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: "enum", enum: RoleEnum })
  libel: string;

  @OneToMany(() => User, (user) => user.role)
  users: User[];
}
