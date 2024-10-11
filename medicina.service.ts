import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Medicina } from './medicina.entity';
import { CreateMedicinaDto } from './dto/create-medicina.dto';

@Injectable()
export class MedicinaService {
  constructor(
    @InjectRepository(Medicina)
    private medicinaRepository: Repository<Medicina>,
  ) {}

  async findAll(): Promise<Medicina[]> {
    return this.medicinaRepository.find();
  }

  async findOne(id: number): Promise<Medicina> {
    const medicina = await this.medicinaRepository.findOne(id);
    if (!medicina) {
      throw new NotFoundException(`Medicina con ID ${id} no encontrada`);
    }
    return medicina;
  }

  async create(createMedicinaDto: CreateMedicinaDto): Promise<Medicina> {
    const newMedicina = this.medicinaRepository.create(createMedicinaDto);
    return this.medicinaRepository.save(newMedicina);
  }

  async update(id: number, updateMedicinaDto: CreateMedicinaDto): Promise<Medicina> {
    const existingMedicina = await this.findOne(id);
    if (!existingMedicina) {
      throw new NotFoundException(`Medicina con ID ${id} no encontrada`);
    }
    await this.medicinaRepository.update(id, updateMedicinaDto);
    return this.findOne(id);
  }

  async remove(id: number): Promise<void> {
    const existingMedicina = await this.findOne(id);
    if (!existingMedicina) {
      throw new NotFoundException(`Medicina con ID ${id} no encontrada`);
    }
    await this.medicinaRepository.delete(id);
  }
}
