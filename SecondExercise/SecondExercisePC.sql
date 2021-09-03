use pc;

/*2.1 Напишете заявка, която извежда производителя и честотата на процесора на 
лаптопите с размер на харддиска поне 9 GB.*/
select maker, speed 
from laptop
join product on laptop.model=product.model
where hd>=9;

/*2.2 Напишете заявка, която извежда номер на модел и цена на всички продукти, 
произведени от производител с име ‘B’. Сортирайте резултата B’. Сортирайте 
резултата така, че първо да се изведат най-скъпите продукти.*/
(select laptop.model, price
from laptop 
join product on laptop.model=product.model
where maker='B')
UNION 
(select pc.model, price
from pc 
join product on pc.model=product.model
where maker='B')
UNION 
(select printer.model, price
from printer 
join product on printer.model=product.model
where maker='B')
order by price desc;

/*2.3 Напишете заявка, която извежда размерите на тези харддискове, които се 
предлагат в поне два компютъра.*/
select distinct h1.hd
from pc h1
join pc h2 on h1.hd=h2.hd and h1.code<>h2.code;

/*2.4 Напишете заявка, която извежда всички двойки модели на компютри, които имат
еднаква честота на процесора и памет. Двойките трябва да се показват само по 
веднъж, например ако вече е изведена двойката (i, j), не трябва да се извежда 
(j, i).*/
select m1.model, m2.model
from pc m1
join pc m2 on m1.speed=m2.speed and m1.ram=m2.ram and m1.code<m2.code;

/*2.5  Напишете заявка, която извежда производителите на поне два различни 
компютъра с честота на процесора поне 1000 MHz.
???*/
select distinct p1.maker
from product p1
join pc on p1.model=pc.model
join product p2 on p1.maker=p2.maker
where speed>700 and p2.type='PC' and p1.model<>p2.model;





