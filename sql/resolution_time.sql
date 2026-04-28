-- I utilized Gemini to brainstorm some of the changes that I would make here.

-- ISSUE IDENTIFIED: 
-- The original query fails there are null values in "closed_date" where there are open ticlets. 

-- FIX STRATEGY:
-- 1. Use a WHERE clause to filter out records where either `created_date` or `closed_date` is NULL.
-- 2. Use TRY(date_parse()) to handle incorrectly formatted strings.
-- 3. Filter for cases where resolution time is non-negative in case of bad entries.

SELECT
    agency,
    AVG(
        date_diff(
            'day',
            TRY(date_parse(created_date, '%Y-%m-%d %H:%i:%s')),
            TRY(date_parse(closed_date,  '%Y-%m-%d %H:%i:%s'))
        )
    ) AS avg_days_to_close,
    COUNT(*) AS total_closed_cases
FROM nyc311_db.complaints
WHERE closed_date IS NOT NULL 
  AND created_date IS NOT NULL
GROUP BY agency
HAVING AVG(
    date_diff(
        'day',
        TRY(date_parse(created_date, '%Y-%m-%d %H:%i:%s')),
        TRY(date_parse(closed_date,  '%Y-%m-%d %H:%i:%s'))
    )
) >= 0
ORDER BY avg_days_to_close DESC;
