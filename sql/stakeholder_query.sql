-- STAKEHOLDER QUESTION: What are the most frequent complaint types per borough?
-- This query identifies the volume of specific problems localized by borough
-- to help prioritize city resource allocation.

SELECT 
    borough, 
    problem, 
    COUNT(*) AS total_complaints
FROM nyc311_db.complaints
WHERE borough IS NOT NULL
GROUP BY borough, problem
ORDER BY total_complaints DESC
LIMIT 15;
