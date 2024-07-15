import {
  Column,
  CreateDateColumn,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { SportField } from "./SportField";
import { User } from "./User";

@Entity()
export class Interest {
  @PrimaryGeneratedColumn("uuid")
  id: string;

  @CreateDateColumn()
  createdAt: Date;

  @ManyToOne(() => SportField, (sportField) => sportField.interests)
  sportField: SportField;

  @ManyToOne(() => User, (user) => user.interests)
  user: User;
}
