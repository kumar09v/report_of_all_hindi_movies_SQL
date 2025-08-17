# SQL Practice Task – Hindi Movies Revenue Report

## 📌 Overview
This practice task demonstrates how to **join multiple tables** using SQL and apply conditional logic with `CASE` and `ROUND()` to normalize revenue values into millions. The output generates a **report of Hindi movies sorted by their revenue**.

## 🗂️ Tables Used
1. **movies** – contains `movie_id`, `title`, `language_id`, etc.  
2. **financials** – contains `movie_id`, `budget`, `revenue`, `currency`, `unit`.  
3. **languages** – contains `language_id`, `name`.

## 🎯 Objective
- List all **Hindi movies**.  
- Show **title, budget, revenue, currency, unit, and revenue (in millions)**.  
- Normalize revenue using **CASE + ROUND()** depending on the unit.  
- Sort the movies by revenue (in millions).  

## 🛠️ SQL Query
```sql
SELECT 
    m.title,
    f.budget,
    f.revenue,
    f.currency,
    f.unit,
    CASE
        WHEN f.unit = "thousands" THEN ROUND(f.revenue / 1000, 1)
        WHEN f.unit = "billions"  THEN ROUND(f.revenue * 1000, 1)
        ELSE ROUND(f.revenue, 1)
    END AS revenue_mln
FROM movies m
JOIN financials f ON f.movie_id = m.movie_id
JOIN languages l ON m.language_id = l.language_id
WHERE l.name = "Hindi"
ORDER BY revenue_mln DESC;
