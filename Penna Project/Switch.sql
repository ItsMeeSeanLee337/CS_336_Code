/*2) Switch(): This stored procedure will return list of precincts, which have switched their winner from one candidate in last 24 hours of vote collection 
(i.e 24 hours before the last Timestamp data was collected) and that candidate was the ultimate winner of this precinct.   
The format of the table should be:
Switch(precinct, timestamp, fromCandidate, toCandidate) 
where fromCandidate is the candidate who was leading at timestamp in precinct, but he lost the lead to the toCandidate (who maintained that lead till the end) 
For example

Switch('Hanover', '2020-11-07 16:41:11', Trump', 'Biden') 
will mean that Biden took the lead from Trump on '2020-11-07 16:41:11' in Hanover Precinct and led all the way till the end of count in Hanover precinct. */
DELIMITER $$
CREATE PROCEDURE Switch()
BEGIN
    SELECT p1.precinct, p2.Timestamp, IF(p2.Biden > p2.TRUMP , 'Trump', 'Biden') AS Loser, IF(p2.Biden > p2.TRUMP , 'Biden', 'Trump') AS Winner
    FROM Penna p1, Penna p2
    WHERE (p1.Timestamp = '2020-11-10 23:31:18' AND p2.Timestamp = '2020-11-07 23:06:36' AND p1.precinct = p2.precinct) AND
		((p1.Biden > p1.Trump AND p2.Biden < p2.Trump) OR
        (p1.Trump > p1.Biden AND p2.Trump < p2.Biden));
END;
$$
DELIMITER ;