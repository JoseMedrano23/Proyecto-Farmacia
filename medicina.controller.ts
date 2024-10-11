import { Controller, Post, Body, Get, Param, Put, Delete } from '@nestjs/common';
import { MedicinaService } from './medicina.service';
import { CreateMedicinaDto } from './dto/create-medicina.dto';
import { Medicina } from './medicina.entity';

@Controller('medicina')
export class MedicinaController {
  constructor(private readonly medicinaService: MedicinaService) {}

  @Post()
  create(@Body() createMedicinaDto: CreateMedicinaDto): Promise<Medicina> {
    return this.medicinaService.create(createMedicinaDto);
  }

  @Get()
  findAll(): Promise<Medicina[]> {
    return this.medicinaService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: number): Promise<Medicina> {
    return this.medicinaService.findOne(id);
  }

  @Put(':id')
  update(
    @Param('id') id: number,
    @Body() updateMedicinaDto: CreateMedicinaDto,
  ): Promise<Medicina> {
    return this.medicinaService.update(id, updateMedicinaDto);
  }

  @Delete(':id')
  remove(@Param('id') id: number): Promise<void> {
    return this.medicinaService.remove(id);
  }
}
