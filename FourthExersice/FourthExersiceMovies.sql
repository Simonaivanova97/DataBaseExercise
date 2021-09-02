use movies;

/*1.1 Напишете заявка, която за всеки филм, по-дълъг от 120 минути, извежда 
заглавие, година, име и адрес на студио.*/
select title,year,studioname,address
from movie
join studio on studioname=name
where length>120;

/*1.2 Напишете заявка, която извежда името на студиото и имената на актьорите, 
участвали във филми, произведени от това студио, подредени по име на студио.*/
select distinct studioname, starname
from movie
join starsin on title=movietitle and year=movieyear
order by studioname;

/*1.3 Напишете заявка, която извежда имената на продуцентите на филмите, в които е
играл Harrison Ford.*/
select distinct name
from movieexec
join movie on producerc=cert
join starsin on title=movietitle and year=movieyear
where starname='Harrison Ford';

/*1.4 Напишете заявка, която извежда имената на актрисите, играли във филми на MGM.*/
-- 1 начин.
select name
from moviestar 
where gender='F' and name in (select starname 
							from starsin
                            where movietitle in (select title
												from movie
                                                where studioname='MGM'));
-- 2 начин.
select moviestar.name
from movie
join starsin on title=movietitle and year=movieyear
join moviestar on starname=name
where gender='F' and studioname='MGM';

/*1.5 Напишете заявка, която извежда името на продуцента и имената на филмите,
продуцирани от продуцента на ‘Star Wars’.*/
select title, name
from movie
join movieexec on producerc=cert
where producerc in (select producerc
					from movie
                    where title='Star Wars');

/* 1.6 Напишете заявка, която извежда имената на актьорите, които не са участвали в
нито един филм. */
-- 1 начин.
select name
from moviestar 
where name not in (select starname 
					from starsin);
-- 2 начин.
select name
from moviestar
left join starsin on name=starname
where movietitle is null;



