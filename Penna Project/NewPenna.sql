/*1) newPenna(): This stored procedure will create a table newPenna, showing for each precinct  
how many votes were added to totalvotes, Trump, Biden between timestamp T and the last timestamp directly preceding  T.  
In other words, create a table like Penna but replace totalvotes with newvotes, 
Trump with new_Trump and Biden with new_Biden.  
Stored procedure with cursor is recommended. 
For example the tuple in the new table newPenna:

newPenna('Hanover', ‘2020-11-06 19:10:53’, 36, 27,9) 
states that 36 additional votes were added at timestamp 2020-11-06 19:10:53’ since the last timestamp preceding it 
(which is 2020-11-06 16:26:51), 27 were added  for Biden and 9  were added for Trump in Hanover precinct.. */

CREATE TABLE newPennatable (
		precinct varchar(100),
        Timestamp datetime,
        newVotes INT,
        newTrump INT,
        newBiden INT
    );
DELIMITER $$

CREATE PROCEDURE newPenna()
BEGIN
	DECLARE previousPrecinct VARCHAR(100) DEFAULT NULL;
    DECLARE previousTimestamp VARCHAR(100) DEFAULT NULL;
    DECLARE previousTotalvotes INT DEFAULT NULL;
    DECLARE previousTrump INT DEFAULT NULL;
    DECLARE previousBiden INT DEFAULT NULL;
    DECLARE currentPrecinct VARCHAR(100) DEFAULT NULL;
    DECLARE currentTimestamp VARCHAR(100) DEFAULT NULL;
    DECLARE currentTotalvotes INT DEFAULT NULL;
    DECLARE currentTrump INT DEFAULT NULL;
    DECLARE currentBiden INT DEFAULT NULL;
	DECLARE cur CURSOR FOR SELECT precinct, Timestamp, totalvotes, Trump, Biden FROM Penna;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = 1;
    OPEN cur;
    FETCH NEXT FROM cur INTO currentPrecinct, currentTimestamp, currentTotalvotes, currentTrump, currentBiden;
    newPennaInsert : LOOP
		IF no_more_rows = 1 THEN
			LEAVE newPennaInsert;
		END IF;
		IF (currentTotalvotes > previousTotalvotes) THEN
			SET totalvotesdifference = currentTotalvotes - previousTotalvotes;
            SET Trumpdifference = currentTrump - previousTrump;
            SET Bidendifference = currentBiden - previousBiden;
			INSERT INTO newPenna(currentPrecinct, currentTimestamp, totalvotesdifference, Trumpdifference, Bidendifference)
			VALUES(precinct, timestamp, fromCandidate, toCandidate);
        END IF;
        SET previousPrecinct = currentPrecinct;
        SET previousTimestamp = currentTimestamp;
        SET previousTotalvotes = currentTotalvotes;
        SET previousTrump = currentTrump;
        SET previousBiden = currentBiden;
		FETCH NEXT FROM cur INTO currentPrecinct, currentTimestamp, currentTotalvotes, currentTrump, currentBiden;
	END LOOP;
    CLOSE cur;
END;
$$
DELIMITER ;