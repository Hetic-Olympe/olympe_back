import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { Role } from "./Role";

@Entity()
export class User {
  @PrimaryGeneratedColumn("uuid")
  id: string;

  @Column({ unique: true })
  email: string;

  @Column()
  password: string;

  @ManyToOne(() => Role, (role) => role.users)
  role: Role;
}
