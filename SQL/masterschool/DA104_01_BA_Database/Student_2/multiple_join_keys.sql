-- Join with multiple join key

-- Use the company_products and company_revenue tables available in the database.

-- What is the quarterly average revenue and quarterly average number of active users for British Airways?

SELECT
    AVG(com_rev.revenue) AS avg_revenue,
    AVG(com_prd.active_users) AS avg_users
FROM company_revenue AS com_rev
LEFT JOIN company_products AS com_prd
ON com_rev.client = com_prd.client AND com_rev.period = com_prd.period
WHERE com_rev.client = 'British Airways'

