# My Notes on Databases

**_contents:_**

- [My Notes on Databases](#my-notes-on-databases)

  - [Resources](#resources)
  - [SQL: Structured Query Language](#sql-structured-query-language)

    - [Relational Database](#relational-database)
    - [Setting Stuff Up](#setting-stuff-up)
    - [Playing Around with Data](#playing-around-with-data)
    - [Khan Academy Tutorial: basic creation &amp; querying](#khan-academy-tutorial-basic-creation-amp-querying)

  - [Resources](#resources)
  - [SQL: Structured Query Language](#sql-structured-query-language)

    - [Relational Database](#relational-database)
    - [Khan Academy Tutorial](#khan-academy-tutorial)

  - [Resources:](#resources)
  - [SQL: Structured Query Language](#sql-structured-query-language)

    - [Relational Database](#relational-database)
    - [Khan Academy Tutorial](#khan-academy-tutorial)

  - [Resources:](#resources)
  - [SQL: Structured Query Language](#sql-structured-query-language)

    - [Relational Database](#relational-database)
    - [Khan Academy Tutorial](#khan-academy-tutorial)

  - [Resources:](#resources)
  - [SQL: Structured Query Language](#sql-structured-query-language)

    - [Relational Database](#relational-database)
    - [Khan Academy Tutorial](#khan-academy-tutorial)

  - [Resources:](#resources)
  - [SQL: Structured Query Language](#sql-structured-query-language)

    - [Relational Database](#relational-database)
    - [Khan Academy Tutorial](#khan-academy-tutorial)

  - [Resources:](#resources)
  - [SQL: Structured Query Language](#sql-structured-query-language)

    - [Relational Database](#relational-database)
    - [Khan Academy Tutorial](#khan-academy-tutorial)

  - [Resources:](#resources)
  - [SQL: Structured Query Language](#sql-structured-query-language)

    - [Relational Database](#relational-database)
    - [Khan Academy Tutorial](#khan-academy-tutorial)

  - [Resources:](#resources)
  - [SQL: Structured Query Language](#sql-structured-query-language)

    - [Relational Database](#relational-database)
    - [Khan Academy Tutorial](#khan-academy-tutorial)

  - [Resources:](#resources)
  - [SQL: Structured Query Language](#sql-structured-query-language)

    - [Relational Database](#relational-database)
    - [Khan Academy Tutorial](#khan-academy-tutorial)

  - [Resources:](#resources)
  - [SQL: Structured Query Language](#sql-structured-query-language)

    - [Relational Database](#relational-database)
    - [Khan Academy Tutorial](#khan-academy-tutorial)

  - [Resources:](#resources)
  - [SQL: Structured Query Language](#sql-structured-query-language)

    - [Relational Database](#relational-database)
    - [Khan Academy Tutorial](#khan-academy-tutorial)

  - [Resources:](#resources)
  - [SQL: Structured Query Language](#sql-structured-query-language)

    - [Relational Database](#relational-database)
    - [Khan Academy Tutorial](#khan-academy-tutorial)

  - [Resources:](#resources)
  - [SQL: Structured Query Language](#sql-structured-query-language)

    - [Relational Database](#relational-database)
    - [Khan Academy Tutorial](#khan-academy-tutorial)

  - [Resources:](#resources)
  - [SQL: Structured Query Language](#sql-structured-query-language)

    - [Relational Database](#relational-database)
    - [Khan Academy Tutorial](#khan-academy-tutorial)

  - [Resources:](#resources)
  - [SQL: Structured Query Language](#sql-structured-query-language)

    - [Relational Database](#relational-database)

  - [Resources:](#resources)
  - [SQL: Structured Query Language](#sql-structured-query-language)
    - [Structured data](#structured-data)

- basic definition of database:

  - **simply 'a structured set of data held in a computer'**

- features of dbs:

  - inputting
  - storing
  - retrieving
  - managing information

- focus here:

  - SQL: learning how to tweak a query to the db using raw SQL.
  - relational dbs

- **relational algebra** exists

## Resources

- **Schema Design**
  - [Intro book on RDMS, also has stuff on schemas and teaches using PostgreSQL: might be useful for CVWO planning](https://launchschool.com/books/sql/read/introduction)
  - [Wiki Link on Schemas (Relational Models)](https://simple.wikipedia.org/wiki/Relational_model)
  - [NTU tutorial on planning schemas](https://www.ntu.edu.sg/home/ehchua/programming/sql/Relational_Database_Design.html)
  - [Idiot-proof Medium Article on Schema Design Steps](https://medium.com/@kimtnguyen/relational-database-schema-design-overview-70e447ff66f9)
  -

## SQL: Structured Query Language

- just a handful of verbs to learn
  - within a few lines, you're able to :
    - Select [find]
    - Insert [add]
    - Update [change]
    - Delete [remove]
- most importantly, need to visualise what is to be done:

  - hence, SQL is a **declarative** language, just describe what needs to be done
  - you may visualise it in your head as as moving around excel tables

- each row is a different record, and each column is one of that record's attributes. The **ID** column gives unique row numbers and is called the record's **Primary Key**
- to "link" tables together means to make one of the columns in one table, point to the ID of another table. The _column_ that has the ID of another table is called the **"foreign key"**

### Relational Database

- relational database is a database organized according to the relational model of data
- relational model defines a set of relations (which we can think of as analogous to tables) and describes the
  relationships, or connections, between them in order to determine how the data stored in them can interact

* helps cut down on duplicated data
* provides a more useful data structure for us to interact with
* **_relational database management system_**, or **RDBMS**: software application for managing relational dbs,
  - SQLite, MS, SQL, [PostgreSQL](https://www.postgresql.org/)
* _they all use SQL_
* funfact: other forms of databases:
  - systems that use non-relational data storage and retrieval models are termed "NoSQL"
  - XML
  - Graph
  - Spatial

### Setting Stuff Up

- database creation and table creation...
- there's a **schema file** that gets updated when the structure of the database is changed
- Creating Indexes: for allowing only unique values in a particular col or for faster searching in the future
  - index creation makes the database much faster
- **\*syntax:** - use single quotes

### Playing Around with Data

- main actions are all CRUD actions (mainly read)
- CRUDY command's structure:

  - action **STATEMENT**
  - conditions **CONDITIONS**

  actions with unspecified conditions apply to the whole db

#### Destroy Queries: `DELETE`

- a carefully constructed `WHERE` clause is needed
- can do common sense things like using comparison operators
- can chain multiple clauses together using `AND`, `OR`, `NOT`
  - e.g. `DELETE * FROM users WHERE id > 12 AND name = 'foo'`

#### Create Queries: `INSERT INTO`

- specify which columns to insert stuff into, then which values to put in those columns
  e.g. `INSERT INTO Users (name, email) VALUES ('foobar','foo@bar.com');`

#### Update Queries: `UPDATE` and `SET`

- `WHERE` clause is needed, construct carefully
- `SET` uses key=”value” pairs

#### Read Queries: `SELECT` or `SELECT DISTINCT`

- good to specify a column you're selecting from
  - `SELECT users.id, users.name FROM users`

### Joining Tables Together

-[W3Schools Explanation](https://www.w3schools.com/sql/sql_join.asp)

-[Visualising Table Joining](https://blog.codinghorror.com/a-visual-explanation-of-sql-joins/)

- join rows from two or more tables, based on a related column between them
  
- there's `(INNER) JOIN` `LEFT(OUTER) JOIN` `RIGHT(OUTER) JOIN` `FULL(OUTER)JOIN`


### Using Functions to Aggregate Data

- can call these functions like `MAX` as part of `SELECT` statements
- can use aliases 

### Khan Academy Tutorial: basic creation & querying

- [Khan Academy Sandbox](https://www.khanacademy.org/computer-programming/new/sql)

- **CREATION** of a simple db:

  - ```SQL
        CREATE TABLE groceries (id INTEGER PRIMARY KEY, name TEXT, quantity INTEGER);
        -- put the primary key as first column
        INSERT INTO groceries VALUES(1, "Bananas", 4); --insert in the same order as the columns declaration
        INSERT INTO groceries VALUES(2, "Apple", 233);
        INSERT INTO groceries VALUES(3, "Mango", 23);
        INSERT INTO groceries VALUES(4, "Pear", 98);

        SELECT  * FROM groceries;
    ```

- **QUERYING**:

  - ordering the query
  - filtering the select
  - filtering with like
  - restricting with LIMIT
  - using ROUND

  ```sql
      CREATE TABLE movies (id INTEGER PRIMARY KEY, name TEXT, release_year INTEGER);
      INSERT INTO movies VALUES (1, "Avatar", 2009);
      INSERT INTO movies VALUES (2, "Titanic", 1997);
      INSERT INTO movies VALUES (3, "Star Wars: Episode IV - A New Hope", 1977);
      INSERT INTO movies VALUES (4, "Shrek 2", 2004);
      INSERT INTO movies VALUES (5, "The Lion King", 1994);
      INSERT INTO movies VALUES (6, "Disney's Up", 2009);
  ```

  ```sql
  SELECT * FROM movies;
  SELECT * FROM movies where release_year >= 2000 ORDER BY release_year;
  ```

- **Aggregating Operations**

```sql
SELECT aisle, SUM(quantitiy) FROM groceries GROUP BY aisle;
```
