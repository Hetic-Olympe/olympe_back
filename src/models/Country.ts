import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { Athlete } from "./Athlete";

@Entity()
export class Country {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: "varchar", length: 2, unique: true })
  iso: string;

  @Column({ type: "varchar", length: 80, unique: true })
  name: string;

  @Column({ type: "varchar", length: 80, unique: true })
  nicename: string;

  @Column({ type: "boolean", default: true })
  isParticpate: boolean;

  @OneToMany(() => Athlete, (athele) => athele.country)
  atheles: Athlete[];
}
