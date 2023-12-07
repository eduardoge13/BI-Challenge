SELECT date_info.day_of_week, ROUND(AVG(reserve_visitors), 0) AS avg_reserve_visitors
FROM restaurant_visits 
JOIN date_info ON restaurant_visits.visit_date = date_info.calendar_date 
GROUP BY date_info.day_of_week 
ORDER BY avg_reserve_visitors DESC 
LIMIT 1;