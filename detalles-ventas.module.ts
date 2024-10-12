import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DetalleVenta } from './detalles-ventas.entity';
import { DetallesVentasService } from './detalles-ventas.service';
import { DetallesVentasController } from './detalles-ventas.controller';

@Module({
  imports: [TypeOrmModule.forFeature([DetalleVenta])],
  providers: [DetallesVentasService],
  controllers: [DetallesVentasController],
})
export class DetallesVentasModule {}