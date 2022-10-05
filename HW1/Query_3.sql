SELECT city
FROM Drinkers group by city order by COUNT(name) DESC
lIMIT 1;