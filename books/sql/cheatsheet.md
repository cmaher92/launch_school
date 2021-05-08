# SQL Cheatsheet

Identifiers and Key Words:

In the statement `SELECT enabled, full_name FROM users;` 

* *indetifiers* are `enabled`, `full_name`, and `users`. 
* the *keywords* are `SELECT`, and `FROM`

Since SQL is not case-sensitive it doesn't use case to differentiate between identifiers and keywords, instead it assumes that anything which is not a keyword, operator, or function is an identifier. **Avoid using identifier names that are the same as keywords**. If unavoidable you can double quote the identifier to clarify.

## Schema

Data Definition Language is responsible for setting up the schema of a database.

### Creating/Deleting a database

```sql
CREATE DATABASE db_name;
```

* database names should be written in snake_case.

```sql
DROP DATABASE db_name;
```

### Creating tables

```sql
CREATE TABLE some_table(
	col_1_name col_1_data_type [constraints, ...],
  ...
  constraints
);
```

### Data types

| Column Data Type         | Description                                                  |
| ------------------------ | ------------------------------------------------------------ |
| serial                   | This data type is used to create identifier columns for a PostgreSQL database. These identifiers are integers, auto-incrementing, and cannot contain a null value. |
| char(n)                  | This data type specifies that information stored in a column can contain strings of up to N characters in length. If a string less than length N is stored, then the remaining string length is filled with space characters. |
| varchar(n)               | This data type specifies that information stored in a column can contain strings of up to N characters in length. If a string less than length N is stored, then the remaining string length isn't used. |
| boolean                  | This is a data type that can only contain two values "true" or "false". In PostgreSQL, boolean values are often displayed in a shorthand format, t or f |
| integer or INT           | An integer is simply a "whole number." An example might be 1 or 50, -50, or 792197 depending on what storage type is used. |
| decimal(precision,scale) | The decimal type takes two arguments, one being the total number of digits in the entire number on both sides of the decimal point (the precision), the second is the number of the digits in the fractional part of the number to the right of the decimal point (the scale). |
| timestamp                | The timestamp type contains both a simple date and time in YYYY-MM-DD HH:MM:SS format. |
| date                     | The date type contains a date but no time.                   |

### Constraints

Constraints can apply to a specific column, an entire table, more than one table, or an entire schema.

| **Constraint** | Description                                                  |
| -------------- | ------------------------------------------------------------ |
| `UNIQUE`       | prevents duplicate values from being entered into column     |
| `NOT NULL`     | value must be specified for this column                      |
| `DEFAULT`      | sets a default value for the column                          |
| `CHECK`        | limit the type of data that can be included in a column based on some condition we set in the constraint. Each time a new record is in the process of being added to a table, that constraint is first *checked* to ensure the data being added conforms to it. |

### Relationships

| **Relationship** | **Example**                                     |
| ---------------- | ----------------------------------------------- |
| one-to-one       | A user has ONE address                          |
| one-to-many      | A book has MANY reviews                         |
| many-to-many     | A user has MANY books and a book has MANY users |

### Creating a one-to-one relationship

```sql
/*
one-to-one: User has one address
*/

CREATE TABLE addresses (
  user_id int, -- Both a primary and foreign key
  street varchar(30) NOT NULL,
  city varchar(30) NOT NULL,
  state varchar(30) NOT NULL,
  PRIMARY KEY (user_id),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
```

### Creating a one-to-many relationship
```sql
CREATE TABLE books (
  id serial,
  title varchar(100) NOT NULL,
  author varchar(100) NOT NULL,
  published_date timestamp NOT NULL,
  isbn char(12),
  PRIMARY KEY (id),
  UNIQUE (isbn)
);

/*
 one-to-many: Book has many reviews
*/

CREATE TABLE reviews (
  id serial,
  book_id integer NOT NULL,
  reviewer_name varchar(255),
  content varchar(255),
  rating integer,
  published_date timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
);
```

### Creating a many-to-many relationship

We can think of many-to-many relationships as combining two one-to-many relationships.

In order to implement this sort of relationship we need to introduce a third, cross-reference, table.

This table holds the relationship between the two entities, by having **two** `FOREIGN KEY`s, each of which references the `PRIMARY KEY` of one of the tables for which we want to create this relationship.

```sql
CREATE TABLE checkouts (
  id serial,
  user_id int NOT NULL,
  book_id int NOT NULL,
  checkout_date timestamp,
  return_date timestamp,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
);
```



### Alter Table

```sql
ALTER TABLE table_name HOW_TO_CHANGE_THE_TABLE args
```

#### Renaming table

```sql
ALTER TABLE table_name
	RENAME TO new_table_name;
```

#### Renaming column

```sql
ALTER TABLE table_name
	RENAME COLUMN col_name TO new_col_name;
```

#### Changing column's datatype

```sql
ALTER TABLE table_name
	ALTER COLUMN col_name TYPE new_datatype;
```

If there is no implicit conversion (or cast) from previous datatype to the new datatype you can use the `USING` clause:

```sql
ALTER TABLE table_name
  ALTER COLUMN col_name TYPE date
    USING col_name::date,
```

#### Adding a constraint

Since `NOT NULL` is always a column constraint, there's a special command for adding the constraint to an existing table:

```sql
ALTER TABLE table_name
	ALTER COLUMN col_name
		SET NOT NULL;
```

To add any other constraint to an existing table, you must use this syntax for adding a table constraint:

```sql
ALTER TABLE table_name
	ADD CONSTRAINT constraint_name constraint_clause;
```

OR if you don't want to specify a constraint name:

```sql
ALTER TABLE table_name ADD constraint_clause;
```

```sql
ALTER TABLE table_name ADD CHECK (col_name <> ' ');
```

#### Dropping a constraint

For table:

```sql
ALTER TABLE table_name
	DROP CONSTRAINT constraint_name;
```

Dropping the `DEFAULT` constraint is different because it's not technically a constraint:

```sql
ALTER TABLE table_name
	ALTER COLUMN col_name DROP DEFAULT;
```

#### Adding a column

```sql
ALTER TABLE table_name
	ADD COLUMN col_name col_datatype constraints,
	ADD COLUMN col_name2 col_datatype constraints;
```

#### Removing a column

```sql
ALTER TABLE table_name
	DROP COLUMN col_name;
```

#### Dropping a table

```sql
DROP TABLE table_name;
```

You can drop  multiple tables:

```sql
DROP TABLE birds, reptiles;
```

#### Adding Primary Key

Primary keys can be though of as a unique identifier for a row of data.

```sql
ALTER TABLE table_name 
	ADD PRIMARY KEY (col_name);
```

#### Adding Foreign Key

```sql
ALTER TABLE table_name
	ADD FOREIGN KEY (fk_col_name) 
		REFERENCES tgt_table_name (pk_col_name);
```

## Data

DML is a sub-language of SQL which incorporates various key words, clauses and syntax used to write Data Manipulation Statements.

Four types of Data Manipulation Statements:

1. `INSERT` statements (create)
2. `SELECT` statements (read)
3. `UPDATE` statements (update)
4. `DELETE` statements (delete)

### Insertion statements

```sql
INSERT INTO table_name (col1_name, col2_name),
	VALUES (data_for_col1, data_for_col2), (data_for_col1, data_for_col2);
```

### Select statements (queries)

The order of the columns in the response is the order that the column names are specified in our query

```sql
SELECT column, another_column, …
FROM mytable;
```

#### Ordering results

SQL allows returning sorted data by adding the `ORDER BY column_name` clause to a query.

```sql
SELECT [*, (col1_name, col2_name, ...)]
FROM table_name 
WHERE condition(s)
ORDER BY column_name ASC/DESC;
```

* When ordering by boolean values, `false` comes before `true` in ascending order.

* You can specify a sort direction, either *ascending* or *descending*, using `ASC` or `DESC`. The default is `ASC`.

You can fine tune your ordering even further by returning results ordered by more than one column. This is done have having comma-separated expressions in the `ORDER BY` clause.

```sql
SELECT [*, (col1_name, col2_name, ...)]
FROM table_name 
WHERE (condition)
	ORDER BY column_name (sort direction), column_name (sort_direction);
```

#### Filtering

In order to filter certain results from being returned, we need to use a `WHERE` clause in the query.

The clause is applied to each row of data by checking specific column values to determine whether it should be included in the results or not.

And below are some useful operators that you can use for numerical data (ie. integer or floating point):

| **Operator**             | **Condition**                                        | **Example**                     |
| ------------------------ | ---------------------------------------------------- | ------------------------------- |
| =, !=, <, <=, >, >=      | numerical operators                                  | `col_name != 4`                 |
| `BETWEEN`.. `AND` ..     | number is within range (inclusive)                   | `col BETWEEN 1.5 AND 9`         |
| `NOT BETWEEN`...`AND`... | Number is not within range of two values (inclusive) | `col_name NOT BETWEEN 1 AND 10` |
| `IN` (..)                | number exists in a list                              | `col IN (2, 4, 6)`              |
| `NOT IN`(..)             | number does not exist in list                        | `col NOT IN (1, 3,)`            |

```sql
SELECT column, another_column, …
FROM mytable
WHERE condition
    AND/OR another_condition
    AND/OR …;
```

##### Comparison predicates

As well as standard operators (`<`, `=`, `<>` etc..) there are what is termed *comparison predicates* which behave much as operators but have special syntax. (i.e. `BETWEEN`, `NOT BETWEEN`, `IS DISTINCT FROM`, `IS NOT DISTINCT FROM`, `IS NULL`, `IS NOT NULL`.)

```sql
SELECT * 
FROM table_name
WHERE my_column IS NULL;
```

##### Logical operators

`AND`, `OR`, and `NOT`.

The `AND` and `OR` operators allow you to combine multiple conditions in a single expression.

```sql
SELECT * 
FROM table_name
WHERE username = 'cmaher92' OR username = 'skylars15';
```

##### String/pattern matching operators

Allows for searching subset of data within a column with a string datatype.

| **Operator** | Condition                                                    | Example                         |
| ------------ | ------------------------------------------------------------ | ------------------------------- |
| `%`          | Used anywhere in a string to match a sequence of zero or more characters (only with `LIKE` or `NOT LIKE`) |                                 |
| `_`          | Used anywhere in a string to match a single character (only with `LIKE` or `NOT LIKE` |                                 |
| `LIKE`       | Case insensitive exact string comparison                     |                                 |
| `NOT LIKE`   | Case insensitive exact string inequality comparison          |                                 |
| `IN`         | String exists within a list                                  | col_name IN ("A", "B", "C:)     |
| `NOT IN`     | String does not exist within a list                          | col_name NOT IN ("D", "E", "F") |

Case sensitive:

```SQL
SELECT * 
FROM users
WHERE username 
	LIKE '%maher'
```

Case insensitive:

```sql
SELECT * 
FROM users
WHERE username 
	NOT LIKE '%maher';
```

##### `LIMIT` and `OFFSET`

```sql
SELECT * 
FROM table_name
	LIMIT 1 
	OFFSET 1;
```

##### `DISTINCT`

```sql
SELECT DISTINCT column_name 
FROM table_name
WHERE condition(s);
```

#### Functions

`nextval`

Keeps track of current highest value and increments by one.

#### `length(string_col)`

```sql
SELECT length(str_col_name) FROM table_name;
```

#### `trim(string_col)`

```sql
SELECT trim(leading ' ' FROM str_col_name)
	FROM table_name;
```

#### `date_part`

```sql
SELECT date_part('year', date_col_name) FROM table_name;
```

#### `age(timestamp)`

```sql
SELECT age(date_col_name) FROM table_name;
```

#### Aggregate Functions

You can't mix aggregate columns with non-aggregate columns.

| Name  | Description                                                  | Example                                        |
| ----- | ------------------------------------------------------------ | ---------------------------------------------- |
| count | returns the count for the given column                       | `count(col_name)`                              |
| sum   | returns the sum total for the given numeric column           | `sum(col_name)`                                |
| min   | returns the smallest value for the given numeric, date time, or string column | `min([datetime_col, numeric_col, string_col])` |
| max   | returns the largest value for the given numeric, datetime or string column | `max([datetime_col, numeric_col, string_col])` |
| avg   | returns the mean for the given numeric column                | `avg(numeric_col)`                             |
#### Grouping with `GROUP BY`

When using `GROUP BY`, all of the columns in the select list must either be included in the `GROUP BY` clause or be the result of an aggregate function.

```sql
SELECT count(col_name) FROM table_name
	GROUP BY col_name;
```

### Updating Data

It's typical to first do a `SELECT` to verify which rows you are targeting.

```sql
UPDATE table_name
  SET { column_name = colvalue, ... } [, ...]
  WHERE conditions;
```

* The `WHERE` clause in the above syntax example is optional (If omitted, PostgreSQL will update **every** row in the target table).

### Deleting Data

It's typical to first do a `SELECT` to verify which rows you are targeting.

```sql
DELETE FROM table_name 
	WHERE (expression);
```

* The `WHERE` clause in a `DELETE` statement is used to target specific rows.

#### Delete rows

```sql
DELETE FROM table_name;
```

#### Delete a specific column's data

```sql
UPDATE table_name SET column_name1 = NULL
	WHERE (expression);
```
* Will not work on column with `NOT NULL` constraint, error will be thrown.
* This isn't technically deleting the data, instead updating it to the value `NULL`.

### Multi-table queries

#### Joins

JOINs are clauses in SQL statements that link two tables together, usually based on the keys that define the relationship between those two tables.

#### Basics

```sql
SELECT [table_name.col_name1, table_name.col_name2, ...] 
FROM table_name1 
join_type JOIN table_name2 
ON (join_condition);
```

* `join_condition` defines the logic by which a row in one table is joined to a row in another table. In most cases this join condition is created using the primary key of one table and the foreign key of the table we want to join it with.

Example:

<img src="https://d186loudes4jlv.cloudfront.net/sql/images/table_relationships/joins-explanation-separate-tables.png" alt="Shapes and Colors, separate tables" style="zoom:67%;" />

```sql
SELECT colors.color, shapes.shape 
FROM colors 
JOIN shapes 
ON colors.id = shapes.color_id;
```

If the join coindition `colors.id = shapes.color_id` is a match, then those two rows are joined together to form a new row in a virtual table know as a *join table*.

<img src="https://d186loudes4jlv.cloudfront.net/sql/images/joins/joins-explanation-virtual-join-table.png" alt="Shapes and Colors, virtual join table" style="zoom:67%;" />

We can now access the *join table*, but we must prepend the originating table_name to the column name:

```sql
SELECT colors.color, shapes.shape FROM shapes_colors_join_table;
```

#### Types

| **Join Type** | **Description**                                              |
| ------------- | ------------------------------------------------------------ |
| INNER         | Combines rows from two tables whenever the join condition is met. |
| LEFT          | Same as an inner join, except rows from the first table are added to the join table, regardless of the join condition. |
| RIGHT         | Same as an inner join, except rows from the second table are added to the join table, regardless of the evaluation of the join condition. |
| FULL          | A combination of LEFT and RIGHT joins                        |
| CROSS         | Doesn't use a join condition. The join table is the result of matching every row from the first table with the second table, the cross product of all rows across both tables. |

#### INNER JOIN

* Returns a result set that contains the common elements of the tables.

* This is the default JOIN if one isn't specified, as shown in the above example.

```sql
SELECT users.*, addresses.*
FROM users
INNER JOIN addresses
ON users.id = addresses.user_id;
```

#### LEFT JOIN

A LEFT JOIN or a LEFT OUTER JOIN takes all the rows from one table, defined as the `LEFT` table, and joins it with a second table.

*Note that using either `LEFT JOIN` or `LEFT OUTER JOIN` does exactly the same thing, and the `OUTER` part is often omitted. It is common to refer to this type of join as 'outer' in order to differentiate it from an 'inner' join.*

A `LEFT JOIN` will always include the rows from the `LEFT` table, even if there are no matching rows in the table it is `JOIN`ed with.

```sql
SELECT users.*, addresses.*
FROM users
LEFT JOIN addresses
ON (users.id = addresses.user_id);
```

<img src="https://d186loudes4jlv.cloudfront.net/sql/images/joins/left-join.png" alt="Left Join" style="zoom:67%;" />

Notice that `Jane Smith` is included in the result even though there wasn't a matching record in the `addresses` table.

#### RIGHT JOIN

A `RIGHT JOIN` or `RIGHT OUTER JOIN` is similar to a `LEFT JOIN` except that the roles between the two tables are reversed, and all the rows on the second table are included along with any matching rows from the first table.

```sql
SELECT reviews.book_id, reviews.content,
       reviews.rating, reviews.published_date,
       books.id, books.title, books.author
FROM reviews 
RIGHT JOIN books 
ON (reviews.book_id = books.id);
```

<img src="https://d186loudes4jlv.cloudfront.net/sql/images/joins/right-join.png" alt="Right Join" style="zoom:67%;" />

#### FULL JOIN

* Contains all of the rows from both of the tables.
* Where condition is met, the rows are joined.
* Where condition is not met, the columns for the other table will have `NULL` values.

#### CROSS JOIN

* Also known as *Cartesian Join*
* Returns all rows from one table crossed with every row from the second table.
* There is no join condition.

#### Multiple JOINs

```sql
SELECT users.full_name, books.title, checkouts.checkout_date
FROM users
JOIN checkouts ON (users.id = checkouts.user_id)
JOIN books ON (books.id = checkouts.book_id);
```

## Aliasing

### Table Aliasing

* Allows us to specify another name for a table and then use that name in later parts of a query.

```sql
SELECT u.full_name, b.title, c.checkout_date
FROM users AS u
INNER JOIN checkouts AS c ON (u.id = c.user_id)
INNER JOIN books AS b ON (b.id = c.book_id)
```

You can write this shorthand without using `AS` which would look like this

```sql
...
INNER JOIN checkouts c ON (u.id = c.user_id)
INNER JOIN books b ON (b.id = c.book_id);
```

### Column Aliasing

```sql
SELECT count(id) AS "Number of Books Checked Out"
FROM checkouts;

Number of Books Checked Out
--------
4
(1 row)
```

### Subqueries

```sql
SELECT u.first_name FROM users u
WHERE u.id NOT IN (SELECT u.user_id FROM checkouts c);
```

Possible expressions:

* `IN`
* `NOT IN`
* `ANY`
* `SOME`
* `ALL`

Another example:

```sql
SELECT first_name, last_name
FROM singers
WHERE id NOT IN (SELECT singer_id FROM albums);
 first_name | last_name
------------+-----------
 Frank      | Sinatra
(1 row)
```

