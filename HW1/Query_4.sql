SELECT DISTINCT bar
FROM Frequents
WHERE drinker IN
(
	SELECT name
	FROM Drinkers AS d
	JOIN
	(
		SELECT city
		FROM Drinkers group by city order by COUNT(name) DESC
		LIMIT 1
	)  AS d2
	ON d.city
	IN (d2.city)
);