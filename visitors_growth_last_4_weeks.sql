WITH WeeklyVisits AS (
    SELECT DATE_TRUNC('week', visit_datetime) AS week_start, SUM(reserve_visitors) AS total_visitors
    FROM restaurant_visits
    WHERE visit_datetime >= (SELECT MAX(visit_datetime) - INTERVAL '4 weeks' FROM restaurant_visits)
    GROUP BY DATE_TRUNC('week', visit_datetime)
    ORDER BY week_start
)
SELECT
    week_start,
    total_visitors,
    LAG(total_visitors) OVER (ORDER BY week_start) AS previous_week_visitors,
    CASE
        WHEN LAG(total_visitors) OVER (ORDER BY week_start) = 0 THEN NULL
        ELSE ROUND(((total_visitors::NUMERIC - LAG(total_visitors) OVER (ORDER BY week_start)::NUMERIC) / LAG(total_visitors) OVER (ORDER BY week_start)::NUMERIC) * 100, 2)
    END AS percentage_growth
FROM WeeklyVisits
ORDER BY week_start DESC
LIMIT 4;