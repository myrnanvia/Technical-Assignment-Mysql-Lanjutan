CREATE DATABASE skilvulbookstore;
USE skilvulbookstore;

CREATE TABLE penerbit 
( id INT(10) NOT NULL AUTO_INCREMENT, 
  nama VARCHAR(50),
  kota VARCHAR(50),
  PRIMARY KEY (id));
  
CREATE TABLE penulis 
( id INT(10) NOT NULL AUTO_INCREMENT, 
  nama VARCHAR(50),
  kota VARCHAR(50),
  PRIMARY KEY (id));  
	
CREATE TABLE buku 
( id INT(10) NOT NULL AUTO_INCREMENT, 
  ISBN VARCHAR(50),
  judul VARCHAR(50),
  penulis VARCHAR(50),
  penerbit INT(10),
  harga INT(10),
  stock INT(10),
  PRIMARY KEY (id),
  CONSTRAINT penulis FOREIGN KEY (`penulis`) REFERENCES `penulis` (`id`),
  CONSTRAINT penerbit FOREIGN KEY (`penerbit`) REFERENCES `penerbit` (`id`)
  ); 
  
INSERT INTO penerbit VALUES ('PB0879', 'Demarg', 'Pekanbaru');
INSERT INTO penerbit VALUES ('PB0652', 'Elang', 'Bukittinggi');
INSERT INTO penerbit VALUES ('PB0343', 'Usagi', 'Surabaya');

INSERT INTO penulis VALUES ('PN033', 'Tono Sudirjo', 'Malang');
INSERT INTO penulis VALUES ('PN025', 'Arisu', 'Surabaya');
INSERT INTO penulis VALUES ('PN005', 'Milhia', 'Jakarta');

INSERT INTO buku VALUES ('BK5685', '9786028519939', 'Jenis-jenis Buku', 'PN025', 'PB0879', 50000, 155);
INSERT INTO buku VALUES ('BK6583', '9782624157827', 'Mencari Judul', 'PN033', 'PB0652', 89000, 50);
INSERT INTO buku VALUES ('BK2326', '9762846172156', 'Baca Dong', 'PN005', 'PB0343', 105000, 45);

SELECT buku.judul, buku.penulis, penerbit.id FROM buku INNER JOIN penerbit ON buku.penerbit = penerbit.id;

SELECT buku.judul, buku.penulis, penerbit.id FROM buku LEFT JOIN penerbit USING (id);

SELECT buku.judul, buku.penulis, penerbit.id FROM buku RIGHT JOIN penerbit USING (id);
  
SELECT MAX(harga) FROM buku WHERE stock < 10;

SELECT MIN(harga) FROM buku;

SELECT COUNT(*) FROM buku WHERE harga < 100000;
  