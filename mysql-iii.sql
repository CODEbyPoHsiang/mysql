-- �Y�O��Ʈw�C����iii�W�ٸ�Ʈw����R��
drop database if exists `iii`;
---�Ыظ�Ʈw�W�٬�iii
create database `iii` default character set utf8 collate utf8_unicode_ci;
---�ЫثȤ��ƪ�
create table Customers (cId int(10) primary key auto_increment ,cName varchar(50),cTel varchar(50) unique key,cEmail varchar(50),cAdd varchar(50));
---�d�ݫȤ��ƪ�����ݩ�
desc customers;
---�Ыب����Ӹ�ƪ�
create table Suppliers (sId int(10) primary key auto_increment , sName varchar(50), sTel varchar(50) unique key, sAdd varchar(50));
---�d�ݨ����Ӹ�ƪ�����ݩ�
desc suppliers;
---�Ыذӫ~��ƪ�A�ó]�ߤ@��foregin key
 create table Products (pId int(10) primary key auto_increment , pNum varchar(50) unique key, pName varchar(50), pPrice int(10) unsigned,sTel varchar(50),
 foreign key (sTel) references Suppliers (sTel));
---�d�ݰӫ~��ƪ�����ݩ�
desc products;
---�Ыحq���ƪ�
 create table Orders (oId int(10) primary key auto_increment, oNum varchar(50) unique key, cTel varchar(50),
 foreign key (cTel) references Customers (cTel));
---�d�ݭq���ƪ�����ݩ�
desc Orders;
---�Ыحq����Ӹ�ƪ�
create table Orderdetails(odId int(10) primary key auto_increment, oNum varchar(50), pNum varchar(50), odPrice int(10) unsigned, odQuantity int(10) unsigned, foreign key (oNum) references Orders(oNum),foreign key (pNum) references Products(pNum));
---�d�ݭq����Ӹ�ƪ�����ݩ�
desc Orderdetails;



--�Ȥ��ƪ�\��----
--�s�W--
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

--�d��---
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

--�R���\��--
\d #
create procedure delC(in kw int)
begin
    delete from Customers where cId = kw; 
end #
\d ;

--�����Ӹ�ƪ�\��
--�s�W--
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

--�d��--
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

--�R��--
\d #
create procedure delS(in kw int)
begin
    delete from Suppliers where sId = kw; 
end #
\d ;

--�ӫ~��\��
--�s�W
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

---�d�ߥ\��
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

--�R��--
\d #
create procedure delP(in kw int)
begin
    delete from Products where pId = kw; 
end #
\d ;


