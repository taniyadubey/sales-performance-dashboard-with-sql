/* =====================================================
   SALES PERFORMANCE DASHBOARD - ADVANCED ANALYTICS
   ===================================================== */


/* -----------------------------------------------------
   1. Rolling 3-Month Revenue
   ----------------------------------------------------- */

WITH monthly_revenue AS (
    SELECT 
        DATE_FORMAT(sale_date, '%Y-%m') AS month,
        SUM(revenue) AS revenue
    FROM sales
    GROUP BY month
)

SELECT
    month,
    revenue AS monthly_revenue,
    SUM(revenue) OVER (
        ORDER BY month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS rolling_3_month_revenue
FROM monthly_revenue
ORDER BY month;


/* -----------------------------------------------------
   2. Salesperson Ranking (Overall)
   ----------------------------------------------------- */

SELECT
    sp.name,
    SUM(s.revenue) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(s.revenue) DESC
    ) AS revenue_rank
FROM sales s
JOIN salespersons sp
ON s.salesperson_id = sp.salesperson_id
GROUP BY sp.name;


/* -----------------------------------------------------
   3. Salesperson Ranking Within Region
   ----------------------------------------------------- */

SELECT
    sp.region,
    sp.name,
    SUM(s.revenue) AS total_revenue,
    RANK() OVER (
        PARTITION BY sp.region
        ORDER BY SUM(s.revenue) DESC
    ) AS regional_rank
FROM sales s
JOIN salespersons sp
ON s.salesperson_id = sp.salesperson_id
GROUP BY sp.region, sp.name;


/* -----------------------------------------------------
   4. Contribution % by Region
   ----------------------------------------------------- */

SELECT
    sp.region,
    SUM(s.revenue) AS region_revenue,
    ROUND(
        SUM(s.revenue) * 100 /
        SUM(SUM(s.revenue)) OVER (),
        2
    ) AS contribution_pct
FROM sales s
JOIN salespersons sp
ON s.salesperson_id = sp.salesperson_id
GROUP BY sp.region;


/* -----------------------------------------------------
   5. Underperformer Detection (<70% of Target)
   ----------------------------------------------------- */

SELECT
    sp.name,
    SUM(s.revenue) AS total_revenue,
    sp.monthly_target,
    ROUND(
        (SUM(s.revenue) / sp.monthly_target) * 100, 
        2
    ) AS achievement_pct,
    CASE
        WHEN SUM(s.revenue) < 0.7 * sp.monthly_target
        THEN 'Underperformer'
        ELSE 'On Track'
    END AS performance_flag
FROM sales s
JOIN salespersons sp
ON s.salesperson_id = sp.salesperson_id
GROUP BY sp.name, sp.monthly_target;


/* -----------------------------------------------------
   6. Customer Repeat Purchase Rate
   ----------------------------------------------------- */

WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(sale_id) AS order_count
    FROM sales
    GROUP BY customer_id
)

SELECT
    COUNT(CASE WHEN order_count > 1 THEN 1 END)
        * 100.0 / COUNT(*) AS repeat_purchase_rate_pct
FROM customer_orders;
