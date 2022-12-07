/*Create three tables Updated Tuples, Inserted Tuples and Deleted Tuples. 
All three tables should have the same schema as Penna and should store any tuples which were updated (store them as they were before the update), 
any tuples which were inserted,  and any tuples which were deleted in their corresponding tables.  
The triggers should populate these tables upon each update/insertion/deletion. 
There will be one trigger for the update operation, one trigger for the insert operation and one trigger for the delete operation. 
Initially theses tables should be empty. In your video you should show how updates, insertions and deletions result in adding tuples to the Updated Tuples, 
Inserted Tuples and Deleted Tuples.  Show multiple examples of deletions, insertions and updates, and display these tables after each of them.*/
CREATE TABLE updated_tuples LIKE Penna;
CREATE TABLE inserted_tuples LIKE Penna;
CREATE TABLE deleted_tuples LIKE Penna;

CREATE TRIGGER update_penna AFTER UPDATE ON test_penna
       FOR EACH ROW 
       INSERT INTO updated_tuples(ID, Timestamp, state, locality, precinct, geo, totalvotes, Biden, Trump, filestamp)
       values(OLD.ID, OLD.Timestamp, OLD.state, OLD.locality, OLD.precinct, OLD.geo, OLD.totalvotes, OLD.Biden, OLD.Trump, OLD.filestamp);

CREATE TRIGGER insert_penna AFTER INSERT ON test_penna
       FOR EACH ROW 
       INSERT INTO inserted_tuples(ID, Timestamp, state, locality, precinct, geo, totalvotes, Biden, Trump, filestamp)
       values(NEW.ID, NEW.Timestamp, NEW.state, NEW.locality, NEW.precinct, NEW.geo, NEW.totalvotes, NEW.Biden, NEW.Trump, NEW.filestamp);
       
CREATE TRIGGER delete_penna AFTER DELETE ON test_penna
       FOR EACH ROW 
       INSERT INTO deleted_tuples(ID, Timestamp, state, locality, precinct, geo, totalvotes, Biden, Trump, filestamp)
       values(OLD.ID, OLD.Timestamp, OLD.state, OLD.locality, OLD.precinct, OLD.geo, OLD.totalvotes, OLD.Biden, OLD.Trump, OLD.filestamp);