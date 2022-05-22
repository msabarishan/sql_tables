
CREATE TABLE COMPANY(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL,
   JOIN_DATE	  DATE
);
INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY,JOIN_DATE) VALUES (1, 'ARUN', 32, 'WEST MAMABALAM', 40000.00,'2001-07-23');
INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY,JOIN_DATE) VALUES (2, 'AKIL', 33, 'ADAYAR', 50000.00,'2001-03-13');
INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY,JOIN_DATE) VALUES (3, 'BALU', 42, 'ANNA NAGAR', 70000.00,'1990-07-13');
INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY,JOIN_DATE) VALUES (4, 'DINU', 22, 'WIMCO', 10000.00,'2020-07-13');

SELECT * FROM COMPANY;