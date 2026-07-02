DECLARE
    -- 1. Declare the explicit cursor
    CURSOR GenerateMonthlyStatements IS
        SELECT c.Name, t.AccountID, t.TransactionDate, t.Amount, t.TransactionType
        FROM Transactions t
        JOIN Accounts a ON t.AccountID = a.AccountID
        JOIN Customers c ON a.CustomerID = c.CustomerID
        WHERE TRUNC(t.TransactionDate, 'MM') = TRUNC(SYSDATE, 'MM'); -- Filters for the current month

    -- 2. Create a record variable to hold row data
    v_row GenerateMonthlyStatements%ROWTYPE;
BEGIN
    -- 3. Open the cursor
    OPEN GenerateMonthlyStatements;
    
    LOOP
        -- 4. Fetch the data into the variable
        FETCH GenerateMonthlyStatements INTO v_row;
        EXIT WHEN GenerateMonthlyStatements%NOTFOUND; -- Stop loop when no data is left
        
        -- 5. Print the statement line
        DBMS_OUTPUT.PUT_LINE('Customer: ' || v_row.Name || 
                             ' | Account: ' || v_row.AccountID || 
                             ' | Date: ' || TO_CHAR(v_row.TransactionDate, 'YYYY-MM-DD') || 
                             ' | Type: ' || v_row.TransactionType || 
                             ' | Amount: $' || v_row.Amount);
    END LOOP;
    
    -- 6. Close the cursor
    CLOSE GenerateMonthlyStatements;
END;
/