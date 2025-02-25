-- The following queries utilize the "dvdstore" database.

-- 1. All of the films that Nick Stallone has appeared in
-- (30 rows)
Select title
      ,first_name
      ,last_name
  from actor   act
       inner join 
       film_actor  fa
    on act.actor_id = fa.actor_id
       inner join
       film    fl
    on fl.film_id = fa.film_id
 where first_name = 'NICK'
   and last_name = 'STALLONE'
   ;
-- 2. All of the films that Rita Reynolds has appeared in
-- (20 rows)
Select title
      ,first_name
      ,last_name
  from actor   act
       inner join 
       film_actor  fa
    on act.actor_id = fa.actor_id
       inner join
       film    fl
    on fl.film_id = fa.film_id
 where first_name = 'RITA'
   and last_name = 'REYNOLDS'
   ;
-- 3. All of the films that Judy Dean or River Dean have appeared in
-- (46 rows)
Select title
      ,first_name
      ,last_name
  from actor   act
       inner join 
       film_actor  fa
    on act.actor_id = fa.actor_id
       inner join
       film    fl
    on fl.film_id = fa.film_id
 where first_name = 'JUDY'
   and last_name = 'DEAN'
   or (first_name = 'RIVER'
   and last_name = 'DEAN')
   ;
-- 4. All of the the ‘Documentary’ films
-- (68 rows)
Select title
      , name
  from category cat
       inner join 
       film_category  fc
    on cat.category_id = fc.category_id
       inner join
       film    fl
    on fl.film_id = fc.category_id
 where name = 'Documentary'
   ;
-- 5. All of the ‘Comedy’ films
-- (58 rows)
Select title
      , name
  from category cat
       inner join 
       film_category  fc
    on cat.category_id = fc.category_id
       inner join
       film    fl
    on fl.film_id = fc.category_id
 where name = 'Comedy'
   ;
-- 6. All of the ‘Children’ films that are rated ‘G’
-- (10 rows)
Select title
from film  fl
  inner join film_category fc
  on fl.film_id = fc.film_id
  inner join category cat
  on fc.category_id = cat.category_id
  where cat.name = 'Children' and fl.rating = 'G'
  ;
-- 7. All of the ‘Family’ films that are rated ‘G’ and are less than 2 hours in length
-- (3 rows)
Select title
from film  fl
  inner join film_category fc
  on fl.film_id = fc.film_id
  inner join category cat
  on fc.category_id = cat.category_id
  where cat.name = 'Family' and fl.rating = 'G' and fl.length <120
  ;
-- 8. All of the films featuring actor Matthew Leigh that are rated ‘G’
-- (9 rows)
Select title
from film fl
 inner join film_actor fa on fl.film_id = fa.film_id
 inner join actor act on fa.actor_id = act.actor_id
 where act.first_name='MATTHEW' and act.last_name='LEIGH' and fl.rating = 'G'
 ;
-- 9. All of the ‘Sci-Fi’ films released in 2006
-- (61 rows)
Select title
from film  fl
  inner join film_category fc
  on fl.film_id = fc.film_id
  inner join category cat
  on fc.category_id = cat.category_id
  where cat.name = 'Sci-Fi' and fl.release_year = 2006
  ;
-- 10. All of the ‘Action’ films starring Nick Stallone
-- (2 rows)
Select title
from category cat
  inner join film_category fc on cat.category_id = fc.category_id
  inner join film fl on fc.film_id = fl.film_id
  inner join film_actor fa on fl.film_id = fa.film_id
  inner join actor act on fa.actor_id = act.actor_id
  where act.first_name = 'NICK' and act.last_name = 'STALLONE' and cat.name = 'Action'
  ;
-- 11. The address of all stores, including street address, city, district, and country
-- (2 rows)
Select a.address, c.city, a.district, ctry.country
from store s
   inner join address a on s.address_id = a.address_id
   inner join city c on a.city_id = c.city_id
   inner join country ctry on c.country_id = ctry.country_id
   ;
-- 12. A list of all stores by ID, the store’s street address, and the name of the store’s manager
-- (2 rows)
Select store.store_id, a.address, staff.first_name, staff.last_name
from store
   inner join staff on staff.staff_id = store.manager_staff_id
   inner join address a on a.address_id = store.address_id
   ;
   
   ;
-- 13. The first and last name of the top ten customers ranked by number of rentals 
-- (#1 should be “ELEANOR HUNT” with 46 rentals, #10 should have 39 rentals)
Select customer.first_name, customer.last_name, count(rental.customer_id) as number_of_rentals
from customer
  inner join rental on customer.customer_id = rental.customer_id
  group by customer.first_name, customer.last_name
  order by number_of_rentals desc
  limit 10
  ;

-- 14. The first and last name of the top ten customers ranked by dollars spent 
-- (#1 should be “KARL SEAL” with 221.55 spent, #10 should be “ANA BRADLEY” with 174.66 spent)
Select customer.first_name, customer.last_name, sum(payment.amount) as dollars_spent
from customer
  inner join payment on customer.customer_id = payment.customer_id
  group by customer.first_name, customer.last_name
  order by dollars_spent desc
  limit 10
  ;
-- 15. The store ID, street address, total number of rentals, total amount of sales (i.e. payments), and average sale of each store.
-- (NOTE: Keep in mind that an employee may work at multiple stores.)
-- (Store 1 has 7928 total rentals and Store 2 has 8121 total rentals)

-- 16. The top ten film titles by number of rentals
-- (#1 should be “BUCKET BROTHERHOOD” with 34 rentals and #10 should have 31 rentals)

-- 17. The top five film categories by number of rentals 
-- (#1 should be “Sports” with 1179 rentals and #5 should be “Family” with 1096 rentals)

-- 18. The top five Action film titles by number of rentals 
-- (#1 should have 30 rentals and #5 should have 28 rentals)

-- 19. The top 10 actors ranked by number of rentals of films starring that actor 
-- (#1 should be “GINA DEGENERES” with 753 rentals and #10 should be “SEAN GUINESS” with 599 rentals)

-- 20. The top 5 “Comedy” actors ranked by number of rentals of films in the “Comedy” category starring that actor 
-- (#1 should have 87 rentals and #5 should have 72 rentals)
