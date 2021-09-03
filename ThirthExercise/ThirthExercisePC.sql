use pc;

/*2.1 Напишете заявка, която извежда производителите на персонални компютри с 
честота на процесора поне 500 MHz.*/
select distinct maker
from product
where model in(select model
	       from pc
               where speed>=500);

/*2.2 Напишете заявка, която извежда лаптопите, чиято честота на CPU е по-ниска 
от честотата на който и да е персонален компютър.*/
select*
from laptop
where speed < all(select speed
		  from pc);

/*2.3 Напишете заявка, която извежда модела на продукта (PC, лаптоп или принтер) 
с найвисока цена.*/
-- 1 начин.
select distinct model
from (select model, price
      from pc
      union all
      select model, price
      from laptop
      union all
      select model, price
      from printer) AllProducts
where price >= all (select price
		    from pc
		    union all
		    select price
		    from laptop
		    union all
		    select price
		    from printer);
-- 2 начин.
select distinct model
from ((select model,price
       from laptop)
      UNION
      (select model,price
       from pc)
      UNION
      (select model,price
       from printer)) ModelPriceProducts
where price >= all (select price
		    from ((select price
			   from laptop)
                           UNION
                           (select price
                            from pc)
                           UNION
                           (select price
                            from printer)) PriceProducts);
                
/*2.4 Напишете заявка, която извежда производителите на цветните принтери с най-
ниска цена.*/    
select maker
from product 
where model in (select model
		from printer 
                where color='y' and price <= all (select price 
						  from printer
                                                  where color='y'));

/*2.5 . Напишете заявка, която извежда производителите на тези персонални 
компютри с най-малко RAM памет, които имат най-бързи процесори.*/
-- 1 начин.
select distinct maker
from product 
where model in(select model 
	       from pc 
               where ram<=all(select ram
			      from pc) and speed>=all(select speed 
					              from pc 
                                                      where ram<=all(select ram
								     from pc)));
-- 2 начин.
select distinct maker
from product
where model in (select model
		from (select model, ram, speed
		      from pc
                      where ram <= all (select ram
					from pc)) SmallerRam
		 where speed >= all (select speed
				     from pc 
                                     where ram <= all (select ram
						       from pc)));

