import {
  AfterLoad,
  Column,
  CreateDateColumn,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
  VirtualColumn,
} from "typeorm";
import { Role } from "./Role";
import { Like } from "./Like";
import { Interest } from "./Interest";

@Entity()
export class User {
  @PrimaryGeneratedColumn("uuid")
  id: string;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;

  @Column({ unique: true })
  email: string;

  @Column()
  password: string;

  @Column({ type: "varchar", length: 100, nullable: true })
  firstname: string;

  @Column({ type: "varchar", length: 100, nullable: true })
  lastname: string;

  @Column({ type: "varchar", length: 30, nullable: true })
  phone: string;

  @Column({ default: false })
  isConnected: boolean;

  @ManyToOne(() => Role, (role) => role.users)
  role: Role;

  @OneToMany(() => Like, (like) => like.user)
  likes: Like[];

  @OneToMany(() => Interest, (interest) => interest.user)
  interests: Interest[];

  // Virtual column

  @VirtualColumn({
    query: () =>
      `SELECT CONCAT(firstname, ' ', lastname) AS fullname FROM user`,
  })
  fullname: string;
}
