import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { TipoMedicina } from './tipo-medicina.entity';
import { CreateTipoMedicinaDto } from './dto/create-tipo-medicina.dto';

@Injectable()
export class TipoMedicinaService {
  constructor(
    @InjectRepository(TipoMedicina)
    private tipoMedicinaRepository: Repository<TipoMedicina>,
  ) {}

  async findAll(): Promise<TipoMedicina[]> {
    return this.tipoMedicinaRepository.find();
  }

  async findOne(id: number): Promise<TipoMedicina> {
    const tipoMedicina = await this.tipoMedicinaRepository.findOne(id);
    if (!tipoMedicina) {
      throw new NotFoundException(`Tipo de medicina con ID ${id} no encontrado`);
    }
    return tipoMedicina;
  }

  async create(createTipoMedicinaDto: CreateTipoMedicinaDto): Promise<TipoMedicina> {
    const newTipoMedicina = this.tipoMedicinaRepository.create(createTipoMedicinaDto);
    return this.tipoMedicinaRepository.save(newTipoMedicina);
  }

  async update(id: number, updateTipoMedicinaDto: CreateTipoMedicinaDto): Promise<TipoMedicina> {
    const existingTipoMedicina = await this.findOne(id);
    if (!existingTipoMedicina) {
      throw new NotFoundException(`Tipo de medicina con ID ${id} no encontrado`);
    }
    await this.tipoMedicinaRepository.update(id, updateTipoMedicinaDto);
    return this.findOne(id);
  }

  async remove(id: number): Promise<void> {
    const existingTipoMedicina = await this.findOne(id);
    if (!existingTipoMedicina) {
      throw new NotFoundException(`Tipo de medicina con ID ${id} no encontrado`);
    }
    await this.tipoMedicinaRepository.delete(id);
  }
}
