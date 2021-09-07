use movies;

/* (05.08.2020) Задача 4.1. Да се напише заявка, която извежда имената и рождените дати на
всички филмови звезди, чието име не съдържа "Ja" и са играли в поне един цветен филм.
Първо да се изведат най-младите звезди, а звездите родени на една и съща дата, да се 
изведат по азбучен ред.*/
select name,birthdate
from moviestar
where name not like '%Ja%' and name in (select starname
					from starsin
                                        where movietitle in (select title
							     from movie
                                                             where incolor='y'))
order by birthdate desc,name;

/*(05.08.2020) Задача 4.2. Да се напише заявка, която извежда следната информация 
за всяка актриса, играла в най-много шест филма:
-име;
-рождена година(напр. ако актрисата е родена на 1.1.1995 г., в колоната да пише 1995);
-брой различни студиа, с които е работила.
Ако за дадена актриса няма информация в какви филми е играла, за нея също да се изведе
ред с горната информация, като за брой студиа се изведе 0.*/
-- 1 начин.
select name,year(birthdate) as YearOfBirthdate,count(distinct studioname) as differentStudios
from moviestar
left join starsin on name=starname
left join movie on movietitle=title and movieyear=year
where gender='F'
group by name
having count(starname)<=6;

-- 2 начин.
select name, year(birthdate) as YearOfBirthdate,count(distinct studioname) as differentStudios
from moviestar
left join starsin on name=starname
left join movie on movietitle=title and movieyear=year
where gender='F' and name in (select name
			      from moviestar
			      left join starsin on name=starname
			      group by name
			      having count(*)<=6)
group by name;

