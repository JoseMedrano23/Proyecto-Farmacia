import { Controller, Post, Body, Get, Param, Put, Delete } from '@nestjs/common';
import { TipoMedicinaService } from './tipo-medicina.service';
import { CreateTipoMedicinaDto } from './dto/create-tipo-medicina.dto';
import { TipoMedicina } from './tipo-medicina.entity';

@Controller('tipo-medicina')
export class TipoMedicinaController {
  constructor(private readonly tipoMedicinaService: TipoMedicinaService) {}

  @Post()
  create(@Body() createTipoMedicinaDto: CreateTipoMedicinaDto): Promise<TipoMedicina> {
    return this.tipoMedicinaService.create(createTipoMedicinaDto);
  }

  @Get()
  findAll(): Promise<TipoMedicina[]> {
    return this.tipoMedicinaService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: number): Promise<TipoMedicina> {
    return this.tipoMedicinaService.findOne(id);
  }

  @Put(':id')
  update(
    @Param('id') id: number,
    @Body() updateTipoMedicinaDto: CreateTipoMedicinaDto,
  ): Promise<TipoMedicina> {
    return this.tipoMedicinaService.update(id, updateTipoMedicinaDto);
  }

  @Delete(':id')
  remove(@Param('id') id: number): Promise<void> {
    return this.tipoMedicinaService.remove(id);
  }
}
