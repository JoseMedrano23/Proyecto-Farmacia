import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class TipoMedicina {
  @PrimaryGeneratedColumn()
  id_tipo: number;

  @Column()
  tipo_medicina: string;
}
