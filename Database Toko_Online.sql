-- Membuat Table
create database toko_online;


Use toko_online; 

create table pelanggan(
	id int primary key not null auto_increment,
    nama varchar(25),
    alamat varchar(30),
    no_hp varchar(20),
    jenis_kelamin varchar(10)
);

create table kategori(
	id int primary key not null auto_increment,
    nama_kategori varchar(25)
);

create table barang(
	id int primary key not null auto_increment,
    nama_barang varchar(23),
    harga_barang int,
    stok_barang int,
    id_kategori int,
    foreign key (id_kategori) references kategori(id)
);


create table transaksi(
	id int primary key not null auto_increment,
    tanggal_transaksi date,
    jumlah_pembelian int,
    id_pelanggan int,
    id_barang int,
    foreign key (id_pelanggan) references pelanggan(id),
    foreign key (id_barang) references barang(id)
);


insert into pelanggan (nama, alamat, no_hp, jenis_kelamin) values
("Anjis", "Ngawi", "085747048022", "Laki-laki"),
("Kiki", "Ngawi", "081937200301", "Laki-laki"),
("irfan", "Ngawi", "087442656788", "Laki-Laki"),
("Rovin", "Ngawi", "083425184027", "Laki-Laki"),
("Dina", "Madiun", "086372946104", "Perempuan"),
("yuli", "Madiun", "082845381047", "Perempuan"),
("Ilham", "Magetan", "087880993232", "Laki-laki"),
("Putri", "Magetan", "082445678990", "Perempuan"),
("Guntor", "Solo", "085688543201", "Laki-laki"),
("Sinta", "Solo", "081788234220", "Perempuan");

insert into kategori (nama_kategori) values
("Elektronik"),
("Makanan & Minuman"),
("Otomotif"),
("Pakaian Pria"),
("Pakain Wanita"),
("Handphone & Aksesoris"),
("Perlengkapan Rumah"),
("Kesehatan"),
("Buku & Alat Tulis"),
("Olahraga & Outdor");

insert into barang (nama_barang, harga_barang, stok_barang, id_kategori) values
("Sweater Hoodie Dikies", 150000, 50, 4),
("Celana Panjang Chinos", 80000, 30, 4),
("Cardigan Rajut", 50000, 20, 5),
("Xiomi Note 10 Pro ", 3000000, 20, 6),
("Mie Lidi", 10000, 200, 2),
("TV Polytron LED", 1500000, 10, 1),
("Hand Sanitizer", 20000, 500, 8),
("Note Book", 10000, 80, 9),
("Sepeda Gunung", 1200000, 40, 10),
("Lemari Plastik", 100000, 50, 7),
("Oli Yamalub", 30000, 250, 3),
("Pasmina", 40000, 300, 5),
("Masker Duckbil", 15000, 100, 8),
("Oppo A5", 1500000, 60, 6),
("Mie Sedaap", 5000, 600, 2),
("Mesin Cuci", 500000, 40, 1),
("Panci", 15000, 100, 7),
("Helm SNI", 300000, 180, 3),
("Tas Gunung", 260000, 90, 10),
("Pencil Warna", 25000, 280, 9);


insert into transaksi (tanggal_transaksi, jumlah_pembelian, id_pelanggan, id_barang) values
("2022-10-20", 2, 3, 3),
("2022-10-20", 2, 5, 3),
("2022-10-20", 2, 2, 4),
("2022-10-21", 2, 3, 2),
("2022-10-21", 2, 4, 2),
("2022-10-22", 2, 9, 9),
("2022-10-22", 2, 3, 6),
("2022-10-22", 2, 1, 2),
("2022-10-25", 2, 1, 19),
("2022-10-25", 2, 6, 12),
("2022-09-22", 2, 8, 12),
("2022-09-22", 2, 7, 18),
("2022-09-22", 2, 10, 10),
("2022-08-22", 2, 5, 17),
("2022-08-22", 2, 5, 13);


-- 1 pelanggan membeli 3 barang yang berbeda
select id_pelanggan, pelanggan.nama, id_barang, nama_barang, jumlah_pembelian
from transaksi inner join pelanggan
on transaksi.id_pelanggan = pelanggan.id
inner join barang
on transaksi.id_barang = barang.id
where id_pelanggan = 1;

-- Melihat 3 produk yang paling sering dibeli oleh pelanggan
select * from transaksi order by jumlah_pembelian desc limit 3 ;

-- Melihat Kategori barang yang paling banyak barangnya
select nama_barang, id_kategori, nama_kategori, max(stok_barang)
from barang inner join kategori
on barang.id_kategori = kategori.id;

-- Melihat pendapat rata-rata tiap bulan terakhir
select transaksi.tanggal_transaksi, AVG(transaksi.jumlah_pembelian*barang.harga_barang) as rata_rata_transaksi
FROM transaksi inner join barang
on transaksi.id = barang.id
GROUP BY YEAR(transaksi.tanggal_transaksi), MONTH(transaksi.tanggal_transaksi);

update pelanggan set nama = "Ihza" where id = 2;

update barang set harga_barang = 1000000 where id = 6;

update kategori set nama_kategori = "sepatu pria" where id = 5 ;

update transaksi set tanggal_transaksi = "2022-07-20" where id = 14;

select * from barang;
select * from kategori;
select * from pelanggan;
select * from transaksi;
select * from transaksi where tanggal_transaksi = "2022-10-21";
select * from pelanggan where id = 1;
select * from barang where id = 1;
select nama_barang, harga_barang from barang where id = 5;
select nama_kategori from kategori;

delete from transaksi where id = 5;
delete from barang where id = 3;
delete from pelanggan where id = 4;
delete from kategori where id = 2;

drop table transaksi;
drop table barang;
drop table pelanggan;
drop table kategori;

drop database toko_online;

