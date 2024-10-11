import { IsString } from 'class-validator';

export class CreateTipoMedicinaDto {
  @IsString()
  tipo_medicina: string;
}
