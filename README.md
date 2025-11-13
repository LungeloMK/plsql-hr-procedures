# PL/SQL HR Procedures

PL/SQL examples using the Oracle HR schema, including:

- `empInfo` procedure: returns last name, salary, and department for a given employee ID
- `getDepart` function: returns department name for a given employee ID
- An anonymous block to call both and print results via `DBMS_OUTPUT`

## Files

- `scripts/hr_examples.sql` – Procedure, function, and call block

## Usage

1. Connect to an Oracle database with the HR schema available.
2. Run the contents of `scripts/hr_examples.sql` in SQL*Plus, SQL Developer, or any Oracle client.
3. Ensure `SET SERVEROUTPUT ON` is enabled to see the `DBMS_OUTPUT` result.

## Notes

- Uses `%TYPE` anchors against HR tables for type safety.
- Uses an explicit join for department lookup.


