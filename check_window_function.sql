SELECT
  continent AS "大陸名",
  SUM(pop) AS "人口"
FROM gapminder
GROUP BY continent
