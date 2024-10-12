import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Venta } from './ventas.entity';
import { CreateVentaDto } from './dto/create-ventas.dto';

@Injectable()
export class VentasService {
  constructor(
    @InjectRepository(Venta)
    private ventasRepository: Repository<Venta>,
  ) {}

  async findAll(): Promise<Venta[]> {
    return this.ventasRepository.find();
  }

  async findOne(id: number): Promise<Venta> {
    const venta = await this.ventasRepository.findOne(id);
    if (!venta) {
      throw new NotFoundException(`Venta con ID ${id} no encontrada`);
    }
    return venta;
  }

  async create(createVentaDto: CreateVentaDto): Promise<Venta> {
    const nuevaVenta = this.ventasRepository.create(createVentaDto);
    return this.ventasRepository.save(nuevaVenta);
  }

  async update(id: number, updateVentaDto: CreateVentaDto): Promise<Venta> {
    const existingVenta = await this.findOne(id);
    if (!existingVenta) {
      throw new NotFoundException(`Venta con ID ${id} no encontrada`);
    }
    await this.ventasRepository.update(id, updateVentaDto);
    return this.findOne(id);
  }

  async remove(id: number): Promise<void> {
    const existingVenta = await this.findOne(id);
    if (!existingVenta) {
      throw new NotFoundException(`Venta con ID ${id} no encontrada`);
    }
    await this.ventasRepository.delete(id);
  }
}