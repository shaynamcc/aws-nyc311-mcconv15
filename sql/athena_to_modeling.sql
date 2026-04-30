```sql
CREATE TABLE nyc311_db.complaint_type_modeling AS
SELECT *
FROM (
    SELECT
        borough,
        incident_zip,
        agency,
        day_of_week(date_parse(created_date, '%Y-%m-%d %H:%i:%s'))  AS day_of_week,
        hour(date_parse(created_date, '%Y-%m-%d %H:%i:%s'))          AS hour_of_day,
        -- Multi-class target (4 meaningful classes)
        CASE
            WHEN problem IN ('HEAT/HOT WATER','PLUMBING','WATER LEAK','PAINT/PLASTER',
                             'DOOR/WINDOW','ELECTRIC','GENERAL','UNSANITARY CONDITION') THEN 'housing'
            WHEN problem IN ('Noise - Residential','Noise - Street/Sidewalk',
                             'Noise - Commercial','Noise')                              THEN 'noise'
            WHEN problem IN ('Illegal Parking','Blocked Driveway','Traffic Signal Condition',
                             'Street Condition','Abandoned Vehicle')                    THEN 'traffic'
            WHEN problem IN ('Snow or Ice','Dirty Condition','Water System')             THEN 'sanitation'
            ELSE NULL
        END AS complaint_category
    FROM nyc311_db.complaints
    WHERE borough IN ('BROOKLYN','QUEENS','BRONX','MANHATTAN','STATEN ISLAND')
)
WHERE complaint_category IS NOT NULL;
```
