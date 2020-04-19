/*1*/
SELECT count(film_id) FROM film  
WHERE fulltext @@ to_tsquery('astronaut')

/*2*/
select count(title) from film
where rating = 'R' and replacement_cost between 5 and 15

/*3*/
select count(payment_id), sum(amount) from payment
group by staff_id
order by count(payment_id) desc

/*4*/
select rating,avg(replacement_cost) from film
group by rating

/*5*/
select concat(c.first_name,' ', c.last_name) full_name, c.email,sum(p.amount) from customer c
join payment p on p.customer_id = c.customer_id
group by c.customer_id
order by sum(p.amount) desc
limit 5

/*6*/
select i.store_id, f.title, count(i.film_id) from inventory i
join film f on f.film_id = i.film_id
group by i.store_id,f.title 
order by i.store_id,f.title

/*7*/
select concat(c.first_name,' ', c.last_name) full_name, c.email,count(p.payment_id) from customer c
join payment p on p.customer_id = c.customer_id
group by c.customer_id
having count(p.payment_id) >= 40
order by count(p.payment_id)
