```sql
-- This query counts the total number of complaints in the dataset. The expected result is 200,000 (as a single number).
SELECT COUNT(*) AS n_complaints
FROM nyc311_db.complaints;
```

```sql
-- This query retrieves the full timeframe of the dataset by finding the earliest and latest recorded complaint dates.
SELECT 
  MIN(created_date) AS earliest,
  MAX(created_date) AS latest
FROM nyc311_db.complaints;
```

```sql
-- This query identifies the top 10 most active agencies by counting the total number of complaints handled by each, sorted from highest to lowest.
SELECT agency, COUNT(*) AS n
FROM nyc311_db.complaints
GROUP BY agency
ORDER BY n DESC
LIMIT 10;
```

```sql
-- This query finds the top 20 most frequent combinations of location and complaint type, showing which specific problems are most prevalent in which boroughs.
SELECT borough, problem, COUNT(*) AS n
FROM nyc311_db.complaints
GROUP BY borough, problem
ORDER BY n DESC
LIMIT 20;
```

```sql
-- This query performs an inner join between the complaints and agencies tables to display the full descriptive name of each agency alongside their total complaint counts.
SELECT 
  c.agency,
  a.agency_name,
  COUNT(*) AS n
FROM nyc311_db.complaints AS c
JOIN nyc311_db.agencies AS a
  ON c.agency = a.agency
GROUP BY c.agency, a.agency_name
ORDER BY n DESC;
```
