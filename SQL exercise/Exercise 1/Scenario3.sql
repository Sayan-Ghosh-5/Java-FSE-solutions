SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_due_loans IS
        SELECT c.Name, c.CustomerID, l.LoanID, l.DueDate, l.InterestRate,
               TRUNC(l.DueDate - SYSDATE) AS DaysUntilDue
        FROM Customers c
        JOIN Loans l ON c.CustomerID = l.CustomerID
        WHERE l.DueDate BETWEEN SYSDATE AND SYSDATE + 30
        ORDER BY l.DueDate ASC;
    
    v_reminder_cnt NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== LOAN DUE REMINDERS (Next 30 Days) ===');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    
    FOR rec IN c_due_loans LOOP
        v_reminder_cnt := v_reminder_cnt + 1;
        
        DBMS_OUTPUT.PUT_LINE(
            'Reminder #' || v_reminder_cnt || ': Dear ' || rec.Name || 
            ' (Customer ID: ' || rec.CustomerID || '),' || CHR(10) ||
            '   Your loan (ID: ' || rec.LoanID || 
            ', Rate: ' || rec.InterestRate || '%) is due in ' || 
            rec.DaysUntilDue || ' day(s) on ' || 
            TO_CHAR(rec.DueDate, 'DD-MON-YYYY') || '.' || CHR(10) ||
            '   Please ensure timely payment.'
        );
        DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    END LOOP;
    
    IF v_reminder_cnt = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No loans due in the next 30 days.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('--- Total reminders sent: ' || v_reminder_cnt || ' ---');
    END IF;
END;
/