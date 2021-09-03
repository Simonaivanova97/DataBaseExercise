use movies;

/*1.1 Напишете заявка, която извежда имената на актрисите, участвали в Terms of
Endearment.*/
select starname 
from starsin 
join moviestar on starname=name
where gender='F' and movietitle='Terms of Endearment';

/*1.2 Напишете заявка, която извежда имената на филмовите звезди, участвали във 
филми на студио MGM през 1995 г*/
select starname
from starsin 
join movie on movietitle=title and movieyear=year
where studioname='MGM' and movieyear=1995;

