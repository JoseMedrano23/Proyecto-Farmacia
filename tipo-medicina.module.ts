import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TipoMedicina } from './tipo-medicina.entity';
import { TipoMedicinaService } from './tipo-medicina.service';
import { TipoMedicinaController } from './tipo-medicina.controller';

@Module({
  imports: [TypeOrmModule.forFeature([TipoMedicina])],
  providers: [TipoMedicinaService],
  controllers: [TipoMedicinaController],
})
export class TipoMedicinaModule {}
