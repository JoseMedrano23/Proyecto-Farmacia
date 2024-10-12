import { IsInt, IsDecimal, IsOptional } from 'class-validator';

export class CreateDetalleVentaDto {
  @IsInt()
  id_venta: number;

  @IsInt()
  id_medicina: number;

  @IsInt()
  cantidad: number;

  @IsOptional()
  @IsDecimal()
  precio?: number;
}