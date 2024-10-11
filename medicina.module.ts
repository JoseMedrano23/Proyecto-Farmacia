import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Medicina } from './medicina.entity';
import { MedicinaService } from './medicina.service';
import { MedicinaController } from './medicina.controller';

@Module({
  imports: [TypeOrmModule.forFeature([Medicina])],
  providers: [MedicinaService],
  controllers: [MedicinaController],
})
export class MedicinaModule {}
