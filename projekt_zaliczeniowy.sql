-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Maj 24, 2026 at 10:12 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projekt_zaliczeniowy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adres_zamieszkania`
--

CREATE TABLE `adres_zamieszkania` (
  `Id_Adresu` int(11) NOT NULL,
  `Ulica` varchar(100) NOT NULL,
  `Numer_domu` varchar(10) NOT NULL,
  `Kod_pocztowy` varchar(6) NOT NULL,
  `Miasto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `adres_zamieszkania`
--

INSERT INTO `adres_zamieszkania` (`Id_Adresu`, `Ulica`, `Numer_domu`, `Kod_pocztowy`, `Miasto`) VALUES
(1, 'Długa', '12', '30-001', 'Kraków'),
(2, 'Słoneczna', '5A', '31-002', 'Kraków'),
(3, 'Leśna', '44', '32-003', 'Wieliczka'),
(4, 'Krótka', '2', '30-004', 'Kraków'),
(5, 'Mickiewicza', '15', '31-005', 'Kraków'),
(6, 'Polna', '8', '32-006', 'Wieliczka'),
(7, 'Kwiatowa', '12', '30-007', 'Kraków'),
(8, 'Warszawska', '101', '31-008', 'Kraków');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `karnet`
--

CREATE TABLE `karnet` (
  `Id_Karnetu` int(11) NOT NULL,
  `Id_Klienta` int(11) NOT NULL,
  `Id_Typu_Karnetu` int(11) NOT NULL,
  `Data_Rozpoczecia` date NOT NULL,
  `Data_Zakonczenia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `karnet`
--

INSERT INTO `karnet` (`Id_Karnetu`, `Id_Klienta`, `Id_Typu_Karnetu`, `Data_Rozpoczecia`, `Data_Zakonczenia`) VALUES
(1, 1, 1, '2026-05-01', '2026-05-31'),
(2, 2, 2, '2026-05-10', '2026-06-09'),
(3, 3, 3, '2026-01-01', '2026-12-31'),
(5, 4, 1, '2026-05-10', '2026-06-09'),
(6, 5, 1, '2026-05-12', '2026-06-11'),
(7, 6, 2, '2026-05-15', '2026-06-14'),
(8, 7, 3, '2026-02-01', '2027-01-31'),
(9, 1, 2, '2026-05-18', '2026-06-17'),
(11, 9, 1, '2026-05-15', '2026-06-15'),
(12, 1, 3, '2026-05-19', '2027-05-19');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `klienci_do_aktywizacji`
-- (See below for the actual view)
--
CREATE TABLE `klienci_do_aktywizacji` (
`Imie_Klienta` varchar(50)
,`Nazwisko_Klienta` varchar(50)
,`Adres_Email` varchar(100)
,`Posiadany_Karnet` varchar(50)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `Id_Klienta` int(11) NOT NULL,
  `Imie` varchar(50) NOT NULL,
  `Nazwisko` varchar(50) NOT NULL,
  `Adres_Email` varchar(100) NOT NULL,
  `Numer_Telefonu` varchar(15) NOT NULL,
  `Id_Adresu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `klient`
--

INSERT INTO `klient` (`Id_Klienta`, `Imie`, `Nazwisko`, `Adres_Email`, `Numer_Telefonu`, `Id_Adresu`) VALUES
(1, 'Marta', 'Zielińska', 'marta@email.com', '999888777', 1),
(2, 'Krzysztof', 'Lewandowski', 'krzysztof@email.com', '222333444', 2),
(3, 'Zofia', 'Wójcik', 'zofia@email.com', '333444555', 3),
(4, 'Tomasz', 'Kaczmarek', 'tomasz.k@email.com', '444555666', 4),
(5, 'Agnieszka', 'Szymańska', 'aga.szym@email.com', '555666777', 5),
(6, 'Michał', 'Dąbrowski', 'michal.d@email.com', '666777888', 6),
(7, 'Katarzyna', 'Kozłowska', 'kasia.k@email.com', '777888999', 7),
(8, 'Piotr', 'Jankowski', 'piotr.j@email.com', '888999000', 8),
(9, 'Olaf', 'Nowak', 'olaf@email.com', '100200300', 1);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `lista_aktywnych_klientow`
-- (See below for the actual view)
--
CREATE TABLE `lista_aktywnych_klientow` (
`Imie` varchar(50)
,`Nazwisko` varchar(50)
,`Adres_Email` varchar(100)
,`Numer_Telefonu` varchar(15)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `obciazenie_trenerow`
-- (See below for the actual view)
--
CREATE TABLE `obciazenie_trenerow` (
`Imie_Pracownika` varchar(50)
,`Nazwisko_Pracownika` varchar(50)
,`Liczba_Zaplanowanych_Zajec` bigint(21)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownik`
--

CREATE TABLE `pracownik` (
  `ID_Pracownika` int(11) NOT NULL,
  `Imie` varchar(50) NOT NULL,
  `Nazwisko` varchar(50) NOT NULL,
  `Stanowisko` varchar(50) NOT NULL,
  `Numer_Telefonu` varchar(15) NOT NULL,
  `Data_Zatrudnienia` date NOT NULL,
  `Wynagrodzenie` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `pracownik`
--

INSERT INTO `pracownik` (`ID_Pracownika`, `Imie`, `Nazwisko`, `Stanowisko`, `Numer_Telefonu`, `Data_Zatrudnienia`, `Wynagrodzenie`) VALUES
(2, 'Anna', 'Kowalska', 'Trener Personalny', '123456789', '2023-01-15', 5500.00),
(3, 'Jan', 'Nowak', 'Instruktor Jogi', '987654321', '2024-03-01', 4800.00),
(4, 'Piotr', 'Wiśniewski', 'Recepcjonista', '555666777', '2024-05-10', 4000.00);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `ranking_popularnosci_zajec`
-- (See below for the actual view)
--
CREATE TABLE `ranking_popularnosci_zajec` (
`Nazwa_Zajec` varchar(100)
,`Termin_Zajec` date
,`Limit_Miejsc` int(11)
,`Zapisani_Klienci` bigint(21)
,`Wolne_Miejsca` bigint(22)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `raport_sprzedazy_karnetow`
-- (See below for the actual view)
--
CREATE TABLE `raport_sprzedazy_karnetow` (
`Rodzaj_Karnetu` varchar(50)
,`Liczba_Sprzedanych_Sztuk` bigint(21)
,`Laczny_Przychod_PLN` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacje`
--

CREATE TABLE `rezerwacje` (
  `Id_Rezerwacji` int(11) NOT NULL,
  `Id_Klienta` int(11) NOT NULL,
  `Id_Zajec` int(11) NOT NULL,
  `Data_Zlozenia_Rezerwacji` datetime NOT NULL,
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `rezerwacje`
--

INSERT INTO `rezerwacje` (`Id_Rezerwacji`, `Id_Klienta`, `Id_Zajec`, `Data_Zlozenia_Rezerwacji`, `Status`) VALUES
(1, 1, 4, '2026-05-13 10:15:00', 'Aktywna'),
(2, 2, 4, '2026-05-13 11:30:00', 'Aktywna'),
(3, 1, 5, '2026-05-13 12:00:00', 'Anulowana'),
(4, 3, 6, '2026-05-13 14:45:00', 'Aktywna'),
(5, 4, 4, '2026-05-14 09:00:00', 'Aktywna'),
(6, 5, 4, '2026-05-14 09:15:00', 'Aktywna'),
(7, 6, 4, '2026-05-14 10:00:00', 'Aktywna'),
(8, 7, 5, '2026-05-14 11:30:00', 'Aktywna'),
(9, 8, 5, '2026-05-14 12:00:00', 'Anulowana'),
(10, 4, 6, '2026-05-14 13:45:00', 'Aktywna'),
(11, 5, 6, '2026-05-14 14:00:00', 'Aktywna');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sala`
--

CREATE TABLE `sala` (
  `Id_Sali` int(11) NOT NULL,
  `Nazwa` varchar(50) NOT NULL,
  `Pojemnosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `sala`
--

INSERT INTO `sala` (`Id_Sali`, `Nazwa`, `Pojemnosc`) VALUES
(1, 'Studio A (Fitness)', 50),
(2, 'Strefa Wolnych Ciężarów', 15),
(3, 'Sala Rowerowa', 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `strefa`
--

CREATE TABLE `strefa` (
  `Id_Strefy` int(11) NOT NULL,
  `Nazwa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `strefa`
--

INSERT INTO `strefa` (`Id_Strefy`, `Nazwa`) VALUES
(1, 'Siłownia'),
(2, 'Basen'),
(3, 'Sauna'),
(4, 'SPA');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typ_karnetu`
--

CREATE TABLE `typ_karnetu` (
  `Id_Typu_Karnetu` int(11) NOT NULL,
  `Nazwa` varchar(50) NOT NULL,
  `Cena` decimal(10,2) NOT NULL,
  `Czas_Trwania_Dni` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `typ_karnetu`
--

INSERT INTO `typ_karnetu` (`Id_Typu_Karnetu`, `Nazwa`, `Cena`, `Czas_Trwania_Dni`) VALUES
(1, 'Karnet Open', 150.00, 30),
(2, 'Karnet Poranny', 100.00, 30),
(3, 'Karnet VIP', 1500.00, 365);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typ_karnetu_strefa`
--

CREATE TABLE `typ_karnetu_strefa` (
  `Id_Typu_Karnetu` int(11) NOT NULL,
  `Id_Strefy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `typ_karnetu_strefa`
--

INSERT INTO `typ_karnetu_strefa` (`Id_Typu_Karnetu`, `Id_Strefy`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(3, 1),
(3, 2),
(3, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zajecia_grupowe`
--

CREATE TABLE `zajecia_grupowe` (
  `Id_Zajec` int(11) NOT NULL,
  `Nazwa` varchar(100) NOT NULL,
  `Data` date NOT NULL,
  `Godzina_Rozpoczecia` time NOT NULL,
  `Godzina_Zakonczenia` time NOT NULL,
  `Limit_Miejsc` int(11) NOT NULL,
  `Poziom_Trudnosci` varchar(50) DEFAULT NULL,
  `Id_Sali` int(11) NOT NULL,
  `Id_Pracownika` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `zajecia_grupowe`
--

INSERT INTO `zajecia_grupowe` (`Id_Zajec`, `Nazwa`, `Data`, `Godzina_Rozpoczecia`, `Godzina_Zakonczenia`, `Limit_Miejsc`, `Poziom_Trudnosci`, `Id_Sali`, `Id_Pracownika`) VALUES
(4, 'Joga', '2026-05-15', '18:00:00', '19:00:00', 20, 'Dla każdego', 1, 3),
(5, 'Trening Obwodowy', '2026-05-16', '17:00:00', '18:30:00', 15, 'Średniozaawansowany', 2, 2),
(6, 'Crossfit', '2026-05-17', '19:00:00', '20:00:00', 10, 'Zaawansowany', 3, 2);

-- --------------------------------------------------------

--
-- Struktura widoku `klienci_do_aktywizacji`
--
DROP TABLE IF EXISTS `klienci_do_aktywizacji`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `klienci_do_aktywizacji`  AS SELECT `k`.`Imie` AS `Imie_Klienta`, `k`.`Nazwisko` AS `Nazwisko_Klienta`, `k`.`Adres_Email` AS `Adres_Email`, `t`.`Nazwa` AS `Posiadany_Karnet` FROM ((`klient` `k` join `karnet` `kar` on(`k`.`Id_Klienta` = `kar`.`Id_Klienta`)) join `typ_karnetu` `t` on(`kar`.`Id_Typu_Karnetu` = `t`.`Id_Typu_Karnetu`)) WHERE `kar`.`Data_Zakonczenia` >= curdate() AND !exists(select 1 from `rezerwacje` `r` where `r`.`Id_Klienta` = `k`.`Id_Klienta` limit 1) ;

-- --------------------------------------------------------

--
-- Struktura widoku `lista_aktywnych_klientow`
--
DROP TABLE IF EXISTS `lista_aktywnych_klientow`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lista_aktywnych_klientow`  AS SELECT `klient`.`Imie` AS `Imie`, `klient`.`Nazwisko` AS `Nazwisko`, `klient`.`Adres_Email` AS `Adres_Email`, `klient`.`Numer_Telefonu` AS `Numer_Telefonu` FROM `klient` WHERE `klient`.`Id_Klienta` in (select `karnet`.`Id_Klienta` from `karnet` where `karnet`.`Data_Zakonczenia` >= curdate()) ;

-- --------------------------------------------------------

--
-- Struktura widoku `obciazenie_trenerow`
--
DROP TABLE IF EXISTS `obciazenie_trenerow`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `obciazenie_trenerow`  AS SELECT `zestawienie`.`Imie_Pracownika` AS `Imie_Pracownika`, `zestawienie`.`Nazwisko_Pracownika` AS `Nazwisko_Pracownika`, `zestawienie`.`Liczba_Zaplanowanych_Zajec` AS `Liczba_Zaplanowanych_Zajec` FROM (select `p`.`Imie` AS `Imie_Pracownika`,`p`.`Nazwisko` AS `Nazwisko_Pracownika`,count(`zg`.`Id_Zajec`) AS `Liczba_Zaplanowanych_Zajec` from (`pracownik` `p` left join `zajecia_grupowe` `zg` on(`p`.`ID_Pracownika` = `zg`.`Id_Pracownika`)) group by `p`.`ID_Pracownika`,`p`.`Imie`,`p`.`Nazwisko`) AS `zestawienie` ORDER BY `zestawienie`.`Liczba_Zaplanowanych_Zajec` DESC ;

-- --------------------------------------------------------

--
-- Struktura widoku `ranking_popularnosci_zajec`
--
DROP TABLE IF EXISTS `ranking_popularnosci_zajec`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ranking_popularnosci_zajec`  AS SELECT `zg`.`Nazwa` AS `Nazwa_Zajec`, `zg`.`Data` AS `Termin_Zajec`, `zg`.`Limit_Miejsc` AS `Limit_Miejsc`, count(`r`.`Id_Rezerwacji`) AS `Zapisani_Klienci`, `zg`.`Limit_Miejsc`- count(`r`.`Id_Rezerwacji`) AS `Wolne_Miejsca` FROM (`zajecia_grupowe` `zg` left join `rezerwacje` `r` on(`zg`.`Id_Zajec` = `r`.`Id_Zajec` and `r`.`Status` = 'Aktywna')) GROUP BY `zg`.`Id_Zajec`, `zg`.`Nazwa`, `zg`.`Data`, `zg`.`Limit_Miejsc` ORDER BY count(`r`.`Id_Rezerwacji`) DESC ;

-- --------------------------------------------------------

--
-- Struktura widoku `raport_sprzedazy_karnetow`
--
DROP TABLE IF EXISTS `raport_sprzedazy_karnetow`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `raport_sprzedazy_karnetow`  AS SELECT `t`.`Nazwa` AS `Rodzaj_Karnetu`, count(`k`.`Id_Karnetu`) AS `Liczba_Sprzedanych_Sztuk`, sum(`t`.`Cena`) AS `Laczny_Przychod_PLN` FROM (`karnet` `k` join `typ_karnetu` `t` on(`k`.`Id_Typu_Karnetu` = `t`.`Id_Typu_Karnetu`)) GROUP BY `t`.`Nazwa` ORDER BY sum(`t`.`Cena`) DESC ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `adres_zamieszkania`
--
ALTER TABLE `adres_zamieszkania`
  ADD PRIMARY KEY (`Id_Adresu`);

--
-- Indeksy dla tabeli `karnet`
--
ALTER TABLE `karnet`
  ADD PRIMARY KEY (`Id_Karnetu`),
  ADD KEY `FK_Karnet_Klient` (`Id_Klienta`),
  ADD KEY `FK_Karnet_Typ` (`Id_Typu_Karnetu`);

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`Id_Klienta`),
  ADD KEY `Id_Adresu` (`Id_Adresu`);

--
-- Indeksy dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  ADD PRIMARY KEY (`ID_Pracownika`);

--
-- Indeksy dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD PRIMARY KEY (`Id_Rezerwacji`),
  ADD KEY `FK_Rezerwacje_Klient` (`Id_Klienta`),
  ADD KEY `FK_Rezerwacje_Zajecia` (`Id_Zajec`);

--
-- Indeksy dla tabeli `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`Id_Sali`);

--
-- Indeksy dla tabeli `strefa`
--
ALTER TABLE `strefa`
  ADD PRIMARY KEY (`Id_Strefy`),
  ADD UNIQUE KEY `uq_strefa_nazwa` (`Nazwa`);

--
-- Indeksy dla tabeli `typ_karnetu`
--
ALTER TABLE `typ_karnetu`
  ADD PRIMARY KEY (`Id_Typu_Karnetu`),
  ADD UNIQUE KEY `uq_typ_karnetu_nazwa` (`Nazwa`);

--
-- Indeksy dla tabeli `typ_karnetu_strefa`
--
ALTER TABLE `typ_karnetu_strefa`
  ADD PRIMARY KEY (`Id_Typu_Karnetu`,`Id_Strefy`),
  ADD KEY `FK_TKS_Strefa` (`Id_Strefy`);

--
-- Indeksy dla tabeli `zajecia_grupowe`
--
ALTER TABLE `zajecia_grupowe`
  ADD PRIMARY KEY (`Id_Zajec`),
  ADD KEY `FK_Zajecia_Sala` (`Id_Sali`),
  ADD KEY `FK_Zajecia_Pracownik` (`Id_Pracownika`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adres_zamieszkania`
--
ALTER TABLE `adres_zamieszkania`
  MODIFY `Id_Adresu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `karnet`
--
ALTER TABLE `karnet`
  MODIFY `Id_Karnetu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `klient`
--
ALTER TABLE `klient`
  MODIFY `Id_Klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pracownik`
--
ALTER TABLE `pracownik`
  MODIFY `ID_Pracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rezerwacje`
--
ALTER TABLE `rezerwacje`
  MODIFY `Id_Rezerwacji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sala`
--
ALTER TABLE `sala`
  MODIFY `Id_Sali` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `strefa`
--
ALTER TABLE `strefa`
  MODIFY `Id_Strefy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `typ_karnetu`
--
ALTER TABLE `typ_karnetu`
  MODIFY `Id_Typu_Karnetu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `zajecia_grupowe`
--
ALTER TABLE `zajecia_grupowe`
  MODIFY `Id_Zajec` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `karnet`
--
ALTER TABLE `karnet`
  ADD CONSTRAINT `FK_Karnet_Klient` FOREIGN KEY (`Id_Klienta`) REFERENCES `klient` (`Id_Klienta`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Karnet_Typ` FOREIGN KEY (`Id_Typu_Karnetu`) REFERENCES `typ_karnetu` (`Id_Typu_Karnetu`);

--
-- Constraints for table `klient`
--
ALTER TABLE `klient`
  ADD CONSTRAINT `klient_ibfk_1` FOREIGN KEY (`Id_Adresu`) REFERENCES `adres_zamieszkania` (`Id_Adresu`);

--
-- Constraints for table `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD CONSTRAINT `FK_Rezerwacje_Klient` FOREIGN KEY (`Id_Klienta`) REFERENCES `klient` (`Id_Klienta`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Rezerwacje_Zajecia` FOREIGN KEY (`Id_Zajec`) REFERENCES `zajecia_grupowe` (`Id_Zajec`) ON DELETE CASCADE;

--
-- Constraints for table `typ_karnetu_strefa`
--
ALTER TABLE `typ_karnetu_strefa`
  ADD CONSTRAINT `FK_TKS_Typ` FOREIGN KEY (`Id_Typu_Karnetu`) REFERENCES `typ_karnetu` (`Id_Typu_Karnetu`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_TKS_Strefa` FOREIGN KEY (`Id_Strefy`) REFERENCES `strefa` (`Id_Strefy`) ON DELETE CASCADE;

--
-- Constraints for table `zajecia_grupowe`
--
ALTER TABLE `zajecia_grupowe`
  ADD CONSTRAINT `FK_Zajecia_Pracownik` FOREIGN KEY (`Id_Pracownika`) REFERENCES `pracownik` (`ID_Pracownika`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Zajecia_Sala` FOREIGN KEY (`Id_Sali`) REFERENCES `sala` (`Id_Sali`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
