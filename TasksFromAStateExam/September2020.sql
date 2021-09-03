use movies;

/*(16.09.2020) Задача 4.1. Да се напише заявка, която извежда имената и адресите на
всички студиа, които имат поне един цветен и поне един черно-бял филм. Резултатът да се 
сортире възходящо по адрес.*/
select distinct name, address
from studio
where name in (select studioname
			from movie 
            where incolor='y') and name in (select studioname
											from movie
                                            where incolor='n')
order by address;

/*(16.09.2020) Задача 4.2. Да се напише заявка, която за всяко студио с най-много 
три филма извежда:
-името му;
-адреса;
-средната дължина на филмите на това студио.
Студиа без филми също да се изведат(за средната дължина да се извежда null или 0).*/
select name,address,avg(length)
from studio
left join movie on name=studioname
where name in (select name
				from studio
				left join movie on name=studioname
				group by name
				having count(*)<=3)
group by(name);
