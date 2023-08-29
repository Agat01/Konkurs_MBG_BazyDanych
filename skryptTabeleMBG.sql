create table wojewodztwo(
id_wojewodztwo int not null,
nazwa varchar2(100) not null
);
ALTER TABLE wojewodztwo ADD (
  CONSTRAINT wojewodztwo_pk PRIMARY KEY (id_wojewodztwo));

CREATE SEQUENCE wojewodztwo_seq START WITH 1 increment by 1;

CREATE OR REPLACE TRIGGER wojewodztwo_on_insert 
BEFORE INSERT ON wojewodztwo 
FOR EACH ROW
BEGIN
  SELECT wojewodztwo_seq.NEXTVAL
  INTO   :new.id_wojewodztwo
  FROM   dual;
END;
/

create table powiat(
id_powiat int not null,
nazwa varchar2(100) not null,
id_wojewodztwo int not null
);
ALTER TABLE powiat ADD (
  CONSTRAINT powiat_pk PRIMARY KEY (id_powiat));

ALTER TABLE powiat
ADD CONSTRAINT powiat_wojewodztwo_fk
FOREIGN KEY (id_wojewodztwo) REFERENCES wojewodztwo(id_wojewodztwo);

CREATE SEQUENCE powiat_seq START WITH 1 increment by 1;

CREATE OR REPLACE TRIGGER powiat_on_insert 
BEFORE INSERT ON powiat
FOR EACH ROW
BEGIN
  SELECT powiat_seq.NEXTVAL
  INTO   :new.id_powiat
  FROM   dual;
END;
/

create table rodzaj(
id_rodzaj int not null,
nazwa varchar2(100) not null
);
ALTER TABLE rodzaj ADD (
  CONSTRAINT rodzaj_pk PRIMARY KEY (id_rodzaj));

create table typ_klasy(
id_typ_klasy int not null,
nazwa varchar2(150) not null,
id_rodzaj int not null
);
ALTER TABLE typ_klasy ADD (
  CONSTRAINT typ_klasy_pk PRIMARY KEY (id_typ_klasy));

ALTER TABLE typ_klasy 
ADD CONSTRAINT typ_klasy_rodzaj_fk
FOREIGN KEY (id_rodzaj) REFERENCES rodzaj(id_rodzaj);

CREATE SEQUENCE typ_klasy_seq START WITH 1 increment by 1;

CREATE OR REPLACE TRIGGER typ_klasy_on_insert 
BEFORE INSERT ON typ_klasy
FOR EACH ROW
BEGIN
  SELECT typ_klasy_seq.NEXTVAL
  INTO   :new.id_typ_klasy
  FROM   dual;
END;
/

create table szkola(
ID_SZKOLA INT NOT NULL, 
MIEJSCOWOSC VARCHAR2(100 BYTE) NOT NULL, 
NAZWA_ZESPOLU_SZKOL VARCHAR2(200 BYTE), 
NAZWA VARCHAR2(200 BYTE) NOT NULL, 
IMIENIA VARCHAR2(200 BYTE), 
NR_TEL VARCHAR2(9 BYTE) NOT NULL, 
EMAIL VARCHAR2(150 BYTE) NOT NULL, 
ID_DYREKTOR INT NOT NULL, 
ID_POWIAT INT NOT NULL, 
ULICA VARCHAR2(100 BYTE) NOT NULL, 
NR_DOMU VARCHAR2(20 BYTE) NOT NULL,
KOD_POCZTOWY VARCHAR2(6 BYTE) NOT NULL,
MIEJSCOWOSC2 VARCHAR2(100 BYTE) NOT NULL,
active char(1)
);

ALTER TABLE szkola ADD (
  CONSTRAINT szkola_pk PRIMARY KEY (id_szkola));

ALTER TABLE szkola
ADD CONSTRAINT szkola_dyrektor_fk
FOREIGN KEY (id_dyrektor) REFERENCES dyrektor(id_dyrektor);

ALTER TABLE szkola
ADD CONSTRAINT szkola_powiat_fk
FOREIGN KEY (id_powiat) REFERENCES powiat(id_powiat);

ALTER TABLE szkola
ADD CONSTRAINT szkola_typ_fk
FOREIGN KEY (id_typ_szkoly) REFERENCES typ_szkoly(id_typ_szkoly);

ALTER TABLE szkola
ADD CONSTRAINT szkola_unique UNIQUE (email);

CREATE SEQUENCE szkola_seq START WITH 101 increment by 1;

CREATE OR REPLACE TRIGGER szkola_on_insert 
BEFORE INSERT ON szkola
FOR EACH ROW
BEGIN
  SELECT szkola_seq.NEXTVAL
  INTO   :new.id_szkola
  FROM   dual;
END;
/

create table dyrektor(
id_dyrektor int not null,
tytul varchar2(100) not null,
imie varchar2(100) not null,
nazwisko varchar2(100) not null,
email varchar2(150)not null
);

ALTER TABLE dyrektor ADD (
  CONSTRAINT dyrektor_pk PRIMARY KEY (id_dyrektor));
  
ALTER TABLE dyrektor
ADD CONSTRAINT dyrektor_unique UNIQUE (email);

CREATE SEQUENCE dyrektor_seq START WITH 1 increment by 1;

CREATE OR REPLACE TRIGGER dyrektor_on_insert 
BEFORE INSERT ON dyrektor
FOR EACH ROW
BEGIN
  SELECT dyrektor_seq.NEXTVAL
  INTO   :new.id_dyrektor
  FROM   dual;
END;
/

create table nauczyciel(
id_nauczyciel int not null,
tytul varchar2(100) not null,
imie varchar2(100) not null,
nazwisko varchar2(100) not null,
email varchar2(150) not null,
id_szkola int not null,
czy_koordynuje char(3) not null,
nr_tel Varchar2(9),
komisja char(1) not null
);

ALTER TABLE nauczyciel ADD (
  CONSTRAINT nauczyciel_pk PRIMARY KEY (id_nauczyciel));

ALTER TABLE nauczyciel
ADD CONSTRAINT nauczyciel_szkola_fk
FOREIGN KEY (id_szkola) REFERENCES szkola(id_szkola);

ALTER TABLE nauczyciel
ADD CONSTRAINT nauczyciel_unique UNIQUE (email);

CREATE SEQUENCE nauczyciel_seq START WITH 5 increment by 1;

CREATE OR REPLACE TRIGGER nauczyciel_on_insert 
BEFORE INSERT ON nauczyciel
FOR EACH ROW
BEGIN
  SELECT nauczyciel_seq.NEXTVAL
  INTO   :new.id_nauczyciel
  FROM   dual;
END;
/

create table jezyk(
id_jezyk int not null,
nazwa varchar2(50) not null);

ALTER TABLE jezyk ADD (
  CONSTRAINT jezyk_pk PRIMARY KEY (id_jezyk));

CREATE SEQUENCE jezyk_seq START WITH 1 increment by 1;

CREATE OR REPLACE TRIGGER jezyk_on_insert 
BEFORE INSERT ON jezyk
FOR EACH ROW
BEGIN
  SELECT jezyk_seq.NEXTVAL
  INTO   :new.id_jezyk
  FROM   dual;
END;
/

create table klasa(
id_klasa int not null,
nazwa varchar2(50) not null,
liczba_uczniow int not null,
pref_jezyk int not null,
id_szkola int not null,
id_typ_klasy int not null,
id_nauczyciel int not null,
id_edycja int not null
);

ALTER TABLE klasa
ADD id_edycja int;

ALTER TABLE klasa ADD (
  CONSTRAINT klasa_pk PRIMARY KEY (id_klasa));

ALTER TABLE klasa
add CONSTRAINT klasa_typ_klasy_fk
FOREIGN KEY (id_typ_klasy) REFERENCES typ_klasy(id_typ_klasy);

ALTER TABLE klasa
ADD CONSTRAINT klasa_szkola_fk
FOREIGN KEY (id_szkola) REFERENCES szkola(id_szkola);

ALTER TABLE klasa
ADD CONSTRAINT klasa_nauczyciel_fk
FOREIGN KEY (id_nauczyciel) REFERENCES nauczyciel(id_nauczyciel);

ALTER TABLE klasa
ADD CONSTRAINT klasa_edycja_fk
FOREIGN KEY (id_edycja) REFERENCES edycja(id_edycja);

ALTER TABLE klasa
ADD CONSTRAINT klasa_jezyk_fk
FOREIGN KEY (pref_jezyk) REFERENCES jezyk(id_jezyk);

CREATE SEQUENCE klasa_seq START WITH 101 increment by 1;

CREATE OR REPLACE TRIGGER klasa_on_insert 
BEFORE INSERT ON klasa
FOR EACH ROW
BEGIN
  SELECT klasa_seq.NEXTVAL
  INTO   :new.id_klasa
  FROM   dual;
END;
/
create table rola(
id_rola int not null,
nazwa varchar2(100) not null
);
ALTER TABLE rola ADD (
  CONSTRAINT rola PRIMARY KEY (id_rola));

CREATE SEQUENCE rola_seq START WITH 1 increment by 1;

CREATE OR REPLACE TRIGGER rola_before_insert 
BEFORE INSERT ON rola
FOR EACH ROW
BEGIN
  SELECT rola_seq.NEXTVAL
  INTO   :new.id_rola
  FROM   dual;
END;
/
CREATE TABLE uzytkownik(
id_uzytkownik int not null,
nazwa_uzytkownika varchar2(150) not null,
haslo varchar2(200) not null
);
ALTER TABLE uzytkownik 
MODIFY nazwa_uzytkownika varchar2(150);

ALTER TABLE uzytkownik ADD (
  CONSTRAINT uzytkownik PRIMARY KEY (id_uzytkownik));

ALTER TABLE uzytkownik
ADD CONSTRAINT uzytkownik_nauczyciel_fk
FOREIGN KEY (nazwa_uzytkownika) 
REFERENCES nauczyciel(email);

ALTER TABLE uzytkownik
DROP CONSTRAINT uzytkownik_nauczyciel_fk;

ALTER TABLE uzytkownik
add CONSTRAINT uzytkownik_unique UNIQUE (nazwa_uzytkownika);

CREATE SEQUENCE uzytkownik_seq START WITH 1 increment by 1;

CREATE OR REPLACE TRIGGER uzytkownik_before_insert 
BEFORE INSERT ON uzytkownik
FOR EACH ROW
BEGIN
  SELECT uzytkownik_seq.NEXTVAL
  INTO   :new.id_uzytkownik
  FROM   dual;
END;
/

create table uzytkownik_rola(
id_uzytkownik_rola int not null,
id_uzytkownik int not null,
id_rola int not null
);
ALTER TABLE uzytkownik_rola ADD (
  CONSTRAINT uzytkownik_rola_pk PRIMARY KEY (id_uzytkownik_rola));

CREATE SEQUENCE uzytkownik_rola_seq START WITH 1 increment by 1;

CREATE OR REPLACE TRIGGER uzytkownik_rola_before_insert 
BEFORE INSERT ON uzytkownik_rola
FOR EACH ROW
BEGIN
  SELECT uzytkownik_rola_seq.NEXTVAL
  INTO   :new.id_uzytkownik_rola
  FROM   dual;
END;
/
ALTER TABLE uzytkownik_rola
ADD CONSTRAINT uzytkownik_rola_uzytkownik_fk
FOREIGN KEY (id_uzytkownik) REFERENCES uzytkownik(id_uzytkownik);

ALTER TABLE uzytkownik_rola
ADD CONSTRAINT uzytkownik_rola_rola_fk
FOREIGN KEY (id_rola) REFERENCES rola(id_rola);



create table zadanie(
id_zadanie int not null,
zadanie varchar2(100) not null,
max_liczba_pkt int not null
);
ALTER TABLE zadanie ADD (
CONSTRAINT zadanie PRIMARY KEY (id_zadanie));

CREATE SEQUENCE zadanie_seq START WITH 1 increment by 1;

CREATE OR REPLACE TRIGGER zadanie_on_insert 
BEFORE INSERT ON zadanie
FOR EACH ROW
BEGIN
  SELECT zadanie_seq.NEXTVAL
  INTO   :new.id_zadanie
  FROM   dual;
END;
/

create table wynik(
id_wynik int not null,
wynik int,
id_zadanie int not null,
id_klasa int not null
);
ALTER TABLE wynik ADD (
CONSTRAINT wynik PRIMARY KEY (id_wynik));

ALTER TABLE wynik
ADD CONSTRAINT wynik_zadanie_fk
FOREIGN KEY (id_zadanie) REFERENCES zadanie(id_zadanie);

ALTER TABLE wynik
ADD CONSTRAINT wynik_klasa_fk
FOREIGN KEY (id_klasa) REFERENCES klasa(id_klasa);

CREATE SEQUENCE wynik_seq START WITH 1 increment by 1;

CREATE OR REPLACE TRIGGER wynik_on_insert 
BEFORE INSERT ON wynik
FOR EACH ROW
BEGIN
  SELECT wynik_seq.NEXTVAL
  INTO   :new.id_wynik
  FROM   dual;
END;
/

create table region(
id_region int not null,
nazwa varchar2(200) not null
);
ALTER TABLE region ADD (
  CONSTRAINT region_pk PRIMARY KEY (id_region));

CREATE SEQUENCE region_seq START WITH 1 increment by 1;

CREATE OR REPLACE TRIGGER region_on_insert 
BEFORE INSERT ON region
FOR EACH ROW
BEGIN
  SELECT region_seq.NEXTVAL
  INTO   :new.id_region
  FROM   dual;
END;
/

create table klasa_region(
id_klasa_region int not null,
id_klasa int not null,
id_region int not null
);
ALTER TABLE klasa_region ADD (
CONSTRAINT klasa_region_pk PRIMARY KEY (id_klasa_region));

ALTER TABLE klasa_region
ADD CONSTRAINT klasa_region_klasa_fk
FOREIGN KEY (id_klasa) REFERENCES klasa(id_klasa);

ALTER TABLE klasa_region
ADD CONSTRAINT klasa_region_region_fk
FOREIGN KEY (id_region) REFERENCES region(id_region);

CREATE SEQUENCE klasa_region_seq START WITH 1 increment by 1;

CREATE OR REPLACE TRIGGER klasa_region_on_insert 
BEFORE INSERT ON klasa_region
FOR EACH ROW
BEGIN
  SELECT klasa_region_seq.NEXTVAL
  INTO   :new.id_klasa_region
  FROM   dual;
END;
/

CREATE TABLE edycja (
  id_edycja INT NOT NULL,
  nazwa VARCHAR(255) NOT NULL,
  url VARCHAR(255) NOT NULL,
  active char(1) NOT NULL
);

ALTER TABLE edycja
ADD active char(1) NOT NULL;

ALTER TABLE edycja
ADD wszystkieWyniki char(1);

ALTER TABLE edycja ADD (
CONSTRAINT edycja_pk PRIMARY KEY (id_edycja));
CREATE SEQUENCE edycja_seq START WITH 1 increment by 1;

CREATE OR REPLACE TRIGGER edycja_on_insert 
BEFORE INSERT ON edycja
FOR EACH ROW
BEGIN
  SELECT edycja_seq.NEXTVAL
  INTO   :new.id_edycja
  FROM   dual;
END;
/