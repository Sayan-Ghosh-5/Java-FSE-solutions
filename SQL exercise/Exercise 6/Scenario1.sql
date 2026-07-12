DECLARE
    CURSOR GenerateMonthlyStatements IS
        SELECT c.Name, t.AccountID, t.TransactionDate, t.Amount, t.TransactionType
        FROM Transactions t
        JOIN Accounts a ON t.AccountID = a.AccountID
        JOIN Customers c ON a.CustomerID = c.CustomerID
        WHERE TRUNC(t.TransactionDate, 'MM') = TRUNC(SYSDATE, 'MM'); -- Filters for the current month

    v_row GenerateMonthlyStatements%ROWTYPE;
BEGIN
    OPEN GenerateMonthlyStatements;
    
    LOOP
        FETCH GenerateMonthlyStatements INTO v_row;
        EXIT WHEN GenerateMonthlyStatements%NOTFOUND; 
        
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