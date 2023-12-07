SELECT restaurant_visits.id, ROUND(AVG(restaurant_visits.reserve_total_visitors), 0) AS avg_reserve_visitors
FROM restaurant_visits
JOIN date_info ON restaurant_visits.visit_date = date_info.calendar_date
WHERE date_info.holiday_flg = 1
GROUP BY restaurant_visits.id
ORDER BY avg_reserve_visitors DESC
LIMIT 5;
