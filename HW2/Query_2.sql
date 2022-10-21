SELECT DISTINCT s.beer, s.price, s.bar
FROM (Sells s, Frequents f)
WHERE s.beer='Budweiser' AND f.bar=s.bar AND f.drinker!='Gunjan' AND 0= 
(
	SELECT count(*) 
    	FROM Sells s1 
    	WHERE s1.price > s.price and s1.beer='Budweiser'
) ;
