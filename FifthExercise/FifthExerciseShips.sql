use ships;

/*2.1 Напишете заявка, която извежда броя на класовете кораби. */
select count(*)
from classes;

/*2.2 Напишете заявка, която извежда средния брой на оръдията (numguns) за всички
кораби, пуснати на вода (т.е. изброени са в таблицата Ships). */
select avg(numguns)
from ships
join classes on ships.class=classes.class;

/*2.3 Напишете заявка, която извежда за всеки клас първата и последната година, в 
която кораб от съответния клас е пуснат на вода. */
select class,max(launched), min(launched)
from ships
group by class;

/*2.4 Напишете заявка, която за всеки клас извежда броя на корабите, потънали в битка. */
select class, count(*)
from ships
join outcomes on name=ship and result='sunk'
group by class;

/*2.5 Напишете заявка, която за всеки клас с над 4 пуснати на вода кораба извежда 
броя на корабите, потънали в битка.*/
select class, count(name)
from ships 
join outcomes on name=ship
where result='sunk' and class in  (select class
				   from ships
				   group by class
				   having count(*)>4)
group by class;

/*2.6 Напишете заявка, която извежда средното тегло на корабите (displacement) за 
всяка страна. */
select country,avg(displacement)
from classes
group by country;

