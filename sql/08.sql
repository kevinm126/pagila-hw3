/*
 * The film 'BUCKET BROTHERHOOD' is your favorite movie, but you're tired of watching it.
 * You want to find something new to watch that is still similar to 'BUCKET BROTHERHOOD'.
 * To find a similar movie, you decide to search the history of movies that other people have rented.
 * Your idea is that if a lot of people have rented both 'BUCKET BROTHERHOOD' and movie X,
 * then movie X must be similar and something you'd like to watch too.
 * Your goal is to create a SQL query that finds movie X.
 * Specifically, write a SQL query that returns all films that have been rented by at least 3 customers who have also rented 'BUCKET BROTHERHOOD'.
 *
 * HINT:
 * This query is very similar to the query from problem 06,
 * but you will have to use joins to connect the rental table to the film table.
 *
 * HINT:
 * If your query is *almost* getting the same results as mine, but off by 1-2 entries, ensure that:
 * 1. You are not including 'BUCKET BROTHERHOOD' in the output.
 * 2. Some customers have rented movies multiple times.
 *    Ensure that you are not counting a customer that has rented a movie twice as 2 separate customers renting the movie.
 *    I did this by using the SELECT DISTINCT clause.
 */

WITH bb AS (SELECT film_id from film WHERE title = 'BUCKET BROTHERHOOD')

select distinct g.title from 
(select distinct a.title, c.customer_id from film as a
    join inventory as b on (a.film_id = b.film_id)
    join rental as c on (b.inventory_id = c.inventory_id)
    join rental as d on(c.customer_id = d.customer_id)
    join inventory as e on(d.inventory_id = e.inventory_id)
    join film as f on (e.film_id = f.film_id)
where a.film_id not in (SELECT * from bb)
and f.film_id in(SELECT * from bb)) as g

group by g.title
having count(*) >= 3 
order by title;


