# sql_tables Basics:
Types of Keys:
1. Primary Key: It helps to uniquely identify records in a table. It can be a single or multiple field. It cannot take null values.
2. Foreign key: It represents the relation with primary key of another table. A table can have more than one primary key.
3. Super Key: It also helps to uniquely identify records in a table with other attributes which are redudant. It can contain one or more fields.
5. Candidate Key: It is a minimum super key required to uniquely identify a table. Each candidate key can also work as primary key.

Types of Normal Forms:
1. First Normal Form: A table is said to be at 1NF if records in any cell contains single value (or atomic value).
2. Second Normal Form: 1. Table should satisfy 1NF. They should not be any partial dependency
