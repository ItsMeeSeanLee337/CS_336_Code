/*API3(candidate) - Given a candidate return top 10 precincts that this candidate won. 
Order precincts by the attribute: totalvotes and list TOP 10 in descending order of totalvotes.*/

DELIMITER $$
CREATE PROCEDURE API3
(
	IN candidate VARCHAR(5)
)
BEGIN
	CASE 
		WHEN candidate = 'Biden' THEN
			SELECT precinct, totalvotes, Biden, Trump
			FROM penna_original 
			WHERE Biden > Trump
			GROUP BY precinct, totalvotes, Biden, Trump ORDER BY totalvotes DESC
			LIMIT 10;
		ELSE
			SELECT precinct, totalvotes, Trump, Biden
			FROM penna_original 
			WHERE Trump > biden
			GROUP BY precinct, totalvotes, Trump, Biden ORDER BY totalvotes DESC
			LIMIT 10;
	END CASE;
END;
$$
DELIMITER ;