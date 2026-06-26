CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
BEGIN
    -- Update all savings accounts by multiplying the balance by 1.01 (1% increase)
    UPDATE Accounts
    SET Balance = Balance * 1.01,
        LastModified = SYSDATE
    WHERE AccountType = 'Savings';

    -- Commit the transaction to save changes
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Monthly interest of 1% processed for all Savings accounts.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERROR processing interest: ' || SQLERRM);
END ProcessMonthlyInterest;
/