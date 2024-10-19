import { MedicinaService } from './medicina.service';
import { CreateMedicinaDto } from './create-medicina.dto';
import { UpdateMedicinaDto } from './update-medicina.dto';
import { Medicina } from './entities/medicina.entity';
export declare class MedicinaController {
    private readonly MedicinaService;
    constructor(MedicinaService: MedicinaService);
    findAll(): Promise<Medicina[]>;
    create(createMedicinaDto: CreateMedicinaDto): Promise<Medicina>;
    update(id: number, updateMedicinaDto: UpdateMedicinaDto): Promise<Medicina>;
    remove(id: number): Promise<void>;
}
