# sql_tables Basics:
Types of Keys:
1. Primary Key: It helps to uniquely identify records in a table. It can be a single or multiple field. It cannot take null values.
2. Foreign key: It represents the relation with primary key of another table. A table can have more than one primary key.
3. Super Key: It also helps to uniquely identify records in a table with other attributes which are redudant. It can contain one or more fields.
5. Candidate Key: It is a minimum super key required to uniquely identify a table. Each candidate key can also work as primary key.

Types of Normal Forms:
1. First Normal Form: A table is said to be at 1NF if records in any cell contains single value (or atomic value).
2. Second Normal Form: 1. Table should satisfy 1NF. There should not be any partial dependency.
   Partial Dependency: If a proper subset of any candidate key determines the non-prime attribute.
3. Third Normal Form: 1. Table should be 2NF. There should not be any transitive dependency.
   Transitive Dependency: If any field is dependent on any other field which is non prime.
4. Boyce Codd Normal Form (BCNF): 1. Table should be in 3NF. All the functional dependency of an attribute should be a super key.
5. ![image](https://user-images.githubusercontent.com/103972490/193458710-9c326744-cfc8-47d4-845d-1c7cd5c65822.png)
 
