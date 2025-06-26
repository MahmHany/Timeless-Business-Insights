-- What is the oldest business on each continent?
select continent, country, business, year_founded from 
	(select continent, country, business, year_founded,
	row_number()over(partition by continent order by year_founded) as oldest_business
from businesses b
join countries c
on b.country_code = c.country_code) as sub
where oldest_business=1

-- How many countries per continent lack data on the oldest businesses
-- Does including the `new_businesses` data change this?
SELECT 
    c.continent,
    COUNT(DISTINCT c.country_code) AS countries_without_businesses
FROM countries c
LEFT JOIN (
    SELECT country_code
    FROM businesses
    UNION
    SELECT country_code
    FROM new_businesses
) b ON c.country_code = b.country_code
WHERE b.country_code IS NULL
GROUP BY c.continent;

-- Which business categories are best suited to last over the course of centuries?
select continent, category, min(year_founded) as year_founded
	from businesses b 
	join countries c
    on 
	b.country_code = c.country_code
	join categories t
	on 
	b.category_code=t.category_code
group by continent, category
order by continent, category
