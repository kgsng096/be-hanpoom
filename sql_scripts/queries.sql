--- fogot the syntax ---
CREATE FUNCTION IF NOT EXISTS  picking_slip_status
( printed_at, inspected_at, shipped_at, held_at)
returns VARCHAR(20) AS
BEGIN

IF(( printed_at, inspected_at, shipped_at, held_at )IS NULL)
RETURN 'not printed'
IF((  inspected_at, shipped_at, held_at) IS NULL AND printed_at NOT NULL )
RETURN 'printed'
IF( held_at IS NOT NULL)
RETURN 'held';

SELECT a.*, b.count_of_pre_order_items from picking_slip_dates as a
    JOIN picking_slip_items as b ON a.picking_slip.id = b.id
        WHERE (
            pre_order_shipping_at = '2023-08-10' AND 
            SELECT * AS  FROM picking_slip_status() = 'printed' AND
            SELECT quantity AS count_of_pre_order_items FROM  picking_slip_items
            WHERE (
                is_pre_order NOT NULL
            )
        )
            ORDER BY created_at DESC
            LIMIT 

