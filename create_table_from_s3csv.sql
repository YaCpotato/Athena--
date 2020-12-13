CREATE EXTERNAL TABLE IF NOT EXISTS gapminder (
         country STRING,
         continent STRING,
         year INT,
         lifeExp FLOAT,
         pop BIGINT,
         gdpPercap DOUBLE,
         iso_alpha STRING,
         iso_num INT 
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ","
)
LOCATION 's3://athena20200616/' 
TBLPROPERTIES ( 'has_encrypted_data'='false', 'skip.header.line.count'='1' )
