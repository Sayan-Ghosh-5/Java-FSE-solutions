CREATE OR REPLACE PROCEDURE AddNewCustomer (
    p_CustomerID   IN NUMBER,
    p_Name         IN VARCHAR2,
    p_DOB          IN DATE,
    p_InitialBal   IN NUMBER
) AS
BEGIN
    INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
    VALUES (p_CustomerID, p_Name, p_DOB, p_InitialBal, SYSDATE);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Customer ' || p_Name || ' added successfully with ID: ' || p_CustomerID);

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: Cannot add customer. Customer ID ' || p_CustomerID || ' already exists.');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('SYSTEM ERROR: ' || SQLERRM);
END AddNewCustomer;
/