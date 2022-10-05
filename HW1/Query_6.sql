SELECT DISTINCT l1.drinker 
FROM Likes AS l1, Likes AS l2
WHERE l1.beer = l2.beer AND l1.drinker!='Mike' AND l1.drinker != 'Joe';