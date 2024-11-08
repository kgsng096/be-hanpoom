import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PickingSlipsModule } from './picking_slips/picking_slips.module';

@Module({
  imports: [PickingSlipsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
