import { Test, TestingModule } from '@nestjs/testing';
import { MedicinaService } from './medicina.service';

describe('ProveedorService', () => {
  let service: MedicinaService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [MedicinaService],
    }).compile();

    service = module.get<MedicinaService>(MedicinaService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
