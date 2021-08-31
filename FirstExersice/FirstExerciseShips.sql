use ships;

/*3.1 Напишете заявка, която извежда името на класа и държавата за всички класове
с брой на оръдията, по-малък от 10*/
select class, country
from classes
where numguns<10;

/*3.2 Напишете заявка, която извежда имената на всички кораби, пуснати на вода 
преди 1918. Задайте псевдоним на колоната shipName*/
select name as shipName
from ships
where launched<1918;

/*3.3 Напишете заявка, която извежда имената на корабите, потънали в битка, и 
имената на битките, в които са потънали*/
select ship, battle
from outcomes
where result='sunk';

/*3.4 Напишете заявка, която извежда имената на корабите с име, съвпадащо с името
на техния клас*/
select name
from ships
where name=class;

/*3.5 Напишете заявка, която извежда имената на всички кораби, започващи с 
буквата R*/
select name
from ships
where name like 'R%';

/*3.6 Напишете заявка, която извежда имената на всички кораби, чието име е 
съставено от точно две думи*/
select name
from ships
where name like '% %' and name not like '% % %'; 

