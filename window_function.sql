SELECT
  year AS "年",
  country AS "国",
  pop AS "人口",
  SUM(pop) OVER (PARTITION BY continent) AS "大陸の合計人口"
FROM gapminder
WHERE continent = 'Americas'
