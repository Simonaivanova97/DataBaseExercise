use movies;

/*1. За всяко студио искаме да изведем точно по един ред със следната информация:
– Име на студиото;
– Сумарна дължина на всички негови филми.*/
select distinct studioname, sum(length)
from movie
group by studioname;

/*2. За всяка година да се изведе колко филмови звезди са родени.*/
select year(birthdate),count(*)
from moviestar
group by year(birthdate);

/*3. За всяка година да се изведе колко актриси и колко актьори мъже са родени.*/
select year(birthdate),gender, count(*)
from moviestar
group by year(birthdate),gender;

/*4. Да се изведе най-дългият филм (ако са повече от един, да се изведат всички най-
дълги).*/
select*
from movie
where length in (select max(length)
				from movie);

/*5. За всяка филмова звезда да се изведе броят на филмите, в които се е снимала.
Ако за дадена звезда не знаем какви филми има, за нея да се изведе 0.*/
select name,count(starname)
from moviestar
left join starsin on name=starname
group by name;

/*6. Да се изведе средният брой филми, в които са се снимали актьорите.*/
select avg(moviescount)
from (select count(movietitle) as moviescount
	from moviestar
    left join starsin on name=starname
    group by name) star;