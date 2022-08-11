-Creatin company DB--
CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);

CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);


-- -----------------------------------------------------------------------------

-- Corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

______________________________________________________________________________________________________________
--Working with the above data--

select first_name as forename, last_name as surname  from employee limit 5; -- change header

select distinct branch_id from employee limit 5; -- Duplicates removed

select count(emp_id)  from employee; -- count

select count(emp_id)  from employee where sex ='M' and birth_day >'1940-01-01'; -- count, where, and
 
select avg(salary)  from employee; -- average, sum

select count(sex),sex  from employee group by sex; -- groupby

-- wildcards: Defining pattern between data

select * from clients where client_name like '%LLC -- % any no of characters before
select * from employee where birth_date like	 '____-10%' -- _ one character

--Union
select first_name from employee
union
select branch_name from branch

--Join - to combain two or more columns from different table

select employee.emp_id,employee.first_name, branch.branch_name from employee
join branch
on employee.emp_id = branch.mgr_id;

--left join- to include all result in left table but will have null
--right join- to include all result in right table
--full join - to include both the table


--nested query--

select first_name , last_name  from employee
where emp_id in (select  emp_id from works_with where total_sales > 30000);


select  client.client_name from client
where client.branch_id = 
(
  select branch.branch_id 
  from branch
  where branch.mgr_id = 106
  limit 1
  );
  

--on delete--
-On Delete Set Null - Data will be set NULL when deleted - Can be used where foreign key is
not primary key-
-On delete cascase - Associated data will be deleted - Can be used where foreign 
key is primary key-


--Triggers-- 
--  Not working in dbeaver--

DELIMITER $$
CREATE
    TRIGGER my_trigger BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
         IF NEW.sex = 'M' THEN
               INSERT INTO trigger_test VALUES('added male employee');
         ELSEIF NEW.sex = 'F' THEN
               INSERT INTO trigger_test VALUES('added female');
         ELSE
               INSERT INTO trigger_test VALUES('added other employee');
         END IF;
    END$$
DELIMITER ;

--Aggregate functions -sum,count,avg,etc--

--Alter / modify--

alter table sample 
add column avg float;

-Use modify to change the data typer-

--Other functions --

update sample
set avg = (select avg(salary) from sample)
where department = 'HR';

SELECT department, 
       first_name, 
       salary, 
       avg(salary) over (PARTITION BY salary) 
FROM sample;


---Rank---

SELECT from_user,
       total_emails
FROM
  (SELECT from_user,
          COUNT(*) AS total_emails,
          RANK() OVER (
                       ORDER BY count(*) DESC) rnk
   FROM google_gmail_emails
   GROUP BY from_user) a
WHERE rnk = 1

--Rank2---
select *,max(salary) over() as max_salary from employee;

--Rank 3 - Based on branch--
select *,row_number() over(partition by branch_id order by emp_id) as rn from employee;

--Rank 3 --Top 2 in branch--
  
  
  ---VIEW-
  
drop view if exists depo_loan;
create view depo_loan as
(SELECT loan.cus_id ,loan.loan_amount ,loan.branch_id,deposit.deposit_amount 
FROM loan
JOIN deposit
ON loan.cus_id = deposit.cus_id);
