import { Test, TestingModule } from '@nestjs/testing';
import { PickingSlipsController } from './picking_slips.controller';
import { PickingSlipsService } from './picking_slips.service';

describe('PickingSlipsController', () => {
  let controller: PickingSlipsController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [PickingSlipsController],
      providers: [PickingSlipsService],
    }).compile();

    controller = module.get<PickingSlipsController>(PickingSlipsController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
