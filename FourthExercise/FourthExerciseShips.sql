use ships;

/*3.1 Напишете заявка, която за всеки кораб извежда името му, държавата, броя 
оръдия и годината на пускане (launched).*/
select name,country,numguns,launched
from ships
join classes on ships.class=classes.class;

/*3.2 Напишете заявка, която извежда имената на корабите, участвали в битка от 1942 
г.*/
select distinct ship
from outcomes
join battles on battle=name
where year(date)=1942; 