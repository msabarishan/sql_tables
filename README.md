# sql_tables Basics:
Types of Keys:
https://www.javatpoint.com/dbms-keys

Types of Normal Forms:
1. First Normal Form: A table is said to be at 1NF if records in any cell contains single value (or atomic value).
2. Second Normal Form: 1. Table should satisfy 1NF. There should not be any partial dependency.
   Partial Dependency: If a proper subset of any candidate key determines the non-prime attribute.
3. Third Normal Form: 1. Table should be 2NF. There should not be any transitive dependency.
   Transitive Dependency: If any field is dependent on any other field which is non prime.
4. Boyce Codd Normal Form (BCNF): 1. Table should be in 3NF. All the functional dependency of an attribute should be a super key.. ![image](https://user-images.githubusercontent.com/103972490/193458710-9c326744-cfc8-47d4-845d-1c7cd5c65822.png)
 
 
Relations in database:
1. One-Many relation: Commonly used relation. A one-to-many relationship occurs when one record in table 1 is related to one or more records in table 2.
2. Many-Many relation: A many-to-many relationship occurs when multiple records in one table are related to multiple records in another table.
3. One-One relation: one record in a table is associated with one and only one record in another table.
