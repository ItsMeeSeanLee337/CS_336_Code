SELECT DISTINCT drinker 
From Frequents AS f1
JOIN 
(
	SELECT bar
	FROM Frequents GROUP BY bar ORDER BY COUNT(drinker) DESC
	LIMIT 1
) AS f2
ON f1.bar
IN (f2.bar);
