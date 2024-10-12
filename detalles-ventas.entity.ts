import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from 'typeorm';
import { Venta } from './ventas.entity';

@Entity()
export class DetalleVenta {
  @PrimaryGeneratedColumn()
  id_detalle: number;

  @ManyToOne(() => Venta)
  @JoinColumn({ name: 'id_venta' })
  id_venta: Venta;

  @Column()
  id_medicina: number;

  @Column({ nullable: true })
  medicina_nombre: string;

  @Column()
  cantidad: number;

  @Column('decimal', { precision: 10, scale: 2, nullable: true })
  precio: number;
}