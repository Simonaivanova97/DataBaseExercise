use movies;

/* (10.09.2019) Задача 4.1. Да се огради буквата на заявката, която извежда за всеки
продуцент името му и броя на филмите му по години. Продуцентите, които нямат нито 
един филм, НЕ трябва да присъстват в резултатното множество.
а)  select me.name,m.year,count(*) as cnt
	from movieexec me 
	left join movie m on me.cert#=m.producerc#
	where m.title is null 
	group by me.cert#,me.name,m.year;  
    Грешно, заради left join.
    
б)  select me.name, m.year, count(*) as cnt
	from movieexec me
	join movie m on me.cert#=m.producerc#
	group by me.cert#,me.name,m.year;
    ВЯРНО.
    
в)  select me.name, m.year, count(*) as cnt
	from movieexec me,movie m
	group by me.cert#, me.name, m.year
	where me.cert#=m.producerc#;
    Грешно, заради реда на where и group by.
    
г)  select me.name, m.year, count(*) as cnt
	from movieexec me
	join movie m on me.cert#=m.producerc#
	order by me.cert#,me.name,m.year;
    Грешно, трябва да е group by.
    
Мое решение на задачата.*/
select name,year,count(title)
from movieexec
join movie on cert=producerc
group by name,year;

/* (10.09.2019) Задача 4.2. Да се напише заявка, която да изведе името на най-
младата звезда (полът е без значение).*/
select name
from moviestar
where birthdate=(select max(birthdate)
				from moviestar);
