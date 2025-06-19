 -- Crea la base de datos
CREATE DATABASE MARIOKART;
 -- Selecciona la base de datos
USE MARIOKART;

 -- Crea la tabla donde se almacena el id del jugador, también el id de cada parte seleccionada por el jugador, es decir que cada id conecta con su tabla correspondiente (id_character con id_character en CharacterMK, id_kart con id_kart en Kart, id_wheel con id_wheel en Wheel, id_glider con id_glider en Glider) además de si activo las ayudas (dirección inteligente, auto aceleración y control por movimiento)
CREATE TABLE Player (
  `id_player` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_character` integer NOT NULL,
  `id_kart` integer NOT NULL,
  `id_wheel` integer NOT NULL,
  `id_glider` integer NOT NULL,
  `smart_steering` boolean NOT NULL,
  `auto_accelerate` boolean NOT NULL,
  `tilt_controls` boolean NOT NULL
);

 -- Crea la tabla donde se almacena cada skin con su id (id_skin) dirección donde se encuentra (ruta de acceso)
CREATE TABLE Skin (
  `id_skin` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `model` varchar(255) NOT NULL
);

 -- Crea la tabla donde se almacena cada personaje con su id, su nombre, su ruta de acceso a los sonidos, un atributo id_skin que hace es clave foránea de la tabla Skin y por último sus atributos (velocidad, aceleración, peso, manejo, tracción, mini turbo e invencibilidad)
CREATE TABLE CharacterMK (
  `id_character` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_skin` integer NOT NULL,
  `character_name` varchar(255) NOT NULL,
  `character_speed` integer NOT NULL DEFAULT 1,
  `character_acceleration` integer NOT NULL DEFAULT 1,
  `character_weight` integer NOT NULL DEFAULT 1,
  `character_handling` integer NOT NULL DEFAULT 1,
  `character_traction` integer NOT NULL DEFAULT 1,
  `character_mini_turbo` integer NOT NULL DEFAULT 1,
  `character_invincibility` integer NOT NULL DEFAULT 1,
  `path_sound` varchar(255) NOT NULL
);

 -- Crea la tabla donde se almacena cada kart con su id, su nombre, su ruta de acceso a los sonidos y al modelo, y por último sus atributos (velocidad, aceleración, peso, manejo, tracción, mini turbo e invencibilidad)
CREATE TABLE Kart (
  `id_kart` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `kart_name` varchar(255) NOT NULL,
  `kart_speed` integer NOT NULL DEFAULT 1,
  `kart_acceleration` integer NOT NULL DEFAULT 1,
  `kart_weight` integer NOT NULL DEFAULT 1,
  `kart_handling` integer NOT NULL DEFAULT 1,
  `kart_traction` integer NOT NULL DEFAULT 1,
  `kart_mini_turbo` integer NOT NULL DEFAULT 1,
  `kart_invincibility` integer NOT NULL DEFAULT 1,
  `model` varchar(255) NOT NULL,
  `path_sound` varchar(255) NOT NULL
);

 -- Crea la tabla donde se almacena cada rueda con su id, su nombre, su ruta de acceso a los sonidos y al modelo, y por último sus atributos (velocidad, aceleración, peso, manejo, tracción, mini turbo e invencibilidad)
CREATE TABLE Wheel (
  `id_wheel` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `wheel_name` varchar(255) NOT NULL,
  `wheel_speed` integer NOT NULL DEFAULT 1,
  `wheel_acceleration` integer NOT NULL DEFAULT 1,
  `wheel_weight` integer NOT NULL DEFAULT 1,
  `wheel_handling` integer NOT NULL DEFAULT 1,
  `wheel_traction` integer NOT NULL DEFAULT 1,
  `wheel_mini_turbo` integer NOT NULL DEFAULT 1,
  `wheel_invincibility` integer NOT NULL DEFAULT 1,
  `model` varchar(255) NOT NULL,
  `path_sound` varchar(255) NOT NULL
);

 -- Crea la tabla donde se almacena cada ala delta con su id, su nombre, su ruta de acceso a los sonidos y al modelo, y por último sus atributos (velocidad, aceleración, peso, manejo, tracción, mini turbo e invencibilidad)
CREATE TABLE Glider (
  `id_glider` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `glider_name` varchar(255) NOT NULL,
  `glider_speed` integer NOT NULL DEFAULT 1,
  `glider_acceleration` integer NOT NULL DEFAULT 1,
  `glider_weight` integer NOT NULL DEFAULT 1,
  `glider_handling` integer NOT NULL DEFAULT 1,
  `glider_traction` integer NOT NULL DEFAULT 1,
  `glider_mini_turbo` integer NOT NULL DEFAULT 1,
  `glider_invincibility` integer NOT NULL DEFAULT 1,
  `model` varchar(255) NOT NULL,
  `path_sound` varchar(255) NOT NULL
);
 -- Relaciona id_character en player con la clave primaria de characterMK (clave foránea)
ALTER TABLE Player ADD CONSTRAINT FK_id_character FOREIGN KEY (id_character) REFERENCES CharacterMK (id_character) ON DELETE NO ACTION ON UPDATE NO ACTION;

 -- Relaciona id_kart en player con la clave primaria de kart (clave foránea)
ALTER TABLE Player ADD CONSTRAINT FK_id_kart FOREIGN KEY (id_kart) REFERENCES Kart (id_kart) ON DELETE NO ACTION ON UPDATE NO ACTION;

 -- Relaciona id_wheel en player con la clave primaria de wheel (clave foránea)
ALTER TABLE Player ADD CONSTRAINT FK_id_wheel FOREIGN KEY (id_wheel) REFERENCES Wheel (id_wheel) ON DELETE NO ACTION ON UPDATE NO ACTION;

 -- Relaciona id_glider en player con la clave primaria de glider (clave foránea)
ALTER TABLE Player ADD CONSTRAINT FK_id_glider FOREIGN KEY (id_glider) REFERENCES Glider (id_glider) ON DELETE NO ACTION ON UPDATE NO ACTION;

 -- Relaciona id_skin en characterMK con la clave primaria de skin (clave foránea)
ALTER TABLE CharacterMK ADD CONSTRAINT FK_id_skin FOREIGN KEY (id_skin) REFERENCES Skin (id_skin) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Insertando datos
INSERT INTO Skin (model) 
VALUES
	('assets/model/characters/mario_default.png'),
	('assets/model/characters/luigi_default.png'),
	('assets/model/characters/peach_default.png'),
	('assets/model/characters/daisy_default.png'),
	('assets/model/characters/rosalina_default.png'),
	('assets/model/characters/tanooki_mario.png'),
	('assets/model/characters/cat_peach.png'),
    -- Birdo (9 colores)
	('assets/model/characters/birdo_pink.png'),
	('assets/model/characters/birdo_light_blue.png'),
	('assets/model/characters/birdo_black.png'),
	('assets/model/characters/birdo_red.png'),
	('assets/model/characters/birdo_yellow.png'),
	('assets/model/characters/birdo_white.png'),
	('assets/model/characters/birdo_blue.png'),
	('assets/model/characters/birdo_green.png'),
	('assets/model/characters/birdo_orange.png'),
    -- Yoshi (9 colores)
	('assets/model/characters/yoshi_green.png'),
	('assets/model/characters/yoshi_pink.png'),
	('assets/model/characters/yoshi_light_blue.png'),
	('assets/model/characters/yoshi_yellow.png'),
	('assets/model/characters/yoshi_orange.png'),
	('assets/model/characters/yoshi_red.png'),
	('assets/model/characters/yoshi_blue.png'),
	('assets/model/characters/yoshi_black.png'),
	('assets/model/characters/yoshi_white.png'),
	('assets/model/characters/toad_default.png'),
	('assets/model/characters/koopa_troopa.png'),
    -- Shy Guy (8 colores)
	('assets/model/characters/shy_guy_red.png'),
	('assets/model/characters/shy_guy_green.png'),
	('assets/model/characters/shy_guy_blue.png'),
	('assets/model/characters/shy_guy_light_blue.png'),
	('assets/model/characters/shy_guy_yellow.png'),
	('assets/model/characters/shy_guy_pink.png'),
	('assets/model/characters/shy_guy_orange.png'),
	('assets/model/characters/shy_guy_black.png'),
    ('assets/model/characters/shy_guy_white.png'),
	('assets/model/characters/lakitu.png'),
	('assets/model/characters/toadette.png'),
	('assets/model/characters/king_boo.png'),
    ('assets/model/characters/petey_piranha.png'),
	('assets/model/characters/baby_mario.png'),
	('assets/model/characters/baby_luigi.png'),
	('assets/model/characters/baby_peach.png'),
	('assets/model/characters/baby_daisy.png'),
	('assets/model/characters/baby_rosalina.png'),
    ('assets/model/characters/gold_mario.png'),
	('assets/model/characters/metal_mario.png'),
	('assets/model/characters/pink_gold_peach.png'),
    ('assets/model/characters/wiggler.png'),
	('assets/model/characters/wario_default.png'),
	('assets/model/characters/waluigi_default.png'),
	('assets/model/characters/donkey_kong.png'),
	('assets/model/characters/bowser_default.png'),
	('assets/model/characters/dry_bones.png'),
	('assets/model/characters/bowser_jr.png'),
	('assets/model/characters/dry_bowser.png'),
    ('assets/model/characters/kamek.png'),
    ('assets/model/characters/lemmy.png'),
	('assets/model/characters/larry.png'),
    ('assets/model/characters/wendy.png'),
    ('assets/model/characters/ludwig.png'),
	('assets/model/characters/iggy.png'),
	('assets/model/characters/roy.png'),
    ('assets/model/characters/morton.png'),
    ('assets/model/characters/peachette.png'),
    -- Inkling Girl (3 colores)
	('assets/model/characters/inkling_girl_orange.png'),
	('assets/model/characters/inkling_girl_green.png'),
	('assets/model/characters/inkling_girl_magenta.png'),
	-- Inkling Boy (3 colores)
	('assets/model/characters/inkling_boy_blue.png'),
	('assets/model/characters/inkling_boy_purple.png'),
	('assets/model/characters/inkling_boy_cyan.png'),
	('assets/model/characters/villager_male.png'),
	('assets/model/characters/villager_female.png'),
	('assets/model/characters/isabelle.png'),
    -- Link (2 aspectos)
	('assets/model/characters/link_green.png'),
	('assets/model/characters/link_champion.png'),
	('assets/model/characters/diddy_kong.png'),
	('assets/model/characters/funky_kong.png'),
	('assets/model/characters/pauline.png'),
	('assets/model/characters/mii_default.png');

INSERT INTO CharacterMK
    (id_character, id_skin, character_name,
     character_speed, character_acceleration, character_weight,
     character_handling, character_traction, character_mini_turbo,
     character_invincibility, path_sound)
VALUES
    (NULL,  1, 'Mario', 7, 2, 6, 4, 2, 3, 3, 'assets/sounds/characters/mario.wav'),
    (NULL,  2, 'Luigi', 7, 2, 6, 5, 1, 3, 3, 'assets/sounds/characters/luigi.wav'),
    (NULL,  3, 'Peach', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/peach.wav'),
    (NULL,  4, 'Daisy', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/daisy.wav'),
    (NULL,  5, 'Rosalina', 8, 1, 7, 3, 3, 2, 4, 'assets/sounds/characters/rosalina.wav'),
    (NULL,  6, 'Tanooki Mario', 6, 3, 5, 5, 1, 4, 1, 'assets/sounds/characters/tanooki_mario.wav'),
    (NULL,  7, 'Cat Peach', 5, 4, 3, 6, 3, 4, 3, 'assets/sounds/characters/cat_peach.wav'),
    (NULL,  8, 'Birdo (Pink)', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/birdo.wav'),
    (NULL,  9, 'Birdo (Light Blue)', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/birdo.wav'),
    (NULL, 10, 'Birdo (Black)', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/birdo.wav'),
    (NULL, 11, 'Birdo (Red)', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/birdo.wav'),
    (NULL, 12, 'Birdo (Yellow)', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/birdo.wav'),
    (NULL, 13, 'Birdo (White)', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/birdo.wav'),
    (NULL, 14, 'Birdo (Blue)', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/birdo.wav'),
    (NULL, 15, 'Birdo (Green)', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/birdo.wav'),
    (NULL, 16, 'Birdo (Orange)', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/birdo.wav'),
    (NULL, 17, 'Yoshi (Green)', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/yoshi.wav'),
    (NULL, 18, 'Yoshi (Pink)', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/yoshi.wav'),
    (NULL, 19, 'Yoshi (Light Blue)', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/yoshi.wav'),
    (NULL, 20, 'Yoshi (Yellow)', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/yoshi.wav'),
    (NULL, 21, 'Yoshi (Orange)', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/yoshi.wav'),
    (NULL, 22, 'Yoshi (Red)', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/yoshi.wav'),
    (NULL, 23, 'Yoshi (Blue)', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/yoshi.wav'),
    (NULL, 24, 'Yoshi (Black)', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/yoshi.wav'),
    (NULL, 25, 'Yoshi (White)', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/yoshi.wav'),
    (NULL, 26, 'Toad', 4, 4, 3, 7, 4, 4, 3, 'assets/sounds/characters/toad.wav'),
    (NULL, 27, 'Koopa Troopa', 3, 4, 2, 5, 5, 4, 4, 'assets/sounds/characters/koopa_troopa.wav'),
    (NULL, 28, 'Shy Guy (Red)', 4, 4, 3, 7, 4, 4, 3, 'assets/sounds/characters/shy_guy.wav'),
    (NULL, 29, 'Shy Guy (Green)', 4, 4, 3, 7, 4, 4, 3, 'assets/sounds/characters/shy_guy.wav'),
    (NULL, 30, 'Shy Guy (Blue)', 4, 4, 3, 7, 4, 4, 3, 'assets/sounds/characters/shy_guy.wav'),
    (NULL, 31, 'Shy Guy (Light Blue)', 4, 4, 3, 7, 4, 4, 3, 'assets/sounds/characters/shy_guy.wav'),
    (NULL, 32, 'Shy Guy (Yellow)', 4, 4, 3, 7, 4, 4, 3, 'assets/sounds/characters/shy_guy.wav'),
    (NULL, 33, 'Shy Guy (Pink)', 4, 4, 3, 7, 4, 4, 3, 'assets/sounds/characters/shy_guy.wav'),
    (NULL, 34, 'Shy Guy (Orange)', 4, 4, 3, 7, 4, 4, 3, 'assets/sounds/characters/shy_guy.wav'),
    (NULL, 35, 'Shy Guy (Black)', 4, 4, 3, 7, 4, 4, 3, 'assets/sounds/characters/shy_guy.wav'),
    (NULL, 36, 'Shy Guy (White)', 4, 4, 3, 7, 4, 4, 3, 'assets/sounds/characters/shy_guy.wav'),
    (NULL, 37, 'Lakitu', 3, 4, 2, 5, 5, 4, 4, 'assets/sounds/characters/lakitu.wav'),
    (NULL, 38, 'Toadette', 3, 5, 2, 7, 2, 4, 3, 'assets/sounds/characters/toadette.wav'),
    (NULL, 39, 'King Boo', 8, 1, 7, 3, 3, 2, 4, 'assets/sounds/characters/king_boo.wav'),
    (NULL, 40, 'Petey Piranha', 8, 1, 10, 3, 1, 1, 6, 'assets/sounds/characters/petey_piranha.wav'),
    (NULL, 41, 'Baby Mario', 2, 5, 1, 8, 4, 5, 5, 'assets/sounds/characters/baby_mario.wav'),
    (NULL, 42, 'Baby Luigi', 2, 5, 1, 8, 4, 5, 5, 'assets/sounds/characters/baby_luigi.wav'),
    (NULL, 43, 'Baby Peach', 1, 4, 0, 10, 5, 5, 6, 'assets/sounds/characters/baby_peach.wav'),
    (NULL, 44, 'Baby Daisy', 1, 4, 0, 10, 5, 5, 6, 'assets/sounds/characters/baby_daisy.wav'),
    (NULL, 45, 'Baby Rosalina', 1, 5, 0, 9, 3, 5, 6, 'assets/sounds/characters/baby_rosalina.wav'),
    (NULL, 46, 'Gold Mario', 8, 1, 10, 3, 1, 1, 3, 'assets/sounds/characters/gold_mario.wav'),
    (NULL, 47, 'Metal Mario', 8, 1, 10, 3, 1, 1, 3, 'assets/sounds/characters/metal_mario.wav'),
    (NULL, 48, 'Pink Gold Peach', 8, 1, 10, 3, 1, 1, 3, 'assets/sounds/characters/pink_gold_peach.wav'),
    (NULL, 49, 'Wiggler', 9, 1, 8, 2, 0, 1, 4, 'assets/sounds/characters/pink_gold_peach.wav'),
    (NULL, 50, 'Wario', 10, 0, 9, 1, 1, 0, 5, 'assets/sounds/characters/wario.wav'),
    (NULL, 51, 'Waluigi', 9, 1, 8, 2, 0, 1, 4, 'assets/sounds/characters/waluigi.wav'),
    (NULL, 52, 'Donkey Kong', 9, 1, 8, 2, 0, 1, 4, 'assets/sounds/characters/donkey_kong.wav'),
    (NULL, 53, 'Bowser', 10, 0, 10, 0, 0, 0, 6, 'assets/sounds/characters/bowser.wav'),
    (NULL, 54, 'Dry Bones', 2, 5, 1, 8, 4, 5, 5, 'assets/sounds/characters/dry_bones.wav'),
    (NULL, 55, 'Bowser Jr', 3, 4, 2, 5, 5, 4, 4, 'assets/sounds/characters/bower_jr.wav'),
    (NULL, 56, 'Dry Bowser', 10, 0, 9, 1, 1, 0, 5, 'assets/sounds/characters/dry_bowser.wav'),
    (NULL, 57, 'Kamek', 7, 2, 6, 5, 1, 3, 3, 'assets/sounds/characters/kamek.wav'),
    (NULL, 58, 'Lemmy', 1, 5, 0, 9, 3, 5, 6, 'assets/sounds/characters/lemmy.wav'),
    (NULL, 59, 'Larry', 4, 4, 3, 7, 4, 4, 3, 'assets/sounds/characters/larry.wav'),
    (NULL, 60, 'Wendy', 3, 5, 2, 7, 2, 4, 3, 'assets/sounds/characters/wendy.wav'),
    (NULL, 61, 'Ludwig', 7, 2, 6, 4, 2, 3, 3, 'assets/sounds/characters/ludwig.wav'),
    (NULL, 62, 'Iggy', 7, 2, 6, 5, 1, 3, 3, 'assets/sounds/characters/iggy.wav'),
    (NULL, 63, 'Roy', 9, 1, 8, 2, 0, 1, 4, 'assets/sounds/characters/roy.wav'),
    (NULL, 64, 'Morton', 10, 0, 10, 0, 0, 0, 6, 'assets/sounds/characters/morton.wav'),
    (NULL, 65, 'Peachette', 6, 3, 4, 5, 3, 4, 1, 'assets/sounds/characters/peachette.wav'),
    (NULL, 66, 'Inkling Girl (Orange)', 5, 4, 3, 6, 3, 4, 3, 'assets/sounds/characters/inkling_girl.wav'),
    (NULL, 67, 'Inkling Girl (Green)', 5, 4, 3, 6, 3, 4, 3, 'assets/sounds/characters/inkling_girl.wav'),
    (NULL, 68, 'Inkling Girl (Magenta)', 5, 4, 3, 6, 3, 4, 3, 'assets/sounds/characters/inkling_girl.wav'),
    (NULL, 69, 'Inkling Boy (Blue)', 6, 3, 5, 5, 1, 4, 1, 'assets/sounds/characters/inkling_boy.wav'),
    (NULL, 70, 'Inkling Boy (Purple)', 6, 3, 5, 5, 1, 4, 1, 'assets/sounds/characters/inkling_boy.wav'),
    (NULL, 71, 'Inkling Boy (Cyan)', 6, 3, 5, 5, 1, 4, 1, 'assets/sounds/characters/inkling_boy.wav'),
    (NULL, 72, 'Villager Male', 6, 3, 5, 5, 1, 4, 1, 'assets/sounds/characters/villager_male.wav'),
    (NULL, 73, 'Villager Female', 5, 4, 3, 6, 3, 4, 3, 'assets/sounds/characters/villager_female.wav'),
    (NULL, 74, 'Isabelle', 3, 5, 2, 7, 2, 4, 3, 'assets/sounds/characters/isabelle.wav'),
    (NULL, 75, 'Link', 8, 1, 7, 3, 3, 2, 4, 'assets/sounds/characters/link.wav'),
    (NULL, 76, 'Link Champion', 8, 1, 7, 3, 3, 2, 4, 'assets/sounds/characters/link_champion.wav'),
    (NULL, 77, 'Diddy Kong', 5, 4, 3, 6, 3, 4, 3, 'assets/sounds/characters/diddy_kong.wav'),
    (NULL, 78, 'Funky Kong', 10, 0, 9, 1, 1, 0, 5, 'assets/sounds/characters/funky_kong.wav'),
    (NULL, 79, 'Pauline', 8, 1, 7, 3, 3, 2, 4, 'assets/sounds/characters/pauline.wav'),
    (NULL, 80, 'Mii Small', 2, 5, 1, 8, 4, 5, 5, 'assets/sounds/characters/mii.wav'),
    (NULL, 80, 'Mii Medium', 7, 2, 6, 4, 2, 3, 3, 'assets/sounds/characters/mii.wav'),
    (NULL, 80, 'Mii Large', 10, 0, 9, 1, 1, 0, 5, 'assets/sounds/characters/mii.wav');
    
INSERT INTO Kart
    (id_kart, kart_name,
     kart_speed, kart_acceleration, kart_weight,
     kart_handling, kart_traction, kart_mini_turbo,
     kart_invincibility, model, path_sound)
VALUES
    (NULL, 'Standard Kart', 3, 4, 2, 3, 3, 5, 3, 'assets/model/karts/standard_kart.png', 'assets/sounds/karts/standard_kart.wav'),
    (NULL, 'Pipe Frame', 2, 6, 1, 4, 4, 6, 3, 'assets/model/karts/pipe_frame.png', 'assets/sounds/karts/pipe_frame.wav'),
    (NULL, 'Mach 8', 4, 3, 3, 2, 4, 5, 3, 'assets/model/karts/mach_8.png', 'assets/sounds/karts/mach_8.wav'),
    (NULL, 'Steel Driver', 3, 1, 4, 2, 3, 3, 6, 'assets/model/karts/steel_driver.png', 'assets/sounds/karts/steel_driver.wav'),
    (NULL, 'Cat Cruiser', 3, 5, 2, 3, 3, 6, 3, 'assets/model/karts/cat_cruiser.png', 'assets/sounds/karts/cat_cruiser.wav'),
    (NULL, 'Circuit Special', 3, 1, 3, 1, 1, 3, 6, 'assets/model/karts/circuit_special.png', 'assets/sounds/karts/circuit_special.wav'),
    (NULL, 'Tri-Speeder', 3, 1, 4, 2, 3, 3, 6, 'assets/model/karts/tri_speeder.png', 'assets/sounds/karts/tri_speeder.wav'),
    (NULL, 'Badwagon', 3, 0, 4, 0, 5, 3, 7, 'assets/model/karts/badwagon.png', 'assets/sounds/karts/badwagon.wav'),
    (NULL, 'Prancer', 3, 2, 1, 3, 2, 4, 5, 'assets/model/karts/prancer.png', 'assets/sounds/karts/prancer.wav'),
    (NULL, 'Biddybuggy', 1, 7, 0, 4, 4, 7, 0, 'assets/model/karts/biddybuggy.png', 'assets/sounds/karts/biddybuggy.wav'),
    (NULL, 'Landship', 2, 6, 0, 4, 6, 6, 2, 'assets/model/karts/landship.png', 'assets/sounds/karts/landship.wav'),
    (NULL, 'Sneeker', 3, 2, 2, 2, 0, 4, 5, 'assets/model/karts/sneeker.png', 'assets/sounds/karts/sneeker.wav'),
    (NULL, 'Sports Coupe', 4, 3, 3, 2, 4, 5, 3, 'assets/model/karts/sports_coupe.png', 'assets/sounds/karts/sports_coupe.wav'),
    (NULL, 'Gold Standard', 3, 2, 2, 2, 0, 4, 4, 'assets/model/karts/gold_standard.png', 'assets/sounds/karts/gold_standard.wav'),
    (NULL, 'GLA', 3, 0, 4, 0, 5, 3, 7, 'assets/model/karts/gla.png', 'assets/sounds/karts/gla.wav'),
    (NULL, 'W 25 Silver Arrow', 3, 5, 1, 4, 5, 5, 4, 'assets/model/karts/w_25_silver_arrow.png', 'assets/sounds/karts/w_25_silver_arrow.wav'),
    (NULL, '300 SL Roadster', 3, 4, 2, 3, 3, 5, 4, 'assets/model/karts/300_sl_roadster.png', 'assets/sounds/karts/300_sl_roadster.wav'),
    (NULL, 'Blue Falcon', 3, 3, 0, 3, 3, 4, 4, 'assets/model/karts/blue_falcon.png', 'assets/sounds/karts/blue_falcon.wav'),
    (NULL, 'Tanooki Kart', 3, 2, 3, 4, 7, 5, 4, 'assets/model/karts/tanooki_kart.png', 'assets/sounds/karts/tanooki_kart.wav'),
    (NULL, 'B Dasher', 3, 1, 3, 1, 1, 3, 6, 'assets/model/karts/b_dasher.png', 'assets/sounds/karts/b_dasher.wav'),
    (NULL, 'Streetle', 2, 6, 0, 4, 6, 6, 3, 'assets/model/karts/streetle.png', 'assets/sounds/karts/streetle.wav'),
    (NULL, 'P-Wing', 3, 1, 3, 1, 1, 3, 6, 'assets/model/karts/p_wing.png', 'assets/sounds/karts/p_wing.wav'),
    (NULL, 'Koopa Clown', 3, 2, 3, 4, 7, 5, 3, 'assets/model/karts/koopa_clown.png', 'assets/sounds/karts/koopa_clown.wav'),
    (NULL, 'Standard Bike', 3, 4, 2, 3, 5, 5, 4, 'assets/model/karts/standard_bike.png', 'assets/sounds/karts/standard_bike.wav'),
    (NULL, 'The Duke', 3, 4, 2, 3, 3, 5, 3, 'assets/model/karts/the_duke.png', 'assets/sounds/karts/the_duke.wav'),
    (NULL, 'Flame Rider', 3, 4, 2, 3, 5, 5, 4, 'assets/model/karts/flame_rider.png', 'assets/sounds/karts/flame_rider.wav'),
    (NULL, 'Varmint', 2, 6, 1, 4, 4, 6, 2, 'assets/model/karts/varmint.png', 'assets/sounds/karts/varmint.wav'),
    (NULL, 'Mr. Scooty', 1, 7, 0, 4, 4, 7, 0, 'assets/model/karts/mr_scooty.png', 'assets/sounds/karts/mr_scooty.wav'),
    (NULL, 'City Tripper', 2, 6, 1, 4, 4, 6, 2, 'assets/model/karts/city_tripper.png', 'assets/sounds/karts/city_tripper.wav'),
    (NULL, 'Master Cycle Zero', 3, 2, 3, 4, 7, 5, 3, 'assets/model/karts/master_cycle_zero.png', 'assets/sounds/karts/master_cycle_zero.wav'),
    (NULL, 'Comet', 3, 5, 2, 3, 3, 6, 3, 'assets/model/karts/comet.png', 'assets/sounds/karts/comet.wav'),
    (NULL, 'Sport Bike', 3, 2, 1, 3, 2, 4, 3, 'assets/model/karts/sport_bike.png', 'assets/sounds/karts/sport_bike.wav'),
    (NULL, 'Jet Bike', 3, 2, 1, 3, 2, 4, 3, 'assets/model/karts/jet_bike.png', 'assets/sounds/karts/jet_bike.wav'),
    (NULL, 'Yoshi Bike', 3, 5, 2, 3, 3, 6, 2, 'assets/model/karts/yoshi_bike.png', 'assets/sounds/karts/yoshi_bike.wav'),
    (NULL, 'Master Cycle', 3, 2, 2, 2, 0, 4, 3, 'assets/model/karts/master_cycle.png', 'assets/sounds/karts/master_cycle.wav'),
    (NULL, 'Standard ATV', 3, 0, 4, 0, 5, 3, 6, 'assets/model/karts/standard_atv.png', 'assets/sounds/karts/standard_atv.wav'),
    (NULL, 'Wild Wiggler', 3, 5, 1, 4, 5, 5, 4, 'assets/model/karts/wild_wiggler.png', 'assets/sounds/karts/wild_wiggler.wav'),
    (NULL, 'Teddy Buggy', 3, 5, 2, 3, 3, 6, 1, 'assets/model/karts/teddy_buggy.png', 'assets/sounds/karts/teddy_buggy.wav'),
    (NULL, 'Bone Rattler', 3, 1, 4, 2, 3, 3, 5, 'assets/model/karts/bone_rattler.png', 'assets/sounds/karts/bone_rattler.wav'),
    (NULL, 'Splat Buggy', 3, 3, 0, 3, 3, 4, 3, 'assets/model/karts/splat_buggy.png', 'assets/sounds/karts/splat_buggy.wav'),
    (NULL, 'Inkstriker', 4, 3, 3, 2, 4, 5, 1, 'assets/model/karts/inkstriker.png', 'assets/sounds/karts/inkstriker.wav');

INSERT INTO Wheel
    (id_wheel, wheel_name,
     wheel_speed, wheel_acceleration, wheel_weight,
     wheel_handling, wheel_traction, wheel_mini_turbo,
     wheel_invincibility, model, path_sound)
VALUES
    (NULL, 'Standard', 3, 4, 2, 3, 5, 4, 4, 'assets/model/wheels/standard.png', 'assets/sounds/wheels/standard.wav'),
    (NULL, 'Monster', 2, 2, 4, 1, 7, 3, 6, 'assets/model/wheels/monster.png', 'assets/sounds/wheels/monster.wav'),
    (NULL, 'Roller', 2, 6, 0, 4, 4, 6, 0, 'assets/model/wheels/roller.png', 'assets/sounds/wheels/roller.wav'),
    (NULL, 'Slim', 3, 2, 2, 4, 1, 3, 5, 'assets/model/wheels/slim.png', 'assets/sounds/wheels/slim.wav'),
    (NULL, 'Slick', 2, 1, 3, 1, 0, 2, 5, 'assets/model/wheels/slick.png', 'assets/sounds/wheels/slick.wav'),
    (NULL, 'Metal', 3, 0, 4, 1, 2, 2, 6, 'assets/model/wheels/metal.png', 'assets/sounds/wheels/metal.wav'),
    (NULL, 'Button', 2, 5, 0, 3, 3, 5, 3, 'assets/model/wheels/button.png', 'assets/sounds/wheels/button.wav'),
    (NULL, 'Off‑Road', 3, 3, 3, 2, 6, 3, 6, 'assets/model/wheels/offroad.png', 'assets/sounds/wheels/offroad.wav'),
    (NULL, 'Sponge', 2, 4, 1, 2, 6, 5, 4, 'assets/model/wheels/sponge.png', 'assets/sounds/wheels/sponge.wav'),
    (NULL, 'Wood', 3, 2, 2, 4, 1, 3, 5, 'assets/model/wheels/wood.png', 'assets/sounds/wheels/wood.wav'),
    (NULL, 'Cushion', 2, 4, 1, 2, 6, 5, 6, 'assets/model/wheels/cushion.png', 'assets/sounds/wheels/cushion.wav'),
    (NULL, 'Blue Standard', 3, 4, 2, 3, 5, 4, 4, 'assets/model/wheels/blue_standard.png', 'assets/sounds/wheels/blue_standard.wav'),
    (NULL, 'Hot Monster', 2, 2, 4, 1, 7, 3, 6, 'assets/model/wheels/hot_monster.png', 'assets/sounds/wheels/hot_monster.wav'),
    (NULL, 'Azure Roller', 2, 6, 0, 4, 4, 6, 0, 'assets/model/wheels/azure_roller.png', 'assets/sounds/wheels/azure_roller.wav'),
    (NULL, 'Crimson Slim', 3, 2, 2, 4, 1, 3, 5, 'assets/model/wheels/crimson_slim.png', 'assets/sounds/wheels/crimson_slim.wav'),
    (NULL, 'Cyber Slick', 2, 1, 3, 1, 0, 2, 5, 'assets/model/wheels/cyber_slick.png', 'assets/sounds/wheels/cyber_slick.wav'),
    (NULL, 'Retro Off‑Road', 3, 3, 3, 2, 6, 3, 6, 'assets/model/wheels/retro_offroad.png', 'assets/sounds/wheels/retro_offroad.wav'),
    (NULL, 'Gold', 3, 0, 4, 1, 2, 2, 5, 'assets/model/wheels/gold.png', 'assets/sounds/wheels/gold.wav'),
    (NULL, 'GLA', 3, 4, 2, 3, 5, 4, 5, 'assets/model/wheels/gla.png', 'assets/sounds/wheels/gla.wav'),
    (NULL, 'Triforce', 3, 3, 3, 2, 6, 3, 6, 'assets/model/wheels/triforce.png', 'assets/sounds/wheels/triforce.wav'),
	(NULL, 'Leaf', 2, 5, 0, 3, 3, 5, 3, 'assets/model/wheels/leaf.png', 'assets/sounds/wheels/leaf.wav'),
	(NULL, 'Ancient', 2, 2, 4, 1, 7, 3, 5, 'assets/model/wheels/ancient.png', 'assets/sounds/wheels/ancient.wav');

INSERT INTO Glider
    (id_glider, glider_name,
     glider_speed, glider_acceleration, glider_weight,
     glider_handling, glider_traction, glider_mini_turbo,
     glider_invincibility, model, path_sound)
VALUES
    (NULL, 'Super Glider', 1, 1, 1, 1, 1, 1, 1, 'assets/model/gliders/super_glider.png', 'assets/sounds/gliders/super_glider.wav'),
    (NULL, 'Cloud Glider', 1, 2, 0, 1, 1, 2, 0, 'assets/model/gliders/cloud_glider.png', 'assets/sounds/gliders/cloud_glider.wav'),
    (NULL, 'Wario Wing', 1, 0, 2, 1, 1, 1, 0, 'assets/model/gliders/wario_wing.png', 'assets/sounds/gliders/wario_wing.wav'),
    (NULL, 'Waddle Wing', 1, 1, 2, 1, 0, 1, 1, 'assets/model/gliders/waddle_wing.png', 'assets/sounds/gliders/waddle_wing.wav'),
    (NULL, 'Peach Parasol', 1, 2, 1, 1, 0, 2, 0, 'assets/model/gliders/peach_parasol.png', 'assets/sounds/gliders/peach_parasol.wav'),
    (NULL, 'Parachute', 1, 2, 0, 1, 1, 2, 0, 'assets/model/gliders/parachute.png', 'assets/sounds/gliders/parachute.wav'),
    (NULL, 'Parafoil', 1, 2, 1, 1, 0, 2, 0, 'assets/model/gliders/parafoil.png', 'assets/sounds/gliders/parafoil.wav'),
    (NULL, 'Flower Glider', 1, 2, 0, 1, 1, 2, 0, 'assets/model/gliders/flower_glider.png', 'assets/sounds/gliders/flower_glider.wav'),
    (NULL, 'Bowser Kite', 1, 2, 1, 1, 0, 2, 0, 'assets/model/gliders/bowser_kite.png', 'assets/sounds/gliders/bowser_kite.wav'),
    (NULL, 'Plane Glider', 1, 1, 2, 1, 0, 1, 1, 'assets/model/gliders/plane_glider.png', 'assets/sounds/gliders/plane_glider.wav'),
    (NULL, 'MKTV Parafoil', 1, 2, 1, 1, 0, 2, 0, 'assets/model/gliders/mktv_parafoil.png', 'assets/sounds/gliders/mktv_parafoil.wav'),
    (NULL, 'Gold Glider', 1, 1, 2, 1, 0, 1, 1, 'assets/model/gliders/gold_glider.png', 'assets/sounds/gliders/gold_glider.wav'),
    (NULL, 'Hylian Kite', 1, 1, 1, 1, 1, 1, 1, 'assets/model/gliders/hylian_kite.png', 'assets/sounds/gliders/hylian_kite.wav'),
    (NULL, 'Paper Glider', 1, 2, 0, 1, 1, 2, 0, 'assets/model/gliders/paper_glider.png', 'assets/sounds/gliders/paper_glider.wav'),
    (NULL, 'Paraglider', 1, 0, 2, 1, 1, 1, 0, 'assets/model/gliders/paraglider.png', 'assets/sounds/gliders/paraglider.wav');

INSERT INTO Player
	(id_player, id_character,id_kart, id_wheel,
     id_glider, smart_steering,
     auto_accelerate, tilt_controls)
VALUES
	(NULL, 72, 41, 15, 7, FALSE, TRUE, TRUE),
    (NULL, 13, 15, 11, 5, TRUE, TRUE, FALSE),
    (NULL, 42, 8, 4, 11, FALSE, FALSE, FALSE),
    (NULL, 66, 31, 8, 15, TRUE, FALSE, TRUE),
	(NULL, 48, 22, 19, 3, TRUE, TRUE, TRUE);