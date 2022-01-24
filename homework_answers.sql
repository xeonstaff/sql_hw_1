--1: how many actors are named Wahlberg?
--A: 2
select last_name, count(last_name) from actor
where last_name = 'Wahlberg'
group by last_name

--2: how many payments were between $3.99 and $5.99?
--A: 5566
--Google told me about over()-- didn't know how to make it work otherwise
select amount,sum(count(amount)) over() as total_count from payment
where amount between 3.99 and 5.99
group by amount 

--3: what film does the store have the most of?
--A: #200, Curtain Videotape
--I don't think getting the name is possible without a merge (just the film_ID)
select inventory.film_id, count(inventory.film_id), film.title
from inventory inner join film on inventory.film_id = film.film_id
group by inventory.film_id, film.title
order by count(inventory.film_id) desc

--4: how many customers have the last name 'William'
--A: 0
select last_name 
from customer
where last_name = 'William'

--5: what store employees sold the most rentals?
--A: ID #1
select staff_id, count(staff_id)
from rental
group by staff_id

--6: how many different district names are there?
--A: 378
select count(distinct(district))
from address

--7: what film has the most actors in it?
--A: Lambs Cincinati with 15
--again, join for the name
select film_actor.film_id, count(distinct(film_actor.actor_id)), film.title
from film_actor inner join film on film_actor.film_id  = film.film_id 
group by film_actor.film_id, film.title
order by count(distinct(film_actor.actor_id)) desc

--8: from store 1, how many customers have last names ending with 'es'
--A: 21
select count(distinct(last_name))
from customer
where last_name like '%es'


--9: how many distinct payment amounts had a number of rentals above 250
--for customers with ids between 380 and 430?
--A: 3
select amount, count(amount)
from payment
where customer_id between 380 and 430
group by amount
having count(amount) > 250
order by count(amount) desc

--10: within the film table, how many ratings categories are there?
--A: 5
--what rating has the most movies total?
--A: PG-13 with 223

select count(distinct(rating))
from film

select rating, count(rating)
from film
group by rating
order by count(rating) desc