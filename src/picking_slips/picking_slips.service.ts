import { Injectable } from '@nestjs/common';
import { DataSource } from 'typeorm';
import { PickingSlip } from './entities/picking_slip.entity';

@Injectable()
export class PickingSlipsService {
  //created data source
  dataSource = new DataSource(/*...*/);
  findAll(limit?: number, picking_status?: string) {
    const query = async () => {
      try {
        const {
          order_id,
          picking_slip_id,
          picking_slip_status,
          count_of_pre_order_items,
        } = await dataSource.manager.query(
          `SELECT a.*, b.count_of_pre_order_items, picking_slip_status FROM picking_slip_dates as a
    JOIN picking_slip_items as b ON a.picking_slip.id = b.id
        WHERE (
            pre_order_shipping_at = '2023-08-10' AND 
            SELECT * AS picking_slip_status FROM picking_slip_status() = ${picking_status} AND
            SELECT quantity AS count_of_pre_order_items FROM  picking_slip_items
            WHERE (
                is_pre_order NOT NULL
            )
        )
            ORDER BY created_at DESC
            LIMIT ${limit || 3}`,
        );

        return {
          order_id,
          picking_slip_id,
          picking_slip_status,
          has_pre_order_item: !count_of_pre_order_items ? null : 'Yes',
        };
      } catch (error) {}
    };
  }
}
