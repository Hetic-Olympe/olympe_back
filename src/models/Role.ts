import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { User } from "./User";
import { RoleEnum } from "../enums/RoleEnum";

@Entity()
export class Role {
  @PrimaryGeneratedColumn("uuid")
  id: string;

  @Column({ type: "enum", enum: RoleEnum, unique: true })
  libel: RoleEnum;

  @OneToMany(() => User, (user) => user.role)
  users: User[];
}
