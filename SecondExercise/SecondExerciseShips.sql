use ships;

/*3.1 Напишете заявка, която извежда името на корабите, по-тежки (displacement) 
от 35000.*/
select name, displacement
from ships
join classes on ships.class=classes.class
where displacement>35000;

/*3.2 Напишете заявка, която извежда имената, водоизместимостта и броя оръдия на 
всички кораби, участвали в битката при Guadalcanal.*/
select ship,displacement, numguns
from outcomes
join ships on ship=name
join classes on ships.class=classes.class
where battle='Guadalcanal';

/*3.3 Напишете заявка, която извежда имената на тези държави, които имат класове 
кораби от тип ‘bb' и 'bc' едновременно.*/
select m1.country
from classes m1, classes m2
where m1.country=m2.country and m1.type='bb' and m2.type='bc';

/*3.4 Напишете заявка, която извежда имената на тези кораби, които са били 
повредени в една битка, но по-късно са участвали в друга битка.*/
select distinct s1.ship
from outcomes s1
join battles b1 on s1.battle=b1.name
join outcomes s2 on s1.ship=s2.ship
join battles b2 on s2.battle=b2.name
where s1.result='damaged' and b1.date<b2.date;




