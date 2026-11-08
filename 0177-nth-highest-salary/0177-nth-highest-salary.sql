CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      with nth as(
        select id,
               salary,
               dense_rank() over(order by salary DESC) as rnk
        from Employee 
      )
      select salary
      from nth
      where rnk=N 
      LIMIT 1     

      

  );
END