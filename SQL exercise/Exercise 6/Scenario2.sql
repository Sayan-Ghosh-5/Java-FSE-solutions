DECLARE
    CURSOR ApplyAnnualFee IS
        SELECT AccountID, Balance 
        FROM Accounts;
BEGIN
    FOR rec IN ApplyAnnualFee LOOP
        
        UPDATE Accounts
        SET Balance = Balance - 20,
            LastModified = SYSDATE
        WHERE AccountID = rec.AccountID;
        
        DBMS_OUTPUT.PUT_LINE('Deducted $20 annual fee from Account ID: ' || rec.AccountID);
    END LOOP;
    
    COMMIT; 
END;
/