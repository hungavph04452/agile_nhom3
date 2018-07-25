Create DATABASE Fashion
go

CREATE TABLE account
(
idAccount int identity(1,1) ,
username varchar(40) not null,
password varchar(40) not null ,
fullname nvarchar(50) not null ,
phone varchar(12) not null,
email varchar(50) not null,
address nvarchar(100) not null,
roles bit default 0 null
constraint pk_account primary key (idAccount)
)
CREATE TABLE productType
(
idProductType int identity(1,1),
nameProductType nvarchar(20) not null,
constraint pk_productType primary key (idProductType)
)
CREATE TABLE product
(
idProduct int identity(1,1),
nameProduct nvarchar(20) not null,
price int not null,
quantity int default 1 not null,
describe nvarchar(100)  null,
productInmage nvarchar(40)  null,
idProductType int not null,
constraint pk_product primary key (idProduct),
constraint FK_product_productType FOREIGN KEY (idProductType) REFERENCES productType(idProductType)
)
CREATE TABLE invoice
(
idInvoice int identity (1,1),
name nvarchar(50) not null,
phoneNumber varchar(12) not null,
addressNumber nvarchar(50) not null,
date datetime not null,
status int default 0 null,
total int not null,
idAccount int not null,
constraint pk_invoice primary key (idInvoice),
constraint FK_invoice_account FOREIGN KEY (idAccount) REFERENCES account(idAccount)
)
CREATE TABLE detailInvoice
(
idInvoice int not null,
idProduct int not null,
quantity int default 1 null
constraint FK_detailInvoice_invoice FOREIGN KEY (idInvoice) REFERENCES invoice(idInvoice),
constraint FK_detailInvoice_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
)

SELECT * FROM account

insert into account values ('admin','12345',N'Nguyễn Văn Trung','01684957862','trung@gmail.com',N'Hà Nội',1)
insert into account values ('hienld','12345',N'Lê Đức Hiển','01684957862','hienldph04407@fpt.edu.vn',N'Thái Bình',0)
insert into account values ('hungav','12345',N'An viết hưng','01684378279','hungavph04457@fpt.edu.vn',N'Hà Nội',0)
insert into account values ('datlv','12345',N'Lùng Văn Đạt','01673257881','datlvph04487@fpt.edu.vn',N'Lào Cai',0)

SELECT * FROM productType


insert into productType values ('nike')
insert into productType values ('adidas')
insert into productType values ('vans')
insert into productType values ('converse')
insert into productType values ('levi')
insert into productType values ('pucsun')
insert into productType values ('champion')
insert into productType values ('pladium')


SELECT * FROM product

insert into product values (N'Áo Nasa',200000,4,N'Đã được giảm giá','product5.jpg',1)
insert into product values (N'Áo phông',150000,5,N'Áo được nhập khẩu','product6.jpg',2)
insert into product values (N'Quần xanh',250000,2,N'Chất liệu lion','product7.jpg',1)
insert into product values (N'Váy',200000,7,N'Được làm da cá sấu','product8.jpg',3)
insert into product values (N'Áo nhung',300000,8,N'Làm từ lông cừu','product9.jpg',4)
insert into product values (N'Áo 1985',100000,8,N'Thương hiệu nổi tiếng 1985','product10.jpg',2)
insert into product values (N'Áo trắng',150000,9,N'Vải lion','product11.jpg',3)
insert into product values (N'Áo hoa',120000,10,N'Được thiêu bằng tay','product12.jpg',4)
insert into product values (N'Áo đen tím',120000,11,N'Làm bằng chất liệu costong','product1_3.jpg',3)
insert into product values (N'Áo đen hồng',120000,12,N'Làm bằng chất liệu costong','product7.jpg',4)



SELECT * FROM invoice

insert into invoice values (N'Kien','01684957862',N'Lao Cai','02/07/2018',0,500000,1)


SELECT * FROM detailInvoice

insert into detailInvoice values (1,1,2)
