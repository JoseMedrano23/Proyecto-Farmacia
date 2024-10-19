import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Medicina {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  nombre: string;

  @Column({nullable:true})
  dosis: string;

  @Column('decimal', { precision: 10, scale: 2 })
  precio: number;

  @Column({nullable:true})
  cantidad: number;

  @Column({nullable:true})
  fecha_caducidad: Date;

  @Column({nullable:true})
  descripcion: string;

  @Column({nullable:true})
  tipo: number;
}
