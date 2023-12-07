SELECT id,visit_date, SUM(reserve_visitors) AS total_visitors
FROM restaurant_visits
GROUP BY visit_date,id
ORDER BY visit_date;
