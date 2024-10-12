import { Controller, Post, Body, Get, Param, Delete } from '@nestjs/common';
import { DetallesVentasService } from './detalles-ventas.service';
import { CreateDetalleVentaDto } from './dto/create-detalle-venta.dto';
import { DetalleVenta } from './detalles-ventas.entity';

@Controller('detalles-ventas')
export class DetallesVentasController {
  constructor(private readonly detallesVentasService: DetallesVentasService) {}

  @Post()
  create(@Body() createDetalleVentaDto: CreateDetalleVentaDto): Promise<DetalleVenta> {
    return this.detallesVentasService.create(createDetalleVentaDto);
  }

  @Get()
  findAll(): Promise<DetalleVenta[]> {
    return this.detallesVentasService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: number): Promise<DetalleVenta> {
    return this.detallesVentasService.findOne(id);
  }

  @Delete(':id')
  remove(@Param('id') id: number): Promise<void> {
    return this.detallesVentasService.remove(id);
  }
}