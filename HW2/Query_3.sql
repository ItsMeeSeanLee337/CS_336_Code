SELECT DISTINCT Likes.drinker 
FROM Likes 
INNER JOIN Frequents
ON Frequents.drinker=Likes.drinker
INNER JOIN Sells
ON  Sells.beer=Likes.beer AND Sells.bar=Frequents.bar;
