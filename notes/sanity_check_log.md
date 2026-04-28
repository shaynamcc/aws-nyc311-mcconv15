## Query: Average resolution time by agency

- **File:** sql/resolution_time.sql
- **Business question:** How long does each agency take to resolve complaints?
- **What I expected:** I figured agencies like the DOT or DEP would have a higher average since they're dealing with physical repairs (pot holes, water mains) compared to something like a noise complaint that's usually handled on-site.
- **Issues encountered:** * The query crashed immediately because it was trying to run `date_parse` on `closed_date` entries that were NULL (open cases). 
    * Found some "impossible" rows where the resolution time was negative—probably just a data entry glitch.
- **Checks performed:** * Threw in `WHERE closed_date IS NOT NULL` to stop the crashing and only look at finished tickets.
    * Wrapped the parses in `TRY()` just in case the string formatting is wrong in other parts of the dataset.
    * Added a count for total cases to make sure we aren't making assumptions based on like, two complaints for a specific agency.
- **Final outcome:** The results look resonable now. I think it’s clean enough to move into the SageMaker workflow without worrying about the model finding nulls or negative intervals.
- **Confidence:** High :)
