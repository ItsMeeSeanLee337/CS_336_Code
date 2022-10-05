SELECT DISTINCT personbeer1.drinker
FROM Likes personbeer1, Likes personbeer2, Likes mike1, Likes mike2
WHERE 
	personbeer1.drinker!='Mike' AND
	mike1.drinker='Mike' AND
	mike2.drinker='Mike' AND
    personbeer1.drinker=personbeer2.drinker AND
    personbeer1.beer!=personbeer2.beer AND
    personbeer1.beer=mike1.beer AND
    personbeer2.beer=mike2.beer AND
    mike1.beer!=mike2.beer;