SELECT name AS beer_name
FROM Beers 
WHERE name IN 
(
	SELECT beer 
	FROM Likes 
	WHERE drinker = 'Mike'
);