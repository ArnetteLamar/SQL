--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    description text,
    galaxy_type character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(12,2),
    has_life boolean NOT NULL
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
    planet_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    has_water boolean,
    diameter_in_km integer,
    description text
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
    star_id integer NOT NULL,
    planet_type_id integer,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_star integer,
    mass numeric(10,2)
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    is_gas_giant boolean NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature_in_kelvin integer NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean NOT NULL,
    description text
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our solar system.', 'Spiral', 13600, 0.00, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest large galaxy to the Milky Way.', 'Spiral', 10000, 2537000.00, false);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'A galaxy with a bright nucleus.', 'Spiral', 13250, 29000000.00, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A grand-design spiral galaxy.', 'Spiral', 400, 23000000.00, false);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'A face-on spiral galaxy.', 'Spiral', 21000, 21000000.00, false);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'A spiral galaxy in the Local Group.', 'Spiral', 12000, 2730000.00, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, true, true, 3474, 'Earth natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, false, 22, 'A moon of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, false, 12, 'A smaller moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, true, false, 3643, 'A volcanic moon of Jupiter.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, true, 3122, 'An icy moon of Jupiter.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, true, true, 5268, 'The largest moon in the Solar System.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, true, 4821, 'A large moon of Jupiter.');
INSERT INTO public.moon VALUES (8, 'Titan', 6, true, true, 5150, 'The largest moon of Saturn.');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, true, true, 504, 'An icy moon of Saturn.');
INSERT INTO public.moon VALUES (10, 'Rhea', 6, true, false, 1528, 'A moon of Saturn.');
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, true, false, 1470, 'A moon of Saturn.');
INSERT INTO public.moon VALUES (12, 'Dione', 6, true, false, 1123, 'A moon of Saturn.');
INSERT INTO public.moon VALUES (13, 'Tethys', 6, true, false, 1062, 'A moon of Saturn.');
INSERT INTO public.moon VALUES (14, 'Mimas', 6, true, false, 396, 'A small moon of Saturn.');
INSERT INTO public.moon VALUES (15, 'Titania', 7, true, false, 1578, 'A moon of Uranus.');
INSERT INTO public.moon VALUES (16, 'Oberon', 7, true, false, 1523, 'A moon of Uranus.');
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, true, false, 1169, 'A moon of Uranus.');
INSERT INTO public.moon VALUES (18, 'Ariel', 7, true, false, 1158, 'A moon of Uranus.');
INSERT INTO public.moon VALUES (19, 'Miranda', 7, true, false, 472, 'A moon of Uranus.');
INSERT INTO public.moon VALUES (20, 'Triton', 8, true, true, 2707, 'The largest moon of Neptune.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 1, false, true, 58, 0.33);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 1, false, true, 108, 4.87);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, true, true, 150, 5.97);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1, false, true, 228, 0.64);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 2, false, true, 778, 1898.00);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 2, false, true, 1434, 568.00);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 3, false, true, 2871, 86.80);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 3, false, true, 4495, 102.00);
INSERT INTO public.planet VALUES (9, 'Proxima b', 3, 1, false, true, 7, 1.27);
INSERT INTO public.planet VALUES (10, 'Sirius Planet One', 2, 2, false, true, 500, 300.00);
INSERT INTO public.planet VALUES (11, 'Vega Prime', 6, 1, false, true, 200, 2.50);
INSERT INTO public.planet VALUES (12, 'Rigel Minor', 5, 3, false, true, 900, 50.00);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'A rocky planet with a solid surface.', false);
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'A large planet mostly made of gas.', true);
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'A giant planet made mainly of heavier volatile substances.', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 4600, true, 'The star at the center of the Solar System.');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, 242, true, 'The brightest star in the night sky.');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 3042, 4850, true, 'The closest known star to the Sun.');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 3500, 10, true, 'A red supergiant star.');
INSERT INTO public.star VALUES (5, 'Rigel', 1, 12100, 8, true, 'A blue supergiant star.');
INSERT INTO public.star VALUES (6, 'Vega', 1, 9602, 455, true, 'A bright star in the constellation Lyra.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 3, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

