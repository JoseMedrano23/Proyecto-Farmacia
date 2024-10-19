import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Medicina } from './entities/medicina.entity';
import { MedicinaService } from './medicina.service';
import { MedicinaController } from './medicina.controller';

@Module({
  imports: [TypeOrmModule.forFeature([Medicina])],
  controllers: [MedicinaController],
  providers: [MedicinaService],
})
export class MedicinaModule {}
