--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    tipo character varying(50) NOT NULL,
    visivelnoite boolean,
    numeroestrela integer NOT NULL,
    descricao text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    raio numeric(10,5),
    massa numeric(50,20),
    habitavel boolean NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    tipo character varying(50),
    massa numeric(10,5),
    distanciaestrela numeric(10,5) NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(50) NOT NULL,
    datalancamento date NOT NULL,
    operacional boolean,
    tipoorbita character varying(50) NOT NULL,
    descricaofabricante text
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    tipoestrela character varying(50) NOT NULL,
    massa numeric(50,20),
    idade integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Láctea', 'Espiral', true, 100, 'A Via Láctea é a galáxia onde o Sistema Solar está localizado.');
INSERT INTO public.galaxy VALUES (2, 'Andrômeda', 'Espiral', true, 1290, 'A galáxia de Andrômeda é uma galáxia espiral localizada perto da Via Láctea.');
INSERT INTO public.galaxy VALUES (3, 'Centaurus A', 'Elíptica', false, 200, 'Centaurus A é uma galáxia elíptica localizada na constelação de Centauro.');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elíptica gigante', false, 2000, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Espiral', false, 500, 'A galáxia Sombrero é conhecida por seu núcleo brilhante e forma distinta.');
INSERT INTO public.galaxy VALUES (6, 'Olho Negro', 'Anular', NULL, 100, 'A galáxia Olho Negro tem um anel de estrelas e poeira ao seu redor.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1737.10000, 735000000000000000000.00000000000000000000, false, 1);
INSERT INTO public.moon VALUES (2, 'Europa', 1560.00000, 480000000000000000000.00000000000000000000, true, 3);
INSERT INTO public.moon VALUES (3, 'Ganymede', 2634.10000, 14800000000000000.00000000000000000000, false, 2);
INSERT INTO public.moon VALUES (4, 'Titan', 2575.00000, 13500000000000000000.00000000000000000000, false, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 2410.30000, 10800000000000000.00000000000000000000, false, 4);
INSERT INTO public.moon VALUES (6, 'Io', 1821.60000, 893000000000000000.00000000000000000000, false, 6);
INSERT INTO public.moon VALUES (7, 'Moonlet', NULL, NULL, false, 7);
INSERT INTO public.moon VALUES (8, 'Phobos', 11.10000, 10800000000000.00000000000000000000, true, 9);
INSERT INTO public.moon VALUES (9, 'Deimos', 6.20000, 200000000000000.00000000000000000000, true, 8);
INSERT INTO public.moon VALUES (10, 'Mimas', 198.20000, NULL, true, 10);
INSERT INTO public.moon VALUES (11, 'Enceladus', 252.10000, 1080000000000000000.00000000000000000000, true, 11);
INSERT INTO public.moon VALUES (12, 'Tethys', NULL, 6180000000000.00000000000000000000, true, 12);
INSERT INTO public.moon VALUES (13, 'Dione', 561.40000, NULL, true, 10);
INSERT INTO public.moon VALUES (14, 'Rhea', NULL, 2310000000000000000.00000000000000000000, false, 4);
INSERT INTO public.moon VALUES (15, 'Iapetus', 1468.00000, 1810000000000000.00000000000000000000, false, 5);
INSERT INTO public.moon VALUES (16, 'Hyperion', NULL, 108000000000000.00000000000000000000, false, 5);
INSERT INTO public.moon VALUES (17, 'Charon', 606.00000, 1520000000000.00000000000000000000, false, 4);
INSERT INTO public.moon VALUES (18, 'Nereid', NULL, 31000000000000.00000000000000000000, false, 6);
INSERT INTO public.moon VALUES (19, 'Proteus', 210.00000, 440000000000.00000000000000000000, false, 7);
INSERT INTO public.moon VALUES (20, 'Triton', 1353.40000, 214000000000000.00000000000000000000, false, 8);
INSERT INTO public.moon VALUES (21, 'Miranda', 235.80000, 6590000000000000.00000000000000000000, false, 9);
INSERT INTO public.moon VALUES (22, 'Ariel', 578.90000, 12700000000000.00000000000000000000, false, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercúrio', 'Rochoso', 0.33000, 57.90000, 1);
INSERT INTO public.planet VALUES (2, 'Vênus', 'Rochoso', 4.87000, 108.20000, 2);
INSERT INTO public.planet VALUES (3, 'Terra', 'Rochoso', 5.97000, 149.60000, 1);
INSERT INTO public.planet VALUES (4, 'Marte', 'Rochoso', 0.64200, 227.90000, 2);
INSERT INTO public.planet VALUES (5, 'Júpiter', 'Gasoso', NULL, 778.50000, 3);
INSERT INTO public.planet VALUES (6, 'Saturno', 'Gasoso', 568.00000, 1433.50000, 4);
INSERT INTO public.planet VALUES (7, 'Urano', NULL, 86.80000, 2872.50000, 4);
INSERT INTO public.planet VALUES (8, 'Netuno', 'Gasoso', 102.00000, 4495.10000, 3);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 'Exoplaneta', 36.00000, 600.00000, 5);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'Exoplaneta', 1.27000, 4.24000, 5);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 'Exoplaneta', 3.10000, 20.30000, 6);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 'Exoplaneta', 220.00000, 150.00000, 6);
INSERT INTO public.planet VALUES (13, 'WASP-12b', 'Exoplaneta', 450.00000, 870.00000, 2);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Hubble', '1990-04-24', true, 'Baixa Terra', 'Telescope Science Institute');
INSERT INTO public.satellite VALUES (2, 'ISS', '1998-11-20', true, 'Estação Espacial', 'NASA');
INSERT INTO public.satellite VALUES (3, 'Voyager 1', '1977-09-05', false, 'Interplanetária', 'NASA');
INSERT INTO public.satellite VALUES (4, 'Mars Reconnaissance Orbiter', '2005-08-12', true, 'Marciana', 'NASA');
INSERT INTO public.satellite VALUES (5, 'Tiangong', '2011-09-29', true, 'Estação Espacial', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Anã Amarela', 198900000000000000000.00000000000000000000, 460000, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'Anã Amarela', 22000000000000000000.00000000000000000000, 6000000, 2);
INSERT INTO public.star VALUES (3, 'Sirius', 'Anã Branca', 2100000000000000.00000000000000000000, NULL, 3);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Supergigante Vermelha', NULL, 80000, 4);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Anã Vermelha', 12000000000000000.00000000000000000000, 5000, 5);
INSERT INTO public.star VALUES (6, 'Polaris', 'Gigante Amarela', 540000000000000.00000000000000000000, NULL, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

