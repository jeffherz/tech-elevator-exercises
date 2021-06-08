-- Write queries to return the following:
-- The following changes are applied to the "dvdstore" database.**

-- 1. Add actors, Hampton Avenue, and Lisa Byway to the actor table.
Begin transaction;

Select *
from actor
order by last_name
;
Insert into actor(first_name, last_name)
values ('HAMPTON','AVENUE'),
        ('LISA','BYWAY')
;
Select *
from actor
order by last_name
;
 commit;
-- 2. Add "Euclidean PI", "The epic story of Euclid as a pizza delivery boy in
-- ancient Greece", to the film table. The movie was released in 2008 in English.
-- Since its an epic, the run length is 3hrs and 18mins. There are no special
-- features, the film speaks for itself, and doesn't need any gimmicks.
Begin transaction;

select *
from film
order by title;

insert into film (title, description, release_year, language_id, length)
values ('EUCLIDEAN PI'
        , 'The epic story of Euclid as a pizza delivery boy in ancient Greece'
        , '2008'
        , '1'
        , '198');
select *
from film
order by title;

commit;
-- 3. Hampton Avenue plays Euclid, while Lisa Byway plays his slightly
-- overprotective mother, in the film, "Euclidean PI". Add them to the film.
Begin transaction;

Insert into film_actor(actor_id, film_id)
  values ((select actor_id from actor where first_name = 'HAMPTON' and last_name = 'AVENUE')
             , (select film_id from film where title = 'EUCLIDEAN PI'));
  
Insert into film_actor(actor_id, film_id)
  values ((select actor_id from actor where first_name = 'LISA' and last_name = 'BYWAY')
             , (select film_id from film where title = 'EUCLIDEAN PI'));
      
Select *
from film_actor
where film_id in (select film_id from film where title = 'EUCLIDEAN PI');        
commit;
-- 4. Add Mathmagical to the category table.
 Begin transaction;
 
 Insert into category (name)
    values ('Mathmagical');
    
 Select *
 from category
 ;

 Commit;
-- 5. Assign the Mathmagical category to the following films, "Euclidean PI",
-- "EGG IGBY", "KARATE MOON", "RANDOM GO", and "YOUNG LANGUAGE"
 BEGIN TRANSACTION;

 insert into film_category (film_id, category_id)
 values ((Select film_id from film where title = 'EUCLIDEAN PI'),(select category_id from category where name = 'Mathmagical'))
 ;
 
 update film_category
 set category_id = (select category_id from category where name = 'Mathmagical')
 where film_id in
  (select film_id from film where title in ('EUCLIDEAN PI', 'EGG IGBY', 'KARATE MOON', 'RANDOM GO', 'YOUNG LANGUAGE'));

  select * 
  from film
  join film_category on film.film_id = film_category.film_id
  join category on film_category.category_id = category.category_id
  where category.name = 'Mathmagical'
  ;
 
 commit;
-- 6. Mathmagical films always have a "G" rating, adjust all Mathmagical films
-- accordingly.
-- (5 rows affected)
Begin transaction;

update film
set rating = 'G'
where film_id in (select film_id from film_category where category_id =
          (select category_id from category where name = 'Mathmagical'))
;
 
 select * from film
 join film_category on film.film_id = film_category.film_id
 join category on film_category.category_id = category.category_id
 where category.name = 'Mathmagical';
 
 commit;
-- 7. Add a copy of "Euclidean PI" to all the stores.
Begin transaction;

insert into inventory(film_id, store_id)
values ((select film_id from film where title = 'EUCLIDEAN PI'), 1)
;
insert into inventory(film_id, store_id)
values ((select film_id from film where title = 'EUCLIDEAN PI'), 2)
;

Select * from inventory
order by film_id desc
;

commit;

-- 8. The Feds have stepped in and have impounded all copies of the pirated film,
-- "Euclidean PI". The film has been seized from all stores, and needs to be
-- deleted from the film table. Delete "Euclidean PI" from the film table.
-- (Did it succeed? Why?)
-- <YOUR ANSWER HERE>
Begin transaction;

delete from film
where title = 'EUCLIDEAN PI'
;

rollback;

-- This fails because Euclidean Pi is referenced in other tables.   

-- 9. Delete Mathmagical from the category table.
-- (Did it succeed? Why?)
-- <YOUR ANSWER HERE>
Begin transaction;

delete from category
where name = 'Mathmagical'
;

Rollback;

--This failed because Mathmagical is referenced in other tables.
  
-- 10. Delete all links to Mathmagical in the film_category tale.
-- (Did it succeed? Why?)
-- <YOUR ANSWER HERE>

-- 11. Retry deleting Mathmagical from the category table, followed by retrying
-- to delete "Euclidean PI".
-- (Did either deletes succeed? Why?)
-- <YOUR ANSWER HERE>

-- 12. Check database metadata to determine all constraints of the film id, and
-- describe any remaining adjustments needed before the film "Euclidean PI" can
-- be removed from the film table.
