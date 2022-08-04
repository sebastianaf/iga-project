--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.4

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

--
-- TOC entry 215 (class 1255 OID 16457)
-- Name: query(); Type: PROCEDURE; Schema: public; Owner: uv-iga-iot
--

CREATE PROCEDURE public.query()
    LANGUAGE sql
    AS $$SELECT * FROM public.metrics
WHERE metrics.metric_type_id = 1
ORDER BY id DESC
LIMIT 1000$$;


ALTER PROCEDURE public.query() OWNER TO "uv-iga-iot";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 16458)
-- Name: metric_types; Type: TABLE; Schema: public; Owner: uv-iga-iot
--

CREATE TABLE public.metric_types (
    id integer NOT NULL,
    value character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.metric_types OWNER TO "uv-iga-iot";

--
-- TOC entry 210 (class 1259 OID 16462)
-- Name: metric_types_id_seq; Type: SEQUENCE; Schema: public; Owner: uv-iga-iot
--

CREATE SEQUENCE public.metric_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metric_types_id_seq OWNER TO "uv-iga-iot";

--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 210
-- Name: metric_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uv-iga-iot
--

ALTER SEQUENCE public.metric_types_id_seq OWNED BY public.metric_types.id;


--
-- TOC entry 211 (class 1259 OID 16463)
-- Name: metrics; Type: TABLE; Schema: public; Owner: uv-iga-iot
--

CREATE TABLE public.metrics (
    id integer NOT NULL,
    value double precision NOT NULL,
    metric_type_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.metrics OWNER TO "uv-iga-iot";

--
-- TOC entry 212 (class 1259 OID 16467)
-- Name: metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: uv-iga-iot
--

CREATE SEQUENCE public.metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metrics_id_seq OWNER TO "uv-iga-iot";

--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 212
-- Name: metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uv-iga-iot
--

ALTER SEQUENCE public.metrics_id_seq OWNED BY public.metrics.id;


--
-- TOC entry 213 (class 1259 OID 16468)
-- Name: users; Type: TABLE; Schema: public; Owner: uv-iga-iot
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    alias character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    id_user integer NOT NULL,
    created_at timestamp with time zone
);


ALTER TABLE public.users OWNER TO "uv-iga-iot";

--
-- TOC entry 214 (class 1259 OID 16473)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: uv-iga-iot
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "uv-iga-iot";

--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uv-iga-iot
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3179 (class 2604 OID 16474)
-- Name: metric_types id; Type: DEFAULT; Schema: public; Owner: uv-iga-iot
--

ALTER TABLE ONLY public.metric_types ALTER COLUMN id SET DEFAULT nextval('public.metric_types_id_seq'::regclass);


--
-- TOC entry 3181 (class 2604 OID 16475)
-- Name: metrics id; Type: DEFAULT; Schema: public; Owner: uv-iga-iot
--

ALTER TABLE ONLY public.metrics ALTER COLUMN id SET DEFAULT nextval('public.metrics_id_seq'::regclass);


--
-- TOC entry 3182 (class 2604 OID 16476)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: uv-iga-iot
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3333 (class 0 OID 16458)
-- Dependencies: 209
-- Data for Name: metric_types; Type: TABLE DATA; Schema: public; Owner: uv-iga-iot
--

COPY public.metric_types (id, value, created_at) FROM stdin;
2	current	2022-08-03 00:00:00-05
1	water	2022-08-03 00:00:00-05
\.


--
-- TOC entry 3335 (class 0 OID 16463)
-- Dependencies: 211
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: uv-iga-iot
--

COPY public.metrics (id, value, metric_type_id, created_at) FROM stdin;
\.


--
-- TOC entry 3337 (class 0 OID 16468)
-- Dependencies: 213
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: uv-iga-iot
--

COPY public.users (id, name, alias, password, role, id_user, created_at) FROM stdin;
\.


--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 210
-- Name: metric_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uv-iga-iot
--

SELECT pg_catalog.setval('public.metric_types_id_seq', 1, false);


--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 212
-- Name: metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uv-iga-iot
--

SELECT pg_catalog.setval('public.metrics_id_seq', 1, false);


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: uv-iga-iot
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 3184 (class 2606 OID 16478)
-- Name: metric_types metric_types_pkey; Type: CONSTRAINT; Schema: public; Owner: uv-iga-iot
--

ALTER TABLE ONLY public.metric_types
    ADD CONSTRAINT metric_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3186 (class 2606 OID 16480)
-- Name: metrics metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: uv-iga-iot
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT metrics_pkey PRIMARY KEY (id);


--
-- TOC entry 3188 (class 2606 OID 16482)
-- Name: users users_alias_key; Type: CONSTRAINT; Schema: public; Owner: uv-iga-iot
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_alias_key UNIQUE (alias);


--
-- TOC entry 3190 (class 2606 OID 16484)
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: uv-iga-iot
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- TOC entry 3192 (class 2606 OID 16486)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: uv-iga-iot
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 16487)
-- Name: metrics metrics_metric_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: uv-iga-iot
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT metrics_metric_type_id_fkey FOREIGN KEY (metric_type_id) REFERENCES public.metric_types(id) ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2022-08-04 03:23:58 UTC

--
-- PostgreSQL database dump complete
--

