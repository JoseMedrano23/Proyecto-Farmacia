import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { DetalleVenta } from './detalles-ventas.entity';
import { CreateDetalleVentaDto } from './dto/create-detalle-venta.dto';

@Injectable()
export class DetallesVentasService {
  constructor(
    @InjectRepository(DetalleVenta)
    private detallesVentasRepository: Repository<DetalleVenta>,
  ) {}

  async findAll(): Promise<DetalleVenta[]> {
    return this.detallesVentasRepository.find();
  }

  async findOne(id: number): Promise<DetalleVenta> {
    const detalleVenta = await this.detallesVentasRepository.findOne(id);
    if (!detalleVenta) {
      throw new NotFoundException(`Detalle de Venta con ID ${id} no encontrado`);
    }
    return detalleVenta;
  }

  async create(createDetalleVentaDto: CreateDetalleVentaDto): Promise<DetalleVenta> {
    const nuevoDetalleVenta = this.detallesVentasRepository.create(createDetalleVentaDto);
    return this.detallesVentasRepository.save(nuevoDetalleVenta);
  }

  async remove(id: number): Promise<void> {
    const existingDetalleVenta = await this.findOne(id);
    if (!existingDetalleVenta) {
      throw new NotFoundException(`Detalle de Venta con ID ${id} no encontrado`);
    }
    await this.detallesVentasRepository.delete(id);
  }
}