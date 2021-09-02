use ships;
-- 1. За всяка държава да се изведат имената на корабите, които никога не са 
-- участвали в битка.
-- 1 начин.
select country, ships.name
from classes
join ships on classes.class=ships.class
left join outcomes on name=ship
where battle is null;

-- 2 начин.
select country, name 
from classes 
join ships on classes.class=ships.class
where name not in (select ship
		   from outcomes);
                    
-- 2. За всеки клас британски кораби да се изведат имената им (на класовете) и 
-- имената на всички битки, в които са участвали кораби от този клас.
-- Ако даден клас няма кораби или има, но те не са участвали в битка, също да се 
-- изведат (със стойност NULL за име на битката).
-- ???
select classes.class,battle
from classes
left join ships on classes.class=ships.class
left join outcomes on name=ship
where country='Gt.Britain';

-- 3. За всеки клас да се изведат името му, държавата и имената на всички негови 
-- кораби, пуснати през 1916 г.
select classes.class, country,name
from classes
join ships on classes.class=ships.class
where launched=1916;

-- 3.1 Да допълним горната задача, като добавим и класовете, които нямат нито един 
-- кораб от 1916 - срещу тях да пише NULL (значи има условие за дясната танблица)
select classes.class, country,name
from classes
left join ships on classes.class=ships.class and launched=1916;
