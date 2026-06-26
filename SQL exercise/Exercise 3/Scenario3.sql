CREATE OR REPLACE PROCEDURE TransferFunds (
    p_SourceAccountID IN NUMBER,
    p_DestAccountID   IN NUMBER,
    p_Amount          IN NUMBER
) AS
    v_SourceBalance NUMBER;
    insufficient_funds EXCEPTION;
BEGIN
    -- 1. Fetch current balance of the source account
    SELECT Balance INTO v_SourceBalance
    FROM Accounts
    WHERE AccountID = p_SourceAccountID;
    
    -- 2. Validate that they have enough money
    IF v_SourceBalance < p_Amount THEN
        RAISE insufficient_funds;
    END IF;
    
    -- 3. Deduct from source account
    UPDATE Accounts
    SET Balance = Balance - p_Amount,
        LastModified = SYSDATE
    WHERE AccountID = p_SourceAccountID;
    
    -- 4. Add to destination account
    UPDATE Accounts
    SET Balance = Balance + p_Amount,
        LastModified = SYSDATE
    WHERE AccountID = p_DestAccountID;
    
    -- 5. Finalize transaction
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Successfully transferred $' || p_Amount || ' from Account ' || p_SourceAccountID || ' to Account ' || p_DestAccountID);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERROR: One or both of the Account IDs specified do not exist.');
    WHEN insufficient_funds THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERROR: Transfer rejected. Insufficient funds in Account ' || p_SourceAccountID);
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('SYSTEM ERROR: ' || SQLERRM);
END TransferFunds;
/