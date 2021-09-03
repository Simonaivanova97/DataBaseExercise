use ships;

/* (10.09.2018) Задача 4.1. Да се напише заявка, която извежда име на клас, 
година на първата битка, в която кораб от този клас е участвал, година на 
последната битка, в която кораб на този клас е участвал, и броя на всички 
различни битки, в които кораби на този клас са участвали, само за тези класове, 
започващи с буквата N. Ако за даден клас няма кораб, който да е участвал в битка,
за въответните години да се върне стойност null.*/
select classes.class, min(year(date)),max(year(date)),count( distinct battle)
from classes 
left join ships on classes.class=ships.class
left join outcomes on ships.name=ship
left join battles on battle=battles.name
where classes.class like 'N%'
group by(classes.class);

/* (10.09.2018) Задача 4.2. Да се напише заявка, която да изведе имената на тези
битки, за които броят на корабите от тип 'bb', участвали с тази битка, е по-голям от
броя на корабите от тип 'bc', участвали в същата битка. Битки, в които не е участвал
нито един кораб, да не се извеждат в резултата.*/
select battle
from (select b1.battle,c1.type,count(c1.type)as Count
from outcomes b1
join ships s1 on b1.ship=s1.name
join classes c1 on s1.class=c1.class
group by b1.battle,c1.type) B 
where B.Count>(select Count
				from (select b1.battle,c1.type,count(c1.type)as Count
						from outcomes b1
						join ships s1 on b1.ship=s1.name
						join classes c1 on s1.class=c1.class
						group by b1.battle,c1.type) C
						where C.battle=B.battle and C.type<>B.type);
