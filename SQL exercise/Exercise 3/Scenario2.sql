CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    p_Department IN VARCHAR2,
    p_BonusPct   IN NUMBER
) AS
    v_RowsUpdated NUMBER;
BEGIN
    -- Apply the bonus percentage to the specified department
    UPDATE Employees
    SET Salary = Salary + (Salary * (p_BonusPct / 100))
    WHERE UPPER(Department) = UPPER(p_Department);
    
    v_RowsUpdated := SQL%ROWCOUNT;
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Bonus applied successfully. Total employees updated in ' || p_Department || ': ' || v_RowsUpdated);
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERROR updating bonuses: ' || SQLERRM);
END UpdateEmployeeBonus;
/