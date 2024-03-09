# SQL

## Challenge 2

### Context

A company that provides English courses gave us a dataset with information about their subscriptions. The subscriptions can be done from two sources: their webpage or their institutional blog.

Their asked us to perform a serie of queries:

1. How many records there are?
1. How many subscribers there are? 
1. Which are the oldest records?
1. How many subscriptions are per day? (Regardless the subscription source)
1. How many subscription are per source? 
1. On which day did the most subscriptions happened? How many were?
1. On which day did the most subscriptions happened via Blog? How many were?
1. What was the subscription average per day?
1. On which day the subscriptions were more than 50? 
1. What was the subscription average per day, but starting from the third day? 

### Solution

Well, we solve this questions using the file that you can find on this wonderful repo! The file is called `challenge_02.sql`.

This file asumes that the table with the customer data isn't created on your database, so if you have any table named `inscritos`, you need to get rid of it first, or the output from the queries will not be the expected.

The queries are properly commented (from my point of view, obviously), so you can have a picture of what I'm doing.

#### How ~~in hell~~ do I run this?

Great question, my fellow friend! I got you covered:

* **First option**: from your shell

```bash
psql -h <hostname> -p <port> -d <database> -U <user> -f /path/to/challenge_02.sql
```

* **Second option**: from within `psql`
```sql
\i /path/to/challenge_02.sql
```

I'm using docker to run my Postgres server, and I mapped the port `5432` from the container to port `5436` from my machine, so I ran the following
```bash
psql -h localhost -p 5436 -U postgres -d challenge02 -f ./challenge_02.sql
```

with the following output

```
CREATE TABLE
INSERT 0 16
 total_entries 
---------------
            16
(1 row)

 total_subscribed 
------------------
              774
(1 row)

 cantidad |   fecha    | fuente 
----------+------------+--------
       44 | 2021-01-01 | Blog
       56 | 2021-01-01 | Página
(2 rows)

   fecha    | sum 
------------+-----
 2021-01-01 | 100
 2021-01-02 | 120
 2021-01-03 | 103
 2021-01-04 |  93
 2021-01-05 |  88
 2021-01-06 |  30
 2021-01-07 |  58
 2021-01-08 | 182
(8 rows)

 fuente | total_subs 
--------+------------
 Página |        441
 Blog   |        333
(2 rows)

   fecha    | daily_subs 
------------+------------
 2021-01-08 |        182
(1 row)

   fecha    | cantidad 
------------+----------
 2021-01-08 |       83
(1 row)

   fecha    | subs_mean 
------------+-----------
 2021-01-01 |        50
 2021-01-02 |        60
 2021-01-03 |        52
 2021-01-04 |        47
 2021-01-05 |        44
 2021-01-06 |        15
 2021-01-07 |        29
 2021-01-08 |        91
(8 rows)

   fecha    | subs 
------------+------
 2021-01-01 |  100
 2021-01-02 |  120
 2021-01-03 |  103
 2021-01-04 |   93
 2021-01-05 |   88
 2021-01-07 |   58
 2021-01-08 |  182
(7 rows)

   fecha    | subs_mean 
------------+-----------
 2021-01-03 |        52
 2021-01-04 |        47
 2021-01-05 |        44
 2021-01-06 |        15
 2021-01-07 |        29
 2021-01-08 |        91
(6 rows)
```

### Author

* [Patricio Parada](https://github.com/pelafustan)

### Acknowledgement

* Black coffee.
* Green tea (when tummy hurt).
* [Desafío Latam](https://desafiolatam.com/)
