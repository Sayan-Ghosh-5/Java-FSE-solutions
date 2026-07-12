SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_senior_loans IS
        SELECT c.CustomerID, c.Name, c.DOB, l.LoanID, l.InterestRate
        FROM Customers c
        JOIN Loans l ON c.CustomerID = l.CustomerID;
    
    v_age          NUMBER;
    v_new_rate     NUMBER;
    v_discount_cnt NUMBER := 0;
BEGIN
    FOR rec IN c_senior_loans LOOP
        v_age := FLOOR(MONTHS_BETWEEN(SYSDATE, rec.DOB) / 12);
        
        IF v_age > 60 THEN
            v_new_rate := rec.InterestRate - 1;
            IF v_new_rate < 0 THEN
                v_new_rate := 0;
            END IF;
            
            UPDATE Loans
            SET InterestRate = v_new_rate
            WHERE LoanID = rec.LoanID;
            
            v_discount_cnt := v_discount_cnt + 1;
            
            DBMS_OUTPUT.PUT_LINE('Discount applied: ' || rec.Name || 
                                 ' (Age: ' || v_age || 
                                 ') | LoanID: ' || rec.LoanID || 
                                 ' | Rate: ' || rec.InterestRate || 
                                 '% -> ' || v_new_rate || '%');
        END IF;
    END LOOP;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('--- Total discounts applied: ' || v_discount_cnt || ' ---');
END;
/

