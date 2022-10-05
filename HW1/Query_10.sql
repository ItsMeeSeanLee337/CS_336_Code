SELECT f1.bar
FROM Frequents f1, Frequents f2
WHERE f1.drinker='Mike' AND f2.drinker='Steve' AND f1.bar=f2.bar;