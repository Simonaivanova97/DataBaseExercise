use movies;
/* 1.1 Напишете заявка, която извежда адреса на студио ‘MGM’*/
select address
from studio 
where name='MGM';


/*1.2 Напишете заявка, която извежда рождената дата на актрисата Sandra Bullock*/
select birthdate
from moviestar 
where name='Sandra Bullock';

/*1.3 Напишете заявка, която извежда имената на всички филмови звезди, които са 
участвали във филм през 1980, в заглавието на които има думата ‘Empire’*/
select starname
from starsin
where movieyear=1980 and movietitle like '%Empire%';

/*1.4 Напишете заявка, която извежда имената на всички изпълнители на филми с 
нетна стойност над 10 000 000 долара*/
select name 
from movieexec 
where networth>=10000000;

/*1.5 Напишете заявка, която извежда имената на всички актьори, които са мъже 
или живеят в Malibu*/
select name
from moviestar 
where gender='M' or address like '%Malibu%';



