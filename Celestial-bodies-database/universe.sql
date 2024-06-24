CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  tipo VARCHAR(50) NOT NULL,
  visivelNoite BOOLEAN,
  numeroEstrela INT NOT NULL,
  descricao TEXT
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  tipoEstrela VARCHAR(50) NOT NULL,
  massa NUMERIC(50,20),
  idade INT,
  galaxy_id INT NOT NULL,
  FOREIGN KEY (galaxy_id) REFERENCES galaxy (galaxy_id)
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  tipo VARCHAR(50),
  massa NUMERIC(10,5),
  distanciaEstrela NUMERIC(10,5) NOT NULL,
  star_id INT NOT NULL,
  FOREIGN KEY (star_id) REFERENCES star (star_id)
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  raio NUMERIC(10,5),
  massa NUMERIC(50,20),
  habitavel BOOLEAN NOT NULL,
  planet_id INT NOT NULL,
  FOREIGN KEY (planet_id) REFERENCES planet (planet_id)
);

CREATE TABLE satellite (
  satellite_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  dataLancamento DATE NOT NULL,
  operacional BOOLEAN,
  tipoOrbita VARCHAR(50) NOT NULL,
  descricaoFabricante TEXT
);

-----------------------------------------------------

INSERT INTO galaxy (name, tipo, visivelNoite, numeroEstrela, descricao) VALUES 
('Via Láctea', 'Espiral', TRUE, 100, 'A Via Láctea é a galáxia onde o Sistema Solar está localizado.'),
('Andrômeda', 'Espiral', TRUE, 1290, 'A galáxia de Andrômeda é uma galáxia espiral localizada perto da Via Láctea.'),
('Centaurus A', 'Elíptica', FALSE, 200, 'Centaurus A é uma galáxia elíptica localizada na constelação de Centauro.'),
('Messier 87', 'Elíptica gigante', FALSE, 2000, NULL),
('Sombrero', 'Espiral', FALSE, 500, 'A galáxia Sombrero é conhecida por seu núcleo brilhante e forma distinta.'),
('Olho Negro', 'Anular', NULL, 100, 'A galáxia Olho Negro tem um anel de estrelas e poeira ao seu redor.');



INSERT INTO star (name, tipoEstrela, massa, idade, galaxy_id) VALUES 
('Sol', 'Anã Amarela', 198900000000000000000, 460000, 1),
('Alpha Centauri A', 'Anã Amarela', 22000000000000000000, 6000000, 2),
('Sirius', 'Anã Branca', 2100000000000000, NULL, 3),
('Betelgeuse', 'Supergigante Vermelha', NULL, 80000, 4),
('Proxima Centauri', 'Anã Vermelha', 12000000000000000, 5000, 5),
('Polaris', 'Gigante Amarela', 540000000000000, NULL, 6);


INSERT INTO planet (name, tipo, massa, distanciaEstrela, star_id) VALUES 
('Mercúrio', 'Rochoso', 0.33000, 57.90000, 1),
('Vênus', 'Rochoso', 4.87000, 108.20000, 2),
('Terra', 'Rochoso', 5.97000, 149.60000, 1),
('Marte', 'Rochoso', 0.64200, 227.90000, 2),
('Júpiter', 'Gasoso', NULL, 778.50000, 3),
('Saturno', 'Gasoso', 568.00000, 1433.50000, 4),
('Urano', NULL, 86.80000, 2872.50000, 4),
('Netuno', 'Gasoso', 102.00000, 4495.10000, 3),
('Kepler-22b', 'Exoplaneta', 36.00000, 600.00000, 5),
('Proxima Centauri b', 'Exoplaneta', 1.27000, 4.24000, 5),
('Gliese 581g', 'Exoplaneta', 3.10000, 20.30000, 6),
('HD 209458 b', 'Exoplaneta', 220.00000, 150.00000, 6),
('WASP-12b', 'Exoplaneta', 450.00000, 870.00000, 2);


INSERT INTO moon (name, raio, massa, habitavel, planet_id) VALUES
('Luna', 1737.10000, 735000000000000000000, FALSE, 1),
('Europa', 1560.00000, 480000000000000000000, TRUE, 3),
('Ganymede', 2634.10000, 14800000000000000, FALSE, 2),
('Titan', 2575.00000, 13500000000000000000, FALSE, 5),
('Callisto', 2410.30000, 10800000000000000, FALSE, 4),
('Io', 1821.60000, 893000000000000000, FALSE, 6),
('Moonlet', NULL, NULL, FALSE, 7),
('Phobos', 11.10000, 10800000000000, TRUE, 9),
('Deimos', 6.20000, 200000000000000, TRUE, 8),
('Mimas', 198.20000, NULL, TRUE, 10),
('Enceladus', 252.10000, 1080000000000000000, TRUE, 11),
('Tethys', NULL, 6180000000000, TRUE, 12),
('Dione', 561.40000, NULL, TRUE, 10),
('Rhea', NULL, 2310000000000000000, FALSE, 4),
('Iapetus', 1468.00000, 1810000000000000, FALSE, 5),
('Hyperion', NULL, 108000000000000, FALSE, 5),
('Charon', 606.00000, 1520000000000, FALSE, 4),
('Nereid', NULL, 31000000000000, FALSE, 6),
('Proteus', 210.00000, 440000000000, FALSE, 7),
('Triton', 1353.40000, 214000000000000, FALSE, 8),
('Miranda', 235.80000, 6590000000000000, FALSE, 9),
('Ariel', 578.90000, 12700000000000, FALSE, 2);


INSERT INTO `satellite` VALUES 
('Hubble','1990-04-24',1,'Baixa Terra','Telescope Science Institute'),
('ISS','1998-11-20',1,'Estação Espacial','NASA'),
('Voyager 1','1977-09-05',0,'Interplanetária','NASA'),
('Mars Reconnaissance Orbiter','2005-08-12',1,'Marciana','NASA'),
('Tiangong','2011-09-29',1,'Estação Espacial',NULL);


