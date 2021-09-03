use movies;

/* (13.07.2013) Задача 4.1. Да се напише заявка, която да изведе име на студио, 
година на първия филм за това студио, година на последния филм за това студио и броя
на всички филми за това студио, само за тези студиа започващи с буквата 'M'.*/
select studioname,min(year) as YearFirtsMovie,max(year) as YearLastMovie,count(distinct title) as nunberOfMovies
from movie
where studioname like 'M%'
group by studioname;

/* (13.07.2013) Задача 4.2. Да се напише заявка, която да изведе името на актрисата,
участвала в най-много филми, и броя на филмите, в които е участвала.*/
select*
from(select ac1.name, count(s1.movietitle) as CountMovie
	from moviestar ac1
	left join starsin s1 on ac1.name=s1.starname
     where gender='F'
	group by ac1.name) B
where B.CountMovie >=all (select CountMovie
							from (select ac1.name, count(s1.movietitle) as CountMovie
									from moviestar ac1
									left join starsin s1 on ac1.name=s1.starname
									where gender='F'
                                    group by ac1.name) C);
