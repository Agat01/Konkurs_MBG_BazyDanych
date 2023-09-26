select d.tytul, d.imie, d.nazwisko, sz.miejscowosc2, sz.nazwa_zespolu_szkol,
sz.nazwa, sz.imienia,sz.nr_tel,sz.email,p.nazwa,t.nazwa,sz.ulica, sz.nr_domu,
sz.kod_pocztowy, sz.miejscowosc2,n.tytul,n.imie,n.nazwisko,n.email, k.nazwa,
k.liczba_uczniow, j.nazwa
from dyrektor d join szkola sz on(sz.id_dyrektor = d.id_dyrektor)
                join nauczyciel n on(n.id_szkola=sz.id_szkola)
                join powiat p on(p.id_powiat=sz.id_powiat)
                join klasa k on(k.id_szkola=sz.id_szkola)
                join typ_klasy t on(t.id_typ_klasy=k.id_typ_klasy)
                join jezyk j on(j.id_jezyk=k.pref_jezyk)
where n.email='2';

select sz.nazwa_zespolu_szkol, sz.nazwa, sz.imienia, sz.nr_tel, sz.email, w.nazwa, 
p.nazwa, sz.miejscowosc, sz.ulica, sz.nr_domu, sz.kod_pocztowy, sz.miejscowosc2, 
d.tytul, d.imie, d.nazwisko, n1.tytul, n1.imie, n1.nazwisko, n1.email
from szkola sz join dyrektor d on(d.id_dyrektor = sz.id_dyrektor)
             join nauczyciel n1 on(n1.id_szkola=sz.id_szkola)
             join powiat p on(p.id_powiat=sz.id_powiat)
             join wojewodztwo w on(w.id_wojewodztwo=p.id_wojewodztwo)
where n1.czy_koordynuje=1 and n1.email='2';

select sz.nazwa_zespolu_szkol, sz.nazwa, sz.imienia, sz.nr_tel, sz.email, w.nazwa,
p.nazwa, sz.miejscowosc, sz.ulica, sz.nr_domu, sz.kod_pocztowy, sz.miejscowosc2, d.tytul, 
d.imie, d.nazwisko, n1.tytul, n1.imie, n1.nazwisko, n1.email
from szkola sz join dyrektor d on(d.id_dyrektor = sz.id_dyrektor)
             join nauczyciel n1 on(n1.id_szkola=sz.id_szkola)
             join powiat p on(p.id_powiat=sz.id_powiat)
             join wojewodztwo w on(w.id_wojewodztwo=p.id_wojewodztwo)
where n1.email='2';

select t.nazwa, k.nazwa, k.liczba_uczniow, j.nazwa, n.tytul,n.imie, n.nazwisko
from klasa k join szkola sz on(k.id_szkola=sz.id_szkola)
             join nauczyciel n on (n.id_nauczyciel=k.id_nauczyciel)
             join typ_klasy t on(t.id_typ_klasy=k.id_typ_klasy)
             join jezyk j on(j.id_jezyk=k.pref_jezyk)
where n.czy_koordynuje=0 and id_szkola=102;

select sz.nazwa_zespolu_szkol, sz.nazwa, sz.imienia
from szkola sz join nauczyciel n1 on(n1.id_szkola=sz.id_szkola)
where n1.czy_koordynuje=1; 

-- wyniki 
select k.id_klasa, k.nazwa, sum(wynik), sum(z.max_liczba_pkt) 
from wynik w join zadanie z on(w.id_zadanie=z.id_zadanie)
             join klasa k on(w.id_klasa=k.id_klasa)
group by k.id_klasa,k.nazwa;

--
select p.nazwa, sz.miejscowosc,sz.nazwa, sz.id_szkola,k.nazwa as nazwaKlasy,k.id_klasa 
from klasa k join szkola sz on(k.id_szkola=sz.id_szkola)
             join powiat p on(p.id_powiat=sz.id_powiat)
             join typ_klasy t on(t.id_typ_klasy=k.id_typ_klasy)
where p.nazwa='Zielona G鏎a';

-- 
select count(DISTINCT sz.id_szkola) 
from szkola sz join powiat p on(sz.id_powiat=p.id_powiat)
join klasa k on(k.id_szkola=sz.id_szkola)
where id_wojewodztwo=4 and (k.id_typ_klasy=1 or k.id_typ_klasy=2);

select count(k.id_klasa) 
from szkola sz join powiat p on(sz.id_powiat=p.id_powiat)
join klasa k on(k.id_szkola=sz.id_szkola)
where id_wojewodztwo=4 and (k.id_typ_klasy=1 or k.id_typ_klasy=2);

select sum(k.liczba_uczniow)
from szkola sz join powiat p on(sz.id_powiat=p.id_powiat)
join klasa k on(k.id_szkola=sz.id_szkola)
where id_wojewodztwo=4 and (k.id_typ_klasy=1 or k.id_typ_klasy=2);

select count(DISTINCT sz.id_szkola)  
from szkola sz join powiat p on(sz.id_powiat=p.id_powiat)
join klasa k on(k.id_szkola=sz.id_szkola)
where id_wojewodztwo=4 and k.id_typ_klasy=3;

select count(k.id_klasa)  
from szkola sz join powiat p on(sz.id_powiat=p.id_powiat)
join klasa k on(k.id_szkola=sz.id_szkola)
where id_wojewodztwo=4 and k.id_typ_klasy=3;

select count(DISTINCT sz.id_szkola) 
from szkola sz join powiat p on(sz.id_powiat=p.id_powiat)
join klasa k on(k.id_szkola=sz.id_szkola)
where id_wojewodztwo=4 and (k.id_typ_klasy=4 or k.id_typ_klasy=5);

select count(k.id_klasa) 
from szkola sz join powiat p on(sz.id_powiat=p.id_powiat)
join klasa k on(k.id_szkola=sz.id_szkola)
where id_wojewodztwo=4 and (k.id_typ_klasy=4 or k.id_typ_klasy=5);

select sz.nazwa, k.id_klasa,k.nazwa, sum(wynik) 
from wynik w join klasa k on(w.id_klasa=k.id_klasa)
            join szkola sz on(sz.id_szkola=k.id_szkola)
            join powiat p on(sz.id_powiat=p.id_powiat)
where p.id_wojewodztwo=1 and (k.id_typ_klasy=1 or k.id_typ_klasy=2)
group by k.id_klasa,k.nazwa,sz.nazwa
order by sum(wynik) desc;

select sz.nazwa, k.id_klasa,k.nazwa, sum(wynik) 
from wynik w join klasa k on(w.id_klasa=k.id_klasa)
            join szkola sz on(sz.id_szkola=k.id_szkola)
            join powiat p on(sz.id_powiat=p.id_powiat)
where p.id_wojewodztwo=1 and k.id_typ_klasy=3
group by k.id_klasa,k.nazwa,sz.nazwa
order by sum(wynik) desc;

select count(distinct k.id_klasa),sz.nazwa,sz.miejscowosc, k.id_klasa,k.nazwa, k.liczba_uczniow,n.tytul || ' ' || n.imie || ' ' || n.nazwisko, sum(wynik)
from wynik w join klasa k on(w.id_klasa=k.id_klasa)
            join szkola sz on(sz.id_szkola=k.id_szkola)
            join powiat p on(sz.id_powiat=p.id_powiat)
            join nauczyciel n on(n.id_nauczyciel=k.id_nauczyciel)
where p.id_wojewodztwo=1 and (k.id_typ_klasy=1 or k.id_typ_klasy=2) and n.czy_koordynuje=0
group by k.id_klasa,k.nazwa,sz.nazwa,sz.miejscowosc,k.id_klasa,k.nazwa, k.liczba_uczniow,n.tytul, n.imie,n.nazwisko
order by sum(wynik) desc;

select k.id_klasa,k.nazwa,w.id_zadanie, sum(wynik)/count(z.id_zadanie) 
from wynik w join klasa k on(w.id_klasa=k.id_klasa)
            join szkola sz on(sz.id_szkola=k.id_szkola)
            join powiat p on(sz.id_powiat=p.id_powiat)
            join nauczyciel n on(n.id_nauczyciel=k.id_nauczyciel)
            join zadanie z on(z.id_zadanie=w.id_zadanie)
where p.id_wojewodztwo=4 and n.czy_koordynuje=0 and (k.id_typ_klasy=1 or k.id_typ_klasy=2)
group by k.id_klasa,k.nazwa,w.id_zadanie
order by sum(wynik) desc;
-- do wynikow
select k.id_klasa,k.nazwa, sum(wynik)/count(z.id_zadanie) 
from wynik w join klasa k on(w.id_klasa=k.id_klasa)
            join szkola sz on(sz.id_szkola=k.id_szkola)
            join powiat p on(sz.id_powiat=p.id_powiat)
            join nauczyciel n on(n.id_nauczyciel=k.id_nauczyciel)
            join zadanie z on(z.id_zadanie=w.id_zadanie)
where p.id_wojewodztwo=4 and n.czy_koordynuje=0 and (k.id_typ_klasy=1 or k.id_typ_klasy=2)
group by k.id_klasa,k.nazwa
order by sum(wynik) desc;

select distinct sz.id_szkola,sz.nazwa || ', ' || sz.miejscowosc
from szkola sz join klasa k on(k.id_szkola=sz.id_szkola)
               join klasa_region kr on(k.id_klasa=kr.id_klasa)
               join region r on(r.id_region=kr.id_region)
where r.nazwa='region dolno零ko-opolski';

select r.nazwa 
from uzytkownik_rola ur join uzytkownik u on(ur.id_uzytkownik=u.id_uzytkownik)
                        join rola r on(r.id_rola=ur.id_rola)
where u.nazwa_uzytkownika='2';

select p.id_powiat, p.id_wojewodztwo,w.nazwa, k.id_klasa
from powiat p join wojewodztwo w on(p.id_wojewodztwo=w.id_wojewodztwo)
              join szkola sz on(sz.id_powiat=p.id_powiat)
              join klasa k on(k.id_szkola=sz.id_szkola)
where (w.nazwa='dolno零kie' or w.nazwa='opolskie') and (k.id_typ_klasy=1 or k.id_typ_klasy=2);

insert into klasa_region(id_klasa,id_region)
select k.id_klasa, 1
from powiat p join wojewodztwo w on(p.id_wojewodztwo=w.id_wojewodztwo)
              join szkola sz on(sz.id_powiat=p.id_powiat)
              join klasa k on(k.id_szkola=sz.id_szkola)
where (w.nazwa='dolno零kie' or w.nazwa='opolskie');

insert into klasa_region(id_klasa,id_region)
select k.id_klasa, 2
from powiat p join wojewodztwo w on(p.id_wojewodztwo=w.id_wojewodztwo)
              join szkola sz on(sz.id_powiat=p.id_powiat)
              join klasa k on(k.id_szkola=sz.id_szkola)
where (w.nazwa='kujawsko-pomorskie');

insert into klasa_region(id_klasa,id_region)
select k.id_klasa, 3
from powiat p join wojewodztwo w on(p.id_wojewodztwo=w.id_wojewodztwo)
              join szkola sz on(sz.id_powiat=p.id_powiat)
              join klasa k on(k.id_szkola=sz.id_szkola)
where (w.nazwa='lubuskie' or w.nazwa='zachodniopomorskie');

insert into klasa_region(id_klasa,id_region)
select k.id_klasa, 4
from powiat p join wojewodztwo w on(p.id_wojewodztwo=w.id_wojewodztwo)
              join szkola sz on(sz.id_powiat=p.id_powiat)
              join klasa k on(k.id_szkola=sz.id_szkola)
where w.nazwa='ma這polskie' and (k.id_typ_klasy=1 or k.id_typ_klasy=2);

insert into klasa_region(id_klasa,id_region)
select k.id_klasa, 5
from powiat p join wojewodztwo w on(p.id_wojewodztwo=w.id_wojewodztwo)
              join szkola sz on(sz.id_powiat=p.id_powiat)
              join klasa k on(k.id_szkola=sz.id_szkola)
where w.nazwa='ma這polskie' and (k.id_typ_klasy=3 or k.id_typ_klasy=4 or k.id_typ_klasy=5);

insert into klasa_region(id_klasa,id_region)
select k.id_klasa, 6
from powiat p join wojewodztwo w on(p.id_wojewodztwo=w.id_wojewodztwo)
              join szkola sz on(sz.id_powiat=p.id_powiat)
              join klasa k on(k.id_szkola=sz.id_szkola)
where (w.nazwa='mazowiecki');

insert into klasa_region(id_klasa,id_region)
select k.id_klasa, 7
from powiat p join wojewodztwo w on(p.id_wojewodztwo=w.id_wojewodztwo)
              join szkola sz on(sz.id_powiat=p.id_powiat)
              join klasa k on(k.id_szkola=sz.id_szkola)
where (w.nazwa='podkarpackie');

insert into klasa_region(id_klasa,id_region)
select k.id_klasa, 8
from powiat p join wojewodztwo w on(p.id_wojewodztwo=w.id_wojewodztwo)
              join szkola sz on(sz.id_powiat=p.id_powiat)
              join klasa k on(k.id_szkola=sz.id_szkola)
where w.nazwa='podlaskie' and (k.id_typ_klasy=3 or k.id_typ_klasy=4 or k.id_typ_klasy=5);


insert into klasa_region(id_klasa,id_region)
select k.id_klasa, 9
from powiat p join wojewodztwo w on(p.id_wojewodztwo=w.id_wojewodztwo)
              join szkola sz on(sz.id_powiat=p.id_powiat)
              join klasa k on(k.id_szkola=sz.id_szkola)
where w.nazwa='pomorskie' and (k.id_typ_klasy=1 or k.id_typ_klasy=2);

insert into klasa_region(id_klasa,id_region)
select k.id_klasa, 10
from powiat p join wojewodztwo w on(p.id_wojewodztwo=w.id_wojewodztwo)
              join szkola sz on(sz.id_powiat=p.id_powiat)
              join klasa k on(k.id_szkola=sz.id_szkola)
where w.nazwa='pomorskie' and (k.id_typ_klasy=3 or k.id_typ_klasy=4 or k.id_typ_klasy=5);

insert into klasa_region(id_klasa,id_region)
select k.id_klasa, 11
from powiat p join wojewodztwo w on(p.id_wojewodztwo=w.id_wojewodztwo)
              join szkola sz on(sz.id_powiat=p.id_powiat)
              join klasa k on(k.id_szkola=sz.id_szkola)
where (w.nazwa='零kie');

insert into klasa_region(id_klasa,id_region)
select k.id_klasa, 12
from powiat p join wojewodztwo w on(p.id_wojewodztwo=w.id_wojewodztwo)
              join szkola sz on(sz.id_powiat=p.id_powiat)
              join klasa k on(k.id_szkola=sz.id_szkola)
where w.nazwa='wielkopolskie' and (k.id_typ_klasy=1 or k.id_typ_klasy=2);

insert into klasa_region(id_klasa,id_region)
select k.id_klasa, 13
from powiat p join wojewodztwo w on(p.id_wojewodztwo=w.id_wojewodztwo)
              join szkola sz on(sz.id_powiat=p.id_powiat)
              join klasa k on(k.id_szkola=sz.id_szkola)
where w.nazwa='wielkopolskie' and (k.id_typ_klasy=3 or k.id_typ_klasy=4 or k.id_typ_klasy=5);

insert into klasa_region(id_klasa,id_region)
select k.id_klasa,14
from klasa k join szkola sz on(k.id_szkola=sz.id_szkola)
            join powiat p on(sz.id_powiat=p.id_powiat)
            join wojewodztwo w on(p.id_wojewodztwo=w.id_wojewodztwo)
where k.id_klasa not in(select kr.id_klasa from klasa_region kr);


select sz.id_szkola, sz.nazwa || ', ' || sz.miejscowosc
from szkola sz join klasa k on(k.id_szkola=sz.id_szkola)
               join klasa_region kr on(k.id_klasa=kr.id_klasa)
               join region r on(r.id_region=kr.id_region)
where r.id_region=3
group by sz.id_szkola, sz.nazwa, sz.miejscowosc;

select k.id_klasa, sum(wynik), kr.id_region 
from wynik w join klasa k on(w.id_klasa=k.id_klasa)
            join szkola sz on(sz.id_szkola=k.id_szkola)
            join klasa_region kr on(kr.id_klasa=k.id_klasa)
            join region r on(kr.id_region=r.id_region)
            join nauczyciel n on(n.id_nauczyciel=k.id_nauczyciel)
where kr.id_region=1 and (k.id_typ_klasy=1 or k.id_typ_klasy=2) and n.czy_koordynuje=0
group by k.id_klasa,kr.id_region
order by sum(wynik) desc;

select k.id_klasa || ', ' || k.nazwa || ': ' || k.id_szkola || ', ' || sz.nazwa || ', ' || miejscowosc
from klasa k join szkola sz on(k.id_szkola=sz.id_szkola)
           left join klasa_region kr on(kr.id_klasa=k.id_klasa)
where kr.id_klasa is not null
order by k.id_klasa;

select k.id_klasa || ', ' || k.nazwa || ': ' || k.id_szkola || ', ' || sz.nazwa || ', ' || miejscowosc
from klasa k join szkola sz on(k.id_szkola=sz.id_szkola)
           left join klasa_region kr on(kr.id_klasa=k.id_klasa)
           left join wynik w on(w.id_klasa=k.id_klasa)
where w.id_klasa is null
order by k.id_klasa;

SELECT k.id_klasa, z.id_zadanie, z.zadanie, z.max_liczba_pkt
FROM klasa k
CROSS JOIN zadanie z
LEFT JOIN wynik w ON k.id_klasa = w.id_klasa AND z.id_zadanie = w.id_zadanie
WHERE w.id_wynik IS NULL and z.id_typ_klasy=k.id_typ_klasy and k.id_klasa=688;

SELECT k.id_klasa, z.id_zadanie, z.zadanie, z.max_liczba_pkt
FROM klasa k LEFT JOIN wynik w on (k.id_klasa = w.id_klasa)
right JOIN zadanie z on (z.id_zadanie = w.id_zadanie)
WHERE w.id_wynik IS NULL;

select TO_CHAR(ROUND(avg(wynik), 2))
from szkola sz join powiat p on(sz.id_powiat=p.id_powiat)
join klasa k on(k.id_szkola=sz.id_szkola)
join edycja e on(e.id_edycja=k.id_edycja)
join wynik w on(w.id_klasa=k.id_klasa)
where id_wojewodztwo=1 and e.nazwa='Edycja XXXIII (21/22)';

select max(wynik)
from szkola sz join powiat p on(sz.id_powiat=p.id_powiat)
join klasa k on(k.id_szkola=sz.id_szkola)
join edycja e on(e.id_edycja=k.id_edycja)
join wynik w on(w.id_klasa=k.id_klasa)
where id_wojewodztwo=2 and (k.id_typ_klasy=1 or k.id_typ_klasy=2) and e.nazwa='Edycja XXXIII (21/22)';

select k.id_typ_klasy, k.id_klasa, count(k.id_klasa), wynik
from szkola sz join powiat p on(sz.id_powiat=p.id_powiat)
join klasa k on(k.id_szkola=sz.id_szkola)
join edycja e on(e.id_edycja=k.id_edycja)
join wynik w on(w.id_klasa=k.id_klasa)
join zadanie z on(z.id_zadanie=w.id_zadanie)
group by k.id_typ_klasy, k.id_klasa, wynik;

update wynik w
set id_zadanie=(select id_zadanie from zadanie
                where id_typ_klasy=5)
WHERE EXISTS (
    SELECT 1
    FROM klasa k
    WHERE k.id_klasa = w.id_klasa
        AND k.id_typ_klasy = 5
);

update klasa
set id_edycja=16;

select n.email || ', ' || k.id_klasa || ', ' || k.nazwa || ', ' || sz.id_szkola || ', ' || sz.nazwa || ', ' || miejscowosc 
from nauczyciel n join szkola sz on(sz.id_szkola=n.id_szkola)
                join klasa k on(k.id_szkola=sz.id_szkola)          
where n.czy_koordynuje=1 and k.id_typ_klasy=1;

select r.nazwa
from uzytkownik_rola ur join rola r on(ur.id_rola=r.id_rola)
join uzytkownik u on(u.id_uzytkownik=ur.id_uzytkownik)
where nazwa_uzytkownika='moderator';

select n.email || ', ' || k.id_klasa || ', ' || k.nazwa || ', ' || sz.id_szkola || ', ' || sz.nazwa || ', ' || miejscowosc
from nauczyciel n join szkola sz on(sz.id_szkola=n.id_szkola)
                join klasa k on(k.id_szkola=sz.id_szkola)
where n.czy_koordynuje=1 and k.id_typ_klasy=1;

select sz.nazwa_zespolu_szkol, sz.nazwa, sz.imienia, sz.nr_tel, sz.email, w.nazwa,
p.nazwa, sz.miejscowosc, sz.ulica, sz.nr_domu, sz.kod_pocztowy, sz.miejscowosc2, d.tytul, 
d.imie, d.nazwisko, n1.tytul, n1.imie, n1.nazwisko, n1.email, sz.id_szkola 
from szkola sz join dyrektor d on(d.id_dyrektor = sz.id_dyrektor)
join nauczyciel n1 on(n1.id_szkola=sz.id_szkola)
join powiat p on(p.id_powiat=sz.id_powiat)
join wojewodztwo w on(w.id_wojewodztwo=p.id_wojewodztwo)
where n1.email='x8@gmail.com';

select nazwa, adres1,ulica,nr_domu,kod_pocztowy,miejscowosc,z_dopiskiem
from region
where id_region=1;

select COUNT(*),sz.id_szkola,sz.nazwa,sz.imienia,sz.miejscowosc,sz.id_szkola
from klasa k join szkola sz on(k.id_szkola=sz.id_szkola)
			join powiat p on(p.id_powiat=sz.id_powiat)
			join wojewodztwo w on(w.id_wojewodztwo=p.id_wojewodztwo)
			join edycja e on(e.id_edycja=k.id_edycja)
where (k.id_typ_klasy=1 or k.id_typ_klasy=2) and e.nazwa='Edycja XXXIII (21/22)'
group by sz.nazwa,sz.imienia,sz.miejscowosc,sz.id_szkola 
order by sz.miejscowosc;

select k.nazwa,j.nazwa, n.tytul,n.imie,n.nazwisko 
from klasa k join szkola sz on(k.id_szkola=sz.id_szkola)
join powiat p on(p.id_powiat=sz.id_powiat)
join wojewodztwo w on(w.id_wojewodztwo=p.id_wojewodztwo)
join typ_klasy t on(t.id_typ_klasy=k.id_typ_klasy)
join nauczyciel n on(n.id_nauczyciel=k.id_nauczyciel)
join jezyk j on(j.id_jezyk=k.pref_jezyk)
join edycja e on(e.id_edycja=k.id_edycja)
where (k.id_typ_klasy=1 or k.id_typ_klasy=2) and k.id_szkola=113 and e.nazwa='Edycja XXXIII (21/22)';

select k.id_klasa || ', ' || k.nazwa || ': ' || k.id_szkola || ', ' || sz.nazwa || ', ' || miejscowosc 
from klasa k join szkola sz on(k.id_szkola=sz.id_szkola)
           left join klasa_region kr on(kr.id_klasa=k.id_klasa)
where kr.id_klasa is null
order by k.id_klasa;

select sz.id_szkola || ', ' || k.nazwa || ', ' || miejscowosc 
from szkola sz join klasa k on(sz.id_szkola=k.id_szkola)
where id_edycja=16;

SELECT id_edycja FROM edycja WHERE id_edycja = (SELECT MAX(id_edycja) FROM edycja);
