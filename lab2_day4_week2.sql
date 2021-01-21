#1.Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

SELECT title, length, rank() over (order by length) AS rank_length
from film
where length not in ("",0," ");


#2.Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, rating and the rank.

select title, length, rating,  rank() over ( partition by rating order by length) as rank_length 
from film
where length not in ("",0," ");



#3.How many films are there for each of the categories in the category table. Use appropriate join to write this query

Select  c.name, count(f.film_id) as number_offFilms
from category as c
join film_category as f
on c.category_id = f.category_id
group by c.name;


#4.Which actor has appeared in the most films?

Select a.last_name, count(f.actor_id) as number_offFilms
from actor as a
join film_actor as f
on a.actor_id = f.actor_id
group by a.last_name;



#5.Most active customer (the customer that has rented the most number of films)

Select c.last_name, count(r.rental_id) as numberofFilmsrented
from rental as r
join customer as c
on r.customer_id = c.customer_id
group by c.last_name
order by numberofFilmsrented DESC;


