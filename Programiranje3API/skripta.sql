
#drop database if exists P3API;
#create database P3API character set utf8 collate utf8_general_ci;

#use P3API;

create  table operater(
sifra int not null primary key auto_increment,
email varchar(50) not null,
lozinka char(32) not null,
ime varchar(50) not null,
prezime varchar(50)not null,
uloga varchar(50) not null,
datumprijave TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)engine=innodb CHARACTER SET utf8 COLLATE utf8_general_ci;


create  table kolegij(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
ects varchar(10) not null
)engine=innodb CHARACTER SET utf8 COLLATE utf8_general_ci;


insert into operater(email,lozinka,ime,prezime,uloga) values
('oms',md5('o'),'Oblikovanje mrežnih','Stranica','admin'),
('sbajic',md5('9FlW5mls'),'Sara','Bajić','oper'),('vdezic',md5('NRRxwfXD'),'Valentina','Dežić','oper'),('mdurcevic',md5('MQb8KgAS'),'Marijana','Đurčević','oper'),('dgarvanovic',md5('WFD25z93'),'Dorotea','Garvanović','oper'),('mgrgic',md5('5kPZw1ha'),'Mihaela','Grgić','oper'),('ahibik',md5('IYy55lyH'),'Adriana','Hibik','oper'),('mholjevac',md5('3zFCF6ls'),'Maria','Holjevac','oper'),('dhorak',md5('AOkudin9'),'Denis','Horak','oper'),('ihorvat',md5('t3YQT7Qr'),'Iva','Horvat','oper'),('mkolic',md5('VflQrKnj'),'Mihaela','Kolić','oper'),('tkonjevod',md5('0SMFOXYe'),'Tomislava','Konjevod','oper'),('mkresonja',md5('C9yGhLFA'),'Marina','Kresonja','oper'),('akrvavica',md5('EtgnqXEb'),'Antonia','Krvavica','oper'),('zmajer',md5('3QSkr6uq'),'Zvonimir','Majer','oper'),('mmajstorovic',md5('O7WsUKxm'),'Mirela','Majstorović','oper'),('nmaljkovic',md5('JWSQxng3'),'Nikolina','Maljković','oper'),('lpalameta',md5('HmfY0K13'),'Lorena','Palameta','oper'),('hrecic',md5('qIdHExYj'),'Helena','Rečić','oper'),('lromic',md5('tLBdmZqV'),'Larisa','Romić','oper'),('zstojadinovic',md5('L0C0nJ2U'),'Zorica','Stojadinović','oper'),('estojic',md5('V7JVHzOY'),'Eva','Stojić','oper'),('gstubicar',md5('8RwBekKy'),'Gabriel','Stubičar','oper'),('isvalina',md5('WcC92SUD'),'Ivana','Svalina','oper'),('asestak',md5('SmC6VuQH'),'Antun','Šestak','oper'),('msimenic',md5('rptYO8ML'),'Maja','Šimenić','oper'),('msostaric',md5('O9dTjNh6'),'Marko','Šoštarić','oper'),('jtustanic',md5('QK4ItObb'),'Josipa','Tustanić','oper'),('mvavetic',md5('2E7MYMkf'),'Matija','Vavetić','oper'),('lvitic',md5('2D4FBFhg'),'Luka','Vitić','oper'),('tzilic',md5('EkZNY8IE'),'Tomislava','Žilić','oper'),('agalic',md5('ICd2gf38'),'Antonela','Galić','oper'),('tistuk',md5('JYKxAVDs'),'Tena','Ištuk','oper'),('hivanovic',md5('pwXQ35Xx'),'Hajdi','Ivanović','oper'),('aneretljak',md5('fNa4KJyi'),'Ana Marija','Neretljak','oper');

insert into kolegij(naziv, ects) values ('OMS', '5'), ('Programiranje', '5'), ('Programiranje 3', '5'), ('Organizacija informacija', '5'); 