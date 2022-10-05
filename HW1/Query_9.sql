SELECT DISTINCT f.bar
FROM Sells AS s, Likes, Frequents AS f
WHERE s.beer='Budweiser' AND Likes.beer='Budweiser' AND f.drinker=Likes.drinker;