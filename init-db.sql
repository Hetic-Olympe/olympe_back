-- -------------------------------------------------------------
-- TablePlus 6.0.0(550)
--
-- https://tableplus.com/
--
-- Database: db_olympe
-- Generation Time: 2024-05-16 14:12:20.3490
-- -------------------------------------------------------------
CREATE EXTENSION "uuid-ossp";

-- -------------------------------------------------------------
-- ROLE TABLE
-- -------------------------------------------------------------
DROP TABLE IF EXISTS "public"."role" CASCADE;
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS role_id_seq;
DROP TYPE IF EXISTS "public"."role_label_enum";
CREATE TYPE "public"."role_label_enum" AS ENUM ('user', 'admin');

-- Table Definition
CREATE TABLE "public"."role" (
    "id" int4 NOT NULL DEFAULT nextval('role_id_seq'::regclass),
    "label" "public"."role_label_enum" NOT NULL,
    PRIMARY KEY ("id")
);

-- -------------------------------------------------------------
-- ROLE INSERT
-- -------------------------------------------------------------
-- Indices
CREATE UNIQUE INDEX "PK_b36bcfe02fc8de3c57a8b2391c2" ON public.role USING btree (id);

INSERT INTO "public"."role" ("id", "label") VALUES
(1, 'admin'),
(2, 'user');



-- -------------------------------------------------------------
-- USER TABLE
-- -------------------------------------------------------------
DROP TABLE IF EXISTS "public"."user" CASCADE;
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."user" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" timestamp NOT NULL DEFAULT now(),
    "updatedAt" timestamp NOT NULL DEFAULT now(),
    "email" varchar NOT NULL,
    "password" varchar NOT NULL,
    "firstname" varchar(100),
    "lastname" varchar(100),
    "phone" varchar(30),
    "isConnected" bool NOT NULL DEFAULT false,
    "roleId" int4,
    CONSTRAINT "FK_c28e52f758e7bbc53828db92194" FOREIGN KEY ("roleId") REFERENCES "public"."role"("id"),
    PRIMARY KEY ("id")
);

-- -------------------------------------------------------------
-- USER INSERT
-- -------------------------------------------------------------
-- Indices
CREATE UNIQUE INDEX "PK_cace4a159ff9f2512dd42373760" ON public."user" USING btree (id);
CREATE UNIQUE INDEX "UQ_e12875dfb3b1d92d7d7c5377e22" ON public."user" USING btree (email);

INSERT INTO "public"."user" ("id", "createdAt", "updatedAt", "email", "password", "firstname", "lastname", "phone", "isConnected", "roleId") VALUES
('341aac51-55d9-48ef-9a1b-0634b3ac2633', '2024-05-19 22:04:00', '2024-05-19 22:04:00', 'william.jones@gmail.com', '$2a$10$HOJ9KXSD6tcYUWmnucyv2OYj6CaeJmjZTZuKIz.pjLu/n1znlnU3W', 'William', 'Jones', '654789123', 'f', 2),
('41fb99b2-96fb-4c91-bba5-5b9d6482dc40', '2024-05-24 22:09:00', '2024-05-24 22:09:00', 'ava.wilson@gmail.com', '$2a$10$HOJ9KXSD6tcYUWmnucyv2OYj6CaeJmjZTZuKIz.pjLu/n1znlnU3W', 'Ava', 'Wilson', '789123456', 'f', 2),
('4492db17-870e-4c34-8932-14162be04509', '2024-05-21 22:06:00', '2024-05-21 22:06:00', 'james.taylor@gmail.com', '$2a$10$HOJ9KXSD6tcYUWmnucyv2OYj6CaeJmjZTZuKIz.pjLu/n1znlnU3W', 'James', 'Taylor', '321987654', 'f', 2),
('9263d4bf-f82d-4610-85bc-6f14b0ea6d0b', '2024-05-17 22:02:00', '2024-05-17 22:02:00', 'michael.brown@gmail.com', '$2a$10$HOJ9KXSD6tcYUWmnucyv2OYj6CaeJmjZTZuKIz.pjLu/n1znlnU3W', 'Michael', 'Brown', '456123789', 'f', 2),
('9800ebcd-e43e-4ab5-a584-0f578a5a9676', '2024-05-18 22:03:00', '2024-05-18 22:03:00', 'emily.wilson@gmail.com', '$2a$10$HOJ9KXSD6tcYUWmnucyv2OYj6CaeJmjZTZuKIz.pjLu/n1znlnU3W', 'Emily', 'Wilson', '987123456', 'f', 2),
('b80a8b07-0b82-4364-beb4-ebd68980fcf4', '2024-05-16 22:01:00', '2024-05-16 22:01:00', 'jane.smith@gmail.com', '$2a$10$HOJ9KXSD6tcYUWmnucyv2OYj6CaeJmjZTZuKIz.pjLu/n1znlnU3W', 'Jane', 'Smith', '987654321', 'f', 2),
('be9fb551-0311-4c64-9b03-cf5699d0b1fa', '2024-05-23 22:08:00', '2024-05-23 22:08:00', 'liam.miller@gmail.com', '$2a$10$HOJ9KXSD6tcYUWmnucyv2OYj6CaeJmjZTZuKIz.pjLu/n1znlnU3W', 'Liam', 'Miller', '456789123', 'f', 2),
('d6dfa6e6-33f8-4de7-9a5d-7b8635cf88d9', '2024-05-22 22:07:00', '2024-05-22 22:07:00', 'emma.anderson@gmail.com', '$2a$10$HOJ9KXSD6tcYUWmnucyv2OYj6CaeJmjZTZuKIz.pjLu/n1znlnU3W', 'Emma', 'Anderson', '123789456', 'f', 2),
('f1c3460c-8d2c-4f93-987a-11ac4f4c11c5', '2024-05-15 22:00:00', '2024-05-15 22:00:00', 'john.doe@gmail.com', '$2a$10$HOJ9KXSD6tcYUWmnucyv2OYj6CaeJmjZTZuKIz.pjLu/n1znlnU3W', 'John', 'Doe', '123456789', 'f', 1),
('fefe9421-aa5f-4cd9-9efc-7164376fa66f', '2024-05-20 22:05:00', '2024-05-20 22:05:00', 'olivia.davis@gmail.com', '$2a$10$HOJ9KXSD6tcYUWmnucyv2OYj6CaeJmjZTZuKIz.pjLu/n1znlnU3W', 'Olivia', 'Davis', '789456123', 'f', 2);



-- -------------------------------------------------------------
-- COUNTRY TABLE
-- -------------------------------------------------------------
DROP TABLE IF EXISTS "public"."country" CASCADE;
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS country_id_seq;

-- Table Definition
CREATE TABLE "public"."country" (
    "id" int4 NOT NULL DEFAULT nextval('country_id_seq'::regclass),
    "iso" varchar(2) NOT NULL,
    "name" varchar(80) NOT NULL,
    "nicename" varchar(80) NOT NULL,
    "isParticpate" bool NOT NULL DEFAULT true,
    PRIMARY KEY ("id")
);

-- Indices
CREATE UNIQUE INDEX "UQ_fdb1c6926f72e5fd94d4603d37c" ON public.country USING btree (iso);
CREATE UNIQUE INDEX "UQ_2c5aa339240c0c3ae97fcc9dc4c" ON public.country USING btree (name);
CREATE UNIQUE INDEX "UQ_98296cc67cc9292af11b7b206dd" ON public.country USING btree (nicename);

-- -------------------------------------------------------------
-- COUNTRY INSERT
-- -------------------------------------------------------------
INSERT INTO "public"."country" ("id", "iso", "name", "nicename", "isParticpate") VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 't'),
(2, 'AL', 'ALBANIA', 'Albania', 't'),
(3, 'DZ', 'ALGERIA', 'Algeria', 't'),
(4, 'AD', 'ANDORRA', 'Andorra', 't'),
(5, 'AO', 'ANGOLA', 'Angola', 't'),
(6, 'AI', 'ANGUILLA', 'Anguilla', 't'),
(7, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 't'),
(8, 'AR', 'ARGENTINA', 'Argentina', 't'),
(9, 'AM', 'ARMENIA', 'Armenia', 't'),
(10, 'AW', 'ARUBA', 'Aruba', 't'),
(11, 'AU', 'AUSTRALIA', 'Australia', 't'),
(12, 'AT', 'AUSTRIA', 'Austria', 't'),
(13, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 't'),
(14, 'BS', 'BAHAMAS', 'Bahamas', 't'),
(15, 'BH', 'BAHRAIN', 'Bahrain', 't'),
(16, 'BD', 'BANGLADESH', 'Bangladesh', 't'),
(17, 'BB', 'BARBADOS', 'Barbados', 't'),
(18, 'BY', 'BELARUS', 'Belarus', 't'),
(19, 'BE', 'BELGIUM', 'Belgium', 't'),
(20, 'BZ', 'BELIZE', 'Belize', 't'),
(21, 'BJ', 'BENIN', 'Benin', 't'),
(22, 'BM', 'BERMUDA', 'Bermuda', 't'),
(23, 'BT', 'BHUTAN', 'Bhutan', 't'),
(24, 'BO', 'BOLIVIA', 'Bolivia', 't'),
(25, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 't'),
(26, 'BW', 'BOTSWANA', 'Botswana', 't'),
(27, 'BR', 'BRAZIL', 'Brazil', 't'),
(28, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 't'),
(29, 'BG', 'BULGARIA', 'Bulgaria', 't'),
(30, 'BF', 'BURKINA FASO', 'Burkina Faso', 't'),
(31, 'BI', 'BURUNDI', 'Burundi', 't'),
(32, 'KH', 'CAMBODIA', 'Cambodia', 't'),
(33, 'CM', 'CAMEROON', 'Cameroon', 't'),
(34, 'CA', 'CANADA', 'Canada', 't'),
(35, 'CV', 'CAPE VERDE', 'Cape Verde', 't'),
(36, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 't'),
(37, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 't'),
(38, 'TD', 'CHAD', 'Chad', 't'),
(39, 'CL', 'CHILE', 'Chile', 't'),
(40, 'CN', 'CHINA', 'China', 't'),
(41, 'CO', 'COLOMBIA', 'Colombia', 't'),
(42, 'KM', 'COMOROS', 'Comoros', 't'),
(43, 'CG', 'CONGO', 'Congo', 't'),
(44, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 't'),
(45, 'CK', 'COOK ISLANDS', 'Cook Islands', 't'),
(46, 'CR', 'COSTA RICA', 'Costa Rica', 't'),
(47, 'CI', 'COTE D''IVOIRE', 'Cote d''Ivoire', 't'),
(48, 'HR', 'CROATIA', 'Croatia', 't'),
(49, 'CU', 'CUBA', 'Cuba', 't'),
(50, 'CW', 'CURACAO', 'Curacao', 't'),
(51, 'CY', 'CYPRUS', 'Cyprus', 't'),
(52, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 't'),
(53, 'DK', 'DENMARK', 'Denmark', 't'),
(54, 'DJ', 'DJIBOUTI', 'Djibouti', 't'),
(55, 'DM', 'DOMINICA', 'Dominica', 't'),
(56, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 't'),
(57, 'EC', 'ECUADOR', 'Ecuador', 't'),
(58, 'EG', 'EGYPT', 'Egypt', 't'),
(59, 'SV', 'EL SALVADOR', 'El Salvador', 't'),
(60, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 't'),
(61, 'ER', 'ERITREA', 'Eritrea', 't'),
(62, 'EE', 'ESTONIA', 'Estonia', 't'),
(63, 'ET', 'ETHIOPIA', 'Ethiopia', 't'),
(64, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 't'),
(65, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 't'),
(66, 'FJ', 'FIJI', 'Fiji', 't'),
(67, 'FI', 'FINLAND', 'Finland', 't'),
(68, 'FR', 'FRANCE', 'France', 't'),
(69, 'GF', 'FRENCH GUIANA', 'French Guiana', 't'),
(70, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 't'),
(71, 'GA', 'GABON', 'Gabon', 't'),
(72, 'GM', 'GAMBIA', 'Gambia', 't'),
(73, 'GE', 'GEORGIA', 'Georgia', 't'),
(74, 'DE', 'GERMANY', 'Germany', 't'),
(75, 'GH', 'GHANA', 'Ghana', 't'),
(76, 'GI', 'GIBRALTAR', 'Gibraltar', 't'),
(77, 'GR', 'GREECE', 'Greece', 't'),
(78, 'GL', 'GREENLAND', 'Greenland', 't'),
(79, 'GD', 'GRENADA', 'Grenada', 't'),
(80, 'GP', 'GUADELOUPE', 'Guadeloupe', 't'),
(81, 'GU', 'GUAM', 'Guam', 't'),
(82, 'GT', 'GUATEMALA', 'Guatemala', 't'),
(83, 'GG', 'GUERNSEY', 'Guernsey', 't'),
(84, 'GN', 'GUINEA', 'Guinea', 't'),
(85, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 't'),
(86, 'GY', 'GUYANA', 'Guyana', 't'),
(87, 'HT', 'HAITI', 'Haiti', 't'),
(88, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 't'),
(89, 'HN', 'HONDURAS', 'Honduras', 't'),
(90, 'HK', 'HONG KONG', 'Hong Kong', 't'),
(91, 'HU', 'HUNGARY', 'Hungary', 't'),
(92, 'IS', 'ICELAND', 'Iceland', 't'),
(93, 'IN', 'INDIA', 'India', 't'),
(94, 'ID', 'INDONESIA', 'Indonesia', 't'),
(95, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 't'),
(96, 'IQ', 'IRAQ', 'Iraq', 't'),
(97, 'IE', 'IRELAND', 'Ireland', 't'),
(98, 'IM', 'ISLE OF MAN', 'Isle of Man', 't'),
(99, 'IL', 'ISRAEL', 'Israel', 't'),
(100, 'IT', 'ITALY', 'Italy', 't'),
(101, 'JM', 'JAMAICA', 'Jamaica', 't'),
(102, 'JP', 'JAPAN', 'Japan', 't'),
(103, 'JE', 'JERSEY', 'Jersey', 't'),
(104, 'JO', 'JORDAN', 'Jordan', 't'),
(105, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 't'),
(106, 'KE', 'KENYA', 'Kenya', 't'),
(107, 'KI', 'KIRIBATI', 'Kiribati', 't'),
(108, 'KW', 'KUWAIT', 'Kuwait', 't'),
(109, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 't'),
(110, 'LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 't'),
(111, 'LV', 'LATVIA', 'Latvia', 't'),
(112, 'LB', 'LEBANON', 'Lebanon', 't'),
(113, 'LS', 'LESOTHO', 'Lesotho', 't'),
(114, 'LR', 'LIBERIA', 'Liberia', 't'),
(115, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 't'),
(116, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 't'),
(117, 'LT', 'LITHUANIA', 'Lithuania', 't'),
(118, 'LU', 'LUXEMBOURG', 'Luxembourg', 't'),
(119, 'MO', 'MACAO', 'Macao', 't'),
(120, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the former Yugoslav Republic of', 't'),
(121, 'MG', 'MADAGASCAR', 'Madagascar', 't'),
(122, 'MW', 'MALAWI', 'Malawi', 't'),
(123, 'MY', 'MALAYSIA', 'Malaysia', 't'),
(124, 'MV', 'MALDIVES', 'Maldives', 't'),
(125, 'ML', 'MALI', 'Mali', 't'),
(126, 'MT', 'MALTA', 'Malta', 't'),
(127, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 't'),
(128, 'MQ', 'MARTINIQUE', 'Martinique', 't'),
(129, 'MR', 'MAURITANIA', 'Mauritania', 't'),
(130, 'MU', 'MAURITIUS', 'Mauritius', 't'),
(131, 'YT', 'MAYOTTE', 'Mayotte', 't'),
(132, 'MX', 'MEXICO', 'Mexico', 't'),
(133, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 't'),
(134, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 't'),
(135, 'MC', 'MONACO', 'Monaco', 't'),
(136, 'MN', 'MONGOLIA', 'Mongolia', 't'),
(137, 'ME', 'MONTENEGRO', 'Montenegro', 't'),
(138, 'MS', 'MONTSERRAT', 'Montserrat', 't'),
(139, 'MA', 'MOROCCO', 'Morocco', 't'),
(140, 'MZ', 'MOZAMBIQUE', 'Mozambique', 't'),
(141, 'MM', 'MYANMAR', 'Myanmar', 't'),
(142, 'NA', 'NAMIBIA', 'Namibia', 't'),
(143, 'NR', 'NAURU', 'Nauru', 't'),
(144, 'NP', 'NEPAL', 'Nepal', 't'),
(145, 'NL', 'NETHERLANDS', 'Netherlands', 't'),
(146, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 't'),
(147, 'NC', 'NEW CALEDONIA', 'New Caledonia', 't'),
(148, 'NZ', 'NEW ZEALAND', 'New Zealand', 't'),
(149, 'NI', 'NICARAGUA', 'Nicaragua', 't'),
(150, 'NE', 'NIGER', 'Niger', 't'),
(151, 'NG', 'NIGERIA', 'Nigeria', 't'),
(152, 'NU', 'NIUE', 'Niue', 't'),
(153, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 't'),
(154, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 't'),
(155, 'NO', 'NORWAY', 'Norway', 't'),
(156, 'OM', 'OMAN', 'Oman', 't'),
(157, 'PK', 'PAKISTAN', 'Pakistan', 't'),
(158, 'PW', 'PALAU', 'Palau', 't'),
(159, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', 't'),
(160, 'PA', 'PANAMA', 'Panama', 't'),
(161, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 't'),
(162, 'PY', 'PARAGUAY', 'Paraguay', 't'),
(163, 'PE', 'PERU', 'Peru', 't'),
(164, 'PH', 'PHILIPPINES', 'Philippines', 't'),
(165, 'PN', 'PITCAIRN', 'Pitcairn', 't'),
(166, 'PL', 'POLAND', 'Poland', 't'),
(167, 'PT', 'PORTUGAL', 'Portugal', 't'),
(168, 'PR', 'PUERTO RICO', 'Puerto Rico', 't'),
(169, 'QA', 'QATAR', 'Qatar', 't'),
(170, 'RE', 'REUNION', 'Reunion', 't'),
(171, 'RO', 'ROMANIA', 'Romania', 't'),
(172, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 't'),
(173, 'RW', 'RWANDA', 'Rwanda', 't'),
(174, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 't'),
(175, 'SH', 'SAINT HELENA', 'Saint Helena', 't'),
(176, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 't'),
(177, 'LC', 'SAINT LUCIA', 'Saint Lucia', 't'),
(178, 'MF', 'SAINT MARTIN', 'Saint Martin', 't'),
(179, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 't'),
(180, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 't'),
(181, 'WS', 'SAMOA', 'Samoa', 't'),
(182, 'SM', 'SAN MARINO', 'San Marino', 't'),
(183, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 't'),
(184, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 't'),
(185, 'SN', 'SENEGAL', 'Senegal', 't'),
(186, 'RS', 'SERBIA', 'Serbia', 't'),
(187, 'SC', 'SEYCHELLES', 'Seychelles', 't'),
(188, 'SL', 'SIERRA LEONE', 'Sierra Leone', 't'),
(189, 'SG', 'SINGAPORE', 'Singapore', 't'),
(190, 'SX', 'SINT MAARTEN', 'Sint Maarten', 't'),
(191, 'SK', 'SLOVAKIA', 'Slovakia', 't'),
(192, 'SI', 'SLOVENIA', 'Slovenia', 't'),
(193, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 't'),
(194, 'SO', 'SOMALIA', 'Somalia', 't'),
(195, 'ZA', 'SOUTH AFRICA', 'South Africa', 't'),
(196, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', 't'),
(197, 'SS', 'SOUTH SUDAN', 'South Sudan', 't'),
(198, 'ES', 'SPAIN', 'Spain', 't'),
(199, 'LK', 'SRI LANKA', 'Sri Lanka', 't'),
(200, 'SD', 'SUDAN', 'Sudan', 't'),
(201, 'SR', 'SURINAME', 'Suriname', 't'),
(202, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 't'),
(203, 'SZ', 'SWAZILAND', 'Swaziland', 't'),
(204, 'SE', 'SWEDEN', 'Sweden', 't'),
(205, 'CH', 'SWITZERLAND', 'Switzerland', 't'),
(206, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 't'),
(207, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 't'),
(208, 'TJ', 'TAJIKISTAN', 'Tajikistan', 't'),
(209, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 't'),
(210, 'TH', 'THAILAND', 'Thailand', 't'),
(211, 'TL', 'TIMOR-LESTE', 'Timor-Leste', 't'),
(212, 'TG', 'TOGO', 'Togo', 't'),
(213, 'TK', 'TOKELAU', 'Tokelau', 't'),
(214, 'TO', 'TONGA', 'Tonga', 't'),
(215, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 't'),
(216, 'TN', 'TUNISIA', 'Tunisia', 't'),
(217, 'TR', 'TURKEY', 'Turkey', 't'),
(218, 'TM', 'TURKMENISTAN', 'Turkmenistan', 't'),
(219, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 't'),
(220, 'TV', 'TUVALU', 'Tuvalu', 't'),
(221, 'UG', 'UGANDA', 'Uganda', 't'),
(222, 'UA', 'UKRAINE', 'Ukraine', 't'),
(223, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 't'),
(224, 'GB', 'UNITED KINGDOM', 'United Kingdom', 't'),
(225, 'US', 'UNITED STATES', 'United States', 't'),
(226, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', 't'),
(227, 'UY', 'URUGUAY', 'Uruguay', 't'),
(228, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 't'),
(229, 'VU', 'VANUATU', 'Vanuatu', 't'),
(230, 'VE', 'VENEZUELA', 'Venezuela', 't'),
(231, 'VN', 'VIET NAM', 'Viet Nam', 't'),
(232, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 't'),
(233, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.S.', 't'),
(234, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 't'),
(235, 'EH', 'WESTERN SAHARA', 'Western Sahara', 't'),
(236, 'YE', 'YEMEN', 'Yemen', 't'),
(237, 'ZM', 'ZAMBIA', 'Zambia', 't'),
(238, 'ZW', 'ZIMBABWE', 'Zimbabwe', 't');



-- -------------------------------------------------------------
-- ATHLETE TABLE
-- -------------------------------------------------------------
DROP TABLE IF EXISTS "public"."athlete" CASCADE;
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

DROP TYPE IF EXISTS "public"."athlete_gender_enum";
CREATE TYPE "public"."athlete_gender_enum" AS ENUM ('M', 'F');

-- Table Definition
CREATE TABLE "public"."athlete" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" timestamp NOT NULL DEFAULT now(),
    "updatedAt" timestamp NOT NULL DEFAULT now(),
    "firstname" varchar(100) NOT NULL,
    "lastname" varchar(100) NOT NULL,
    "gender" "public"."athlete_gender_enum" NOT NULL,
    "age" int4 NOT NULL,
    "height" int4 NOT NULL,
    "weight" int4 NOT NULL,
    "pictureProfile" varchar(500),
    "countryId" int4,
    CONSTRAINT "FK_d5f99b87d33d93728f574d62179" FOREIGN KEY ("countryId") REFERENCES "public"."country"("id"),
    PRIMARY KEY ("id")
);

-- -------------------------------------------------------------
-- ATHLETE INSERT
-- -------------------------------------------------------------
INSERT INTO "public"."athlete" ("id", "createdAt", "updatedAt", "firstname", "lastname", "gender", "age", "height", "weight", "pictureProfile", "countryId") VALUES
('0d67d24d-df5a-4bb6-959c-af0714edfaa1', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Stephen', 'Anthony Abas', 'M', 26, 165, 55, NULL, 2),
('1c3e524d-69d1-43d3-bc2c-65ac01147fff', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Aleksey', 'Aleksandrovich Abalmasov', 'M', 28, 180, 83, NULL, 9),
('1cd50787-44af-480e-b99a-594d065e687b', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Jol', 'Marc Abati', 'M', 38, 190, 85, NULL, 5),
('20a6b92a-d208-4031-a344-efcfadd7ff7e', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Edgar', 'Lindenau Aabye', 'M', 34, 177, 73, NULL, 2),
('2ea0ec41-8763-4585-a398-077e075af98a', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Tamila', 'Rashidovna Abasova', 'F', 21, 163, 60, NULL, 2),
('3792bf6d-b0e6-41a0-a73e-5943e0787487', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Ragnhild', 'Margrethe Aamodt', 'F', 27, 163, 73, NULL, 6),
('433c6825-7baf-4132-9295-c8b77e31f5aa', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Agostino', 'Abbagnale', 'M', 22, 188, 96, NULL, 10),
('51c7bb47-4ea8-420b-b560-28896d8409fb', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Arvo', 'Ossian Aaltonen', 'M', 30, 177, 73, NULL, 2),
('5be1e36f-4cca-4d80-a408-e6f0a402fddf', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Giovanni', 'Abagnale', 'M', 21, 198, 90, NULL, 6),
('7158bec2-8f35-41a4-89d1-3637c5d8810d', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Jouan', 'Patrice Abanda Etong', 'M', 22, 185, 82, NULL, 6),
('7b7667af-5ad4-4e77-94e4-a27605ebca6b', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Ann', 'Kristin Aarnes', 'F', 23, 182, 64, NULL, 10),
('85b91b70-3c00-4290-964e-83fbfb00b9de', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Kjetil', 'Andr Aamodt', 'M', 20, 176, 85, NULL, 7),
('872aef53-1963-45e8-8d3e-376c2a35b8d5', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Pter', 'Abay', 'M', 30, 181, 79, NULL, 7),
('977e88d7-abd4-4bf2-af5c-fee2c1e40fc6', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Willemien', 'Aardenburg', 'F', 22, 177, 73, NULL, 8),
('99636b2d-5d1d-4979-9857-4dbfbc577c4e', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Karl', 'Jan Aas', 'M', 20, 177, 73, NULL, 7),
('9b486db7-cc66-4b88-a454-445c72c33c90', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Paavo', 'Johannes Aaltonen', 'M', 28, 175, 64, NULL, 10),
('a5014aa7-f66f-4197-8ecb-9c3b4ebb3e3c', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Pepijn', 'Aardewijn', 'M', 26, 189, 72, NULL, 3),
('a599dbb8-d294-4f57-a85c-db907987f1e1', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Alejandro', 'Abascal Garca', 'M', 28, 181, 82, NULL, 6),
('b626844a-472a-49e0-9c58-40de3c4f3ef3', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Alf', 'Lied Aanning', 'M', 24, 177, 73, NULL, 9),
('b7ba05e0-212d-4aef-9323-b67a044f278c', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Oszkr', 'Abay-Nemes', 'M', 22, 177, 73, NULL, 3),
('bfcdd9e2-1607-44d6-88cd-2289334ecf16', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Jos', 'Luis Abajo Gmez', 'M', 30, 194, 87, NULL, 10),
('c0d560f9-1e1a-4e8d-82fb-fb868b943204', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Carmine', 'Abbagnale', 'M', 22, 182, 90, NULL, 5),
('c3d3dc98-8b29-4b7e-8e48-d24a1637b725', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Luc', 'Abalo', 'M', 23, 182, 86, NULL, 8),
('d10d8827-59bf-4607-a62a-0cbc9797d307', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Thomas', 'Valentin Aas', 'M', 25, 177, 73, NULL, 7),
('d694cd8f-3226-4af5-a5fe-5625f38663c1', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Jos', 'Mara Abarca Plotas', 'M', 22, 186, 83, NULL, 8),
('d6ee8b5c-7117-4c0d-92a1-6dd9fb22826e', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Jos', 'Manuel Abascal Gmez', 'M', 26, 182, 67, NULL, 8),
('d8993f70-d2a4-4577-a9ca-c45b96839629', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Juhamatti', 'Tapio Aaltonen', 'M', 28, 184, 85, NULL, 10),
('dd769e0a-091c-4b40-bcc8-4fb57bd1ee0e', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Roald', 'Edgar Aas', 'M', 23, 177, 73, NULL, 4),
('e19815b9-e06f-4208-a6a5-ed04b6f1ff7c', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Mariya', 'Vasilyevna Abakumova (-Tarabina)', 'F', 22, 179, 80, NULL, 4),
('e549ce87-e40d-4191-8a13-cf821369abeb', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Ren', 'Abadie', 'M', 21, 177, 73, NULL, 3),
('e977231a-6f2e-40c6-8622-7e80c1c504ac', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Patimat', 'Abakarova', 'F', 21, 165, 49, NULL, 5),
('ead2d966-43bf-4465-afa6-0d4df8d672be', '2024-05-16 08:30:51.21705', '2024-05-16 08:30:51.21705', 'Silvano', 'Abba', 'M', 25, 177, 73, NULL, 10);


-- -------------------------------------------------------------
-- SPORT_FIELD TABLE
-- -------------------------------------------------------------
DROP TABLE IF EXISTS "public"."sport_field" CASCADE;
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS sport_field_id_seq;
DROP TYPE IF EXISTS "public"."sport_field_label_enum";
CREATE TYPE "public"."sport_field_label_enum" AS ENUM ('Athletics', 'Swimming', 'Gymnastics', 'Football', 'Basketball', 'Tennis', 'Volleyball', 'Field hockey', 'Rugby sevens', 'Cycling', 'Boxing', 'Fencing', 'Judo', 'Taekwondo', 'Wrestling', 'Shooting', 'Sailing', 'Equestrian', 'Canoeing', 'Rowing', 'Badminton', 'Baseball', 'Softball', 'Archery', 'Modern pentathlon', 'Triathlon', 'Synchronized swimming', 'Diving', 'Weightlifting', 'Handball', 'Golf', 'Rugby union', 'Sport climbing', 'Skateboarding', 'Surfing');

-- Table Definition
CREATE TABLE "public"."sport_field" (
    "createdAt" timestamp NOT NULL DEFAULT now(),
    "updatedAt" timestamp NOT NULL DEFAULT now(),
    "label" "public"."sport_field_label_enum" NOT NULL,
    "id" int4 NOT NULL DEFAULT nextval('sport_field_id_seq'::regclass),
    PRIMARY KEY ("id")
);

-- Indices
CREATE UNIQUE INDEX "PK_82825bd3d86802e2df3ae4c32fc" ON public.sport_field USING btree (id);

-- -------------------------------------------------------------
-- SPORT_FIELD INSERT
-- -------------------------------------------------------------
INSERT INTO "public"."sport_field" ("createdAt", "updatedAt", "label", "id") VALUES
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Athletics', 1),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Swimming', 2),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Gymnastics', 3),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Football', 4),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Basketball', 5),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Tennis', 6),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Volleyball', 7),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Field hockey', 8),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Rugby sevens', 9),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Cycling', 10),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Boxing', 11),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Fencing', 12),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Judo', 13),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Taekwondo', 14),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Wrestling', 15),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Shooting', 16),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Sailing', 17),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Equestrian', 18),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Canoeing', 19),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Rowing', 20),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Badminton', 21),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Baseball', 22),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Softball', 23),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Archery', 24),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Modern pentathlon', 25),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Triathlon', 26),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Synchronized swimming', 27),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Diving', 28),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Weightlifting', 29),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Handball', 30),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Golf', 31),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Rugby union', 32),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Sport climbing', 33),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Skateboarding', 34),
('2024-05-16 08:59:23.471344', '2024-05-16 08:59:23.471344', 'Surfing', 35);


-- -------------------------------------------------------------
-- SPORT TABLE
-- -------------------------------------------------------------
DROP TABLE IF EXISTS "public"."sport" CASCADE;
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS sport_id_seq;
DROP TYPE IF EXISTS "public"."sport_gender_enum";
CREATE TYPE "public"."sport_gender_enum" AS ENUM ('M', 'F');

-- Table Definition
CREATE TABLE "public"."sport" (
    "createdAt" timestamp NOT NULL DEFAULT now(),
    "updatedAt" timestamp NOT NULL DEFAULT now(),
    "gender" "public"."sport_gender_enum" NOT NULL,
    "isTeam" bool NOT NULL DEFAULT false,
    "sportFieldId" int4,
    "id" int4 NOT NULL DEFAULT nextval('sport_id_seq'::regclass),
    "label" varchar(100) NOT NULL,
    CONSTRAINT "FK_146bea35c52f0c668c7b02aa2d5" FOREIGN KEY ("sportFieldId") REFERENCES "public"."sport_field"("id"),
    PRIMARY KEY ("id")
);

-- Indices
CREATE UNIQUE INDEX "UQ_248808f92d9e7f2fcdfca8c67f4" ON public.sport USING btree (label);
CREATE UNIQUE INDEX "PK_c67275331afac347120a1032825" ON public.sport USING btree (id);

-- -------------------------------------------------------------
-- SPORT INSERT
-- -------------------------------------------------------------
INSERT INTO "public"."sport" ("createdAt", "updatedAt", "gender", "isTeam", "sportFieldId", "id", "label") VALUES
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 1, 'Swimming Men''s 200 metres Breaststroke'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 2, 'Swimming Men''s 400 metres Breaststroke'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 3, 3, 'Gymnastics Men''s Individual All-Around'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 3, 4, 'Gymnastics Men''s Team All-Around'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 3, 5, 'Gymnastics Men''s Horse Vault'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 3, 6, 'Gymnastics Men''s Pommelled Horse'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 't', 30, 7, 'Handball Women''s Handball'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 3, 8, 'Gymnastics Men''s Team All-Around, Free System'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 20, 9, 'Rowing Men''s Lightweight Double Sculls'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 't', 4, 10, 'Football Women''s Football'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 10, 11, 'Cycling Men''s Road Race, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 20, 12, 'Rowing Men''s Coxless Pairs'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 12, 13, 'Fencing Men''s epee, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 14, 14, 'Taekwondo Women''s Flyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 15, 'Athletics Women''s Javelin Throw'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 16, 'Canoeing Men''s Kayak Fours, 1,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 30, 17, 'Handball Men''s Handball'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 4, 18, 'Football Men''s Football'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 19, 'Wrestling Men''s Featherweight, Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 20, 'Athletics Men''s 1,500 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 10, 21, 'Cycling Women''s Sprint'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 12, 22, 'Fencing Men''s Sabre, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 23, 'Swimming Men''s 4 x 200 metres Freestyle Relay'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 20, 24, 'Rowing Men''s Quadruple Sculls'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 20, 25, 'Rowing Men''s Double Sculls'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 20, 26, 'Rowing Men''s Coxed Pairs'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 31, 27, 'Golf Women''s Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 't', 23, 28, 'Softball Women''s Softball'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 14, 29, 'Taekwondo Women''s Featherweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 30, 'Wrestling Men''s Middleweight, Greco-Roman'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 2, 31, 'Swimming Women''s 4 x 100 metres Medley Relay'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 11, 32, 'Boxing Men''s Light-Welterweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 33, 'Wrestling Men''s Flyweight, Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 34, 'Wrestling Men''s Bantamweight, Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 5, 35, 'Basketball Men''s Basketball'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 36, 'Wrestling Men''s Light-Heavyweight, Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 37, 'Athletics Men''s Hammer Throw'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 38, 'Athletics Men''s 10,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 't', 3, 39, 'Gymnastics Women''s Team All-Around'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 28, 40, 'Diving Women''s Synchronized Springboard'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 20, 41, 'Rowing Men''s Coxed Eights'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 42, 'Athletics Men''s Marathon'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 43, 'Athletics Men''s Long Jump'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 44, 'Athletics Men''s Triple Jump'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 22, 45, 'Baseball Men''s Baseball'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 2, 46, 'Swimming Women''s 4 x 100 metres Freestyle Relay'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 47, 'Athletics Women''s 5,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 48, 'Wrestling Men''s Middleweight, Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 49, 'Athletics Men''s 4 x 400 metres Relay'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 3, 50, 'Gymnastics Men''s Floor Exercise'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 3, 51, 'Gymnastics Men''s Rings'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 52, 'Swimming Men''s 4 x 100 metres Freestyle Relay'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 12, 53, 'Fencing Men''s Foil, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 54, 'Canoeing Men''s Kayak Doubles, 500 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 55, 'Swimming Men''s 4 x 100 metres Medley Relay'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 56, 'Wrestling Men''s Light-Heavyweight, Greco-Roman'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 57, 'Athletics Men''s 100 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 58, 'Athletics Men''s 4 x 100 metres Relay'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 7, 59, 'Volleyball Men''s Volleyball'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 't', 7, 60, 'Volleyball Women''s Volleyball'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 't', 5, 61, 'Basketball Women''s Basketball'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 62, 'Wrestling Men''s Lightweight, Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 63, 'Cycling Men''s Mountainbike, Cross-Country'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 14, 64, 'Taekwondo Men''s Featherweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 12, 65, 'Fencing Men''s epee, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 11, 66, 'Boxing Men''s Welterweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 67, 'Wrestling Men''s Flyweight, Greco-Roman'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 10, 68, 'Cycling Men''s 100 kilometres Team Time Trial'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 11, 69, 'Boxing Men''s Featherweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 11, 70, 'Boxing Men''s Bantamweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 20, 71, 'Rowing Women''s Coxed Eights'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 20, 72, 'Rowing Women''s Quadruple Sculls'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 3, 73, 'Gymnastics Men''s Team All-Around, Swedish System'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 11, 74, 'Boxing Men''s Heavyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 11, 75, 'Boxing Men''s Lightweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 12, 76, 'Fencing Men''s Foil, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 10, 77, 'Cycling Men''s Team Pursuit, 4,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 78, 'Athletics Men''s Standing High Jump'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 79, 'Athletics Men''s Standing Long Jump'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 80, 'Swimming Men''s Plunge For Distance'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 81, 'Shooting Men''s Military Rifle, 200, 400, 500 and 600 metres, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 13, 82, 'Judo Men''s Lightweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 13, 83, 'Judo Men''s Half-Middleweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 11, 84, 'Boxing Women''s Flyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 85, 'Athletics Women''s Shot Put'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 86, 'Shooting Men''s Military Rifle, 300 metres and 600 metres, Prone, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 87, 'Canoeing Men''s Canadian Doubles, Slalom'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 88, 'Athletics Men''s 400 metres Hurdles'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 6, 89, 'Tennis Women''s Singles, Covered Courts'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 28, 90, 'Diving Men''s Platform'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 28, 91, 'Diving Men''s Plain High'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 2, 92, 'Swimming Women''s 400 metres Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 2, 93, 'Swimming Women''s 800 metres Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 94, 'Swimming Men''s 100 metres Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 95, 'Swimming Men''s 50 metres Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 96, 'Athletics Women''s 4 x 400 metres Relay'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 20, 97, 'Rowing Women''s Coxed Quadruple Sculls'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 3, 98, 'Gymnastics Women''s Horse Vault'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 20, 99, 'Rowing Men''s Coxless Fours'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 6, 100, 'Tennis Men''s Singles'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 13, 101, 'Judo Women''s Half-Middleweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 102, 'Swimming Men''s 200 metres Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 't', 12, 103, 'Fencing Women''s Foil, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 20, 104, 'Rowing Men''s 17-Man Naval Rowing Boats'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 29, 105, 'Weightlifting Women''s Flyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 106, 'Wrestling Men''s Bantamweight, Greco-Roman'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 107, 'Wrestling Men''s Middleweight B, Greco-Roman'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 2, 108, 'Swimming Women''s 100 metres Butterfly'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 29, 109, 'Weightlifting Men''s Heavyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 110, 'Canoeing Men''s Kayak Singles, Slalom'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 17, 111, 'Sailing Men''s One Person Dinghy'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 17, 112, 'Sailing Men''s One Person Heavyweight Dinghy'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 113, 'Cycling Men''s Madison'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 114, 'Shooting Men''s Small-Bore Rifle, Prone, 50 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 115, 'Athletics Women''s Long Jump'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 116, 'Canoeing Men''s Kayak Doubles, 10,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 117, 'Wrestling Men''s Super-Heavyweight, Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 118, 'Wrestling Men''s Heavyweight, Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 119, 'Athletics Women''s 4 x 100 metres Relay'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 29, 120, 'Weightlifting Men''s Middle-Heavyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 29, 121, 'Weightlifting Men''s Heavyweight II'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 't', 12, 122, 'Fencing Women''s Sabre, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 123, 'Shooting Men''s Skeet'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 124, 'Shooting Men''s Double Trap'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 125, 'Shooting Men''s Trap'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 17, 126, 'Sailing Women''s Windsurfer'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 6, 127, 'Tennis Men''s Doubles'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 29, 128, 'Weightlifting Men''s Super-Heavyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 129, 'Wrestling Men''s Lightweight, Greco-Roman'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 20, 130, 'Rowing Men''s Coxed Fours'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 131, 'Athletics Men''s High Jump'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 132, 'Cycling Men''s 50 kilometres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 17, 133, 'Sailing Women''s Two Person Dinghy'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 134, 'Athletics Men''s Discus Throw'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 20, 135, 'Rowing Women''s Double Sculls'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 136, 'Wrestling Men''s Heavyweight, Greco-Roman'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 28, 137, 'Diving Women''s Platform'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 13, 138, 'Judo Men''s Half-Lightweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 139, 'Wrestling Men''s Light-Flyweight, Greco-Roman'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 140, 'Shooting Men''s Air Rifle, 10 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 14, 141, 'Taekwondo Men''s Heavyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 142, 'Athletics Women''s 100 metres Hurdles'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 143, 'Shooting Men''s Rapid-Fire Pistol, 25 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 3, 144, 'Gymnastics Men''s Rope Climbing'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 24, 145, 'Archery Men''s Target Archery, 28 metres, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 24, 146, 'Archery Men''s Target Archery, 33 metres, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 24, 147, 'Archery Men''s Target Archery, 50 metres, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 148, 'Shooting Men''s Small-Bore Rifle, Three Positions, 50 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 26, 149, 'Triathlon Women''s Olympic Distance'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 20, 150, 'Rowing Men''s Coxed Fours, Inriggers'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 1, 151, 'Athletics Men''s Cross-Country, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 11, 152, 'Boxing Men''s Flyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 2, 153, 'Swimming Women''s 50 metres Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 2, 154, 'Swimming Women''s 100 metres Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 20, 155, 'Rowing Women''s Coxless Pairs'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 156, 'Athletics Men''s 10 kilometres Walk'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 13, 157, 'Judo Women''s Middleweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 11, 158, 'Boxing Men''s Super-Heavyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 3, 159, 'Gymnastics Women''s Individual All-Around'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 3, 160, 'Gymnastics Women''s Floor Exercise'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 20, 161, 'Rowing Men''s Lightweight Coxless Fours'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 11, 162, 'Boxing Men''s Middleweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 17, 163, 'Sailing Women''s One Person Dinghy'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 164, 'Athletics Men''s 3,000 metres Steeplechase'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 165, 'Shooting Men''s Small-Bore Rifle, 50 and 100 yards, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 166, 'Shooting Men''s Small-Bore Rifle, Disappearing Target, 25 yards'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 167, 'Athletics Women''s 400 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 168, 'Athletics Men''s 800 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 169, 'Shooting Men''s Military Pistol, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 170, 'Shooting Men''s Free Rifle, Three Positions, 300 metres, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 171, 'Wrestling Men''s Featherweight, Greco-Roman'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 15, 172, 'Wrestling Women''s Lightweight, Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 173, 'Canoeing Men''s Canadian Singles, 1,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 13, 174, 'Judo Women''s Half-Lightweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 175, 'Canoeing Men''s Canadian Doubles, 500 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 13, 176, 'Judo Women''s Heavyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 177, 'Athletics Men''s Pole Vault'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 178, 'Canoeing Men''s Kayak Singles, 1,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 179, 'Athletics Women''s Marathon'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 2, 180, 'Swimming Women''s 4 x 200 metres Freestyle Relay'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 181, 'Shooting Men''s Free Rifle, Three Positions, 300 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 182, 'Cycling Men''s Individual Pursuit, 4,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 2, 183, 'Swimming Women''s 10 kilometres Open Water'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 28, 184, 'Diving Men''s Springboard'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 185, 'Athletics Men''s 110 metres Hurdles'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 10, 186, 'Cycling Men''s Team Pursuit, 1,980 yards'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 19, 187, 'Canoeing Women''s Kayak Singles, 500 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 19, 188, 'Canoeing Women''s Kayak Doubles, 500 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 19, 189, 'Canoeing Women''s Kayak Fours, 500 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 190, 'Shooting Men''s Free Pistol, 50 metres, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 191, 'Wrestling Men''s Welterweight, Greco-Roman'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 192, 'Athletics Men''s Cross-Country, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 193, 'Wrestling Men''s Welterweight, Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 29, 194, 'Weightlifting Men''s Bantamweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 195, 'Athletics Men''s Shot Put'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 196, 'Swimming Men''s 1,200 metres Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 197, 'Cycling Men''s 5 mile'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 198, 'Cycling Men''s 25 mile'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 2, 199, 'Swimming Women''s 100 metres Backstroke'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 200, 'Athletics Men''s 20 kilometres Walk'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 3, 201, 'Gymnastics Men''s Parallel Bars'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 3, 202, 'Gymnastics Men''s Horizontal Bar'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 29, 203, 'Weightlifting Men''s Featherweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 20, 204, 'Rowing Women''s Coxed Fours'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 2, 205, 'Swimming Women''s 100 metres Breaststroke'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 13, 206, 'Judo Women''s Half-Heavyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 207, 'Athletics Women''s Discus Throw'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 20, 208, 'Rowing Women''s Single Sculls'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 209, 'Athletics Women''s 400 metres Hurdles'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 210, 'Athletics Men''s 5,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 211, 'Athletics Men''s 200 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 29, 212, 'Weightlifting Men''s Middleweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 12, 213, 'Fencing Men''s Sabre, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 214, 'Athletics Men''s 50 kilometres Walk'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 11, 215, 'Boxing Women''s Lightweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 't', 10, 216, 'Cycling Women''s Team Pursuit'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 11, 217, 'Boxing Men''s Light-Flyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 21, 218, 'Badminton Men''s Doubles'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 219, 'Shooting Men''s Trap, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 11, 220, 'Boxing Men''s Light-Heavyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 10, 221, 'Cycling Women''s Road Race, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 222, 'Swimming Men''s 400 metres Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 28, 223, 'Diving Women''s Plain High'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 10, 224, 'Cycling Women''s Individual Time Trial'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 10, 225, 'Cycling Women''s Individual Pursuit, 3,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 20, 226, 'Rowing Men''s Coxed Fours, Outriggers'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 227, 'Cycling Men''s Tandem Sprint, 2,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 't', 24, 228, 'Archery Women''s Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 29, 229, 'Weightlifting Men''s Lightweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 29, 230, 'Weightlifting Men''s Light-Heavyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 231, 'Swimming Men''s 100 metres Butterfly'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 232, 'Shooting Men''s Running Target, Single Shot, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 13, 233, 'Judo Men''s Extra-Lightweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 13, 234, 'Judo Men''s Middleweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 20, 235, 'Rowing Men''s Single Sculls'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 236, 'Athletics Women''s 100 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 17, 237, 'Sailing Men''s Windsurfer'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 238, 'Wrestling Men''s Middleweight A, Greco-Roman'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 239, 'Shooting Men''s Running Target, 10 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 240, 'Athletics Women''s 3,000 metres Steeplechase'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 241, 'Athletics Women''s High Jump'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 't', 3, 242, 'Gymnastics Women''s Team Portable Apparatus'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 3, 243, 'Gymnastics Women''s Uneven Bars'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 16, 244, 'Shooting Women''s Sporting Pistol, 25 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 2, 245, 'Swimming Women''s 200 metres Backstroke'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 246, 'Cycling Men''s 5,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 247, 'Shooting Men''s Free Rifle, 400, 600 and 800 metres, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 248, 'Athletics Men''s Decathlon'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 24, 249, 'Archery Women''s Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 250, 'Shooting Men''s Running Target, 50 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 251, 'Canoeing Men''s Canadian Singles, Slalom'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 252, 'Cycling Men''s Keirin'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 21, 253, 'Badminton Men''s Singles'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 254, 'Canoeing Men''s Kayak Doubles, 1,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 255, 'Shooting Men''s Free Pistol, 50 yards, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 256, 'Athletics Women''s 10,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 12, 257, 'Fencing Men''s epee, Masters, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 12, 258, 'Fencing Men''s epee, Masters and Amateurs, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 17, 259, 'Sailing Women''s Three Person Keelboat'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 6, 260, 'Tennis Women''s Singles'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 't', 12, 261, 'Fencing Women''s epee, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 2, 262, 'Swimming Women''s 200 metres Breaststroke'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 2, 263, 'Swimming Women''s 200 metres Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 264, 'Athletics Men''s 400 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 265, 'Shooting Men''s Free Pistol, 50 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 266, 'Shooting Men''s Air Pistol, 10 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 267, 'Swimming Men''s 200 metres Butterfly'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 268, 'Athletics Men''s Javelin Throw'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 1, 269, 'Athletics Men''s 3,000 metres, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 16, 270, 'Shooting Women''s Skeet'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 6, 271, 'Tennis Women''s Doubles'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 24, 272, 'Archery Men''s Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 273, 'Canoeing Men''s Kayak Singles, 500 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 19, 274, 'Canoeing Women''s Kayak Singles, Slalom'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 275, 'Swimming Men''s 4 x 250 metres Freestyle Relay'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 276, 'Athletics Women''s 1,500 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 277, 'Cycling Men''s Road Race, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 28, 278, 'Diving Women''s Springboard'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 11, 279, 'Boxing Men''s Light-Middleweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 10, 280, 'Cycling Women''s 500 metres Time Trial'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 16, 281, 'Shooting Women''s Trap'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 20, 282, 'Rowing Men''s 6-Man Naval Rowing Boats'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 283, 'Swimming Men''s 200 metres Backstroke'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 21, 284, 'Badminton Women''s Singles'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 2, 285, 'Swimming Women''s 400 metres Individual Medley'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 286, 'Cycling Men''s 20 kilometres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 12, 287, 'Fencing Women''s epee, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 288, 'Shooting Men''s Small-Bore Rifle, Prone, 50 and 100 yards'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 20, 289, 'Rowing Women''s Coxless Fours'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 28, 290, 'Diving Men''s Synchronized Springboard'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 291, 'Swimming Men''s 100 metres Backstroke'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 292, 'Wrestling Men''s Super-Heavyweight, Greco-Roman'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 17, 293, 'Sailing Men''s Two Person Dinghy'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 6, 294, 'Tennis Men''s Doubles, Covered Courts'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 24, 295, 'Archery Men''s Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 13, 296, 'Judo Men''s Half-Heavyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 297, 'Cycling Men''s 100 kilometres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 14, 298, 'Taekwondo Women''s Heavyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 299, 'Cycling Men''s 25 kilometres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 16, 300, 'Shooting Women''s Air Pistol, 10 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 301, 'Swimming Men''s 1,500 metres Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 302, 'Swimming Men''s 400 metres Individual Medley'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 29, 303, 'Weightlifting Women''s Middleweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 12, 304, 'Fencing Women''s Foil, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 10, 305, 'Cycling Men''s Team Sprint'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 306, 'Cycling Men''s Sprint'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 307, 'Swimming Men''s 200 metres Individual Medley'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 308, 'Athletics Men''s Standing Triple Jump'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 2, 309, 'Swimming Women''s 200 metres Individual Medley'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 310, 'Canoeing Men''s Kayak Singles, 200 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 311, 'Athletics Women''s Heptathlon'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 14, 312, 'Taekwondo Men''s Welterweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 20, 313, 'Rowing Women''s Lightweight Double Sculls'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 10, 314, 'Cycling Women''s Points Race'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 2, 315, 'Swimming Women''s 200 metres Butterfly'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 316, 'Shooting Men''s Running Target, Double Shot'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 317, 'Shooting Men''s Running Target, Double Shot, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 318, 'Shooting Men''s Military Rifle, 200/500/600/800/900/1,000 Yards, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 28, 319, 'Diving Women''s Synchronized Platform'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 320, 'Athletics Women''s 800 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 321, 'Athletics Men''s 4,000 metres Steeplechase'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 1, 322, 'Athletics Men''s 5,000 metres, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 13, 323, 'Judo Men''s Heavyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 13, 324, 'Judo Women''s Extra-Lightweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 20, 325, 'Rowing Men''s Coxed Pairs (1 mile)'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 2, 326, 'Swimming Men''s 200 metres Team Swimming'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 16, 327, 'Shooting Women''s Small-Bore Rifle, Three Positions, 50 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 328, 'Athletics Men''s Pentathlon'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 329, 'Athletics Women''s Pentathlon'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 3, 330, 'Gymnastics Women''s Balance Beam'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 331, 'Cycling Men''s 1/4 mile'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 332, 'Cycling Men''s 1/3 mile'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 333, 'Cycling Men''s 1/2 mile'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 334, 'Cycling Men''s 1 mile'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 16, 335, 'Shooting Women''s Air Rifle, 10 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 336, 'Athletics Women''s 200 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 337, 'Canoeing Men''s Folding Kayak Doubles, 10 kilometres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 29, 338, 'Weightlifting Men''s Heavyweight I'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 339, 'Athletics Women''s 80 metres Hurdles'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 13, 340, 'Judo Women''s Lightweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 10, 341, 'Cycling Women''s Mountainbike, Cross-Country'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 2, 342, 'Swimming Women''s 300 metres Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 343, 'Shooting Men''s Military Rifle, Prone, 600 metres, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 344, 'Shooting Men''s Free Rifle, 1,000 Yards'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 345, 'Cycling Men''s Individual Time Trial'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 3, 346, 'Gymnastics Men''s Parallel Bars, Teams'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 3, 347, 'Gymnastics Men''s Horizontal Bar, Teams'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 348, 'Athletics Men''s 1,600 metres Medley Relay'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 349, 'Canoeing Men''s Canadian Doubles, 1,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 350, 'Shooting Men''s Small-Bore Rifle, Disappearing Target, 25 metres, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 351, 'Shooting Men''s Running Target, Single Shot'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 352, 'Athletics Men''s 1,500 metres Walk'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 1, 353, 'Athletics Men''s 3 mile, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 13, 354, 'Judo Men''s Open Class'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 355, 'Cycling Men''s 1,000 metres Time Trial'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 356, 'Canoeing Men''s Canadian Doubles, 10,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 28, 357, 'Diving Men''s Synchronized Platform'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 358, 'Swimming Men''s 100 Yard Backstroke'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 359, 'Swimming Men''s 440 Yard Breaststroke'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 360, 'Shooting Men''s Military Pistol, 30 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 3, 361, 'Gymnastics Men''s Individual All-Around, 5 Events'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 24, 362, 'Archery Men''s Double York Round'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 363, 'Shooting Men''s Military Rifle, Standing, 300 metres, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 26, 364, 'Triathlon Men''s Olympic Distance'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 365, 'Swimming Men''s 100 metres Breaststroke'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 24, 366, 'Archery Men''s Target Archery, 33 metres, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 24, 367, 'Archery Men''s Target Archery, 50 metres, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 20, 368, 'Rowing Men''s Coxed Pairs (1 kilometres)'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 369, 'Cycling Men''s Points Race'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 24, 370, 'Archery Men''s Double American Round'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 24, 371, 'Archery Men''s Team Round'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 372, 'Canoeing Men''s Canadian Singles, 500 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 373, 'Canoeing Men''s Canadian Singles, 10,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 15, 374, 'Wrestling Women''s Heavyweight, Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 17, 375, 'Sailing Men''s Skiff'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 376, 'Shooting Men''s Small-Bore Rifle, Any Position, 50 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 24, 377, 'Archery Men''s Continental Style'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 31, 378, 'Golf Men''s Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 29, 379, 'Weightlifting Men''s Unlimited, One Hand'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 29, 380, 'Weightlifting Women''s Heavyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 6, 381, 'Tennis Men''s Singles, Covered Courts'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 382, 'Shooting Men''s Dueling Pistol, 30 metres, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 383, 'Shooting Men''s Small-Bore Rifle, Prone, 50 metres, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 384, 'Shooting Men''s Dueling Pistol Au Commandement, 25 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 385, 'Shooting Men''s Small-Bore Rifle, Disappearing Target, 25 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 19, 386, 'Canoeing Women''s Kayak Singles, 200 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 12, 387, 'Fencing Men''s Sabre, Individual, Three Hits'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 388, 'Athletics Men''s 200 metres Hurdles'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 389, 'Cycling Men''s Omnium'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 390, 'Athletics Women''s 3,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 391, 'Athletics Men''s 2,500 metres Steeplechase'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 10, 392, 'Cycling Women''s BMX'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 393, 'Canoeing Men''s Canadian Singles, 200 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 29, 394, 'Weightlifting Women''s Lightweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 395, 'Athletics Women''s 10 kilometres Walk'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 29, 396, 'Weightlifting Women''s Featherweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 14, 397, 'Taekwondo Men''s Flyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 15, 398, 'Wrestling Women''s Flyweight, Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 29, 399, 'Weightlifting Men''s Flyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 24, 400, 'Archery Men''s Pole Archery, Large Birds, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 24, 401, 'Archery Men''s Pole Archery, Small Birds, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 24, 402, 'Archery Men''s Pole Archery, Large Birds, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 29, 403, 'Weightlifting Women''s Light-Heavyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 404, 'Shooting Men''s Military Rifle, Any Position, 600 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 12, 405, 'Fencing Men''s Sabre, Masters, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 24, 406, 'Archery Women''s Double Columbia Round'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 24, 407, 'Archery Women''s Double National Round'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 1, 408, 'Athletics Men''s 4 mile, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 409, 'Canoeing Men''s Kayak Doubles, 200 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 410, 'Athletics Women''s Hammer Throw'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 411, 'Cycling Men''s 333 metres Time Trial'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 412, 'Wrestling Men''s Light-Flyweight, Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 413, 'Athletics Men''s 5 mile'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 414, 'Athletics Men''s 2,590 metres Steeplechase'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 415, 'Swimming Men''s 50 yard Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 416, 'Swimming Men''s 100 yard Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 417, 'Swimming Men''s 220 yard Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 418, 'Swimming Men''s 440 yard Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 419, 'Swimming Men''s 4 x 50 Yard Freestyle Relay'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 420, 'Swimming Men''s 10 kilometres Open Water'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 421, 'Cycling Men''s BMX'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 422, 'Shooting Men''s Military Revolver, 1873-1874 Gras Model, 20 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 423, 'Shooting Men''s Military Rifle, Kneeling Or Standing, 300 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 424, 'Athletics Men''s 56-pound Weight Throw'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 425, 'Swimming Men''s Underwater Swimming'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 426, 'Athletics Women''s Triple Jump'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 10, 427, 'Cycling Women''s Omnium'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 29, 428, 'Weightlifting Women''s Super-Heavyweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 429, 'Shooting Men''s Military Pistol, 25 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 430, 'Athletics Men''s Stone Throw'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 431, 'Athletics Men''s Javelin Throw, Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 15, 432, 'Wrestling Women''s Light-Heavyweight, Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 433, 'Cycling Men''s 2 mile'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 434, 'Athletics Women''s Pole Vault'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 435, 'Swimming Men''s 100 metres Freestyle For Sailors'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 24, 436, 'Archery Men''s Sur La Perche a La Herse'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 21, 437, 'Badminton Women''s Doubles'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 438, 'Canoeing Men''s Folding Kayak Singles, 10 kilometres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 31, 439, 'Golf Men''s Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 440, 'Athletics Men''s 3,200 metres Steeplechase'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 17, 441, 'Sailing Men''s Two Person Keelboat'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 29, 442, 'Weightlifting Men''s Unlimited, Two Hands'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 3, 443, 'Gymnastics Men''s Individual All-Around, Field Sports'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 14, 444, 'Taekwondo Women''s Welterweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 3, 445, 'Gymnastics Men''s Club Swinging'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 446, 'Shooting Men''s Military Rifle, Prone, 600 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 447, 'Shooting Men''s Small Bore-Rifle, Standing, 50 metres, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 3, 448, 'Gymnastics Men''s Individual All-Around, 4 Events'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 3, 449, 'Gymnastics Men''s Side Horse'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 450, 'Shooting Men''s Small-Bore Rifle, Standing, 50 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 't', 16, 451, 'Shooting Men''s Military Rifle, Prone, 300 metres, Team'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 452, 'Shooting Men''s Free Rifle, Prone, 600 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 24, 453, 'Archery Men''s Au Cordon Dore, 50 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 454, 'Cycling Men''s 10,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 455, 'Shooting Men''s Small-Bore Rifle, Moving Target, 25 yards'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 11, 456, 'Boxing Women''s Middleweight'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 457, 'Shooting Men''s Free Pistol, 30 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 458, 'Shooting Men''s Muzzle-Loading Pistol, 25 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 459, 'Canoeing Men''s Kayak Singles, 10,000 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 460, 'Athletics Men''s 3,000 metres Walk'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 461, 'Swimming Men''s 880 yard Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 462, 'Swimming Men''s One Mile Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 16, 463, 'Shooting Women''s Double Trap'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 464, 'Athletics Men''s Discus Throw, Greek Style'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 24, 465, 'Archery Men''s Sur La Perche a La Pyramide'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 't', 10, 466, 'Cycling Women''s Team Sprint'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 1, 467, 'Athletics Women''s 20 kilometres Walk'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 468, 'Shooting Men''s Free Pistol, 50 yards'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 17, 469, 'Sailing Women''s Skiff'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 12, 470, 'Fencing Men''s Single Sticks, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 3, 471, 'Gymnastics Men''s Tumbling'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 472, 'Athletics Men''s All-Around Championship'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 10, 473, 'Cycling Women''s Keirin'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 474, 'Athletics Men''s 60 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 19, 475, 'Canoeing Men''s Kayak Relay 4 x 500 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 24, 476, 'Archery Men''s Au Chapelet, 50 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 24, 477, 'Archery Men''s Pole Archery, Small Birds, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 24, 478, 'Archery Men''s Championnat Du Monde'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 't', 24, 479, 'Archery Women''s Team Round'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 15, 480, 'Wrestling Women''s Middleweight, Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 12, 481, 'Fencing Women''s Sabre, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 482, 'Swimming Men''s 1,000 metres Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 483, 'Swimming Men''s 4,000 metres Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 484, 'Wrestling Men''s All-Around, Greco-Roman'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 485, 'Shooting Men''s Military Rifle, Prone, 300 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 486, 'Shooting Men''s Military Rifle, 200 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 10, 487, 'Cycling Men''s 12-Hours Race'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 488, 'Shooting Men''s Free Rifle, Kneeling, 300 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 489, 'Swimming Men''s 200 metres Obstacle Course'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 490, 'Athletics Men''s 3,500 metres Walk'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 2, 491, 'Swimming Men''s 500 metres Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 15, 492, 'Wrestling Men''s Unlimited Class, Greco-Roman'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 12, 493, 'Fencing Men''s Foil, Masters, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 29, 494, 'Weightlifting Men''s All-Around Dumbbell Contest'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 495, 'Shooting Men''s Dueling Pistol, 30 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 496, 'Athletics Men''s 10 mile Walk'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 497, 'Shooting Men''s Running Target, Single And Double Shot'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 498, 'Shooting Men''s Free Pistol, 25 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 499, 'Shooting Men''s Dueling Pistol Au Vise 20 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 500, 'Athletics Men''s Pentathlon (Ancient)');
INSERT INTO "public"."sport" ("createdAt", "updatedAt", "gender", "isTeam", "sportFieldId", "id", "label") VALUES
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 3, 501, 'Gymnastics Men''s Individual All-Around, Apparatus Work'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 502, 'Shooting Men''s Free Rifle, Standing, 300 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 503, 'Shooting Men''s Military Rifle, Standing, 300 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 504, 'Athletics Men''s Discus Throw, Both Hands'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'F', 'f', 15, 505, 'Wrestling Women''s Featherweight, Freestyle'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 506, 'Athletics Men''s Shot Put, Both Hands'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 507, 'Shooting Men''s Trap, Single Shot, 16 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 508, 'Shooting Men''s Trap, Double Shot, 14 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 509, 'Shooting Men''s Free Rifle, Any Position, 300 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 510, 'Shooting Men''s Military Rifle, 1873-1874 Gras Model, Kneeling Or Standing, 200 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 511, 'Shooting Men''s Free Rifle, Prone, 300 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 512, 'Shooting Men''s Military Rifle, Three Positions, 300 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 1, 513, 'Athletics Men''s Javelin Throw, Both Hands'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 24, 514, 'Archery Men''s Au Chapelet, 33 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 24, 515, 'Archery Men''s Au Cordon Dore, 33 metres'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 24, 516, 'Archery Men''s Target Archery, 28 metres, Individual'),
('2024-05-16 12:00:00', '2024-05-16 12:00:00', 'M', 'f', 16, 517, 'Shooting Men''s Military Revolver, 20 metres');



-- -------------------------------------------------------------
-- EVENT_CATEGORY TABLE
-- -------------------------------------------------------------
DROP TABLE IF EXISTS "public"."event_category" CASCADE;
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS event_category_category_seq;
DROP TYPE IF EXISTS "public"."event_category_label_enum";
CREATE TYPE "public"."event_category_label_enum" AS ENUM ('sport', 'ceremony', 'concert', 'other');

-- Table Definition
CREATE TABLE "public"."event_category" (
    "label" "public"."event_category_label_enum" NOT NULL,
    "category" int4 NOT NULL DEFAULT nextval('event_category_category_seq'::regclass),
    PRIMARY KEY ("category")
);

-- Indices
CREATE UNIQUE INDEX "PK_6f7db1b89a9385910134524043d" ON public.event_category USING btree (category);

-- -------------------------------------------------------------
-- EVENT_CATEGORY INSERT
-- -------------------------------------------------------------
INSERT INTO "public"."event_category" ("label") VALUES
('sport'),
('ceremony'),
('concert'),
('other');


-- -------------------------------------------------------------
-- EVENT TABLE
-- -------------------------------------------------------------
DROP TABLE IF EXISTS "public"."event" CASCADE;
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."event" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" timestamp NOT NULL DEFAULT now(),
    "updatedAt" timestamp NOT NULL DEFAULT now(),
    "name" varchar(100) NOT NULL,
    "startDate" date NOT NULL,
    "endDate" date NOT NULL,
    "latitude" varchar(50) NOT NULL,
    "longitude" varchar(50) NOT NULL,
    "location" varchar NOT NULL,
    "description" varchar(1000) NOT NULL,
    "typeEventCategory" int4,
    "sportId" int4,
    CONSTRAINT "FK_6ab506b7cc1d98d9c2edc5cee4b" FOREIGN KEY ("typeEventCategory") REFERENCES "public"."event_category"("category"),
    CONSTRAINT "FK_14126dc54792504366f3db67c28" FOREIGN KEY ("sportId") REFERENCES "public"."sport"("id"),
    PRIMARY KEY ("id")
);

-- Indices
CREATE UNIQUE INDEX "PK_30c2f3bbaf6d34a55f8ae6e4614" ON public.event USING btree (id);



-- -------------------------------------------------------------
-- MEDAL TABLE
-- -------------------------------------------------------------
DROP TABLE IF EXISTS "public"."medal" CASCADE;
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS medal_type_seq;
DROP TYPE IF EXISTS "public"."medal_label_enum";
CREATE TYPE "public"."medal_label_enum" AS ENUM ('gold', 'silver', 'bronze');

-- Table Definition
CREATE TABLE "public"."medal" (
    "type" int4 NOT NULL DEFAULT nextval('medal_type_seq'::regclass),
    "label" "public"."medal_label_enum" NOT NULL,
    PRIMARY KEY ("type")
);

-- Indices
CREATE UNIQUE INDEX "PK_f4dd43c7afc1f7ed63b69547047" ON public.medal USING btree (type);

-- -------------------------------------------------------------
-- MEDAL INSERT
-- -------------------------------------------------------------
INSERT INTO "public"."medal" ("type", "label") VALUES
(1, 'gold'),
(2, 'silver'),
(3, 'bronze');



-- -------------------------------------------------------------
-- ATHLETE_SPORT TABLE
-- -------------------------------------------------------------
DROP TABLE IF EXISTS "public"."athlete_sport" CASCADE;
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS athlete_sport_id_seq;

-- Table Definition
CREATE TABLE "public"."athlete_sport" (
    "createdAt" timestamp NOT NULL DEFAULT now(),
    "updatedAt" timestamp NOT NULL DEFAULT now(),
    "athleteId" uuid,
    "medalTypeType" int4,
    "sportId" int4,
    "id" int4 NOT NULL DEFAULT nextval('athlete_sport_id_seq'::regclass),
    CONSTRAINT "FK_56150551d3353ff2a7c3cd369b6" FOREIGN KEY ("sportId") REFERENCES "public"."sport"("id"),
    CONSTRAINT "FK_e3c48c3591a87f1ed25fdc94747" FOREIGN KEY ("medalTypeType") REFERENCES "public"."medal"("type"),
    CONSTRAINT "FK_e591c8b4fb5e3938b0f7c08f26f" FOREIGN KEY ("athleteId") REFERENCES "public"."athlete"("id"),
    PRIMARY KEY ("id")
);

-- Indices
CREATE UNIQUE INDEX "PK_2597f04527c5f2795fd9ae61074" ON public.athlete_sport USING btree (id);



-- -------------------------------------------------------------
-- INTEREST TABLE
-- -------------------------------------------------------------
DROP TABLE IF EXISTS "public"."interest" CASCADE;
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."interest" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" timestamp NOT NULL DEFAULT now(),
    "userId" uuid,
    "sportFieldId" int4,
    CONSTRAINT "FK_565b1666092f9c0f988183c78bd" FOREIGN KEY ("userId") REFERENCES "public"."user"("id"),
    CONSTRAINT "FK_d930c21a8012ad427931c1ff677" FOREIGN KEY ("sportFieldId") REFERENCES "public"."sport_field"("id"),
    PRIMARY KEY ("id")
);

-- Indices
CREATE UNIQUE INDEX "PK_6619d627e204e0596968653011f" ON public.interest USING btree (id);



-- -------------------------------------------------------------
-- LIKE TABLE
-- -------------------------------------------------------------
DROP TABLE IF EXISTS "public"."like" CASCADE;
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."like" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" timestamp NOT NULL DEFAULT now(),
    "isActive" bool NOT NULL DEFAULT true,
    "athleteId" uuid,
    "userId" uuid,
    CONSTRAINT "FK_fbb0706b9606a905a3a2686da5a" FOREIGN KEY ("athleteId") REFERENCES "public"."athlete"("id"),
    CONSTRAINT "FK_e8fb739f08d47955a39850fac23" FOREIGN KEY ("userId") REFERENCES "public"."user"("id"),
    PRIMARY KEY ("id")
);

-- Indices
CREATE UNIQUE INDEX "PK_eff3e46d24d416b52a7e0ae4159" ON public."like" USING btree (id);


-- -------------------------------------------------------------
-- PARTICIPATION TABLE
-- -------------------------------------------------------------
DROP TABLE IF EXISTS "public"."participation" CASCADE;
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."participation" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" timestamp NOT NULL DEFAULT now(),
    "updatedAt" timestamp NOT NULL DEFAULT now(),
    "position" int4,
    "athleteId" uuid,
    "eventId" uuid,
    CONSTRAINT "FK_834f264f10c81e99c5355c3255f" FOREIGN KEY ("eventId") REFERENCES "public"."event"("id"),
    CONSTRAINT "FK_f7ef9380d2c8fe3ec35fe24863c" FOREIGN KEY ("athleteId") REFERENCES "public"."athlete"("id"),
    PRIMARY KEY ("id")
);

-- Indices
CREATE UNIQUE INDEX "PK_ba5442bab90fc96ddde456c69e1" ON public.participation USING btree (id);