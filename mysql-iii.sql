-- 若是資料庫列表中有iii名稱資料庫先行刪除
drop database if exists `iii`;
---創建資料庫名稱為iii
create database `iii` default character set utf8 collate utf8_unicode_ci;
---創建客戶資料表
create table Customers (cId int(10) primary key auto_increment ,cName varchar(50),cTel varchar(50) unique key,cEmail varchar(50),cAdd varchar(50));
---查看客戶資料表欄位屬性
desc customers;
---創建供應商資料表
create table Suppliers (sId int(10) primary key auto_increment , sName varchar(50), sTel varchar(50) unique key, sAdd varchar(50));
---查看供應商資料表欄位屬性
desc suppliers;
---創建商品資料表，並設立一個foregin key
 create table Products (pId int(10) primary key auto_increment , pNum varchar(50) unique key, pName varchar(50), pPrice int(10) unsigned,sTel varchar(50),
 foreign key (sTel) references Suppliers (sTel));
---查看商品資料表欄位屬性
desc products;
---創建訂單資料表
 create table Orders (oId int(10) primary key auto_increment, oNum varchar(50) unique key, cTel varchar(50),
 foreign key (cTel) references Customers (cTel));
---查看訂單資料表欄位屬性
desc Orders;
---創建訂單明細資料表
create table Orderdetails(odId int(10) primary key auto_increment, oNum varchar(50), pNum varchar(50), odPrice int(10) unsigned, odQuantity int(10) unsigned, foreign key (oNum) references Orders(oNum),foreign key (pNum) references Products(pNum));
---查看訂單明細資料表欄位屬性
desc Orderdetails;



--客戶資料表功能----
--新增--
\d #
create procedure addC(
    in cName varchar(50), 
    in cTel varchar(50), 
    in cEmail varchar(50), 
    in cAdd varchar(50)
)
begin

    insert into `customers` (`cName`, `cTel`, `cEmail`, `cAdd`)
    values (cName, cTel, cEmail, cAdd);
end#
/d;

--查詢---
\d# 
create procedure selectC(in kw varchar(50))
begin
set @v_kw = concat('%',kw,'%');
select count(*)into @count from `customers`
where `cTel`like @v_kw or `cName` like @v_kw;
select kw, @count;
if kw ='' or @count = 0 then
select * from `customers`;
else 
select * from `customers` where `cTel`like @v_kw or `cName` like @v_kw;
end if;
end#
\d;

--刪除功能--
\d #
create procedure delC(in kw int)
begin
    delete from Customers where cId = kw; 
end #
\d ;

--供應商資料表功能
--新增--
\d #
create procedure addS(
    in sName varchar(50), 
    in sTel varchar(50), 
    in sAdd varchar(50)
)
begin

    insert into `Suppliers` (`sName`, `sTel`, `sAdd`)
    values (sName, sTel, sEmail, sAdd);
end#
/d;

--查詢--
\d# 
create procedure selectS(in kw varchar(50))
begin
set @v_kw = concat('%',kw,'%');
select count(*)into @count from `suppliers`
where `sTel`like @v_kw or `sName` like @v_kw;
select kw, @count;
if kw ='' or @count = 0 then
select * from `suppliers`;
else 
select * from `suppliers` where `sTel`like @v_kw or `sName` like @v_kw;
end if;
end#
\d;

--刪除--
\d #
create procedure delS(in kw int)
begin
    delete from Suppliers where sId = kw; 
end #
\d ;

--商品表功能
--新增
\d #
create procedure addP(
    in pNum varchar(50), 
    in pName varchar(50), 
    in pPrice int(10) unsigned,
    in sTel varchar(50),
)
begin

    insert into `Products` (`pNum`, `pName`, `pPrice`, `sTel`)
    values (pNum, pName, pPrice, sTel);
end#
/d;

---查詢功能
\d# 
create procedure selectP(in kw varchar(50))
begin
set @v_kw = concat('%',kw,'%');
select count(*)into @count from `products`
where `pName`like @v_kw;
select kw, @count;
if kw ='' or @count = 0 then
select * from `products`;
else 
select * from `products` where `pName`like @v_kw ;
end if;
end#
\d;

--刪除--
\d #
create procedure delP(in kw int)
begin
    delete from Products where pId = kw; 
end #
\d ;


