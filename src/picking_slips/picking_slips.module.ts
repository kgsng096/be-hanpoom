import { Module } from '@nestjs/common';
import { PickingSlipsService } from './picking_slips.service';
import { PickingSlipsController } from './picking_slips.controller';

@Module({
  controllers: [PickingSlipsController],
  providers: [PickingSlipsService],
})
export class PickingSlipsModule {}
