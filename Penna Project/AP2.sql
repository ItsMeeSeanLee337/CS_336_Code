/*API2(date) - Given a date, return the candidate who had the most votes at the last timestamp for this date as well as how many votes he got. 
For example the last timestamp for 2020-11-06 will be 2020-11-06 23:51:43.*/

DELIMITER $$
CREATE PROCEDURE API2
(
	IN d DATE 
)
BEGIN
	SELECT timestamp AS Last_timestamp
	FROM Penna
	Where Timestamp <= DATE_ADD('2020-11-06', INTERVAL 1 day)
	ORDER BY Timestamp DESC
	LIMIT 1;
	
    SELECT SUM(Biden) AS Biden_total, SUM(TRUMP) AS Trump_total, Timestamp, IF(SUM(Biden) > SUM(TRUMP) , 'Biden', 'Trump') AS Winner 
	FROM Penna
	WHERE Timestamp = Last_timestamp;
END;
$$
DELIMITER ;