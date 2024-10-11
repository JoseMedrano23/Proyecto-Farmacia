import { IsString, IsOptional, IsNumber, IsDecimal, IsDate, IsInt } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateMedicinaDto {
  @IsString()
  nombre: string;

  @IsOptional()
  @IsString()
  dosis?: string;

  @IsDecimal()
  precio: number;

  @IsOptional()
  @IsInt()
  cantidad?: number;

  @IsOptional()
  @IsDate()
  @Type(() => Date)
  fecha_caducidad?: Date;

  @IsOptional()
  @IsString()
  descripcion?: string;

  @IsOptional()
  @IsInt()
  tipo?: number;
}
