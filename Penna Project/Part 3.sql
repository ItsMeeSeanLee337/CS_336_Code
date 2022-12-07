/*Write SQL queries or stored procedures to check if the following patterns are enforced in the database:
a)   The sum of votes for Trump and Biden cannot be larger than totalvotes*/
SELECT
    CASE WHEN EXISTS 
    (
        SELECT *
		FROM Penna
		WHERE Trump + Biden > totalvotes
    )
    THEN 'TRUE'
    ELSE 'FALSE'
	END AS ANSWER;

/*b)    There cannot be any tuples with timestamps later than Nov 11 and earlier than Nov3*/
SELECT
    CASE WHEN EXISTS 
    (
        SELECT *
		FROM Penna
		WHERE timestamp > '202-11-11' OR timestamp < '2020-11-03'
    )
    THEN 'TRUE'
    ELSE 'FALSE'
	END AS ANSWER;

/*c)  Totalvotes for any precinct and at any timestamp T > 2020-11-05 00:00:00,   will be larger or equal to totalvotes  at T’<T where T’>2020-11-05 00:00:00 for that precinct.  
In other words the total votes of any precinct should not decrease with increasing timestamps within the day of 2020-11-05. */
SELECT
    CASE WHEN EXISTS 
    (
        SELECT *
		FROM Penna
		WHERE timestamp > '2020-11-05 00:00:00' AND totalvotes <
		(
			SELECT totalvotes
			FROM Penna
			WHERE precinct = precinct AND timestamp = '2020-11-05 00:00:00'
		)
    )
    THEN 'TRUE'
    ELSE 'FALSE'
	END AS ANSWER;
