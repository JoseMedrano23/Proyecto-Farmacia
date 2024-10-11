import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from 'typeorm';
import { TipoMedicina } from '/src/entity/tipo-medicina.entity.ts';

@Entity()
export class Medicina {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  nombre: string;

  @Column({ nullable: true })
  dosis: string;

  @Column('decimal', { precision: 10, scale: 2, default: 0 })
  precio: number;

  @Column({ nullable: true })
  cantidad: number;

  @Column({ type: 'date', nullable: true })
  fecha_caducidad: Date;

  @Column({ nullable: true })
  descripcion: string;

  @ManyToOne(() => TipoMedicina)
  @JoinColumn({ name: 'tipo' })
  tipo: TipoMedicina;
}
