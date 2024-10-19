import { Test, TestingModule } from '@nestjs/testing';
import { MedicinaController } from './medicina.controller';

describe('ProveedorController', () => {
  let controller: MedicinaController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [MedicinaController],
    }).compile();

    controller = module.get<MedicinaController>(MedicinaController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
