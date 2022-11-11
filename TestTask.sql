CREATE DATABASE MyDB

GO

USE MyDB

GO

CREATE TABLE Bank
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	BankName NVARCHAR(40) NULL UNIQUE
);

CREATE TABLE City
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	City_Name NVARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE Branch
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Bank_Id INT NULL,
	City_Id INT NULL, 
	FOREIGN KEY(City_Id) REFERENCES City(Id),
	FOREIGN KEY(Bank_Id) REFERENCES Bank(Id)
);


CREATE TABLE Client
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Client_Name NVARCHAR(20) NOT NULL,
	Client_Surname NVARCHAR(20) NOT NULL,
	Branch_Id INT NOT NULL,
	Status_Id INT NOT NULL, 
	FOREIGN KEY(Branch_Id) REFERENCES Branch(Id),
	--FOREIGN KEY(Id) REFERENCES Client_Status(Id),	
);

CREATE TABLE Client_Status
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Status_Name NVARCHAR(30) NOT NULL,
	Client_Id INT NULL,
	FOREIGN KEY(Client_Id) REFERENCES Client(Id)
);

CREATE TABLE Account
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Account_Balance MONEY NOT NULL DEFAULT 0,
	Client_Id INT NULL,
	FOREIGN KEY(Client_Id) REFERENCES Client(Id)
);

CREATE TABLE Cards
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Account_Id INT NOT NULL,
	Balance MONEY NOT NULL DEFAULT 0,
	FOREIGN KEY (Account_Id) REFERENCES Account(Id)
);

GO

INSERT INTO Bank(BankName)
VALUES
('ПриорБанк'),
('ВТББанк'),
('БСББанк'),
('АльфаБанк'),
('Беларусбанк')

INSERT INTO City(City_Name)
VALUES
('Минск'),
('Гомель'),
('Пинск'),
('Борисов'),
('Брест')

INSERT INTO Branch(Bank_Id, City_Id)
VALUES
(1, 2),
(1, 3),
(1, 1),
(1, 4),
(2, 1),
(2, 1),
(2, 3),
(2, 2),
(3, 1),
(3, 2),
(3, 3),
(3, 3),
(3, 3),
(4, 1),
(4, 3),
(4, 3),
(4, 5),
(5, 2),
(5, 1)

INSERT INTO Client_Status(Status_Name)
VALUES
('Инвалид'),
('Студент'),
('Безработный'),
('Пенсионер'),
('Иностранец'),
('Льготник')

INSERT INTO Client(Client_Name, Client_Surname, Branch_Id, Status_Id)
VALUES
('Александр', 'Шаповалов', 1, 4),
('Александр', 'Шаповалов', 5, 4),
('Александр', 'Шаповалов', 13, 4),
('Алёна', 'Будрова', 1, 2),
('Елена', 'Гончарова', 2, 3),
('Данила', 'Бут-Гусаим', 2, 1),
('Данила', 'Бут-Гусаим', 9, 1),
('Данила', 'Бут-Гусаим', 10, 1),
('Данила', 'Бут-Гусаим', 17, 1),
('Егор', 'Бурдов', 3, 3),
('Игорь', 'Войтенко', 6, 1),
('Дмитрий', 'Прокопенко', 4, 2),
('Дмитрий', 'Прокопенко', 19, 2),
('Антон', 'Батюшков', 4, 2),
('Иван', 'Громыко', 7, 2),
('Иван', 'Гаращук', 5, 1),
('Анастасия', 'Чернявская', 4, 4),
('Анастасия', 'Чернявская', 18, 4),
('Денис', 'Тарелко', 4, 4),
('Григорий', 'Бут-Гусаим', 4, 4),
('Михаил', 'Ешман', 6, 5),
('Афанасий', 'Ёвженко', 9, 5),
('Любовь', 'Жиринква', 3, 6),
('Евгений', 'Маслак', 12, 5),
('Евгения', 'Войтишенюк', 15, 2),
('Елизавета', 'Громода', 13, 3),
('Николай', 'Пасхин', 2, 1),
('Николай', 'Пасхин', 11, 1),
('Игорь', 'Володкевич', 15, 5),
('Варвара', 'Гончарова', 14, 3),
('Валентина', 'Громыко', 18, 2),
('Вероника', 'Бонапарт', 19, 3),
('Галина', 'Русско', 19, 4),
('Иннокентий', 'Нерусско',19 , 6),
('Олег', 'Курган', 14, 3),
('Ростислав', 'Черепашкович', 6, 4),
('Ростислав', 'Черепашкович', 3, 4),
('Ростислав', 'Черепашкович', 16, 4),
('Леонид', 'Медведев', 5, 4),
('Константин', 'Тчакинский', 8, 2),
('Макар', 'Бутербродов', 5, 3),
('Валерий', 'Пашковец', 3, 4),
('Валерий', 'Пашковец', 7, 4),
('Пётр', 'Первый', 17, 1),
('Руслан', 'Усачев', 16, 1),
('Святослав', 'Коновалов', 19, 2),
('Степан', 'Перепечка', 15, 2),
('Тимофей', 'Кровопийца', 14, 3),
('Юрий', 'Дудь', 14, 1),
('Юрий', 'Дудь', 1,1)

INSERT INTO Account(Account_Balance, Client_Id)
VALUES
(5000,1),
(9000,2),
(3000,3),
(8000,4),
(5000,5),
(5000,6),
(2000,7),
(5000,8),
(4000,9),
(3000,10),
(2000,11),
(4000,12),
(5000,13),
(4000,14),
(5000,15),
(8000,16),
(4000,17),
(9000,18),
(5000,19),
(1000,20),
(3000,21),
(4000,22),
(8000,23),
(7000,24),
(8000,25),
(3000,26),
(1000,27),
(2000,28),
(7000,29),
(3000,30),
(4000,31),
(7000,32),
(7000,33),
(7000,34),
(7000,35),
(7000,36),
(6000,37),
(5000,38),
(4000,39),
(3000,40),
(2000,41),
(1000,42),
(2000,43),
(6000,44),
(4000,45),
(2000,46),
(2000,47),
(6000,48),
(3000,49),
(1000,50)

INSERT INTO Cards(Account_Id, Balance)
VALUES
(1, 500),
(1, 4500),
(2, 4500),
(2, 4500),
(3, 3000),
(4, 100),
(5, 70),
(6, 50),
(6, 600),
(7, 50),
(9, 50),
(9, 10),
(10, 10),
(11, 250),
(12, 300),
(12, 620),
(14, 800),
(15, 50),
(15, 950),
(16, 820),
(17, 50),
(17, 840),
(19, 890),
(20, 50),
(21, 50),
(22, 90),
(23, 10),
(24, 40),
(25, 300),
(25, 700),
(26, 60),
(28, 280),
(29, 5),
(30, 70),
(31, 310),
(31, 40),
(31, 50),
(32, 40),
(32, 50),
(33, 40),
(35, 35),
(35, 80),
(37, 5),
(37, 60),
(38, 800),
(39, 10),
(40, 1),
(40, 0.1),
(41, 100),
(41, 30),
(42, 500),
(43, 300),
(43, 850),
(44, 10),
(45, 5),
(47, 2),
(48, 30),
(49, 3),
(49, 1),
(50, 1000)

GO

--Задание 2

SELECT DISTINCT BankName FROM Branch, Bank, City
WHERE City_Name = 'Борисов' AND 
	Bank.Id = Branch.Bank_Id AND
	Branch.City_Id = City.Id

GO

--Задание 3

SELECT Cards.Id AS CardId, Client_Name, Client_Surname, Balance, BankName
FROM Cards, Branch, Bank, Client, Account
WHERE Client_Name = 'Данила' AND 
	Client_Surname = 'Бут-Гусаим' AND
	Account.Account_Balance = 5000 AND
	Bank.BankName = 'ПриорБанк' AND
	Client.Branch_Id = Branch.Id AND
	Branch.Bank_Id = Bank.Id AND
	Account.Client_Id = Client.Id AND
	Cards.Account_Id = Account.Id

GO

--Задание 4

SELECT Account_Id, Client_Surname, Client_Name, BankName, Account_Balance, SUM(Balance) as 'Cards sum', Account_Balance - SUM(Balance) as 'Difference'
FROM Cards, Client, Account, Bank, Branch
WHERE
Cards.Account_Id = Account.Id AND
Account.Id = Client.Id AND
Client.Branch_Id = Branch.Id AND
Branch.Bank_Id = Bank.Id
GROUP BY Account_Id, Client_Surname, Client_Name, BankName, Account_Balance
HAVING  Account_Balance - SUM(Balance) <> 0
ORDER BY Account_Id

GO

--Задание 5.1

SELECT Status_Name, COUNT(Cards.Id)
FROM Client_Status, Client, Account, Cards
WHERE
Client_Status.Id = Client.Status_Id AND
Account.Client_Id = Client.Id AND
Cards.Account_Id = Account.Id
GROUP BY Status_Name
