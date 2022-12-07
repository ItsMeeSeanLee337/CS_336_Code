/*API1(candidate, timestamp, precinct) - Given a candidate C, timestamp T and precinct P, return how many votes did the candidate C  
have at  T or largest timestamp T’ smaller than T, in case T does not appear in Penna.  
In case T <  minimum timestamp in Penna, return 0 as number of votes for C.  
When T > maximum timestamp in Penna, return the last vote in this precinct for this candidate. */

DELIMITER $$
CREATE PROCEDURE API1
(
	IN candidate VARCHAR(5), 
    IN t DATETIME, 
    IN precinct VARCHAR(100) 
)
BEGIN
	SELECT Timestamp AS Last_timestamp
	FROM Penna
	Where Timestamp >= t
	ORDER BY Timestamp DESC
	LIMIT 1;
    
	CASE 
		WHEN candidate = 'Biden' THEN
			SELECT Biden
			FROM Penna
			WHERE (Timestamp = last_timestamp AND precinct = precinct);
		ELSE
			SELECT Trump
			FROM Penna
			WHERE (Timestamp = last_timestamp AND precinct = precinct);
	END CASE;
END;
$$
DELIMITER ;