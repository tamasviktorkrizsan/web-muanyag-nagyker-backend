-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Jan 17. 11:18
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `matejka_muanyag_nagykereskedelem`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `garden_catalog`
--

CREATE TABLE `garden_catalog` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `garden_catalog`
--

INSERT INTO `garden_catalog` (`id`, `category`, `name`, `type`, `product_id`, `color`, `img`) VALUES
(1, 'virágcserepek', 'Hajtató cserép', '13cm-28cm-ig', NULL, 'fekete', 'kerteszeti/viragcserepek/hajtatocserep.jpg'),
(2, 'virágcserepek', 'Ravenna cserép', '12cm', '500014', 'terracotta', 'kerteszeti/viragcserepek/ravennacs.jpg'),
(3, 'virágcserepek', 'Ravenna alátét', '110', '500020', 'terracotta', 'kerteszeti/viragcserepek/ravennaa.jpg'),
(4, 'virágcserepek', 'IL cserép', '16cm', '520001', 'fehér,terracotta', 'kerteszeti/viragcserepek/ilcserep.jpg'),
(5, 'virágcserepek', 'IL alátét', '140', '520009', 'fehér,terracotta', 'kerteszeti/viragcserepek/ilalatet.jpg'),
(6, 'virágcserepek', 'Garda cserép', '16cm', '500047', 'terracotta', 'kerteszeti/viragcserepek/gardacs.jpg'),
(7, 'virágcserepek', 'Garda alátét', '130', '500054', 'terracotta', 'kerteszeti/viragcserepek/gardaal.jpg'),
(8, 'virágcserepek', 'Szegletes cserép', '14cm', '530030', 'terracotta', 'kerteszeti/viragcserepek/szegletes.jpg'),
(9, 'virágcserepek', 'Szegletes alátét', '120', '530035', 'terracotta', 'kerteszeti/viragcserepek/szegletesalatet.jpg'),
(10, 'seprűk', 'cirokseprű', 'normál', '60011', NULL, 'kerteszeti/sepruk/ciroksepru.jpg'),
(11, 'seprűk', 'kézi cirokseprű', NULL, '60010', NULL, 'kerteszeti/sepruk/kezicirok.jpg'),
(12, 'seprűk', 'Műszálas seprű PVC nyéllel', NULL, '60022', NULL, 'kerteszeti/sepruk/pvcsepru.jpg'),
(13, 'seprűk', 'Vesszőseprű', NULL, '60070', NULL, 'kerteszeti/sepruk/vesszo.jpg'),
(14, 'seprűk', 'Seprű nyéllel', NULL, '530201', NULL, 'kerteszeti/sepruk/seprunyellel.jpg'),
(15, 'seprűk', 'Kerti seprű', NULL, '530111', NULL, 'kerteszeti/sepruk/kertisepru.jpg'),
(16, 'seprűk', 'Partvis ipari', NULL, '390117', NULL, 'kerteszeti/sepruk/iparisepru.jpg'),
(17, 'seprűk', 'Terempartvis', '50cm', '060008', NULL, 'kerteszeti/sepruk/terempartvis.jpg'),
(18, 'seprűk', 'Lószőr partvis 303-as nyéllel', NULL, '060018', NULL, 'kerteszeti/sepruk/partvis.jpg'),
(19, 'seprűk', 'Mini partvis nyéllel', NULL, '060016', NULL, 'kerteszeti/sepruk/minipartvis.jpg'),
(20, 'seprűk', 'Partvis', 'Muuu', '530200', NULL, 'kerteszeti/sepruk/mintaspartvis.jpg'),
(21, 'seprűk', '307-es kézi partvis', NULL, '060041', NULL, 'kerteszeti/sepruk/307-es.jpg'),
(22, 'seprűk', 'Udvartisztító', '30cm', '060033', NULL, 'kerteszeti/sepruk/udvartisztito.jpg'),
(23, 'seprűk', 'Hólapát', NULL, '440004', NULL, 'kerteszeti/sepruk/holapat.jpg'),
(24, 'temetői vázák', 'Sírváza talpas', 'nagy', '090014', NULL, 'kerteszeti/temetoi_vazak/sirvaza2.jpg'),
(25, 'temetői vázák', 'Talpasváza', NULL, '670010', NULL, 'kerteszeti/temetoi_vazak/talpas-vaza.jpg'),
(26, 'temetői vázák', 'Talpas kehely', '25cm', '360132', NULL, 'kerteszeti/temetoi_vazak/talpasvirag.jpg'),
(27, 'temetői vázák', 'Sírváza leszúrós', 'kicsi', '670006', NULL, 'kerteszeti/temetoi_vazak/sirvaza.jpg'),
(28, 'ládák és vödrök', '90l húsos láda', '90l', '440005', NULL, 'kerteszeti/ladak_es_vodrok/husoslada.jpg'),
(29, 'ládák és vödrök', 'Húsosláda II. o.', NULL, '520056', NULL, 'kerteszeti/ladak_es_vodrok/husoslada_II_osztalyu.jpg'),
(30, 'ládák és vödrök', 'Húsosláda I. o.', NULL, '520050', NULL, 'kerteszeti/ladak_es_vodrok/husoslada_I_osztalyu.jpg'),
(31, 'ládák és vödrök', 'Malteros láda', '65l', '440010', NULL, 'kerteszeti/ladak_es_vodrok/malteroslada.jpg'),
(32, 'ládák és vödrök', 'Kád', '50l', '520041', NULL, 'kerteszeti/ladak_es_vodrok/25_literes_kad.jpg'),
(33, 'ládák és vödrök', 'Szögletes kád', '40l', '310074', NULL, 'kerteszeti/ladak_es_vodrok/mindeneskad.jpg'),
(34, 'ládák és vödrök', 'Sózókád ', '75l', '250006', NULL, 'kerteszeti/ladak_es_vodrok/sozokad.jpg'),
(35, 'ládák és vödrök', 'Köralakú dézsa', '90l', '520060', NULL, 'kerteszeti/ladak_es_vodrok/90ldezsa.jpg'),
(36, 'ládák és vödrök', 'Dézsa', '25l', '520021', NULL, 'kerteszeti/ladak_es_vodrok/45ldezsa.jpg'),
(37, 'ládák és vödrök', 'Szeméttároló', NULL, '250014', NULL, 'kerteszeti/ladak_es_vodrok/50lszemetes.jpg'),
(38, 'ládák és vödrök', 'Szüretelőkád', '110l', '390014', NULL, 'kerteszeti/ladak_es_vodrok/szuretelo.jpg'),
(39, 'ládák és vödrök', 'Láda', 'M5', '520078', NULL, 'kerteszeti/ladak_es_vodrok/m5sima.jpg'),
(40, 'ládák és vödrök', 'Savanyítós vödrök', '2,5l', '250018', NULL, 'kerteszeti/ladak_es_vodrok/savanyitosvodor.jpg'),
(41, 'ládák és vödrök', '18l ovális vödör', '18l', '040051', NULL, 'kerteszeti/ladak_es_vodrok/ovalis.jpg'),
(42, 'ládák és vödrök', '10l vödör', '10l', '040002', NULL, 'kerteszeti/ladak_es_vodrok/fedelesvodor.jpg'),
(43, 'ládák és vödrök', 'fémfüles vödör', '5l', '400004', NULL, 'kerteszeti/ladak_es_vodrok/femfules.jpg'),
(44, 'ládák és vödrök', 'Kiöntős vödör', NULL, '050059', NULL, 'kerteszeti/ladak_es_vodrok/kiontosvodor.jpg'),
(45, 'ládák és vödrök', 'Horgász vödör', NULL, '250037', NULL, 'kerteszeti/ladak_es_vodrok/horgaszvodor.jpg'),
(46, 'ládák és vödrök', 'Vödör fémfüles', '12l IIoszt.', '520017', NULL, 'kerteszeti/ladak_es_vodrok/malteros.jpg'),
(47, 'hordók', 'Fedeles hordó', '30l', '320001', NULL, 'kerteszeti/hordok/savanyitoshordo.jpg'),
(48, 'hordók', 'Mézeshordó', '120l', '320014', NULL, 'kerteszeti/hordok/esovizeshordo.jpg'),
(49, 'hordók', 'Demizson', '5l', '390001', NULL, 'kerteszeti/hordok/demizson.jpg'),
(50, 'hordók', 'Dáma üveg', '5l', '390035', NULL, 'kerteszeti/hordok/damauveg.jpg'),
(51, 'kannák', 'Locsolókannák', '1,5l', '380004', NULL, 'kerteszeti/kannak/locsolokannak.jpg'),
(52, 'kannák', 'Csapos kanna', '10l', '190001', NULL, 'kerteszeti/kannak/csapos_kanna.jpg'),
(53, 'kannák', 'Üzemanyagkanna', '5l', '650001', NULL, 'kerteszeti/kannak/uzemanyagkanna.jpg'),
(54, 'kannák', 'Kanna', '2l', '630008', NULL, 'kerteszeti/kannak/marmonkanna.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `home_catalog`
--

CREATE TABLE `home_catalog` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `home_catalog`
--

INSERT INTO `home_catalog` (`id`, `category`, `name`, `type`, `product_id`, `color`, `img`) VALUES
(1, 'szemetesek', 'Billenős szemetes 10 literes', '10l', '510002', NULL, 'haztartasi/szemetesek/billenos.jpg'),
(2, 'szemetesek', 'Pedalina szeméttároló', '4l', '050317', NULL, 'haztartasi/szemetesek/pedalina.jpg'),
(3, 'szemetesek', 'Pedálos szemetes 10 literes', '10l', '310001', NULL, 'haztartasi/szemetesek/10lpedalos.jpg'),
(4, 'szemetesek', 'Pedálos szemetes 12 literes', '12l', '510005', NULL, 'haztartasi/szemetesek/pedalos.jpg'),
(5, 'szemetesek', 'Furba szeméttároló', '17l', '050222', NULL, 'haztartasi/szemetesek/furba.jpg'),
(6, 'szemetesek', 'Oscar billenős szemetes', '7l', '360065', NULL, 'haztartasi/szemetesek/szemettarolom3.jpg'),
(7, 'szemetesek', 'Billenős szemetes', '22l', '050116', NULL, 'haztartasi/szemetesek/szemettarolo.jpg'),
(8, 'szemetesek', 'Gilda billenős szemetes', '50l', '530133', NULL, 'haztartasi/szemetesek/Gilda.jpg'),
(9, 'szivacsok', 'Mosogatószivacs', '5db', '050283', NULL, 'haztartasi/szivacsok/szivacs10dbos.jpg'),
(10, 'szivacsok', 'Mosogatószivacs', '3db', '050013', NULL, 'haztartasi/szivacsok/3dbosszivacs.jpg'),
(11, 'szivacsok', 'Citromolajos súroló', '6db', '050212', NULL, 'haztartasi/szivacsok/citromossurolo.jpg'),
(12, 'szivacsok', 'Mosogatószivacs', '2db', '050098', NULL, 'haztartasi/szivacsok/szivacs2dbos.jpg'),
(13, 'szivacsok', 'Mosdószivacs masszázs', NULL, '050007', NULL, 'haztartasi/szivacsok/masszas.jpg'),
(14, 'evőeszköztartók', 'Edényszárító', NULL, '050021', NULL, 'haztartasi/evoeszkoztartok/edenycsepegt.jpg'),
(15, 'evőeszköztartók', 'Edénycsepegtető Nova', 'kicsi', '530068', NULL, 'haztartasi/evoeszkoztartok/edenycsep2.jpg'),
(16, 'evőeszköztartók', 'Edénycsepegtető Classic', NULL, '530101', NULL, 'haztartasi/evoeszkoztartok/edenycsep1.jpg'),
(17, 'evőeszköztartók', 'Edényszárítórács+tálca', NULL, '310028', NULL, 'haztartasi/evoeszkoztartok/edenycsepst.jpg'),
(18, 'evőeszköztartók', 'Edénycsepegtető PL', NULL, '360082', NULL, 'haztartasi/evoeszkoztartok/edenycseppl.jpg'),
(19, 'evőeszköztartók', 'Tányérszárító', NULL, '050020', NULL, 'haztartasi/evoeszkoztartok/tanyerszarito.jpg'),
(20, 'evőeszköztartók', 'Evőeszközszárító PL', NULL, '360081', NULL, 'haztartasi/evoeszkoztartok/evoeszkszaritopl.jpg'),
(21, 'evőeszköztartók', 'Evőeszközszárító kerek', NULL, '050073', NULL, 'haztartasi/evoeszkoztartok/eveszkszaritokerek.jpg'),
(22, 'evőeszköztartók', 'Evőeszközszárító 4 részes', NULL, '011180', NULL, 'haztartasi/evoeszkoztartok/evoeszktarto4r.jpg'),
(23, 'evőeszköztartók', 'Evőeszközszárító Nova', NULL, '530151', NULL, 'haztartasi/evoeszkoztartok/evszarituj.jpg'),
(24, 'evőeszköztartók', 'Evőeszközszárító ovál', NULL, '310042', NULL, 'haztartasi/evoeszkoztartok/evoeszkszaritoval.jpg'),
(25, 'evőeszköztartók', 'Evőeszközszárító', '4 részes', '250026', NULL, 'haztartasi/evoeszkoztartok/evoeszktart4r.jpg'),
(26, 'evőeszköztartók', 'Evőeszköztartó', '7 részes', '050063', NULL, 'haztartasi/evoeszkoztartok/evtart7r.jpg'),
(27, 'evőeszköztartók', 'Evőeszköztartó ', '5 részes', '050074', NULL, 'haztartasi/evoeszkoztartok/evtarto5.jpg'),
(28, 'tálak', 'Ételhordó', '1l 3 részes', '010820', NULL, 'haztartasi/talak/etelhordo.jpg'),
(29, 'tálak', 'Ételdoboz', '1l', '030004', NULL, 'haztartasi/talak/eteldoboz.jpg'),
(30, 'tálak', 'Kelesztőtál', '5.5l-es', '330004', NULL, 'haztartasi/talak/kelesztotal.jpg'),
(31, 'tálak', 'Ételes szett', 'kicsi', '520023', NULL, 'haztartasi/talak/3doboz.jpg'),
(32, 'tálak', 'Bella doboz süteményes+tető', NULL, '120019', NULL, 'haztartasi/talak/bellasutis.jpg'),
(33, 'tálak', 'Bordás tálak', '16cm', '050240', NULL, 'haztartasi/talak/bordastal.jpg'),
(34, 'tálak', 'Kerek tál', '0,7l', '36011', NULL, 'haztartasi/talak/formastal.jpg'),
(35, 'tálak', 'Ovális gyümölcsmintás tál', NULL, '310034', NULL, 'haztartasi/talak/ovalisgyumo.jpg'),
(36, 'tálak', 'Kiöntős keverőtál', NULL, '250028', NULL, 'haztartasi/talak/kiontoskevero.jpg'),
(37, 'tálak', 'Gyümölcsmosó szűrő', NULL, '040004', NULL, 'haztartasi/talak/gymosogn.jpg'),
(38, 'tálak', 'Lapostányér', NULL, '260014', NULL, 'haztartasi/talak/talak2.jpg'),
(39, 'tálak', 'Kompótos tál', NULL, '260016', NULL, 'haztartasi/talak/talak2.jpg'),
(40, 'tálak', 'Mélytányér', NULL, '260013', NULL, 'haztartasi/talak/talak2.jpg');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `garden_catalog`
--
ALTER TABLE `garden_catalog`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `home_catalog`
--
ALTER TABLE `home_catalog`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `garden_catalog`
--
ALTER TABLE `garden_catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT a táblához `home_catalog`
--
ALTER TABLE `home_catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
