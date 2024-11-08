import { Entity, PrimaryColumn, Column, ManyToOne } from 'typeorm';

@Entity()
export class PickingSlip {
  @PrimaryColumn({ type: 'bigint' })
  id: number;

  @Column({ type: 'bigint' })
  order_id: number;

  @Column({ type: 'tinyint' })
  is_contained_single_product: number;

  @Column({ type: 'timestamp' })
  created_at: Date;

  //  foreign key creation since
  //  @ManyToOne({type} => OrderedBulkOperation, (order:Order) => order.id)
}
