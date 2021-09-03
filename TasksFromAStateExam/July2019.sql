use movies;

/* (09.07.2019) Задача 4.1. Да се огради буквата на заявката, която извежда име на
студио и броя на филмите му, за тези студиа с по-малко от два филма. Студиата, които 
нямат нито един филм, НЕ трябва да присъстват в резултата.
a)  SELECT S.NAME, COUNT(M.TITLE) as CNT
	FROM STUDIO S JOIN MOVIE M
	ON S.NAME = M.STUDIONAME
	GROUP BY S.NAME
	HAVING CNT < 2;
    Грешно, защото трябва да бъде having count(m.title) < 2.

b)  SELECT S.NAME, COUNT(M.TITLE) as CNT
	FROM STUDIO S LEFT JOIN MOVIE M 
	ON S.NAME = M.STUDIONAME
	WHERE M.TITLE IS NULL
	GROUP BY S.NAME
	HAVING COUNT(M.TITLE) < 2;
    Грешно, заради left join.

c)  SELECT S.NAME, COUNT(M.TITLE) as CNT
	FROM STUDIO S JOIN MOVIE M
	ON S.NAME = M.STUDIONAME
	GROUP BY S.NAME
	HAVING COUNT(M.TITLE) < 2;
    ВЯРНО.
    
d)  SELECT S.NAME, COUNT(M.TITLE) as CNT
	FROM STUDIO S JOIN MOVIE M
	ON S.NAME = M.STUDIONAME
	WHERE COUNT(M.TITLE) < 2
	GROUP BY S.NAME;
    Грешно, трябва да бъде having count(m.title)<2.
    
Мое решение на задачата.*/
select studioname,count(title) as numberOfMovies
from movie
group by studioname
having count(title)<2;

/* (09.07.2019) Задача 4.2. Да се напише заявка,която да изведе имената на всички
продуценти с минимален нетен актив.*/
-- 1 начин.
select name 
from movieexec
where networth=(select min(networth)
				from movieexec);
-- 2 начин.
select name 
from movieexec
where networth <= all (select networth 
					from movieexec);

