CREATE DATABASE UserManagement_1
go

use UserManagement_1
go

CREATE TABLE Roles(
roleID nvarchar(100) not null,
roleName nvarchar(100) null,
CONSTRAINT pk_Roles PRIMARY KEY(roleID)
)
GO

CREATE TABLE Users(
email nvarchar(100) not null,
fullName nvarchar(100)null,
password char(100) not null,
roleID nvarchar(100) not null,
address nvarchar(100) null,
birthday DATE,
phone char(15) null,
status bit null,
CONSTRAINT pk_Users PRIMARY KEY(email),
CONSTRAINT pk_RolesUsers FOREIGN KEY(roleID) REFERENCES [dbo].[Roles](roleID)
)
GO




CREATE TABLE Orders(
orderID int identity(1,1) not null,
orderDate DATE,
total char(10) null,
email nvarchar(100) not null,
CONSTRAINT pk_Orders PRIMARY KEY(orderID),
CONSTRAINT pk_UsersOrders FOREIGN KEY(email) REFERENCES [dbo].[Users](email)
)
GO

CREATE TABLE Category(
categoryID nvarchar(100) not null,
categoryName nvarchar(100) null,
CONSTRAINT pk_Category PRIMARY KEY(categoryID)
)
GO


CREATE TABLE Products(
productID nvarchar(100) not null,
productName nvarchar(100) null,
price float null,
image nvarchar(150) null,
quantity int null,
categoryID nvarchar(100) not null,
importDate DATE null,
usingDate DATE null,
status bit null,
CONSTRAINT pk_Products PRIMARY KEY(productID),
CONSTRAINT pk_CategoryProducts FOREIGN KEY(categoryID) REFERENCES [dbo].[Category](categoryID),

)
GO


CREATE TABLE OrderDetail(
detailID int identity(1,1) not null,
price float null,
quantity int null,
orderID int not null,
productID nvarchar(100) not null,
CONSTRAINT pk_OrdersDetail PRIMARY KEY(detailID),
CONSTRAINT pk_OrdersOrderDetail FOREIGN KEY(orderID) REFERENCES Orders(orderID),
CONSTRAINT pk_ProductsOrderDetail FOREIGN KEY(productID) REFERENCES Products(productID)
)
GO

use UserManagement_1
go

INSERT INTO Roles(roleID, roleName) VALUES ( N'AD', N'ADMIN');
INSERT INTO Roles(roleID, roleName) VALUES ( N'US', N'USER');


INSERT INTO Users(email, fullName , password , roleID , address , birthday , phone , status) 
VALUES ( N'quocsy2511@gmail.com', N'SixjuBow',N'1' , N'AD',N'VT',cAST (N'2001-01-10' AS DATE),0983709791,1);

INSERT INTO Users(email, fullName , password , roleID, address , birthday , phone , status) 
VALUES ( N'thiepngo@gmail.com', N'ông hoàng tư vấn tc',N'1' ,N'AD',N'ĐN',cAST (N'2001-03-01' AS DATE),0899845787,1);

INSERT INTO Users(email, fullName , password , roleID, address , birthday , phone , status) 
VALUES ( N'thaihoang03122001@gmail.com', N'Thái ko ngu',N'1' ,N'US',N'HCM',cAST (N'2001-03-10' AS DATE),0938874361,1);

INSERT INTO Users(email, fullName , password , roleID, address , birthday , phone , status) 
VALUES ( N'thichanbobobo@gmail.com', N'Bowsep',N'1' ,N'AD',N'ĐN',cAST (N'2001-07-25' AS DATE),0868031890,1);

INSERT INTO Users(email, fullName , password , roleID, address , birthday , phone , status) 
VALUES ( N'thinhddse151086@fpt.edu.vn', N'Thịnh cậu cả',N'1' ,N'US',N'ĐN',cAST (N'2001-03-01' AS DATE),0975647951,0);

INSERT INTO Users(email, fullName , password , roleID, address , birthday , phone , status) 
VALUES ( N'tungntse151167@fpt.edu.vn', N'Tùn hot girl',N'1' ,N'US',N'BD',cAST (N'2001-05-01' AS DATE),0868649875,1);

INSERT INTO Users(email, fullName , password , roleID, address , birthday , phone , status) 
VALUES ( N'khanhchivt456@gmail.com', N'Chi đb',N'1' ,N'US',N'VT',cAST (N'2001-10-24' AS DATE),0834547296,1);

INSERT INTO Users(email, fullName , password , roleID, address , birthday , phone , status) 
VALUES ( N'synqse151029@fpt.edu.vn', N'con gà',N'1' ,N'US',N'HCM',cAST (N'2001-11-25' AS DATE),0983709791,0);




INSERT INTO Category (categoryID , categoryName) VALUES (N'1',N'fruits');
INSERT INTO Category (categoryID , categoryName) VALUES (N'2',N'vegetables');


INSERT INTO Products(productID, productName ,price ,image ,quantity ,categoryID ,importDate ,usingDate ,status) 
VALUES (N'1',N'chuối',20000, 'https://anhdep123.com/wp-content/uploads/2020/11/hinh-anh-qua-chuoi-tieu.jpg', 100, N'1',
cAST (N'2022-03-01' AS DATE),cAST (N'2022-03-10' AS DATE),1);

INSERT INTO Products(productID, productName ,price ,image ,quantity ,categoryID ,importDate ,usingDate ,status) 
VALUES (N'2',N'cam',25000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ079okWSIsyOMuef-bJ_I0aI12wCsaHPnvjQ&usqp=CAU', 100, N'1',
cAST (N'2022-03-01' AS DATE),cAST (N'2022-03-10' AS DATE),1 );

INSERT INTO Products(productID, productName ,price ,image ,quantity ,categoryID ,importDate ,usingDate ,status) 
VALUES (N'3',N'bưởi',22000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKlMURI3z1do_UeaCrUU7v0DLxso4U9dZWTg&usqp=CAU', 100, N'1',
cAST (N'2022-03-01' AS DATE),cAST (N'2022-03-10' AS DATE),1);

INSERT INTO Products(productID, productName ,price ,image ,quantity ,categoryID ,importDate ,usingDate ,status) 
VALUES (N'4',N'táo',10000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiur-lT66SI3swI8Lqi6UznXBw2RtwhOdh3A&usqp=CAU', 100, N'1',
cAST (N'2022-03-04' AS DATE),cAST (N'2022-03-14' AS DATE),1);

INSERT INTO Products(productID, productName ,price ,image ,quantity ,categoryID ,importDate ,usingDate ,status) 
VALUES (N'5',N'sầu riêng',35000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgFXJr9LNdZFIQDLqhsYlVEMlDv4mpOwmu3Q&usqp=CAU', 100, N'1',
cAST (N'2022-03-04' AS DATE),cAST (N'2022-03-14' AS DATE),1);

INSERT INTO Products(productID, productName ,price ,image ,quantity ,categoryID ,importDate ,usingDate ,status) 
VALUES (N'6',N'dâu',25000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfMrXNRtY-JNcndiMr2ot7YbopKfuidla4TQ&usqp=CAU', 100, N'1',
cAST (N'2022-03-04' AS DATE),cAST (N'2022-03-14' AS DATE),1 );

INSERT INTO Products(productID, productName ,price ,image ,quantity ,categoryID ,importDate ,usingDate ,status) 
VALUES (N'7',N'bơ',20000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTp8CwFNXunhb6r2Q_vV65uyEdE9LdPHLplXg&usqp=CAU', 100, N'1',
cAST (N'2022-03-05' AS DATE),cAST (N'2022-03-15' AS DATE),1 );

INSERT INTO Products(productID, productName ,price ,image ,quantity ,categoryID ,importDate ,usingDate ,status) 
VALUES (N'8',N'nho',20000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnuKHyI0MP2pqi5b3M9ClkDpPkFQjKKuizEQ&usqp=CAU', 100, N'1',
cAST (N'2022-03-02' AS DATE),cAST (N'2022-03-11' AS DATE),1 );

INSERT INTO Products(productID, productName ,price ,image ,quantity ,categoryID ,importDate ,usingDate ,status) 
VALUES (N'9',N'chôm chôm',23000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiepoS31Ida5WJopJcYiE53qa0CcxZLGkJxA&usqp=CAU', 100, N'1',
cAST (N'2022-03-02' AS DATE),cAST (N'2022-03-11' AS DATE),1 );

INSERT INTO Products(productID, productName ,price ,image ,quantity ,categoryID ,importDate ,usingDate ,status) 
VALUES (N'10',N'nhãn',20000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3uLU037ELqakMDK4ZQPX1tYsZv-ta1rh8BQ&usqp=CAU', 100, N'1',
cAST (N'2022-03-03' AS DATE),cAST (N'2022-03-12' AS DATE),1 );

INSERT INTO Products(productID, productName ,price ,image ,quantity ,categoryID ,importDate ,usingDate ,status) 
VALUES (N'13',N'rau muống',5000, 'https://ihr.org.vn/wp-content/uploads/2021/03/benh-gut-co-an-duoc-rau-muong-1.jpg', 100, N'2',
cAST (N'2022-03-06' AS DATE),cAST (N'2022-03-12' AS DATE),1 );

INSERT INTO Products(productID, productName ,price ,image ,quantity ,categoryID ,importDate ,usingDate ,status) 
VALUES (N'11',N'rau cải',15000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0QuaHZkVeE97QfgyaYaCo7cRdn4BRnzTA7g&usqp=CAU', 100, N'2',
cAST (N'2022-03-06' AS DATE),cAST (N'2022-03-12' AS DATE),1 );

INSERT INTO Products(productID, productName ,price ,image ,quantity ,categoryID ,importDate ,usingDate ,status) 
VALUES (N'12',N'súp lơ',10000, 'https://hatgiongphuongnam.com/asset/upload/image/hat-giong-sup-lo-vang-trang-2.1_.jpg', 100, N'2',
cAST (N'2022-03-06' AS DATE),cAST (N'2022-03-12' AS DATE), 1);

INSERT INTO Products(productID, productName ,price ,image ,quantity ,categoryID ,importDate ,usingDate ,status) 
VALUES (N'14',N'rau salad',14000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiwTEJb74BgbWwHbhWIaumEsv_lrChHG0YNg&usqp=CAU', 100, N'2',
cAST (N'2022-03-07' AS DATE),cAST (N'2022-03-15' AS DATE), 1);

INSERT INTO Products(productID, productName ,price ,image ,quantity ,categoryID ,importDate ,usingDate,status ) 
VALUES (N'15',N'củ cà rốt',20000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTq0BLcT-VBEXOTnflTMEZtWAeTbNW3edUTQ&usqp=CAU', 100, N'2',
cAST (N'2022-03-07' AS DATE),cAST (N'2022-03-15' AS DATE),1 );


 

