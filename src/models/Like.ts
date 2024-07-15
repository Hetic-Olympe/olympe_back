import {
  Column,
  CreateDateColumn,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Athlete } from "./Athlete";
import { User } from "./User";

@Entity()
export class Like {
  @PrimaryGeneratedColumn("uuid")
  id: string;

  @CreateDateColumn()
  createdAt: Date;

  @Column({ type: "boolean", default: true })
  isActive: boolean;

  @ManyToOne(() => Athlete, (athlete) => athlete.likes)
  athlete: Athlete;

  @ManyToOne(() => User, (user) => user.likes)
  user: User;
}
