import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { PickingSlipsService } from './picking_slips.service';
@Controller('/api/v1/picking-slips')
export class PickingSlipsController {
  constructor(private readonly pickingSlipsService: PickingSlipsService) {}

  @Get()
  findAll() {
    return this.pickingSlipsService.findAll();
  }
}
