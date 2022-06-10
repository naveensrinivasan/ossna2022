  /* Need to parse a go dependecy github.com/golangci/golangci-lint/pkg/golinters 
into something like github.com/golangci/golangci-lint because that is what scorecard stores 
 */ 

/* This returns the first N items from the array*/
CREATE TEMP FUNCTION FirstN(arr ARRAY<STRING>, N FLOAT64)
RETURNS ARRAY<STRING> LANGUAGE js AS """ 
  return arr.slice(0, N);
""";


 /* 
1 . Splitting the string github.com/golangci/golangci-lint/pkg/golinters  by "/"
2 . Take the just the first 3 
3 . Joining them back into string
*/


SELECT
  distinct ARRAY_TO_STRING(FirstN(SPLIT(`from`.Name,"/"),
      3),"/") AS deps
FROM
  `bigquery-public-data.deps_dev_v1.DependencyGraphEdges`
WHERE
  DATE(SnapshotAt) = "2022-05-08"
  AND name LIKE '%github.com/ossf/scorecard'
  AND `from`.Name LIKE 'github.com%'
order by deps;
