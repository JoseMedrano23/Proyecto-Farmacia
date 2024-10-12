import { Controller, Post, Body, Get, Param, Put, Delete } from '@nestjs/common';
import { VentasService } from './ventas.service';
import { CreateVentaDto } from './dto/create-ventas.dto';
import { Venta } from './ventas.entity';

@Controller('ventas')
export class VentasController {
  constructor(private readonly ventasService: VentasService) {}

  @Post()
  create(@Body() createVentaDto: CreateVentaDto): Promise<Venta> {
    return this.ventasService.create(createVentaDto);
  }

  @Get()
  findAll(): Promise<Venta[]> {
    return this.ventasService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: number): Promise<Venta> {
    return this.ventasService.findOne(id);
  }

  @Put(':id')
  update(@Param('id') id: number, @Body() updateVentaDto: CreateVentaDto): Promise<Venta> {
    return this.ventasService.update(id, updateVentaDto);
  }

  @Delete(':id')
  remove(@Param('id') id: number): Promise<void> {
    return this.ventasService.remove(id);
  }
}