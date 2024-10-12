import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from 'typeorm';
import { Cliente } from '/src/entity/cliente.entity.ts';

@Entity()
export class Venta {
  @PrimaryGeneratedColumn()
  id_venta: number;

  @Column({ type: 'date' })
  fecha: Date;

  @Column('decimal', { precision: 10, scale: 2, default: 0 })
  precio: number;

  @ManyToOne(() => Cliente)
  @JoinColumn({ name: 'cliente' })
  cliente: Cliente;
}