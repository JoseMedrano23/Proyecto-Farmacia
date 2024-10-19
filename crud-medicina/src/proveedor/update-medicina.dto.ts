import { IsOptional } from 'class-validator';
export class UpdateMedicinaDto {
  nombre?: string;

  @IsOptional()
  dosis?: string;


  precio?: number;

  @IsOptional()
  cantidad?: number;

  @IsOptional()
  fechacaducidad?: Date;

  @IsOptional()
  descripcion?: string;

  @IsOptional()
  tipo?: number;
}