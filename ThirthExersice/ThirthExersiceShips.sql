use ships;

/*3.1 Напишете заявка, която извежда страните, чиито класове кораби са с най-
голям брой оръдия.*/
select distinct country
from classes
where numguns>=all(select numguns
					from classes);
                    
/*3.2 . Напишете заявка, която извежда имената на корабите с 16-инчови оръдия
(bore).*/
select distinct name
from ships 
where class in (select class
				from classes 
                where bore=16);
                
/*3.3 Напишете заявка, която извежда имената на битките, в които са участвали 
кораби от клас ‘Kongo’.*/
select distinct battle
from outcomes
where ship in (select name
				from ships
                where class='Kongo');
                    
/*3.4 Напишете заявка, която извежда имената на корабите, чиито брой оръдия е 
най-голям в сравнение с корабите със същия калибър оръдия (bore).*/
select s1.name
from ships s1
join classes c1 on s1.class=c1.class
where c1.numguns>=all(select c2.numguns
					from classes c2
                    where c1.bore=c2.bore); 

