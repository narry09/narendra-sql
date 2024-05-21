1.SELECT SUM(population) AS total_population
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
WHERE zipcode = '94085';


2.SELECT
    SUM(CASE WHEN gender = 'Male' THEN population ELSE 0 END) AS male_population,
    SUM(CASE WHEN gender = 'Female' THEN population ELSE 0 END) AS female_population
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
WHERE zipcode = '94085';

3.SELECT  SUM(population) AS total_population
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
WHERE zipcode = '94085'
GROUP BY population
ORDER BY total_population DESC
LIMIT 1;

4.SELECT maximum_age, SUM(CASE WHEN gender = 'Male' THEN population ELSE 0 END) AS male_population
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
WHERE zipcode = '94085'
GROUP BY maximum_age
ORDER BY male_population DESC
LIMIT 1;

5.SELECT maximum_age, SUM(CASE WHEN gender = 'Female' THEN population ELSE 0 END) AS female_population
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
WHERE zipcode = '94085'
GROUP BY maximum_age
ORDER BY female_population DESC
LIMIT 1;

6.SELECT zipcode, SUM(population) AS total_population
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
GROUP BY zipcode
ORDER BY total_population DESC
limit 1;

7.SELECT maximum_age, SUM(population) AS total_population
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
GROUP BY maximum_age
ORDER BY total_population DESC
LIMIT 5;

8.SELECT zipcode, SUM(CASE WHEN gender = 'Female' THEN population ELSE 0 END) AS total_female_population
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
GROUP BY zipcode
ORDER BY total_female_population DESC
LIMIT 5;

9.SELECT zipcode, SUM(CASE WHEN gender = 'Male' THEN population ELSE 0 END) AS total_male_population
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
GROUP BY zipcode
ORDER BY total_male_population ASC
LIMIT 10;




