CREATE OR ALTER VIEW vw_olist_order_master AS
WITH OrderPaymentSummary AS (
    SELECT
        order_id,
        SUM(payment_value) AS total_payment_value,
        MAX(payment_installments) AS max_installments
    FROM olist_order_payments_dataset
    WHERE payment_value > 0
    GROUP BY order_id
),
OrderItemSummary AS (
    SELECT
        order_id,
        SUM(price) AS total_product_value,
        SUM(freight_value) AS total_freight_value,
        COUNT(order_item_id) AS total_items
    FROM olist_order_items_dataset
    GROUP BY order_id
)
SELECT
    o.order_id,
    o.order_status,
    o.order_purchase_timestamp,
    DATEFROMPARTS(YEAR(o.order_purchase_timestamp), MONTH(o.order_purchase_timestamp), 1) AS purchase_month,
    o.customer_id,
    c.customer_unique_id,
    c.customer_state,
    p.total_payment_value,
    p.max_installments,
    CASE WHEN p.max_installments > 1 THEN 1 ELSE 0 END AS is_installment,
    CASE WHEN p.max_installments > 1 THEN 'Installments (2+)' ELSE 'Full Payment (1)' END AS payment_type_group,
    i.total_product_value,
    i.total_freight_value,
    i.total_items,
    (i.total_product_value + i.total_freight_value) AS landed_cost,
    ROUND((i.total_freight_value / NULLIF((i.total_product_value + i.total_freight_value), 0)) * 100.0, 2) AS freight_burden_pct
FROM olist_orders_dataset o
INNER JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
INNER JOIN OrderPaymentSummary p ON o.order_id = p.order_id
LEFT JOIN OrderItemSummary i ON o.order_id = i.order_id
WHERE o.order_status = 'delivered'
  AND o.order_approved_at IS NOT NULL
  AND o.order_delivered_customer_date IS NOT NULL
GO

CREATE OR ALTER VIEW vw_olist_order_items AS
SELECT
    i.order_id,
    i.order_item_id,
    i.product_id,
    i.price,
    i.freight_value,
    COALESCE(t.column2, prod.product_category_name, 'Unknown') AS product_category_name_english
FROM olist_order_items_dataset i
LEFT JOIN olist_products_dataset prod 
    ON i.product_id = prod.product_id
LEFT JOIN product_category_name_translation t 
    ON prod.product_category_name = t.column1;
GO