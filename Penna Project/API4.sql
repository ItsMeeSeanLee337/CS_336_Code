/*API4(precinct) - Given a precinct,  Show who won this precinct (Trump or Biden) 
as well as what percentage of total votes went to the winner. */

DELIMITER $$
CREATE PROCEDURE API4
(
	IN p VARCHAR(100)
)
BEGIN
	SELECT Biden, TRUMP, IF(Biden > TRUMP , 'Biden', 'Trump') AS Winner, IF(Biden > TRUMP , CONCAT(Biden * 100 / totalvotes, "%"), CONCAT(Trump * 100 / totalvotes, "%")) AS Percentage
	FROM Penna
	WHERE precinct = p AND Timestamp = '2020-11-10 23:31:18';
END;
$$
DELIMITER ;