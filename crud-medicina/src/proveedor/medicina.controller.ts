import { Controller, Get, Post, Put, Delete, Param, Body, ParseIntPipe } from '@nestjs/common';
import { MedicinaService } from './medicina.service';
import { CreateMedicinaDto } from './create-medicina.dto';
import { UpdateMedicinaDto } from './update-medicina.dto';
import { Medicina } from './entities/medicina.entity';

@Controller('medicinas')
export class MedicinaController {
  constructor(private readonly MedicinaService: MedicinaService) {}

  @Get()
  findAll(): Promise<Medicina[]> {
    return this.MedicinaService.findAll();
  }

  @Post()
  create(@Body() createMedicinaDto: CreateMedicinaDto): Promise<Medicina> {
    return this.MedicinaService.create(createMedicinaDto);
  }

  @Put(':id')
  update(
    @Param('id', ParseIntPipe) id: number, 
    @Body() updateMedicinaDto: UpdateMedicinaDto,
  ): Promise<Medicina> {
    return this.MedicinaService.update(id, updateMedicinaDto);
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number): Promise<void> {
    return this.MedicinaService.remove(id);
  }
}
