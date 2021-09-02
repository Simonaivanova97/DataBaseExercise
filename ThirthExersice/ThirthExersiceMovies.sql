use movies;

/* 1.1 Напишете заявка, която извежда имената на актрисите, които са също и 
продуценти с нетна стойност, поголяма от 10 милиона.*/
select name 
from moviestar
where gender='F' and name in(select name 
			     from movieexec
                             where networth>10000000);

/*1.2 . Напишете заявка, която извежда имената на тези филмови звезди, които не 
са продуценти.*/
select name
from moviestar
where name not in (select name
		   from movieexec);
