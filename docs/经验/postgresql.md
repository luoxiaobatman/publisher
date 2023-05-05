---
created: 2023-05-04
share: true
category: 经验
title: PostgreSQL
---

> Be miserable. Or motivate yourself. Whatever has to be done, it's always your choice.
> — <cite>Wayne Dyer</cite>

### dblink
`dblink` is an extension in PostgreSQL that allows you to connect to and execute queries on remote PostgreSQL databases from within a local PostgreSQL database. This is useful when you need to fetch or manipulate data from another database server without having to leave the current database session. 

By using `dblink`, you can perform various operations like SELECT, INSERT, UPDATE, and DELETE across databases. It can also be used to execute functions and stored procedures on remote databases.

To use `dblink`, you need to install the extension first. In a PostgreSQL database, you can install the `dblink` extension with the following SQL command:

```
CREATE EXTENSION dblink;
```

Once the extension is installed, you can create a connection to a remote database and execute queries using the `dblink()` function. The basic syntax for using the `dblink()` function is:

```
SELECT * FROM dblink('connection_info', 'remote_query') AS alias_name (column_name1 data_type1, column_name2 data_type2, ...);
```

Here, 'connection_info' is a string containing the connection parameters for the remote database, such as host, port, user, password, and database name. 'remote_query' is the SQL query you want to execute on the remote database.

Please note that using `dblink` can pose security risks if connection information is not properly secured, and it might also impact performance if used inappropriately. It is essential to follow best practices while using `dblink` to ensure the safety and performance of your databases.

#### More examples
Sure! Here are some examples of using `dblink` in PostgreSQL:

**Example 1: Basic SELECT query on a remote database**

```sql
SELECT *
FROM dblink('host=remote_host port=5432 dbname=remote_db user=remote_user password=remote_password',
            'SELECT id, name FROM users')
  AS remote_users(id INTEGER, name VARCHAR(255));
```

This query connects to the remote database `remote_db` and retrieves the `id` and `name` columns from the `users` table. The result is presented as a local table named `remote_users` with the specified column names and data types.

**Example 2: JOIN between local and remote tables**

```sql
SELECT l.id, l.name, r.department
FROM local_users l
JOIN dblink('host=remote_host port=5432 dbname=remote_db user=remote_user password=remote_password',
            'SELECT user_id, department FROM user_departments')
  AS remote_departments(user_id INTEGER, department VARCHAR(255))
ON l.id = remote_departments.user_id;
```

This query retrieves data from the local `local_users` table and the remote `user_departments` table, performing a JOIN operation based on the user IDs.

**Example 3: INSERT data into a remote table**

```sql
SELECT dblink_exec('host=remote_host port=5432 dbname=remote_db user=remote_user password=remote_password',
                   'INSERT INTO users (id, name) VALUES (1, ''John Doe'')');
```

This example inserts a new record into the `users` table of the remote database. Note that `dblink_exec` function is used here since we don't expect a result set from an INSERT statement.

**Example 4: UPDATE data in a remote table**

```sql
SELECT dblink_exec('host=remote_host port=5432 dbname=remote_db user=remote_user password=remote_password',
                   'UPDATE users SET name = ''Jane Doe'' WHERE id = 1');
```

This example updates the `name` field of the user with `id=1` in the remote `users` table.

**Example 5: DELETE data from a remote table**

```sql
SELECT dblink_exec('host=remote_host port=5432 dbname=remote_db user=remote_user password=remote_password',
                   'DELETE FROM users WHERE id = 1');
```

This example deletes the user with `id=1` from the remote `users` table.

Please ensure to replace the placeholder values like `remote_host`, `remote_db`, `remote_user`, and `remote_password` with the actual values for your remote PostgreSQL server.


#### dblink with transaction
Transactions in the context of `dblink` refer to how database transactions are managed when using the `dblink` extension to interact with remote databases in PostgreSQL.

A transaction is a sequence of one or more SQL commands that are executed as a single unit of work. Transactions help maintain the integrity of a database by ensuring that either all the commands within the transaction are successfully executed, or none of them are. They follow the ACID properties (Atomicity, Consistency, Isolation, and Durability) to provide reliable database operations.

When using `dblink`, you should be aware of how transactions behave, as they might not work the same way as they do within a single local database. Here are some key points to consider:

1. **Separate transactions**: When you execute a `dblink` query, it opens a new connection to the remote database and runs the query within its own separate transaction. This means that any changes made by the `dblink` query will not be part of the local transaction.

2. **Commit and rollback**: If a local transaction is rolled back, it will not affect any changes made by the `dblink` query on the remote database. Similarly, if a local transaction is committed, it doesn't automatically commit the changes made by the `dblink` query on the remote database. You need to manage the remote transaction separately using the `dblink_exec` function to issue COMMIT or ROLLBACK commands as needed.

3. **Two-phase commit**: If you need to ensure that the local and remote transactions are committed or rolled back together, you can use a two-phase commit protocol. PostgreSQL provides a built-in two-phase commit mechanism using the `PREPARE TRANSACTION` and `COMMIT PREPARED` SQL commands. However, implementing this with `dblink` can be complex and requires careful handling of the transaction identifiers and states.

In summary, when using `dblink` for remote database operations, you should be cautious about transaction management. It is important to understand that `dblink` does not automatically enforce transaction consistency across local and remote databases, and you need to handle this aspect explicitly if required.
