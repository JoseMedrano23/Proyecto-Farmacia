import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Medicina } from './entities/medicina.entity';
import { CreateMedicinaDto } from './create-medicina.dto';
import { UpdateMedicinaDto } from './update-medicina.dto';


@Injectable()
export class MedicinaService {
  constructor(
    @InjectRepository(Medicina)
    private medicinaRepository: Repository<Medicina>,
  ) {}

  findAll(): Promise<Medicina[]> {
    return this.medicinaRepository.find();
  }

  create(createMedicinaDto: CreateMedicinaDto): Promise<Medicina> {
    const medicina = this.medicinaRepository.create(createMedicinaDto);
    return this.medicinaRepository.save(medicina);
  }

  async update(id: number, updateMedicinaDto: UpdateMedicinaDto): Promise<Medicina> {
    await this.medicinaRepository.update(id, updateMedicinaDto);
    return this.medicinaRepository.findOneBy({ id });
  }

  async remove(id: number): Promise<void> {
    await this.medicinaRepository.delete(id);
  }
}

