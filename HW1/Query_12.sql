SELECT DISTINCT s1.bar
FROM Likes l1, Likes l2, Likes l3, Sells s1, Sells s2, Sells s3
WHERE
	l1.beer=s1.beer AND
    l2.beer=s2.beer AND
    l3.beer=s3.beer AND
    l1.drinker='Mike' AND
    l2.drinker='Mike' AND
    l3.drinker='Mike' AND
    l1.beer!=l2.beer AND
    l1.beer!=l3.beer AND
    l2.beer!=l3.beer AND
    s1.beer!=s2.beer AND
    s1.beer!=s3.beer AND
    s2.bar!=s3.beer AND
    s1.bar=s2.bar AND
    s1.bar=s3.bar AND
    s2.bar=s3.bar;