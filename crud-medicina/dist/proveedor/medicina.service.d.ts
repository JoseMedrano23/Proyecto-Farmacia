import { Repository } from 'typeorm';
import { Medicina } from './entities/medicina.entity';
import { CreateMedicinaDto } from './create-medicina.dto';
import { UpdateMedicinaDto } from './update-medicina.dto';
export declare class MedicinaService {
    private medicinaRepository;
    constructor(medicinaRepository: Repository<Medicina>);
    findAll(): Promise<Medicina[]>;
    create(createMedicinaDto: CreateMedicinaDto): Promise<Medicina>;
    update(id: number, updateMedicinaDto: UpdateMedicinaDto): Promise<Medicina>;
    remove(id: number): Promise<void>;
}
