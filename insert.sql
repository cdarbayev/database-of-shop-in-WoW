-- smazání všech záznamů z tabulek

CREATE or replace FUNCTION clean_tables() RETURNS void AS $$
declare
  l_stmt text;
begin
  select 'truncate ' || string_agg(format('%I.%I', schemaname, tablename) , ',')
    into l_stmt
  from pg_tables
  where schemaname in ('public');

  execute l_stmt || ' cascade';
end;
$$ LANGUAGE plpgsql;
select clean_tables();

-- reset sekvenci

CREATE or replace FUNCTION restart_sequences() RETURNS void AS $$
DECLARE
i TEXT;
BEGIN
 FOR i IN (SELECT column_default FROM information_schema.columns WHERE column_default SIMILAR TO 'nextval%')
  LOOP
         EXECUTE 'ALTER SEQUENCE'||' ' || substring(substring(i from '''[a-z_]*')from '[a-z_]+') || ' '||' RESTART 1;';
  END LOOP;
END $$ LANGUAGE plpgsql;
select restart_sequences();
-- konec resetu

-- konec mazání

insert into adresa (mesto, ulice, dum) values ('Exodar', 'Stoughton', 2558);
insert into adresa (mesto, ulice, dum) values ('Boralus', 'Northridge', 4060);
insert into adresa (mesto, ulice, dum) values ('Stormwind', 'Banding', 8595);
insert into adresa (mesto, ulice, dum) values ('Stormwind', 'Iowa', 3929);
insert into adresa (mesto, ulice, dum) values ('Stormwind', 'Spohn', 1387);
insert into adresa (mesto, ulice, dum) values ('Boralus', 'Bayside', 9402);
insert into adresa (mesto, ulice, dum) values ('Exodar', 'Donald', 4124);
insert into adresa (mesto, ulice, dum) values ('Darnassus', 'Birchwood', 8639);
insert into adresa (mesto, ulice, dum) values ('Oribos', 'Cardinal', 8031);
insert into adresa (mesto, ulice, dum) values ('Dalaran', 'Washington', 8192);
insert into adresa (mesto, ulice, dum) values ('Dalaran', 'Nancy', 6164);
insert into adresa (mesto, ulice, dum) values ('Oribos', 'School', 7617);
insert into adresa (mesto, ulice, dum) values ('Exodar', 'Blue Bill Park', 3478);
insert into adresa (mesto, ulice, dum) values ('Orgrimmar', 'Charing Cross', 7737);
insert into adresa (mesto, ulice, dum) values ('Dalaran', 'Leroy', 6056);
insert into adresa (mesto, ulice, dum) values ('Dalaran', 'Becker', 3354);
insert into adresa (mesto, ulice, dum) values ('Exodar', 'Leroy', 2);
insert into adresa (mesto, ulice, dum) values ('Dalaran', 'Hudson', 814);
insert into adresa (mesto, ulice, dum) values ('Stormwind', 'Sage', 830);
insert into adresa (mesto, ulice, dum) values ('Boralus', 'Troy', '1866');
insert into adresa (mesto, ulice, dum) values ('Orgrimmar', 'International', 6049);
insert into adresa (mesto, ulice, dum) values ('Darnassus', 'Anderson', 7);
insert into adresa (mesto, ulice, dum) values ('Dalaran', 'Eagle Crest', 59785);
insert into adresa (mesto, ulice, dum) values ('Exodar', 'Pepper Wood', 110);
insert into adresa (mesto, ulice, dum) values ('Stormwind', 'Golden Leaf', 3);

insert into typ_dorucovani (id_typ_dorucovani, cena_typ_dorucovani, nazev_typ) values (1, '0', 'vyzvednuti');
insert into typ_dorucovani (id_typ_dorucovani, cena_typ_dorucovani, nazev_typ) values (2, '50', 'dorucovani');

insert into prodejna (id_prodejna, id_adresa) values (1, 1);
insert into prodejna (id_prodejna, id_adresa) values (2, 2);
insert into prodejna (id_prodejna, id_adresa) values (3, 3);

insert into dodavatel (id_prodejna, nazev_dodavatele) values (1, 'Pacocha Inc');
insert into dodavatel (id_prodejna, nazev_dodavatele) values (2, 'Renner-Bode');
insert into dodavatel (id_prodejna, nazev_dodavatele) values (1, 'Padberg-Mayer');
insert into dodavatel (id_prodejna, nazev_dodavatele) values (1, 'Graham, Huel and Mayert');
insert into dodavatel (id_prodejna, nazev_dodavatele) values (1, 'Abshire-Herman');
insert into dodavatel (id_prodejna, nazev_dodavatele) values (3, 'Gottlieb-Bednar');
insert into dodavatel (id_prodejna, nazev_dodavatele) values (3, 'Abshire-Herman');
insert into dodavatel (id_prodejna, nazev_dodavatele) values (3, 'Torp-Nolan');
insert into dodavatel (id_prodejna, nazev_dodavatele) values (2, 'Graham, Huel and Mayert');
insert into dodavatel (id_prodejna, nazev_dodavatele) values (3, 'Beer-Simonis');
insert into dodavatel (id_prodejna, nazev_dodavatele) values (3, 'Pacocha Inc');
insert into dodavatel (id_prodejna, nazev_dodavatele) values (1, 'Beer-Simonis');

insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Kelthuzad', 3, 'mage');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Ragnaros', 27, 'warrior');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Sargeras', 30, 'archer');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Kaelthas', 80, 'paladin');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Nerzhul', 57, 'warrior');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Tyranda', 72, 'archer');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Guldan', 96, 'mage');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Mediv', 31, 'mage');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Alexstrasza', 15, 'archer');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Malfurion', 100, 'paladin');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Malganis', 72, 'archer');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Varian', 71, 'warrior');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Arthas', 100, 'warrior');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Artemida', 72, 'archer');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Jaina', 96, 'mage');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Trall', 31, 'mage');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Garrosh', 15, 'warrior');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Anduin', 99, 'paladin');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Sylvana', 72, 'archer');
insert into zakaznik (jmeno_zakaznik, uroven, povolani) values ('Illidan', 71, 'warrior');

insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Ashbringer', 99, 99999, 'legendary');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Frostmourne', 99, 99999, 'legendary');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Ring of the Dark Lord', 63, 41065, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Wand of the Frost Mage', 5, 11620, 'rare');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Spear of the Amazon Warrior', 46, 78929, 'unique');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Chalice of the Angelic Host', 96, 15730, 'rare');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Harp of the Troubadour', 83, 73194, 'unique');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Sulfuras', 92, 99926, 'legendary');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Shield of the Crusader', 76, 38849, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Tome of the Forbidden Knowledge', 14, 51629, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Stormrage', 63, 79637, 'unique');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Crown of the Storm Queen', 85, 43824, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Sword of the Fallen King', 53, 91617, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Robe of the Elemental Mage', 69, 52775, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Amulet of the Moon Goddess', 4, 53477, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Scepter of the Moonlight', 96, 97816, 'unique');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Robe of the Elemental Mage', 24, 28965, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Boots of the Water Walker', 65, 18796, 'uncommon');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Horned Helm of the Dragon Knight', 49, 90024, 'unique');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Robe of the Celestial Mage', 89, 36331, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Spear of the Valkyrie Warrior', 28, 84855, 'unique');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Chalice of the Demon Lord', 49, 90606, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Necklace of the Moonstone', 73, 90272, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Crown of the Ice Queen', 51, 34171, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Gloves of the Thunderclap', 33, 64927, 'legendary');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Cape of the Night Watchman', 58, 74135, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Quiver of the Hunter', 45, 12576, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Warglaive of Azzinoth', 98, 98529, 'legendary');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Goblet of the Ogre King', 56, 32391, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Potion of the Phoenix Rebirth', 94, 75239, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Goblet of the Troll King', 19, 29647, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Ring of the Necromancer', 25, 47649, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Scepter of the Sun God', 26, 4322, 'rare');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Amulet of the Warlock', 8, 6586, 'common');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Gloves of the Frostbite', 39, 12014, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Shield of the Crusader', 25, 10347, 'rare');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Horned Helm of the Dragon Knight', 28, 53252, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Amulet of the Moon Goddess', 89, 15550, 'uncommon');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Ring of the Necromancer', 82, 24476, 'uncommon');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Wand of the Frost Mage', 40, 22058, 'rare');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Mace of the Titan Slayer', 90, 66408, 'unique');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Amulet of the Necromancer', 68, 66908, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Cape of the Shadow Hunter', 16, 36178, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Chalice of the Holy Grail', 83, 46849, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Amulet of the Necromancer', 12, 85729, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Ring of the Dark Lord', 76, 99190, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Dagger of the Poison Assassin', 31, 6778, 'common');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Scepter of the Moonlight', 41, 81968, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Staff of the Arcane', 64, 1274, 'common');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Mace of the Ogre Bane', 27, 15634, 'rare');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Bracers of the Earthshaker', 34, 24704, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Spear of the Amazon Warrior', 43, 73053, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Mace of the Ogre Bane', 19, 55087, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Staff of the Sorcerer', 37, 4549, 'uncommon');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Gloves of the Thunderclap', 73, 48861, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Goblet of the Goblin King', 95, 29870, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Helm of the Dragon Slayer', 42, 41680, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Wand of the Stormcaller', 59, 1947, 'common');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Helm of the Dragon Slayer', 8, 53472, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Robe of the Shadow Weaver', 55, 55988, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Helm of the Dragon Slayer', 1, 33695, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Shield of the Crusader', 19, 71616, 'legendary');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Robe of the Shadow Weaver', 26, 44939, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Dagger of the Silent Killer', 93, 69583, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Spear of the Amazon Warrior', 81, 9993, 'common');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Cape of the Shadow Hunter', 15, 96520, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Gloves of the Firestarter', 2, 39784, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Spear of the Amazon Warrior', 47, 42059, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Bracers of the Windrider', 55, 75421, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Bow of the Forest Guardian', 75, 39030, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Shield of the Paladin', 72, 10849, 'rare');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Scepter of the Moonlight', 42, 70858, 'unique');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Mace of the Titan Slayer', 65, 43900, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Scepter of the Sun God', 69, 96029, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Necklace of the Sea Serpent', 12, 60035, 'legendary');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Boots of the Swift Wind', 86, 55153, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Quiver of the Hunter', 81, 16969, 'rare');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Boots of the Swift Wind', 20, 12908, 'uncommon');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Gloves of the Frostbite', 97, 16065, 'rare');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Horn of the Unicorn King', 7, 78060, 'legendary');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Shield of the Ironclad', 11, 21075, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Tome of the Arcane Secrets', 12, 57768, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Horned Helm of the Minotaur', 29, 44711, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Ring of the Dark Lord', 65, 70815, 'legendary');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Ring of the Eternal Flame', 39, 91532, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Mace of the Ogre Crusher', 49, 8098, 'uncommon');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Horn of the Chimera', 65, 35141, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Cloak of the Shadow Assassin', 15, 90637, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Cape of the Night Watchman', 3, 63590, 'legendary');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Horn of the Chimera', 97, 25657, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Wand of the Frost Mage', 66, 38912, 'epic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Dagger of the Poison Assassin', 45, 85026, 'legendary');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (2, 'Quiver of the Archer', 99, 53249, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Scepter of the Sun God', 91, 54635, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (1, 'Necklace of the Sea Serpent', 66, 89508, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Horn of the Centaur', 24, 31236, 'mythic');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Quiver of the Hunter', 64, 78153, 'unique');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Crown of the Fire King', 52, 960, 'uncommon');
insert into vyrobek (id_prodejna, nazev_vyrobek, uroven_vyrobek, cena, kvalita) values (3, 'Boots of the Water Walker', 45, 85804, 'mythic');

insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (21187, 1, 5, 'prijata', '10/3/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (19147, 2, 5, 'prijata', '10/5/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (65518, 3, 13, 'prijata', '10/10/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (13654, 4, 10, 'vyrizena', '9/17/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (50677, 6, 11, 'vyrizena', '1/26/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (33546, 5, 11, 'prijata', '10/9/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (68596, 7, 3, 'vyrizena', '9/24/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (13401, 9, 9, 'vyrizena', '7/19/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (22929, 8, 12, 'vyrizena', '9/9/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (15257, 10, 8, 'prijata', '10/1/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (49039, 13, 13, 'vyrizena', '7/25/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (45513, 11, 10, 'prijata', '10/1/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (93541, 12, 12, 'prijata', '10/5/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (97316, 14, 2, 'vyrizena', '10/4/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (65505, 16, 8, 'vyrizena', '10/5/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (24301, 18, 8, 'prijata', '10/6/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (69959, 19, 1, 'vyrizena', '9/27/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (44077, 20, 2, 'vyrizena', '7/6/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (39191, 13, 10, 'prijata', '10/2/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (32806, 15, 5, 'prijata', '10/4/2022');
insert into objednavka (id_objednavka, id_zakaznik, mnozstvi_polozka, stav_objednavka, datum_objednavka) values (32805, 15, 1, 'vyrizena', '10/9/2022');


insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (21187, 10, 2, 'pripravujeme', '10/10/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (19147, 10, 2, 'pripravujeme', '10/11/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (65518, 7, 2, 'na ceste', '10/17/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (13654, 10, 2, 'doruceno', '9/25/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (50677, 14, 2, 'doruceno', '2/1/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (33546, 5, 2, 'pripravujeme', '10/18/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (68596, 3, 1, 'doruceno', '10/6/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (13401, 9, 2, 'doruceno', '7/24/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (22929, 5, 2, 'doruceno', '9/15/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (15257, 9, 2, 'na ceste', '10/15/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (49039, 14, 2, 'doruceno', '7/30/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (45513, 10, 2, 'na ceste', '10/11/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (93541, 8, 2, 'na ceste', '10/15/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (97316, 3, 1, 'hotovo k vyzvednuti', '10/4/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (65505, 2, 1, 'hotovo k vyzvednuti', '10/6/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (24301, 9, 2, 'pripravujeme', '10/11/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (69959, 15, 2, 'doruceno', '10/2/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (44077, 11, 2, 'doruceno', '7/15/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (39191, 6, 2, 'pripravujeme', '10/9/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (32806, 15, 2, 'na ceste', '10/12/2022');
insert into doruceni_objednavky (id_objednavka, id_adresa, id_typ_dorucovani, stav, datum_doruceni) values (32805, 2, 1, 'hotovo k vyzvednuti', '10/10/2022');


insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (21187, 49, 2, 2);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (19147, 99, 3, 1);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (65518, 28, 2, 5);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (13654, 97, 3, 1);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (50677, 60, 3, 4);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (33546, 77, 2, 1);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (68596, 29, 1, 5);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (13401, 84, 1, 4);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (22929, 98, 3, 3);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (15257, 46, 2, 3);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (49039, 45, 1, 1);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (45513, 85, 1, 1);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (93541, 13, 3, 1);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (97316, 65, 2, 5);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (65505, 99, 3, 4);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (24301, 61, 1, 4);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (69959, 53, 1, 1);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (44077, 3, 2, 3);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (39191, 63, 2, 4);
insert into polozka (id_objednavka, id_vyrobek, id_prodejna, mnozstvi) values (32805, 58, 2, 2);

insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (638187, 61, 1, 1, '9/28/2022', 3);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (699721, 83, 1, 2, '9/29/2022', 1);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (978451, 56, 2, 1, '9/30/2022', 2);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (576470, 89, 1, 4, '9/9/2022', 5);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (734116, 34, 1, 5, '10/4/2022', 5);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (120381, 69, 1, 6, '9/23/2022', 2);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (184239, 67, 2, 7, '8/20/2022', 4);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (340449, 64, 1, 8, '10/1/2022', 4);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (472355, 40, 1, 9, '10/5/2022', 1);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (186528, 67, 2, 10, '10/3/2022', 1);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (940131, 91, 3, 1, '9/8/2022', 2);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (146773, 80, 1, 12, '10/4/2022', 1);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (979530, 87, 2, 13, '10/2/2022', 4);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (321330, 85, 1, 14, '9/21/2022', 2);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (824278, 64, 1, 15, '9/11/2022', 3);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (245380, 75, 2, 16, '10/3/2022', 4);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (994120, 32, 3, 17, '10/4/2022', 2);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (857799, 97, 3, 18, '9/26/2022', 1);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (905679, 20, 1, 19, '10/1/2022', 2);
insert into prodej (id_prodej, id_vyrobek, id_prodejna, id_zakaznik, datum_prodej, mnozstvi_vyrobek) values (656086, 90, 2, 20, '9/25/2022', 5);



insert into zamestnanec (id_adresa, id_prodejna, osobni_cislo, jmeno_zamestnanec, prijmeni) values (20, 1, 6491, 'Tichondrius', 'Simco');
insert into zamestnanec (id_adresa, id_prodejna, osobni_cislo, jmeno_zamestnanec, prijmeni) values (9, 3, 5039, 'Azgalor', 'Ragless');
insert into zamestnanec (id_adresa, id_prodejna, osobni_cislo, jmeno_zamestnanec, prijmeni) values (6, 1, 7959, 'Yrel', 'Gaine of England');
insert into zamestnanec (id_adresa, id_prodejna, osobni_cislo, jmeno_zamestnanec, prijmeni) values (25, 3, 1007, 'Nozdormu', 'Tennant');
insert into zamestnanec (id_adresa, id_prodejna, osobni_cislo, jmeno_zamestnanec, prijmeni) values (13, 2, 2483, 'Kalec', 'Buttler');
insert into zamestnanec (id_adresa, id_prodejna, osobni_cislo, jmeno_zamestnanec, prijmeni) values (21, 2, 4594, 'Muradin', 'Bronzebeard');
insert into zamestnanec (id_adresa, id_prodejna, osobni_cislo, jmeno_zamestnanec, prijmeni) values (13, 2, 9731, 'Falstad', 'Dinneen');
insert into zamestnanec (id_adresa, id_prodejna, osobni_cislo, jmeno_zamestnanec, prijmeni) values (4, 3, 2319, 'Valeera', 'Panniers');
insert into zamestnanec (id_adresa, id_prodejna, osobni_cislo, jmeno_zamestnanec, prijmeni) values (21, 3, 8751, 'Azshara', 'Kirtland');
insert into zamestnanec (id_adresa, id_prodejna, osobni_cislo, jmeno_zamestnanec, prijmeni) values (25, 1, 1274, 'Maiev', 'Figurski');
insert into zamestnanec (id_adresa, id_prodejna, osobni_cislo, jmeno_zamestnanec, prijmeni) values (8, 2, 5500, 'Murky', 'Baldoni');
insert into zamestnanec (id_adresa, id_prodejna, osobni_cislo, jmeno_zamestnanec, prijmeni) values (18, 3, 4797, 'Gazlowe', 'Dallimore');
