DECLARE
    CURSOR UpdateLoanInterestRates IS
        SELECT LoanID, InterestRate 
        FROM Loans;
BEGIN
    FOR rec IN UpdateLoanInterestRates LOOP
        
        UPDATE Loans
        SET InterestRate = rec.InterestRate + 0.5
        WHERE LoanID = rec.LoanID;
        
        DBMS_OUTPUT.PUT_LINE('Updated Loan ID: ' || rec.LoanID || ' to New Rate: ' || (rec.InterestRate + 0.5) || '%');
    END LOOP;
    
    COMMIT; 
END;
/