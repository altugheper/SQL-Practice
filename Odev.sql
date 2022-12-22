-- 1-) Tablo 1’de görüldüğü gibi hastaneler adında bir tablo oluşturunuz. - id sütunu primary key yapılmalı.
CREATE TABLE hastaneler(
id varchar(10) PRIMARY KEY,
isim varchar(30),
sehir varchar(30),
ozel char(5)
);
SELECT * FROM hastaneler;

INSERT INTO hastaneler VALUES ('H101','ACI BADEM HASTANESI','ISTANBUL','Y');
INSERT INTO hastaneler VALUES ('H102','HASZEKI HASTANESI','ISTANBUL','N');
INSERT INTO hastaneler VALUES ('H103','MEDIKOL HASTANESI','IZMIR','Y');
INSERT INTO hastaneler VALUES ('H104','NEMORYIL HASTANESI','ANKARA','Y');


-- Tablo 2’de görüldüğü gibi hastalar adında bir tablo oluşturunuz. - Kimlik_no sütunu primary key yapılmalı.
CREATE TABLE hastalar(
kimlik_no varchar(15) PRIMARY KEY,
isim varchar(30),
teshis varchar(40)
);
SELECT * FROM hastalar;

INSERT INTO hastalar VALUES('12345678901','Ali Can','Gizli Seker');
INSERT INTO hastalar VALUES('45678901121','Ayse Yilmaz','Hipertansiyon');
INSERT INTO hastalar VALUES('78901123451','Steve Job','Pankreatit');
INSERT INTO hastalar VALUES('12344321251','Tom Hanks','COVID19');


-- Tablo 3’de görüldüğü gibi bolumler adında bir tablo oluşturunuz. - bolum_id sütunu primary key yapılmalı.
CREATE TABLE bolumler(
bolum_id char(10) PRIMARY KEY,
bolum_adi varchar(25)
);
SELECT * FROM bolumler;

INSERT INTO bolumler VALUES('DHL','Dahiliye');
INSERT INTO bolumler VALUES('KBB','Kulak-Burun-Bogaz');
INSERT INTO bolumler VALUES('NRJ','Noroloji');
INSERT INTO bolumler VALUES('GAST','Gastoroloji');
INSERT INTO bolumler VALUES('KARD','Kardioloji');
INSERT INTO bolumler VALUES('PSK','Psikiyatr');
INSERT INTO bolumler VALUES('GOZ','Goz Hastaliklari');


-- 4-) Tablo 4’de görüldüğü gibi hasta_kayıtlar adında bir tablo oluşturunuz. - kimlik_no sütunu primary key yapılmalı.
CREATE TABLE hasta_kayitlar(
kimlik_no varchar(25) PRIMARY KEY,
hast_isim varchar(30),
hastane_adi varchar(30),
bolum_adi varchar(30),
teshis varchar(30)
);
SELECT * FROM hasta_kayitlar;

INSERT INTO hasta_kayitlar(kimlik_no,hast_isim) VALUES('1111','NONAME');
INSERT INTO hasta_kayitlar(kimlik_no,hast_isim) VALUES('2222','NONAME');
INSERT INTO hasta_kayitlar(kimlik_no,hast_isim) VALUES('3333','NONAME');


-- 5-) hasta_kayıtlar tablosundaki ‘3333’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz.
/*
hasta_isim : ‘Salvadore Dali’ ismi ile
hastane_adi: ‘John Hopins’
bolum_adi: ‘Noroloji’
teshis: ‘Parkinson’
kimlik_no: ‘99991111222’
*/
UPDATE hasta_kayitlar SET hast_isim='Salvador Dali',hastane_adi='John Hopins',bolum_adi='Noroloji',teshis='Parkinson',kimlik_no=99991111222 WHERE kimlik_no='3333';


-- 5-) hasta_kayıtlar tablosundaki ‘1111’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz. 
/*
hasta_isim : hastalar tablosundaki ‘Ali Can’ ismi ile
hastane_adi: hastaneler tablosundaki 'H104' bolum_id kodlu hastanenin ismi ile
bolum_adi: bolumler tablosundaki 'DHL' bolum_id kodlu bolum_adi ile
teshis: hastalar tablosundaki 'Ali Can' isimli hastanın teshis bilgisi ile

kimlik_no: hastalar tablosundaki 'Ali Can' isimli hastanın kimlik_no kodu ile
*/
UPDATE hasta_kayitlar SET 
hast_isim=(SELECT isim FROM hastalar WHERE kimlik_no='12345678901'),
hastane_adi=(SELECT isim FROM hastaneler WHERE id='H104'),
bolum_adi=(SELECT bolum_adi FROM bolumler WHERE bolum_id='DHL'),
teshis=(SELECT teshis FROM hastalar WHERE isim='Ali Can'),
kimlik_no=(SELECT kimlik_no FROM hastalar WHERE isim='Ali Can')
WHERE kimlik_no='1111';


-- 6-) hasta_kayıtlar tablosundaki ‘2222’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz. 
/*
hasta_isim : hastalar tablosundaki ‘Ayşe Yılmaz’ ismi ile
hastane_adi: hastaneler tablosundaki 'H103' bolum_id kodlu hastanenin ismi ile
bolum_adi: bolumler tablosundaki ‘KBB’ bolum_id kodlu bolum_adi ile
teshis: hastalar tablosundaki ‘Tom Hanks' isimli hastanın teshis bilgisi ile

kimlik_no: hastalar tablosundaki 'Stevev Job' isimli hastanın kimlik_no kodu ile 
*/
UPDATE hasta_kayitlar SET
hast_isim=(SELECT isim FROM hastalar WHERE kimlik_no='45678901121'),
hastane_adi=(SELECT isim FROM hastaneler WHERE id='H103'),
bolum_adi=(SELECT bolum_adi FROM bolumler WHERE bolum_id='KBB'),
teshis=(SELECT teshis FROM hastalar WHERE isim='Tom Hanks'),
kimlik_no=(SELECT kimlik_no FROM hastalar WHERE isim='Steve Job')
WHERE kimlik_no='2222';