-- Create a temp table to store the counts for each origin
CREATE TEMPORARY TABLE IF NOT EXISTS temp_counts AS
SELECT origin, COUNT(*) as nb_fans
FROM metal_bands
GROUP BY origin;

-- Rank the origins based on the number of fans
SET @rank=0;
SELECT origin, nb_fans, (@rank := @rank + 1) AS rank
FROM temp_counts
ORDER BY nb_fans DESC;

-- Drop the temp table
DROP TEMPORARY TABLE IF EXISTS temp_counts;
