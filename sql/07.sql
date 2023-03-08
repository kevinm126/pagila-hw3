/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

WITH problem_6  AS (select distinct actor_id from actor
join film_actor using (actor_id)
where film_id in(
    select film_id from film_actor join actor using (actor_id)
 where first_name ='RUSSELL' AND last_name = 'BACALL') and not
(first_name = 'RUSSELL' AND last_name = 'BACALL'))

select distinct A.first_name || ' ' || A.last_name as "Actor Name" from actor as A 
join film_actor as c using (actor_id) 
join film_actor as d using (film_id) 
join actor as b  on (d.actor_id = b.actor_id) where b.actor_id in( select * from problem_6) 
and A.actor_id Not in (select * from problem_6) and 
A.actor_id not in (select actor_id from actor where A.first_name = 'RUSSELL' and A.last_name = 'BACALL')
order by "Actor Name";
