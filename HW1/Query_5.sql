SELECT DISTINCT name AS bar_name
from Bars, Sells s
WHERE s.beer in
(
	SELECT name 
	FROM Beers 
	WHERE name IN 
	(
        SELECT beer 
		FROM Likes 
		WHERE drinker = 'Mike'
	)
);
