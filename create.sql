-- Remove conflicting tables
DROP TABLE IF EXISTS adresa CASCADE;
DROP TABLE IF EXISTS dodavatel CASCADE;
DROP TABLE IF EXISTS doruceni_objednavky CASCADE;
DROP TABLE IF EXISTS objednavka CASCADE;
DROP TABLE IF EXISTS polozka CASCADE;
DROP TABLE IF EXISTS prodej CASCADE;
DROP TABLE IF EXISTS prodejna CASCADE;
DROP TABLE IF EXISTS typ_dorucovani CASCADE;
DROP TABLE IF EXISTS vyrobek CASCADE;
DROP TABLE IF EXISTS zakaznik CASCADE;
DROP TABLE IF EXISTS zamestnanec CASCADE;
-- End of removing

CREATE TABLE adresa (
    id_adresa SERIAL NOT NULL,
    mesto VARCHAR(30) NOT NULL,
    ulice VARCHAR(70) NOT NULL,
    dum INTEGER NOT NULL
);
ALTER TABLE adresa ADD CONSTRAINT pk_adresa PRIMARY KEY (id_adresa);

CREATE TABLE dodavatel (
    id_dodavatel SERIAL NOT NULL,
    id_prodejna INTEGER,
    nazev_dodavatele VARCHAR(80) NOT NULL
);
ALTER TABLE dodavatel ADD CONSTRAINT pk_dodavatel PRIMARY KEY (id_dodavatel);

CREATE TABLE doruceni_objednavky (
    id_objednavka INTEGER NOT NULL,
    id_adresa INTEGER NOT NULL,
    id_typ_dorucovani INTEGER NOT NULL,
    stav VARCHAR(25) NOT NULL,
    datum_doruceni DATE NOT NULL
);
ALTER TABLE doruceni_objednavky ADD CONSTRAINT pk_doruceni_objednavky PRIMARY KEY (id_objednavka);

CREATE TABLE objednavka (
    id_objednavka INTEGER NOT NULL,
    id_zakaznik INTEGER NOT NULL,
    stav_objednavka VARCHAR(30) NOT NULL,
    datum_objednavka DATE NOT NULL,
    mnozstvi_polozka INTEGER NOT NULL
);
ALTER TABLE objednavka ADD CONSTRAINT pk_objednavka PRIMARY KEY (id_objednavka);

CREATE TABLE polozka (
    id_polozka SERIAL NOT NULL,
    id_objednavka INTEGER NOT NULL,
    id_vyrobek INTEGER NOT NULL,
    id_prodejna INTEGER NOT NULL,
    mnozstvi INTEGER NOT NULL
);
ALTER TABLE polozka ADD CONSTRAINT pk_polozka PRIMARY KEY (id_polozka, id_objednavka);

CREATE TABLE prodej (
    id_prodej SERIAL NOT NULL,
    id_vyrobek INTEGER NOT NULL,
    id_prodejna INTEGER NOT NULL,
    id_zakaznik INTEGER NOT NULL,
    datum_prodej DATE NOT NULL,
    mnozstvi_vyrobek INTEGER NOT NULL
);
ALTER TABLE prodej ADD CONSTRAINT pk_prodej PRIMARY KEY (id_prodej);

CREATE TABLE prodejna (
    id_prodejna SERIAL NOT NULL,
    id_adresa INTEGER NOT NULL
);
ALTER TABLE prodejna ADD CONSTRAINT pk_prodejna PRIMARY KEY (id_prodejna);
ALTER TABLE prodejna ADD CONSTRAINT u_fk_prodejna_adresa UNIQUE (id_adresa);

CREATE TABLE typ_dorucovani (
    id_typ_dorucovani SERIAL NOT NULL,
    cena_typ_dorucovani INTEGER NOT NULL,
    nazev_typ VARCHAR(30) NOT NULL
);
ALTER TABLE typ_dorucovani ADD CONSTRAINT pk_typ_dorucovani PRIMARY KEY (id_typ_dorucovani);

CREATE TABLE vyrobek (
    id_vyrobek SERIAL NOT NULL,
    id_prodejna INTEGER NOT NULL,
    nazev_vyrobek VARCHAR(100) NOT NULL,
    uroven_vyrobek INTEGER NOT NULL,
    cena INTEGER NOT NULL,
    kvalita VARCHAR(20) NOT NULL
);
ALTER TABLE vyrobek ADD CONSTRAINT pk_vyrobek PRIMARY KEY (id_vyrobek, id_prodejna);

CREATE TABLE zakaznik (
    id_zakaznik SERIAL NOT NULL,
    jmeno_zakaznik VARCHAR(50) NOT NULL,
    uroven INTEGER NOT NULL,
    povolani VARCHAR(20) NOT NULL
);
ALTER TABLE zakaznik ADD CONSTRAINT pk_zakaznik PRIMARY KEY (id_zakaznik);

CREATE TABLE zamestnanec (
    id_zamestnanec SERIAL NOT NULL,
    id_adresa INTEGER NOT NULL,
    id_prodejna INTEGER NOT NULL,
    osobni_cislo INTEGER NOT NULL,
    jmeno_zamestnanec VARCHAR(50) NOT NULL,
    prijmeni VARCHAR(30) NOT NULL
);
ALTER TABLE zamestnanec ADD CONSTRAINT pk_zamestnanec PRIMARY KEY (id_zamestnanec);
ALTER TABLE zamestnanec ADD CONSTRAINT uc_zamestnanec_osobni_cislo UNIQUE (osobni_cislo);

ALTER TABLE dodavatel ADD CONSTRAINT fk_dodavatel_prodejna FOREIGN KEY (id_prodejna) REFERENCES prodejna (id_prodejna) ON DELETE CASCADE;

ALTER TABLE doruceni_objednavky ADD CONSTRAINT fk_doruceni_objednavky_objednav FOREIGN KEY (id_objednavka) REFERENCES objednavka (id_objednavka) ON DELETE CASCADE;
ALTER TABLE doruceni_objednavky ADD CONSTRAINT fk_doruceni_objednavky_adresa FOREIGN KEY (id_adresa) REFERENCES adresa (id_adresa) ON DELETE CASCADE;
ALTER TABLE doruceni_objednavky ADD CONSTRAINT fk_doruceni_objednavky_typ_doru FOREIGN KEY (id_typ_dorucovani) REFERENCES typ_dorucovani (id_typ_dorucovani) ON DELETE CASCADE;

ALTER TABLE objednavka ADD CONSTRAINT fk_objednavka_zakaznik FOREIGN KEY (id_zakaznik) REFERENCES zakaznik (id_zakaznik) ON DELETE CASCADE;

ALTER TABLE polozka ADD CONSTRAINT fk_polozka_objednavka FOREIGN KEY (id_objednavka) REFERENCES objednavka (id_objednavka) ON DELETE CASCADE;
ALTER TABLE polozka ADD CONSTRAINT fk_polozka_vyrobek FOREIGN KEY (id_vyrobek, id_prodejna) REFERENCES vyrobek (id_vyrobek, id_prodejna) ON DELETE CASCADE;

ALTER TABLE prodej ADD CONSTRAINT fk_prodej_vyrobek FOREIGN KEY (id_vyrobek, id_prodejna) REFERENCES vyrobek (id_vyrobek, id_prodejna) ON DELETE CASCADE;
ALTER TABLE prodej ADD CONSTRAINT fk_prodej_zakaznik FOREIGN KEY (id_zakaznik) REFERENCES zakaznik (id_zakaznik) ON DELETE CASCADE;

ALTER TABLE prodejna ADD CONSTRAINT fk_prodejna_adresa FOREIGN KEY (id_adresa) REFERENCES adresa (id_adresa) ON DELETE CASCADE;

ALTER TABLE vyrobek ADD CONSTRAINT fk_vyrobek_prodejna FOREIGN KEY (id_prodejna) REFERENCES prodejna (id_prodejna) ON DELETE CASCADE;

ALTER TABLE zamestnanec ADD CONSTRAINT fk_zamestnanec_adresa FOREIGN KEY (id_adresa) REFERENCES adresa (id_adresa) ON DELETE CASCADE;
ALTER TABLE zamestnanec ADD CONSTRAINT fk_zamestnanec_prodejna FOREIGN KEY (id_prodejna) REFERENCES prodejna (id_prodejna) ON DELETE CASCADE;

