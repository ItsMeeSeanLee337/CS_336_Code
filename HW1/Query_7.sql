SELECT DISTINCT f.bar
FROM Sells, Likes, Frequents f
WHERE Sells.beer=Likes.beer AND f.drinker=Likes.drinker;