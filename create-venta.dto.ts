import { IsInt, IsDate, IsDecimal } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateVentaDto {
  @IsDate()
  @Type(() => Date)
  fecha: Date;

  @IsDecimal()
  precio: number;

  @IsInt()
  cliente: number;
}
