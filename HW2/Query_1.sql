SELECT DISTINCT drinker, COUNT(beer)
FROM Likes group by drinker ORDER BY COUNT(beer) DESC;
