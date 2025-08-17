SELECT 
m.title, budget, revenue, currency, unit,
CASE
WHEN unit = "thousands" THEN ROUND(revenue/1000,1)
WHEN unit = "billions"  THEN ROUND(revenue*1000,1)
ELSE ROUND(revenue,1)
END as revenue_mln
FROM financials f 
JOIN movies m ON f.movie_id = m.movie_id 
JOIN languages l ON m.language_id = l.language_id 
WHERE l.name = "Hindi"
ORDER BY revenue_mln DESC;