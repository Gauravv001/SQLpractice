/* You want to check if there are any employees in the Sales department.

Question: How can you use the EXISTS operator to verify if a department has employees?

The EXISTS operator checks if a subquery returns any rows. If it does, the result is TRUE
*/

-- If employees exist in the Sales department, the result will be 1 (true)
Select EXISTS( SELECT 1 FROM employees WHERE department = 'Sales' ); -- 1


Select EXISTS( SELECT 1 FROM employees WHERE department = 'roleplayer' ); -- 0