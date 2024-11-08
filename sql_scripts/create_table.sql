CREATE TABLE IF NOT EXISTS picking_slip_items (
    id BIGINT NOT NULL DEFAULT random(0,524287) PRIMARY KEY,
    CONSTRAINT fk_item 
        FOREIGN KEY (item_id) 
            REFERENCES item_table (id),
    CONSTRAINT fk_stock 
        FOREIGN KEY (stock_id) 
            REFERENCES stock_table (id),
    CONSTRAINT fk_order_fulfillment_product_id 
        FOREIGN KEY (order_fulfillment_product_id) 
            REFERENCES order_fulfillment_table (product_id),
    quantity int(11),
    refunded_quantity int(11),
    location_id BIGINT(11),
    location_code VARCHAR(30),
    is_pre_order TINYINT(1),
    is_sales_only TINYINT(1),
    pre_order_shipping_at TIMESTAMP,
    pre-order_deadline_at TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_AT TIMESTAMP,
);


CREATE TABLE IF NOT EXISTS picking_slip_dates (
    id BIGINT NOT NULL DEFAULT random(0,524287) PRIMARY KEY,
    CONSTRAINT fk_picking_slip_id 
        FOREIGN KEY (picking_slip_id) 
            REFERENCES picking_slips(id),
    printed_username VARCHAR(20),
    inspected_username VARCHAR(20),
    packed_username VARCHAR(20),
    shipped_username VARCHAR(20),
    held_username VARCHAR(20),
    canceled_username VARCHAR(20),
    refunded_username VARCHAR(20),
    confirmed_username VARCHAR(20),
    printed_at TIMESTAMP,
    inspected_at TIMESTAMP,
    packed_at TIMESTAMP,
    shipped_at TIMESTAMP,
    delivered_at TIMESTAMP,
    returned_at TIMESTAMP,
    cancelled_at TIMESTAMP,
    refunded_at TIMESTAMP,
    held_at TIMESTAMP,
    confirmed_at TIMESTAMP,
    held_reason VARCHAR(20)

    UNIQUE(picking_slip_id)
);

CREATE TABLE IF NOT EXISTS picking_slips (
    id BIGINT NOT NULL DEFAULT random(0,524287) PRIMARY KEY,
    FOREIGN KEY (order_id) 
        REFERENCES order_table(id),
    printed_username VARCHAR(20),
    order_fulfillment_order_id  BIGINT(20),
    is_contained_single_product TINYINT(1),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
);