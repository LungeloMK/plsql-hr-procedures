-- PROCEDURE
CREATE OR REPLACE PROCEDURE empInfo(
  v_id   IN  employees.employee_id%TYPE,
  v_last OUT employees.last_name%TYPE,
  v_sal  OUT employees.salary%TYPE,
  v_dep  OUT employees.department_id%TYPE
) IS
BEGIN
  SELECT last_name, salary, department_id
  INTO   v_last, v_sal, v_dep
  FROM   employees
  WHERE  employee_id = v_id;
END;
/

-- FUNCTION
CREATE OR REPLACE FUNCTION getDepart(
  v_id IN employees.employee_id%TYPE
) RETURN VARCHAR2
IS
  v_Dname departments.department_name%TYPE;
BEGIN
  SELECT d.department_name
  INTO   v_Dname
  FROM   employees e
  JOIN   departments d ON e.department_id = d.department_id
  WHERE  e.employee_id = v_id;

  RETURN v_Dname;
END;
/

-- CALL SAMPLE
SET SERVEROUTPUT ON;
DECLARE
  v_id      employees.employee_id%TYPE := 200;
  v_last    employees.last_name%TYPE; 
  v_sal     employees.salary%TYPE;
  v_dep     employees.department_id%TYPE;
  v_depName departments.department_name%TYPE;
BEGIN
  empInfo(v_id, v_last, v_sal, v_dep);
  v_depName := getDepart(v_id);

  DBMS_OUTPUT.PUT_LINE(v_last || ' ' || v_sal || ' ' || v_dep || ' ' || v_depName);
END;
/
