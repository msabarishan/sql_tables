# sql_tables

# TO DISPLAY TABLE
SELECT * FROM TABLE_NAME

#TO INSERT VALUE INTO TABLE
INSERT INTO TABLE_NAME VALUES(CO1,CO2,2O3,..)


#TO CREATE A TABLE
CREATE TABLE table_name(
column1 datatype,
column2 datatype,
column3 datatype,
.....
columnN datatype,
PRIMARY KEY( one or more columns )
);

#EG FOR CREATING TABLE
CREATE TABLE COMPANY(
   ID INT PRIMARY KEY     1,
   NAME           TEXT    JOEY,
   AGE            INT     29,
   ADDRESS        CHAR(50) LONDON,
   SALARY         REAL 40000
);

#EG FOR INSERTING VALUE INTO TABLE
INSERT INTO COMPANY VALUES(2,'AKIL',23,'ARKINSAS',4500);	

#REMONVE TABLE
DROP TABLE table_name;

# THE ABOVE ALL ARE COMBAINED AS CODES
CREATE TABLE COMPANY(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL,
   JOIN_DATE	  DATE
);
INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY,JOIN_DATE) VALUES (1, 'Paul', 32, 'California', 40000.00,'2001-07-23');
INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY,JOIN_DATE) VALUES (2, 'Sam', 33, 'kentuky', 50000.00,'2001-03-13');
INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY,JOIN_DATE) VALUES (3, 'Joel', 42, 'Arizona', 70000.00,'1990-07-13');
INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY,JOIN_DATE) VALUES (4, 'Peter', 22, 'Miami', 10000.00,'2020-07-13');
