/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */
select first_name, last_name from (select first_name, last_name from actor
join film_actor using(actor_id) join film using(film_id) join film_category using(film_id) join category using (category_id)
where name = 'Children')as a  where (first_name, last_name) not in (select actor.first_name, actor.last_name
from actor
join film_actor using(actor_id) join film using(film_id) join film_category using(film_id) join category using (category_id) where name = 'Horror') 
group by first_name,last_name
order by last_name, first_name;
