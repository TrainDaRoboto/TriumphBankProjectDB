use nmparkhurst_proj;
START TRANSACTION;
SAVEPOINT before_new_card_change;
UPDATE transactInfo 
SET debits = '0', credits = '200', transferAmnt = '200' WHERE (transactID = '5');

SAVEPOINT before_new_transact;
UPDATE customerActInfo 
SET accBal = '-110' WHERE (accountID = '5');

ROLLBACK TO SAVEPOINT before_new_card_change;
ROLLBACK TO SAVEPOINT before_new_transact;

COMMIT;