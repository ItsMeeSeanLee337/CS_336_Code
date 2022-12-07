/*MoveVotes(Precinct, Timestamp, Candidate, Number_of_Moved_Votes)
Precinct – one of the existing precincts
Timestamp must be existing timestamp. If Timestamp does not appear in Penna than MoveVotes should display a message “Unknown Timestamp”. 
The Number_of_Moved_Votes  parameter  (always positive integer) shows the number of votes to be moved from the Candidate to another candidate 
and it cannot be larger than number of votes that the Candidate has at the Timestamp.  
If this is the case MoveVotes () should display a message “Not enough votes”.  
Of course if CoreCandidate is neither Trump nor Biden, MoveVotes() should say “Wrong Candidate”. 

Just as stated before each exception should lead to a message “wrong candidate name”
, “wrong precinct name’ or not existing timestamp (this time we will not approximate like in API1()).  
In your video demonstrate some exceptions as well as the result of your procedure by running a query following call of MoveVotes(). 
 
MoveVotes() should  move the Number_of_Moved_Votes from CoreCandidate to another candidate (there are only two) 
and do it not just for this Timestamp (the first parameter) but also for all T>Timestamp, that is all future timestamps in the given precinct.
For example MoveVotes(Red Hill, 2020-11-06 15:38:36,’Trump’,100) 
will remove 100 votes from Trump and move it to Biden at 2020-11-06 15:38:36 and all future timestamps after that in the Red Hill precinct. */

DELIMITER $$
CREATE PROCEDURE MoveVotes
(
	IN p VARCHAR(100),
    IN t TIMESTAMP,
    IN Candidate VARCHAR(5),
    IN Number_of_Moved_Votes INT
)
BEGIN
	IF NOT EXISTS(SELECT precinct FROM test_penna WHERE precinct = p) THEN
		SELECT 'wrong precinct name' AS 'ERROR';
	END IF;
	
    IF NOT EXISTS(SELECT precinct FROM test_penna WHERE Timestamp = t) THEN
		SELECT 'Unknown Timestamp' AS 'ERROR';
	END IF;
    IF (Candidate != 'Biden' AND Candidate != 'Trump') THEN
		SELECT 'Wrong Candidate Name' AS ERROR;
	END IF;
	CASE
		WHEN Candidate = 'Biden' THEN
			UPDATE test_penna
            SET Biden = Biden - Number_of_Moved_Votes, Trump = Trump + Number_of_Moved_Votes
            WHERE (Timestamp >= t AND precinct = p);
        ELSE
			UPDATE test_penna
            SET Biden = Biden + Number_of_Moved_Votes, Trump = Trump - Number_of_Moved_Votes
            WHERE (Timestamp >= t AND precinct = p);
    END CASE;
END;
$$
