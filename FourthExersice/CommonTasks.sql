use ships;
/*1. Имената и годините на пускане на всички кораби, които имат същото име като
своя клас.*/
select name,launched
from ships
where name=class;

use movies;
/*2. Всички филми, чието заглавие съдържа едновременно думите 'the' и 'w' (не
непременно в този ред). Резултатите да се подредят по година (първо най-новите
филми), а филмите от една и съща година - по азбучен ред.*/
select title,year
from movie
where (title like '%the%w%' or title like '%w%the%')
order by year desc, title;

/*3. Заглавията и годините на филмите, в които са играли звезди, родени между
1.1.1970 и 1.7.1980. */
select distinct movietitle, movieyear
from starsin
where starname in (select name 
					from moviestar
                    where birthdate>='1970-01-01' and birthdate<='1980-07-01');
                    
use ships;
/*4. Имената на всички кораби, за които едновременно са изпълнени следните условия:
(1) участвали са в поне една битка и 
(2) имената им (на корабите) започват с C или K.*/
select name
from ships
where name in (select ship
				from outcomes) and (name like 'C%' or name like 'K%');

/*5. Всички държави, които имат потънали в битка кораби.*/
select country
from classes
where class in (select class 
				from ships
                where name in (select ship
								from outcomes
								where result='sunk'));

/*6. Всички държави, които нямат нито един потънал кораб.*/
select distinct country
from classes
where country not in (select country
					from classes
                    where class in (select class
									from ships
                                    where name in (select ship
													from outcomes
													where result='sunk')));

/*7. (От държавен изпит) Имената на класовете, за които няма кораб, пуснат на вода
(launched) след 1921 г. Ако за класа няма пуснат никакъв кораб, той също трябва
да излезе в резултата.*/
select distinct classes.class 
from classes
left join ships on classes.class=ships.class and launched<=1921
where classes.class not in (select class
							from ships
							where launched>1921);

/*8. Името, държавата и калибъра (bore) на всички класове кораби с 6, 8 или 10
оръдия. Калибърът да се изведе в сантиметри (1 инч е приблизително 2.54 см).*/
select class, country, bore*2.54 as BoreSm
from classes
where numguns=6 or numguns=8 or numguns=10;

/*9. Държавите, които имат класове с различен калибър (напр. САЩ имат клас с 14
калибър и класове с 16 калибър, докато Великобритания има само класове с 15).*/
select distinct c1.country
from classes c1
where c1.country in (select c2.country
					from classes c2
                    where c1.country=c2.country and c1.bore<>c2.bore and c1.class<>c2.class);

/*10. Страните, които произвеждат кораби с най-голям брой оръдия (numguns).*/
select distinct country
from classes
where numguns >= all (select numguns
						from classes);
  
use pc;
/*11. Компютрите, които са по-евтини от всеки лаптоп на същия производител.*/
select pc.*
from pc
join product p1 on pc.model=p1.model
where price < all (select price
					from laptop 
                    join product p2 on laptop.model=p2.model
                    where p1.maker=p2.maker);
                    
/*12. Компютрите, които са по-евтини от всеки лаптоп и принтер на същия 
производител.*/
select pc.*
from pc
join product p1 on pc.model=p1.model
where price < all (select price
					from laptop 
                    join product p2 on laptop.model=p2.model
                    where p1.maker=p2.maker) and price < all (select price
																from printer 
																join product p3 on printer.model=p3.model
																where p1.maker=p3.maker);
					
                    

