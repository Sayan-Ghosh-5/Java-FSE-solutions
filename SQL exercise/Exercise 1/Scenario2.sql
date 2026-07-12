
SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_vip_check IS
        SELECT CustomerID, Name, Balance, IsVIP
        FROM Customers
        FOR UPDATE;  
    
    v_promoted_cnt NUMBER := 0;
    v_already_vip  NUMBER := 0;
BEGIN
    FOR rec IN c_vip_check LOOP
        IF rec.Balance > 10000 THEN
            IF rec.IsVIP = 'N' OR rec.IsVIP IS NULL THEN
                UPDATE Customers
                SET IsVIP = 'Y'
                WHERE CURRENT OF c_vip_check;
                
                v_promoted_cnt := v_promoted_cnt + 1;
                
                DBMS_OUTPUT.PUT_LINE('Promoted to VIP: ' || rec.Name || 
                                     ' (ID: ' || rec.CustomerID || 
                                     ', Balance: $' || rec.Balance || ')');
            ELSE
                v_already_vip := v_already_vip + 1;
            END IF;
        END IF;
    END LOOP;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('--- Newly promoted: ' || v_promoted_cnt || 
                          ' | Already VIP: ' || v_already_vip || ' ---');
END;
/