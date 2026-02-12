/* =====================================================
   SALES PERFORMANCE DASHBOARD - CORE KPI QUERIES
   ===================================================== */

/* -----------------------------------------------------
   1. Total Revenue, Profit & Profit Margin
   ----------------------------------------------------- */

SELECT 
    SUM(revenue) AS total_revenue,
    SUM(revenue - cost) AS total_profit,
    ROUND((SUM(revenue - cost) / SUM(revenue)) * 100, 2) AS profit_margin_pct
FROM sales;


/* -----------------------------------------------------
   2. Monthly Revenue Trend
   ----------------------------------------------------- */


SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    SUM(revenue) AS monthly_revenue
FROM sales
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY year, month;


/* -----------------------------------------------------
   3. Target Achievement by Salesperson
   ----------------------------------------------------- */

SELECT 
    sp.salesperson_id,
    sp.name,
    SUM(s.revenue) AS total_revenue,
    sp.monthly_target,
    ROUND((SUM(s.revenue) / sp.monthly_target) * 100, 2) 
        AS target_achievement_pct
FROM sales s
JOIN salespersons sp
ON s.salesperson_id = sp.salesperson_id
GROUP BY sp.salesperson_id, sp.name, sp.monthly_target
ORDER BY total_revenue DESC;


/* -----------------------------------------------------
   4. Revenue & Profit by Region
   ----------------------------------------------------- */

SELECT 
    sp.region,
    SUM(s.revenue) AS region_revenue,
    SUM(s.revenue - s.cost) AS region_profit,
    ROUND(
        (SUM(s.revenue - s.cost) / SUM(s.revenue)) * 100, 
        2
    ) AS region_profit_margin_pct
FROM sales s
JOIN salespersons sp
ON s.salesperson_id = sp.salesperson_id
GROUP BY sp.region
ORDER BY region_revenue DESC;


/* -----------------------------------------------------
   5. Top 5 Products by Revenue
   ----------------------------------------------------- */

SELECT 
    p.product_name,
    SUM(s.revenue) AS total_revenue
FROM sales s
JOIN products p
ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;
