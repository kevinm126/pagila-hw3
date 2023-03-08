/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

select distinct title from film join film_actor as A  using (film_id) join film_actor as B using (film_id) where A.actor_id In(select actor_id from film_actor join film using (film_id) where film.title = 'AMERICAN CIRCUS') and B.actor_id in (select actor_id from film_actor join film using (film_id) where film.title = 'AMERICAN CIRCUS') and A.actor_id != B.actor_id
order by title; 
