DECLARE
    -- 1. Declare the explicit cursor
    CURSOR ApplyAnnualFee IS
        SELECT AccountID, Balance 
        FROM Accounts;
BEGIN
    -- 2. The FOR loop automatically opens, fetches, and closes the cursor
    FOR rec IN ApplyAnnualFee LOOP
        
        -- 3. Deduct a $20 annual fee from each account
        UPDATE Accounts
        SET Balance = Balance - 20,
            LastModified = SYSDATE
        WHERE AccountID = rec.AccountID;
        
        DBMS_OUTPUT.PUT_LINE('Deducted $20 annual fee from Account ID: ' || rec.AccountID);
    END LOOP;
    
    COMMIT; -- Save changes
END;
/