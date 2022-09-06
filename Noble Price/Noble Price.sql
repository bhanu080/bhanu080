Create database Noble_Price;

Create TABLE Price_Winners(
Year INT Not Null,
Subject varchar(30) Not Null,
Winner varchar(30) Not Null,
Country varchar(30) Not Null,
(1971,'','Hannes Alfven','Sweden','Scientist'),
Category varchar(30) Not Null);

INSERT Into Price_Winners(Year,Subject,Winner,Country,Category)
Values(1970,'Physics','Hannes Alfven','Sweden','Scientist'),

(1970,'Physics','Louis Neel','France','Scientist'),

(1970,'Chemistry','Luis Federico Leloir','France','Scientist'),

(1970,'Physiology','Ulf von Euler','Sweden','Scientist'),

(1970,'Physiology','Benerd Katz','Germany','Scientist'),

(1970,'Literature','Aleksandr Solzhenitsyn','Russia','Linguist'),

(1970,'Economics','Paul Samuelson','USA','Economist'),

(1970,'Physiology','Julius Axelrod','USA','Scientist'),

(1971,'Physics','Dennis Gabor','Hungary','Scientist'),

(1971,'Chemistry','Gerhard Herzberg','Germany','Scientist'),

(1971,'Peace','Willy Brandt','Germany','Chancellor'),

(1971,'Literature','Pablo Neruda','Chile','Linguist'),

(1971,'Economics','Simon Kuznets','Russia','Economist'),

(1978,'Peace','Anwar al-Sadat','Egypt','President'),

(1978,'Peace','Menachem Begin','Isrel','Prime Minister'),

(1987,'Chemistry','Donald J.Cram','USA','Scientist'),

(1987,'Chemistry','Jean-Marie Lehn','France','Scientist'),

(1987,'Physiology','Susumu tonegawa','Japan','Scientist'),

(1994,'Economics','Reinhaed Selten','Germany','Economist'),


(1994,'Peace','Yitzhak Rabin','Isrel','Prime Minister'),

(1987,'Physics','Johannes Georg Bednorz','Germany','Scientist'),

(1987,'Literature','Joseph Brodsky','Russia','Linguist'),

(1987,'Economics','Robert Solow','USA','Economist'),

(1994,'Literature','Kenzaburo Oe','Japan','Linguist');

SELECT Year,Subject,Winner 
FROM Price_Winners
WHERE Year=1970;


SELECT Winner
FROM Price_Winners
WHERE Year=1971
AND Subject='Literature';


SELECT Year,Subject
From Price_Winners
WHERE Winner='Dennis Gabor';


SELECT Winner
FROM Price_Winners
WHERE Year>+1950
AND Subject='Physics';


SELECT * FROM Price_Winners
WHERE Subject NOT LIKE 'P%'
ORDER BY Year DESc,Winner;
