use ships;

/* (09.09.2017) Задача 3.1. Попълнете липсващите части, обозначени с ______ така, 
че заявката да изведе име и държава на корабите, които никога не са потъвали в 
битка (може и да не са участвали).
select name, country
from ships _____ outcomes on name=ship
		   _____ classes on ships.class=classes.class
where ____________________;*/
select distinct name,country
from ships
left join outcomes on name=ship
join classes on ships.class=classes.class
where name not in (select ship
					from outcomes
                    where result='sunk');

/* (09.09.2017) Задача 3.2. Попълнете липсващите части, обозначени с ______ така, 
че заявката да изведе име, водоизместимост и брой оръдия на най-леките кораби 
с най-много оръдия. */
/*select name,displacement,numguns
from classes s 
join ships s on s.class=c.class
where displacement = (select __________
					  from classes) and 
	  numguns = (select __________
				 from classes c1
                 where ______________________);*/
select name,displacement,numguns
from classes c
join ships s on s.class=c.class
where displacement = (select min(displacement)
						from classes) and numguns = (select numguns
													from classes c1
                                                    where displacement = (select min(displacement)
						from classes));  
-- Мое решение на задачата.
select* 
from (select name,displacement,numguns
from ships
join classes on ships.class=classes.class
where displacement = (select min(displacement)
					  from classes)) t
where t.numguns >= all (select numguns
						from(select name,displacement,numguns
							from ships
							join classes on ships.class=classes.class
							where displacement = (select min(displacement)
													from classes)) t1);
                                                    
/* (09.09.2017) Задача 3.3. Попълнете липсващите части, обозначени с ______ така, че заявката да изведе име на 
битките, в които е участвал един кораб.
/*select battle
from outcomes o1
where _____ (select* 
			 from outcomes o2
             where ______________________) 

Мое решение, вярно, но не в правилния вариант!*/
select distinct battle
from outcomes o1
where battle in (select o2.battle
				from outcomes o2
                group by o2.battle
                having count(*)=1);
select battle 
from  outcomes o1
where not exists (select * 
				  from outcomes o2 
                  where o1.battle=o2.battle and o1.ship<>o2.ship);

/* (09.09.2017) Задача 3.4. Да се посочи заявката, която извежда име на класа и брой на потъналите кораби за 
съответния клас, за тези класове с повече от 5 кораба.
а) select c.class
from classes c join ships s on c.class=s.class
group by c.class
having count(name)>5
INTERSECT
select class
from ships s join outcomes o on s.name=o.ship 
where o.result='sunk';
Грешно. 

б) select class, count(distinct name)
from ships s 
join outcomes o on s.name=o.ship
where result='sunk' and class in (select c.class
								from classes c
                                join ships s on c.class=s.class
                                group by c.class
                                having count(name)>5)
                                group by class;
ВЯРНО.

в) select class, count(distinct name)
from ships s join outcomes o on s.name=o.ship
where result='sunk' and class in (select c.class
								from classes c join ships on c.class=s.class
                                where count(name)>5
                                group by c.class)
group by class;
Грешно.
       
г) select s.class,count(distinct name)
from ships s 
join outcomes o on s.name=o.ship
join (select c.class
	from classes c 
    join ships s on c.class=s.class
    group by c.class, name
    having count(name)>5)t on s.class=t.class
where result='sunk'
group by s.class;
Грешно.
Мое решение на задачата.*/
select class, count(distinct ship)
from ships
left join outcomes on name=ship and result='sunk'
where class in (select class
				from ships
				group by class
				having count(*)>5)
group by class;



 
