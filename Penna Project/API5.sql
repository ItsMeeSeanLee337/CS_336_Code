/*API5(string) - Given a string s of characters, create a stored procedure which determines who won more votes in all 
precincts whose names contain this string s and how many votes did they get in total.  
For example,  for  s= ‘Township’, the procedure will return the name (Trump or Biden) 
who won more votes in union of  precincts which have “Township” in their name as well as sum of votes for the winner in such precincts.
Hint: Use Locate() function from mysql to find if value of a variable is substring of a column name.*/

DELIMITER $$
CREATE PROCEDURE API5
(
	IN s VARCHAR(100)
)
BEGIN
	SELECT IF(SUM(Biden) > SUM(TRUMP), SUM(Biden), SUM(TRUMP)) AS Winner_Votes ,IF(SUM(Biden) > SUM(TRUMP), 'Biden', 'Trump') AS Winner
    FROM Penna
    WHERE LOCATE(s, precinct) > 0 AND Timestamp = '2020-11-10 23:31:18';
END;
$$
DELIMITER ;