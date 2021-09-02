use pc;

/*2.1 Напишете заявка, която извежда производител, модел и тип на продукт за тези 
производители, за които съответният продукт не се продава (няма го в таблиците PC, 
Laptop или Printer).*/
select maker, model, type 
from product
where model not in (select model from pc) and model not in (select model from laptop)
and model not in (select model from printer);
