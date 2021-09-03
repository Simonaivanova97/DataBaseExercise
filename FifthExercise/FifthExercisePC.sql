use pc;

/*1.1 Напишете заявка, която извежда средната честота на процесорите на компютрите.*/
select avg(speed)
from pc;

/*1.2 Напишете заявка, която за всеки производител извежда средния
размер на екраните на неговите лаптопи.*/
select maker,avg(screen)
from product
join laptop on product.model=laptop.model
group by maker;

/*1.3 Напишете заявка, която извежда средната честота на лаптопите с цена над 1000.*/
select avg(speed)
from laptop
where price>1000;

/*1.4  Напишете заявка, която извежда средната цена на компютрите, произведени от 
производител ‘A’.*/
select avg(price)
from pc
join product on pc.model=product.model
where maker='A';

/*1.5 Напишете заявка, която извежда средната цена на компютрите и лаптопите на 
производител ‘B’ (едно число).*/
select avg(price)
from ((select price
	from pc
    join product on pc.model=product.model and maker='B')
    UNION all
    (select price
	from laptop
    join product on laptop.model=product.model and maker='B'))PcLaptopMakerB;

/*1.6 Напишете заявка, която извежда средната цена на компютрите според различните 
им честоти на процесорите.*/
select speed, avg(price)
from pc
group by speed;

/*1.7 Напишете заявка, която извежда производителите, които са произвели поне по 
3 различни модела компютъра.*/
select maker
from product 
where type='PC'
group by maker
having count(*)>=3;

/*1.8 Напишете заявка, която извежда производителите на компютрите с най-висока цена.*/
select distinct maker
from product 
where model in (select model
				from pc 
                where price>=all(select price 
								from pc));

/*1.9 Напишете заявка, която извежда средната цена на компютрите за всяка честота, 
по-голяма от 800 MHz.*/
select avg(price)
from pc 
where speed>800
group by speed; 

/*1.10 Напишете заявка, която извежда средния размер на диска на тези компютри, 
произведени от производители, които произвеждат и принтери.*/
select avg(hd)
from pc 
join product on pc.model=product.model
where maker in (select maker
				from product 
                where type='Printer');

/*1.11 Напишете заявка, която за всеки размер на лаптоп намира разликата в цената на
най-скъпия и най-евтиния лаптоп със същия размер.*/
select screen, max(price)-min(price)
from laptop
group by screen;