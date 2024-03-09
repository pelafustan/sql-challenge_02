-- table creation
CREATE TABLE inscritos(cantidad INT, fecha DATE, fuente VARCHAR);

-- inserting the data to the table
INSERT INTO inscritos(cantidad, fecha, fuente) VALUES
    (44, '01/01/2021', 'Blog'),
    (56, '01/01/2021', 'Página'),
    (39, '01/02/2021', 'Blog'),
    (81, '01/02/2021', 'Página'),
    (12, '01/03/2021', 'Blog'),
    (91, '01/03/2021', 'Página'),
    (48, '01/04/2021', 'Blog'),
    (45, '01/04/2021', 'Página'),
    (55, '01/05/2021', 'Blog'),
    (33, '01/05/2021', 'Página'),
    (18, '01/06/2021', 'Blog'),
    (12, '01/06/2021', 'Página'),
    (34, '01/07/2021', 'Blog'),
    (24, '01/07/2021', 'Página'),
    (83, '01/08/2021', 'Blog'),
    (99, '01/08/2021', 'Página');

-- first question
-- here we're using the COUNT(*) aggregate function to count all the rows from
-- the table
SELECT COUNT(*) AS total_entries FROM inscritos;

-- second question
-- here we're using the SUM() aggregate function to, for the sake of redundancy,
-- sum all the values from the cantidad column
SELECT SUM(cantidad) AS total_subscribed FROM inscritos;

-- third question
-- here we're using querying all the results from the table that matches, thru
-- the WHERE clause and a subquery
SELECT * FROM inscritos WHERE fecha = (SELECT MIN(fecha) from inscritos);

-- fourth question
SELECT fecha, SUM(cantidad) FROM inscritos GROUP BY fecha ORDER BY fecha;

-- fifth question
-- here we're retrieving the entries from fuente, apply the SUM() aggregate 
-- function to sum the values of the cantidad column and then we group it by
-- fuente
SELECT fuente, SUM(cantidad) AS total_subs FROM inscritos GROUP BY fuente;

-- sixth quesion
-- this is a tricky one: I'm using the WITH clause to make a temporary view 
-- that I will reference later in the where condition of the main query
WITH temporal_view AS (
    SELECT fecha, SUM(cantidad) as daily_subs 
    FROM inscritos
    GROUP BY fecha
)
SELECT fecha, daily_subs 
FROM temporal_view
WHERE daily_subs = (SELECT MAX(daily_subs) FROM temporal_view);

-- seventh question
-- this is quite similar to the privious one. I'm using a temporal view and
-- then I select the max value
WITH temporal_view AS (
    SELECT fecha, cantidad
    FROM INSCRITOS
    WHERE fuente = 'Blog'
)
SELECT fecha, cantidad
FROM temporal_view
WHERE cantidad = (SELECT MAX(cantidad) FROM temporal_view);

-- eight question
-- really straightforward, select columns, apply aggregate function, group and 
-- order
SELECT fecha, ROUND(AVG(cantidad)) AS subs_mean FROM inscritos
GROUP BY fecha
ORDER BY fecha;

-- ninth question
-- also quite straightforward, temporal view, select values, apply condition
-- thru WHERE condition
WITH temporal_view AS (
    SELECT fecha, SUM(cantidad) as subs
    FROM inscritos
    GROUP BY fecha
)
SELECT fecha, subs
FROM temporal_view
WHERE subs > 50
ORDER BY fecha;

-- tenth question
-- little tricky, WITH condition saving the day
WITH temporal_view AS (
    SELECT fecha, ROUND(AVG(cantidad)) as subs_mean
    FROM inscritos
    GROUP BY fecha
)
SELECT fecha, subs_mean
FROM temporal_view
WHERE fecha > '2021-01-02'
ORDER BY fecha;
