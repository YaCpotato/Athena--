WITH log as (
  SELECT
    log_date as "日付"
    COUNT(DISTINCT [column]) as "レコード数"
  FROM
    [table]
  WHERE
    log_date BETWEEN 'YYYY-MM-DD' AND 'YYYY-MM-DD'
  GROUP BY
    log_date
),
daily as (
  SELECT
    date_column
  FROM (
    VALUES (
      SEQUENCE (
        FROM_ISO8601_DATE('YYYY-MM-DD'),
        FROM_ISO8601_DATE('YYYY-MM-DD'),
        INTERVAL '1' DAY
      )
    ) as t1(date_array)
    CROSS JOIN
      UNNEST(date_array) as t2(date_column)
  )
)

SELECT
  date_format(daily.date_column, '%Y%m%d') as "日付",
  COALESCE(log."レコード数", 0) as "レコード数"
FROM
  daily
LEFT JOIN
  log
ON
  date_format(daily.date_column, '%Y%m%d') = log."日付"
ORDER BY "日付"
