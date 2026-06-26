CREATE OR REPLACE PROCEDURE SafeTransferFunds (
    p_FromAccountID IN NUMBER,
    p_ToAccountID   IN NUMBER,
    p_Amount        IN NUMBER
) AS
    v_SourceBalance NUMBER;
    v_DestExists    NUMBER;
    insufficient_funds EXCEPTION;
    invalid_destination EXCEPTION;
BEGIN
    -- 1. Check if source account exists and get balance
    SELECT Balance INTO v_SourceBalance 
    FROM Accounts 
    WHERE AccountID = p_FromAccountID;
    
    -- 2. Check if destination account exists
    SELECT COUNT(*) INTO v_DestExists 
    FROM Accounts 
    WHERE AccountID = p_ToAccountID;
    
    IF v_DestExists = 0 THEN
        RAISE invalid_destination;
    END IF;

    -- 3. Check for sufficient funds
    IF v_SourceBalance < p_Amount THEN
        RAISE insufficient_funds;
    END IF;

    -- 4. Perform the transfer
    UPDATE Accounts 
    SET Balance = Balance - p_Amount 
    WHERE AccountID = p_FromAccountID;

    UPDATE Accounts 
    SET Balance = Balance + p_Amount 
    WHERE AccountID = p_ToAccountID;

    -- 5. Commit the changes if everything is successful
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Transfer of $' || p_Amount || ' completed successfully.');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERROR: Source account ID ' || p_FromAccountID || ' does not exist.');
    WHEN invalid_destination THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERROR: Destination account ID ' || p_ToAccountID || ' does not exist.');
    WHEN insufficient_funds THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERROR: Transfer failed. Insufficient funds in Account ' || p_FromAccountID);
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('SYSTEM ERROR: ' || SQLERRM);
END SafeTransferFunds;
/