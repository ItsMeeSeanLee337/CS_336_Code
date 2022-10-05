SELECT DISTINCT drinker
FROM Sells, Likes
Where Sells.bar='Caravan' AND Sells.beer=Likes.beer;