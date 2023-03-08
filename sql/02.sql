/*
 * Compute the country with the most customers in it. 
 */

select country from (select country.country, count(customer_id) from customer
join address using (address_id) join city using(city_id) join country using(country_id)
group by country.country order by count desc) as A
Limit 1;
