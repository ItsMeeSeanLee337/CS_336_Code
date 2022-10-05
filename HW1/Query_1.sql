SELECT DISTINCT l.drinker
FROM Drinkers d, Likes l
WHERE (d.phone LIKE '917-%') AND 
	(l.beer="Budweiser" or l.beer = "Bud") AND 
    (d.name=l.drinker);
