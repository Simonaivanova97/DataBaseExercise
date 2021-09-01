use pc;
/*1. Всички принтери с най-висока цена.*/
select*
from printer 
where price>=all(select price
				from printer);

/*2. Точно един принтер с най-висока цена.*/
select*
from printer 
where price>=all(select price
				from printer)
limit 1;

use ships;
/*3. Класовете, на които поне един от корабите им е потънал в битка.*/
select distinct class
from ships 
where name in (select ship
				from outcomes
                where result='sunk');
                
/*4. Класовете, на които нито един от корабите им не е потънал в битка.*/
select class
from classes
where class not in (select class
from ships
join outcomes on name=ship
where result='sunk');


