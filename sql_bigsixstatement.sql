-- question -01
 -- we will need a list of staff members, including thier first  and last name, email id  
 -- and store idintification where there are working
 
 
 select*
 from staff;
 
 select
 staff_id,
 first_name,
 last_name,
 email,
 store_id
 from staff;
 


 -- 2.we will need to seprate counts of inventroy items held at each of two store 
 
 select*from inventory;
 
 select 
 store_id,
 count(inventory_id)
 from inventory
 group by store_id;
  
  -- answer  4581
 
 -- 3.we will need a count of active customer for each of your stores,separatly 
 
 select*
 from customer;
 
 select
 store_id,
 active,
count(customer_id)
 from customer
 group by store_id
 having active="1"   ;
 
  -- answ -599
  
-- 4. In order to asses the liablity of data breach, we will need to provide a count 
 -- of all  customer  email adresses stored in the data base. 
 
 select 
 *
 from customer;
 
 select 
 store_id,
 count(customer_id),
 email
 from customer
 group by store_id;
 
 -- ans 599 
  
 -- 5.  We are intreted in how diverse  your film offering is as a means of understanding how likely 
 --  	your are  to keep customer  engaged in the future, please provide a count of unique film title 
 -- you have in inventory at each store and then a count of unique catagory of film you provide 
 
 
 select
 distinct count(title)
 from film;
 
 select
 distinct (category_id),
 name
 from category
 group by category_id;


 
 -- 6. we would like to understand 	the replacement cost of your films, 
 -- please provide the replacemnt cost of the film  that is least expensive to replace , the most expensive , 
 -- and the avaarge of the  films you carry.
 
 select * from film;

select
replacement_cost,
count(film_id),
avg(replacement_cost),
max(replacement_cost),
min(replacement_cost)
from film
group by replacement_cost
order by replacement_cost desc;


-- 7. we are intrested in having you put payment monitoring systems and maximum payment processing restriction in place 
-- in order to minimize the future risk of fraud by your staff . please provide the avarge payment you process, 
-- as well as the maximum payment you have processed.

select
		amount,
        payment_id,
		count(customer_id),
				avg(amount),
				max(amount)
				from payment
				group by amount
                order by amount desc;

-- 8.we would like  to better understand what your customer base looks like,
-- please a list all customer identification value with a count of rental they have made all time 
-- with your highest volume customer at the top of the list.

select
customer_id,
count(rental_id)
from rental
group by customer_id
order by count(rental_id)desc
limit 10;



