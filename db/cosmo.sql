--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: body_types; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE body_types (
    id integer NOT NULL,
    description character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE body_types OWNER TO "zMac";

--
-- Name: body_types_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE body_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE body_types_id_seq OWNER TO "zMac";

--
-- Name: body_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE body_types_id_seq OWNED BY body_types.id;


--
-- Name: desired_genders; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE desired_genders (
    id integer NOT NULL,
    user_id integer,
    gender_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE desired_genders OWNER TO "zMac";

--
-- Name: desired_genders_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE desired_genders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE desired_genders_id_seq OWNER TO "zMac";

--
-- Name: desired_genders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE desired_genders_id_seq OWNED BY desired_genders.id;


--
-- Name: details_of_users; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE details_of_users (
    id integer NOT NULL,
    user_id integer NOT NULL,
    last_online timestamp without time zone,
    ethnicity_id integer,
    height numeric,
    body_type_id integer,
    relationship_status_id integer,
    religion_id integer,
    zip_code integer,
    latitude numeric,
    longitude numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE details_of_users OWNER TO "zMac";

--
-- Name: details_of_users_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE details_of_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE details_of_users_id_seq OWNER TO "zMac";

--
-- Name: details_of_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE details_of_users_id_seq OWNED BY details_of_users.id;


--
-- Name: ethnicities; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE ethnicities (
    id integer NOT NULL,
    description character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ethnicities OWNER TO "zMac";

--
-- Name: ethnicities_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE ethnicities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ethnicities_id_seq OWNER TO "zMac";

--
-- Name: ethnicities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE ethnicities_id_seq OWNED BY ethnicities.id;


--
-- Name: genders; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE genders (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE genders OWNER TO "zMac";

--
-- Name: genders_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE genders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genders_id_seq OWNER TO "zMac";

--
-- Name: genders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE genders_id_seq OWNED BY genders.id;


--
-- Name: interests; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE interests (
    id integer NOT NULL,
    description character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE interests OWNER TO "zMac";

--
-- Name: interests_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE interests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE interests_id_seq OWNER TO "zMac";

--
-- Name: interests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE interests_id_seq OWNED BY interests.id;


--
-- Name: matches; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE matches (
    id integer NOT NULL,
    sender_id integer NOT NULL,
    receiver_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT check_matches_sender_neq_receiver CHECK ((sender_id <> receiver_id))
);


ALTER TABLE matches OWNER TO "zMac";

--
-- Name: matches_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE matches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE matches_id_seq OWNER TO "zMac";

--
-- Name: matches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE matches_id_seq OWNED BY matches.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE messages (
    id integer NOT NULL,
    sender_id integer NOT NULL,
    receiver_id integer NOT NULL,
    body text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT check_messages_sender_neq_receiver CHECK ((sender_id <> receiver_id))
);


ALTER TABLE messages OWNER TO "zMac";

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE messages_id_seq OWNER TO "zMac";

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE messages_id_seq OWNED BY messages.id;


--
-- Name: photos; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE photos (
    id integer NOT NULL,
    user_id integer NOT NULL,
    description integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    url character varying NOT NULL,
    thumb_url character varying NOT NULL
);


ALTER TABLE photos OWNER TO "zMac";

--
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE photos_id_seq OWNER TO "zMac";

--
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE photos_id_seq OWNED BY photos.id;


--
-- Name: relationship_statuses; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE relationship_statuses (
    id integer NOT NULL,
    description character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE relationship_statuses OWNER TO "zMac";

--
-- Name: relationship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE relationship_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE relationship_statuses_id_seq OWNER TO "zMac";

--
-- Name: relationship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE relationship_statuses_id_seq OWNED BY relationship_statuses.id;


--
-- Name: religions; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE religions (
    id integer NOT NULL,
    title character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE religions OWNER TO "zMac";

--
-- Name: religions_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE religions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE religions_id_seq OWNER TO "zMac";

--
-- Name: religions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE religions_id_seq OWNED BY religions.id;


--
-- Name: response_categories; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE response_categories (
    id integer NOT NULL,
    title character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE response_categories OWNER TO "zMac";

--
-- Name: response_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE response_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE response_categories_id_seq OWNER TO "zMac";

--
-- Name: response_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE response_categories_id_seq OWNED BY response_categories.id;


--
-- Name: responses; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE responses (
    id integer NOT NULL,
    response_category_id integer NOT NULL,
    user_id integer NOT NULL,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE responses OWNER TO "zMac";

--
-- Name: responses_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE responses_id_seq OWNER TO "zMac";

--
-- Name: responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE responses_id_seq OWNED BY responses.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "zMac";

--
-- Name: user_interest_links; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE user_interest_links (
    id integer NOT NULL,
    user_id integer,
    interest_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE user_interest_links OWNER TO "zMac";

--
-- Name: user_interest_links_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE user_interest_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_interest_links_id_seq OWNER TO "zMac";

--
-- Name: user_interest_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE user_interest_links_id_seq OWNED BY user_interest_links.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying NOT NULL,
    password_digest character varying NOT NULL,
    session_token character varying NOT NULL,
    birthdate timestamp without time zone,
    gender_id integer,
    min_age integer,
    max_age integer,
    max_radius integer,
    last_login timestamp without time zone,
    last_logout timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO "zMac";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "zMac";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: visits; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE visits (
    id integer NOT NULL,
    visitor_id integer NOT NULL,
    profile_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE visits OWNER TO "zMac";

--
-- Name: visits_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE visits_id_seq OWNER TO "zMac";

--
-- Name: visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE visits_id_seq OWNED BY visits.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY body_types ALTER COLUMN id SET DEFAULT nextval('body_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY desired_genders ALTER COLUMN id SET DEFAULT nextval('desired_genders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY details_of_users ALTER COLUMN id SET DEFAULT nextval('details_of_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY ethnicities ALTER COLUMN id SET DEFAULT nextval('ethnicities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY genders ALTER COLUMN id SET DEFAULT nextval('genders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY interests ALTER COLUMN id SET DEFAULT nextval('interests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY matches ALTER COLUMN id SET DEFAULT nextval('matches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY messages ALTER COLUMN id SET DEFAULT nextval('messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY photos ALTER COLUMN id SET DEFAULT nextval('photos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY relationship_statuses ALTER COLUMN id SET DEFAULT nextval('relationship_statuses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY religions ALTER COLUMN id SET DEFAULT nextval('religions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY response_categories ALTER COLUMN id SET DEFAULT nextval('response_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY responses ALTER COLUMN id SET DEFAULT nextval('responses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY user_interest_links ALTER COLUMN id SET DEFAULT nextval('user_interest_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY visits ALTER COLUMN id SET DEFAULT nextval('visits_id_seq'::regclass);


--
-- Data for Name: body_types; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY body_types (id, description, created_at, updated_at) FROM stdin;
1	Rather Not Say	2015-08-12 04:13:25.58476	2015-08-12 04:13:25.58476
2	Thin	2015-08-12 04:13:25.587103	2015-08-12 04:13:25.587103
3	Overweight	2015-08-12 04:13:25.588552	2015-08-12 04:13:25.588552
4	Average	2015-08-12 04:13:25.589962	2015-08-12 04:13:25.589962
5	Fit	2015-08-12 04:13:25.59127	2015-08-12 04:13:25.59127
6	Jacked	2015-08-12 04:13:25.5926	2015-08-12 04:13:25.5926
7	A Little Extra	2015-08-12 04:13:25.593926	2015-08-12 04:13:25.593926
8	Curvy	2015-08-12 04:13:25.595208	2015-08-12 04:13:25.595208
9	Full Figured	2015-08-12 04:13:25.59647	2015-08-12 04:13:25.59647
10	Used Up	2015-08-12 04:13:25.597701	2015-08-12 04:13:25.597701
\.


--
-- Name: body_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('body_types_id_seq', 10, true);


--
-- Data for Name: desired_genders; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY desired_genders (id, user_id, gender_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: desired_genders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('desired_genders_id_seq', 1, false);


--
-- Data for Name: details_of_users; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY details_of_users (id, user_id, last_online, ethnicity_id, height, body_type_id, relationship_status_id, religion_id, zip_code, latitude, longitude, created_at, updated_at) FROM stdin;
1	1	\N	8	\N	4	1	1	\N	\N	\N	2015-08-12 04:19:06.212864	2015-08-12 04:19:06.212864
2	4	\N	8	\N	5	1	3	\N	\N	\N	2015-08-13 18:26:24.593496	2015-08-13 18:26:24.593496
4	6	\N	8	\N	3	3	4	\N	\N	\N	2015-08-13 19:06:48.203282	2015-08-13 19:06:48.203282
5	7	\N	5	\N	5	1	10	\N	\N	\N	2015-08-13 19:09:27.078736	2015-08-13 19:09:27.078736
6	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-16 06:11:48.564177	2015-08-16 06:11:48.564177
7	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-18 05:54:50.962866	2015-08-18 05:54:50.962866
8	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-19 02:01:25.223789	2015-08-19 02:01:25.223789
9	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-20 00:13:18.959154	2015-08-20 00:13:18.959154
\.


--
-- Name: details_of_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('details_of_users_id_seq', 9, true);


--
-- Data for Name: ethnicities; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY ethnicities (id, description, created_at, updated_at) FROM stdin;
1	Asian	2015-08-12 04:13:25.567632	2015-08-12 04:13:25.567632
2	Native American	2015-08-12 04:13:25.569751	2015-08-12 04:13:25.569751
3	Hispanic/Latin	2015-08-12 04:13:25.571115	2015-08-12 04:13:25.571115
4	Middle Eastern	2015-08-12 04:13:25.572421	2015-08-12 04:13:25.572421
5	Black	2015-08-12 04:13:25.573768	2015-08-12 04:13:25.573768
6	Indian	2015-08-12 04:13:25.575088	2015-08-12 04:13:25.575088
7	Pacific Islander	2015-08-12 04:13:25.576382	2015-08-12 04:13:25.576382
8	White	2015-08-12 04:13:25.577654	2015-08-12 04:13:25.577654
9	Other	2015-08-12 04:13:25.578902	2015-08-12 04:13:25.578902
\.


--
-- Name: ethnicities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('ethnicities_id_seq', 9, true);


--
-- Data for Name: genders; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY genders (id, name, created_at, updated_at) FROM stdin;
1	man	2015-08-12 04:13:25.555234	2015-08-12 04:13:25.555234
2	woman	2015-08-12 04:13:25.559638	2015-08-12 04:13:25.559638
3	other gender	2015-08-12 04:13:25.561399	2015-08-19 02:39:41.310009
4	dog	2015-08-21 07:43:46.489505	2015-08-21 07:43:46.489505
\.


--
-- Name: genders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('genders_id_seq', 4, true);


--
-- Data for Name: interests; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY interests (id, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('interests_id_seq', 1, false);


--
-- Data for Name: matches; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY matches (id, sender_id, receiver_id, created_at, updated_at) FROM stdin;
12	1	15	2015-08-19 06:58:20.589132	2015-08-19 06:58:20.589132
13	1	7	2015-08-19 06:58:27.785383	2015-08-19 06:58:27.785383
19	4	7	2015-08-19 18:04:41.183583	2015-08-19 18:04:41.183583
20	4	15	2015-08-19 18:04:47.838578	2015-08-19 18:04:47.838578
21	7	4	2015-08-19 18:04:58.878505	2015-08-19 18:04:58.878505
23	7	15	2015-08-19 20:35:30.574869	2015-08-19 20:35:30.574869
24	7	12	2015-08-19 21:02:32.672142	2015-08-19 21:02:32.672142
29	15	12	2015-08-20 04:02:28.839034	2015-08-20 04:02:28.839034
30	15	14	2015-08-20 04:02:33.569729	2015-08-20 04:02:33.569729
32	16	15	2015-08-20 04:48:42.267146	2015-08-20 04:48:42.267146
36	14	7	2015-08-21 01:33:03.619022	2015-08-21 01:33:03.619022
38	14	15	2015-08-21 07:17:42.832484	2015-08-21 07:17:42.832484
\.


--
-- Name: matches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('matches_id_seq', 38, true);


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY messages (id, sender_id, receiver_id, body, created_at, updated_at) FROM stdin;
2	14	15	The guy who runs the place is a little temperamental, especially about the ordering procedure. He’s secretly referred to as the Soup Nazi.	2015-08-21 06:08:12.764925	2015-08-21 06:08:12.764925
3	15	14	Why? What happens if you don’t order right?	2015-08-21 06:26:28.378487	2015-08-21 06:26:28.378487
4	14	15	He yells and you don’t get your soup.	2015-08-21 06:28:17.100806	2015-08-21 06:28:17.100806
5	16	15	No soup for you!	2015-08-21 08:35:09.786377	2015-08-21 08:35:09.786377
6	16	15	No soup for you!	2015-08-21 08:35:12.307527	2015-08-21 08:35:12.307527
7	1	4	How are things going?  Are you taking that job in Maine?	2015-08-21 08:37:36.733731	2015-08-21 08:37:36.733731
8	4	1	Not sure yet.	2015-08-21 08:37:58.151827	2015-08-21 08:37:58.151827
\.


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('messages_id_seq', 8, true);


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY photos (id, user_id, description, created_at, updated_at, url, thumb_url) FROM stdin;
1	7	\N	2015-08-18 01:32:06.388793	2015-08-18 01:32:06.388793	http://www.google.com	http://www.npr.org
2	7	\N	2015-08-18 01:32:42.25678	2015-08-18 01:32:42.25678	http://www.60minutes.com	http://www.thisamericanlife.org
\.


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('photos_id_seq', 2, true);


--
-- Data for Name: relationship_statuses; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY relationship_statuses (id, description, created_at, updated_at) FROM stdin;
1	Single	2015-08-12 04:13:25.622709	2015-08-12 04:13:25.622709
2	Seeing Someone	2015-08-12 04:13:25.624851	2015-08-12 04:13:25.624851
3	Married	2015-08-12 04:13:25.62632	2015-08-12 04:13:25.62632
4	In An Open Relationship	2015-08-12 04:13:25.627692	2015-08-12 04:13:25.627692
\.


--
-- Name: relationship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('relationship_statuses_id_seq', 4, true);


--
-- Data for Name: religions; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY religions (id, title, created_at, updated_at) FROM stdin;
1	Festivus	2015-08-12 04:13:25.603687	2015-08-12 04:13:25.603687
2	Agnosticism	2015-08-12 04:13:25.605832	2015-08-12 04:13:25.605832
3	Atheism	2015-08-12 04:13:25.607298	2015-08-12 04:13:25.607298
4	Christianity	2015-08-12 04:13:25.608711	2015-08-12 04:13:25.608711
5	Judaism	2015-08-12 04:13:25.610096	2015-08-12 04:13:25.610096
6	Catholocism	2015-08-12 04:13:25.61146	2015-08-12 04:13:25.61146
7	Islam	2015-08-12 04:13:25.612795	2015-08-12 04:13:25.612795
8	Hinduism	2015-08-12 04:13:25.614082	2015-08-12 04:13:25.614082
9	Buddhism	2015-08-12 04:13:25.615408	2015-08-12 04:13:25.615408
10	Other	2015-08-12 04:13:25.616705	2015-08-12 04:13:25.616705
\.


--
-- Name: religions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('religions_id_seq', 10, true);


--
-- Data for Name: response_categories; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY response_categories (id, title, created_at, updated_at) FROM stdin;
1	My self-summary	2015-08-12 04:13:25.633607	2015-08-12 04:13:25.633607
2	What I'm doing with my life	2015-08-12 04:13:25.635682	2015-08-12 04:13:25.635682
4	Favorite books, movies, shows, music, and food	2015-08-12 04:13:25.638527	2015-08-12 04:13:25.638527
5	The six things I could never do without	2015-08-12 04:13:25.639843	2015-08-12 04:13:25.639843
6	I spend a lot of time thinkin about	2015-08-12 04:13:25.641198	2015-08-12 04:13:25.641198
7	On a typical Friday night I am	2015-08-12 04:13:25.642507	2015-08-12 04:13:25.642507
8	You should message me if	2015-08-12 04:13:25.643774	2015-08-12 04:13:25.643774
3	I'm really good at.	2015-08-12 04:13:25.637142	2015-08-14 23:56:32.967242
\.


--
-- Name: response_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('response_categories_id_seq', 1, false);


--
-- Data for Name: responses; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY responses (id, response_category_id, user_id, body, created_at, updated_at) FROM stdin;
10	2	6	\N	2015-08-13 19:06:48.244348	2015-08-13 19:06:48.244348
12	4	6	\N	2015-08-13 19:06:48.297984	2015-08-13 19:06:48.297984
13	5	6	\N	2015-08-13 19:06:48.312887	2015-08-13 19:06:48.312887
14	6	6	\N	2015-08-13 19:06:48.327584	2015-08-13 19:06:48.327584
15	7	6	\N	2015-08-13 19:06:48.346335	2015-08-13 19:06:48.346335
16	8	6	\N	2015-08-13 19:06:48.391296	2015-08-13 19:06:48.391296
20	4	7	I don't speak english.\r\n  	2015-08-13 19:09:27.165825	2015-08-13 19:09:27.165825
22	6	7	when I'm going to go for a walk.	2015-08-13 19:09:27.193281	2015-08-13 19:09:27.193281
23	7	7	cuddling with Lorraine as she tries to do work.\r\n  	2015-08-13 19:09:27.230581	2015-08-13 19:09:27.230581
26	5	1	1,2,3,4,5,6	2015-08-17 16:49:48.15748	2015-08-17 16:49:48.15748
27	6	1	how far behind I am.	2015-08-17 16:49:56.34562	2015-08-17 16:49:56.34562
28	3	1	I thought computer programming, but I'm reevaluating.	2015-08-17 16:50:10.479905	2015-08-17 16:50:10.479905
9	1	6	Awesome father, uncle, husband, lawyer.	2015-08-13 19:06:48.227166	2015-08-17 16:51:11.877206
11	3	6	telling stories.	2015-08-13 19:06:48.258268	2015-08-17 16:51:18.064304
30	4	1	power of habit, memento, west wing, deadmau5 I remember, pizza.	2015-08-17 17:00:59.337161	2015-08-17 17:00:59.337161
31	7	1	Catching up on my project.	2015-08-17 18:52:23.285127	2015-08-17 18:52:23.285127
18	2	7	Cuddling.  Being sweet.  Looking cute.  	2015-08-13 19:09:27.112862	2015-08-17 19:08:01.104797
19	3	7	That sad puppy dog stare.  	2015-08-13 19:09:27.151998	2015-08-17 21:07:24.85567
17	1	7	I'm the easiest dog the Zelazniks have ever had.  	2015-08-13 19:09:27.097903	2015-08-17 21:07:30.075223
24	8	7	You're a black lab or golden retriever.  	2015-08-13 19:09:27.24444	2015-08-17 22:01:43.451087
25	2	1	Attending a coding bootcamp.	2015-08-17 16:49:39.046196	2015-08-18 03:03:08.532236
29	1	1	(edit) I don't know what to say.	2015-08-17 17:00:24.367881	2015-08-18 04:02:45.024907
21	5	7	tennis balls, tennis, balls, tennis balls.  	2015-08-13 19:09:27.179685	2015-08-18 04:23:30.310019
33	3	4	charming people	2015-08-18 04:28:49.901855	2015-08-18 04:28:49.901855
34	6	4	happy gilmore	2015-08-18 04:28:56.509794	2015-08-18 04:28:56.509794
35	1	4	not sure where I'm going in life, but making lots of friends on the way.	2015-08-18 04:29:07.66948	2015-08-18 04:29:07.66948
36	7	4	working	2015-08-18 04:29:14.661676	2015-08-18 04:29:14.661676
32	8	1	(edit) You know CSS and/or bootstrap.	2015-08-17 18:52:32.824896	2015-08-18 05:26:28.823061
37	3	14	Stand up comedy.	2015-08-18 18:16:14.151676	2015-08-18 18:16:14.151676
38	6	14	how to make clean humor.	2015-08-18 18:16:22.109873	2015-08-18 18:16:22.109873
39	1	14	I had the number one TV show.	2015-08-18 18:16:31.221476	2015-08-18 18:16:31.221476
40	7	14	Counting my 401k.	2015-08-18 18:16:39.598132	2015-08-18 18:16:39.598132
42	8	15	You're sponge worthy.	2015-08-19 02:05:36.506112	2015-08-19 02:05:36.506112
43	3	15	dancing	2015-08-19 02:19:49.483958	2015-08-19 02:19:49.483958
44	1	15	I HAVE A 212 NUMBER NOW!!!	2015-08-19 02:20:05.982471	2015-08-19 02:20:05.982471
45	6	16	why I left my recipies in my old armoir	2015-08-20 04:43:22.102684	2015-08-20 04:43:22.102684
46	3	16	making soup, and making you feel inferior	2015-08-20 04:43:42.605408	2015-08-20 04:43:42.605408
47	1	16	take three steps to the right and I'll tell you.	2015-08-20 04:43:58.947611	2015-08-20 04:43:58.947611
48	2	4	weafasdfasdf	2015-08-20 20:51:55.17787	2015-08-20 20:51:55.17787
49	8	14		2015-08-21 05:22:10.380868	2015-08-21 05:22:10.380868
41	5	14	Elaine, Newman, Tom's Restaurant	2015-08-18 21:31:45.386885	2015-08-21 05:30:53.556268
\.


--
-- Name: responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('responses_id_seq', 49, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY schema_migrations (version) FROM stdin;
20150811162119
20150811162243
20150811162357
20150811162514
20150811162557
20150811162720
20150811162930
20150811163203
20150811164748
20150811165025
20150811165653
20150811165959
20150811170635
20150811170844
20150811171049
20150811172719
20150816055328
20150816055846
20150818012611
20150819005213
\.


--
-- Data for Name: user_interest_links; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY user_interest_links (id, user_id, interest_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: user_interest_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('user_interest_links_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY users (id, username, password_digest, session_token, birthdate, gender_id, min_age, max_age, max_radius, last_login, last_logout, created_at, updated_at) FROM stdin;
14	seinfeld	$2a$10$WO0BighJXm2znlGFT0XxWuC/RYPtvVFfOHN.7o5.aeFb9StkJUwxe	tytk1h8P4P50FQkFWFshiw	0006-09-20 00:00:00	1	\N	\N	\N	\N	\N	2015-08-18 05:54:50.957263	2015-08-21 16:07:10.685486
12	sparticus	$2a$10$LRnclwqRXbDPkp.e1vaHBeyX8wOENzhro5IETV/FC53KMICZkH3Zq	3a_kSfDQQXoXB11jC5sPSA	1990-01-01 00:00:00	1	\N	\N	\N	\N	\N	2015-08-16 06:11:48.548833	2015-08-18 06:53:26.478577
15	elaine	$2a$10$C1iMvXxqnYvXZJ2NVwEVmeDsFizZa0CaGjQrimCZ4uNdfDNEQ./Pm	dTGKxFrAjMhPUjpDp7FHCw	1961-01-13 00:00:00	2	\N	\N	\N	\N	\N	2015-08-19 02:01:25.216819	2015-08-20 22:05:52.141961
6	robert	$2a$10$HbJeVTqbIhlQZ5sYRSmBB.T81AENlKFWsXru0ZLHZA8Brh.HMLsRO	ilIvlSLrXf8Ue6-HlHnVOw	1959-01-01 00:00:00	1	18	92	50	\N	\N	2015-08-13 19:06:48.15266	2015-08-17 16:51:33.461609
7	chloe	$2a$10$hcBR4JDKLUvLfZhrq9MU4u4iHE6geGHEsJHIVOgn6FdKpMmvCZGee	sbnZn6Xts3gBRIQoDuM6TA	2010-12-01 00:00:00	4	18	92	50	\N	\N	2015-08-13 19:09:27.02488	2015-08-21 07:44:03.702282
16	soup_nazi	$2a$10$MRxNj4rwkW0aW8mE5BCn.uAlkdI/dd0sQEqVaDGlYGGP/W/yvFIv6	pIS79u1zgDQa4z8_IH_p2A	1956-09-01 00:00:00	1	\N	\N	\N	\N	\N	2015-08-20 00:13:18.952628	2015-08-21 08:13:22.979445
1	zelaznik	$2a$10$GxKq.J.9qWJ2tlLU7P6UEerTRa01rIef7GLb9WaXb3FOePHzF/acC	RjJe9vu2GgI3ocMLhhSRhw	0004-03-06 00:00:00	1	18	92	50	\N	\N	2015-08-12 04:19:06.209106	2015-08-21 08:37:04.006111
4	michael	$2a$10$L5KCtJ632ssljfS/qTaFBOtcIVowGo6aSb1XwCobV3yvjYepJNWwy	u1d2mebjeKj8v4RJrc8_pQ	2014-08-20 00:00:00	1	18	92	50	\N	\N	2015-08-13 18:26:24.546648	2015-08-21 08:37:46.072025
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('users_id_seq', 16, true);


--
-- Data for Name: visits; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY visits (id, visitor_id, profile_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('visits_id_seq', 1, false);


--
-- Name: body_types_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY body_types
    ADD CONSTRAINT body_types_pkey PRIMARY KEY (id);


--
-- Name: desired_genders_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY desired_genders
    ADD CONSTRAINT desired_genders_pkey PRIMARY KEY (id);


--
-- Name: details_of_users_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY details_of_users
    ADD CONSTRAINT details_of_users_pkey PRIMARY KEY (id);


--
-- Name: ethnicities_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY ethnicities
    ADD CONSTRAINT ethnicities_pkey PRIMARY KEY (id);


--
-- Name: genders_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY genders
    ADD CONSTRAINT genders_pkey PRIMARY KEY (id);


--
-- Name: interests_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY interests
    ADD CONSTRAINT interests_pkey PRIMARY KEY (id);


--
-- Name: matches_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_pkey PRIMARY KEY (id);


--
-- Name: messages_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: photos_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: relationship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY relationship_statuses
    ADD CONSTRAINT relationship_statuses_pkey PRIMARY KEY (id);


--
-- Name: religions_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY religions
    ADD CONSTRAINT religions_pkey PRIMARY KEY (id);


--
-- Name: response_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY response_categories
    ADD CONSTRAINT response_categories_pkey PRIMARY KEY (id);


--
-- Name: responses_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY responses
    ADD CONSTRAINT responses_pkey PRIMARY KEY (id);


--
-- Name: user_interest_links_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY user_interest_links
    ADD CONSTRAINT user_interest_links_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: visits_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);


--
-- Name: index_body_types_on_description; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_body_types_on_description ON body_types USING btree (description);


--
-- Name: index_desired_genders_on_gender_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_desired_genders_on_gender_id ON desired_genders USING btree (gender_id);


--
-- Name: index_desired_genders_on_user_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_desired_genders_on_user_id ON desired_genders USING btree (user_id);


--
-- Name: index_desired_genders_on_user_id_and_gender_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_desired_genders_on_user_id_and_gender_id ON desired_genders USING btree (user_id, gender_id);


--
-- Name: index_details_of_users_on_body_type_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_details_of_users_on_body_type_id ON details_of_users USING btree (body_type_id);


--
-- Name: index_details_of_users_on_ethnicity_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_details_of_users_on_ethnicity_id ON details_of_users USING btree (ethnicity_id);


--
-- Name: index_details_of_users_on_height; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_details_of_users_on_height ON details_of_users USING btree (height);


--
-- Name: index_details_of_users_on_relationship_status_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_details_of_users_on_relationship_status_id ON details_of_users USING btree (relationship_status_id);


--
-- Name: index_details_of_users_on_religion_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_details_of_users_on_religion_id ON details_of_users USING btree (religion_id);


--
-- Name: index_details_of_users_on_user_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_details_of_users_on_user_id ON details_of_users USING btree (user_id);


--
-- Name: index_ethnicities_on_description; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_ethnicities_on_description ON ethnicities USING btree (description);


--
-- Name: index_genders_on_name; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_genders_on_name ON genders USING btree (name);


--
-- Name: index_interests_on_description; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_interests_on_description ON interests USING btree (description);


--
-- Name: index_matches_on_receiver_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_matches_on_receiver_id ON matches USING btree (receiver_id);


--
-- Name: index_matches_on_sender_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_matches_on_sender_id ON matches USING btree (sender_id);


--
-- Name: index_matches_on_sender_id_and_receiver_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_matches_on_sender_id_and_receiver_id ON matches USING btree (sender_id, receiver_id);


--
-- Name: index_messages_on_receiver_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_messages_on_receiver_id ON messages USING btree (receiver_id);


--
-- Name: index_messages_on_sender_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_messages_on_sender_id ON messages USING btree (sender_id);


--
-- Name: index_messages_on_sender_id_and_receiver_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_messages_on_sender_id_and_receiver_id ON messages USING btree (sender_id, receiver_id);


--
-- Name: index_photos_on_user_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_photos_on_user_id ON photos USING btree (user_id);


--
-- Name: index_relationship_statuses_on_description; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_relationship_statuses_on_description ON relationship_statuses USING btree (description);


--
-- Name: index_religions_on_title; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_religions_on_title ON religions USING btree (title);


--
-- Name: index_response_categories_on_title; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_response_categories_on_title ON response_categories USING btree (title);


--
-- Name: index_responses_on_response_category_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_responses_on_response_category_id ON responses USING btree (response_category_id);


--
-- Name: index_responses_on_user_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_responses_on_user_id ON responses USING btree (user_id);


--
-- Name: index_responses_on_user_id_and_response_category_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_responses_on_user_id_and_response_category_id ON responses USING btree (user_id, response_category_id);


--
-- Name: index_user_interest_links_on_interest_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_user_interest_links_on_interest_id ON user_interest_links USING btree (interest_id);


--
-- Name: index_user_interest_links_on_user_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_user_interest_links_on_user_id ON user_interest_links USING btree (user_id);


--
-- Name: index_user_interest_links_on_user_id_and_interest_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_user_interest_links_on_user_id_and_interest_id ON user_interest_links USING btree (user_id, interest_id);


--
-- Name: index_users_on_session_token; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_session_token ON users USING btree (session_token);


--
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_username ON users USING btree (username);


--
-- Name: index_visits_on_profile_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_visits_on_profile_id ON visits USING btree (profile_id);


--
-- Name: index_visits_on_visitor_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_visits_on_visitor_id ON visits USING btree (visitor_id);


--
-- Name: index_visits_on_visitor_id_and_profile_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_visits_on_visitor_id_and_profile_id ON visits USING btree (visitor_id, profile_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_06f41649f1; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY details_of_users
    ADD CONSTRAINT fk_rails_06f41649f1 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_0e82c8a925; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY details_of_users
    ADD CONSTRAINT fk_rails_0e82c8a925 FOREIGN KEY (relationship_status_id) REFERENCES relationship_statuses(id);


--
-- Name: fk_rails_1d76cf6954; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY user_interest_links
    ADD CONSTRAINT fk_rails_1d76cf6954 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_226f7867bd; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY details_of_users
    ADD CONSTRAINT fk_rails_226f7867bd FOREIGN KEY (ethnicity_id) REFERENCES ethnicities(id);


--
-- Name: fk_rails_2bd9a0753e; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY responses
    ADD CONSTRAINT fk_rails_2bd9a0753e FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_3d5495eb35; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT fk_rails_3d5495eb35 FOREIGN KEY (sender_id) REFERENCES users(id);


--
-- Name: fk_rails_4154aab8fd; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT fk_rails_4154aab8fd FOREIGN KEY (receiver_id) REFERENCES users(id);


--
-- Name: fk_rails_47055e3204; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_47055e3204 FOREIGN KEY (gender_id) REFERENCES genders(id);


--
-- Name: fk_rails_4bcdc22c1b; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY responses
    ADD CONSTRAINT fk_rails_4bcdc22c1b FOREIGN KEY (response_category_id) REFERENCES response_categories(id);


--
-- Name: fk_rails_5118b56961; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY visits
    ADD CONSTRAINT fk_rails_5118b56961 FOREIGN KEY (profile_id) REFERENCES users(id);


--
-- Name: fk_rails_67c67d2963; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT fk_rails_67c67d2963 FOREIGN KEY (receiver_id) REFERENCES users(id);


--
-- Name: fk_rails_a407c53dcd; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY user_interest_links
    ADD CONSTRAINT fk_rails_a407c53dcd FOREIGN KEY (interest_id) REFERENCES interests(id);


--
-- Name: fk_rails_ac8d78ef71; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY desired_genders
    ADD CONSTRAINT fk_rails_ac8d78ef71 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_b156c396f4; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY visits
    ADD CONSTRAINT fk_rails_b156c396f4 FOREIGN KEY (visitor_id) REFERENCES users(id);


--
-- Name: fk_rails_b8f26a382d; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT fk_rails_b8f26a382d FOREIGN KEY (sender_id) REFERENCES users(id);


--
-- Name: fk_rails_c15204215a; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY desired_genders
    ADD CONSTRAINT fk_rails_c15204215a FOREIGN KEY (gender_id) REFERENCES genders(id);


--
-- Name: fk_rails_c79d76afc0; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT fk_rails_c79d76afc0 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_cd4d9a2710; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY details_of_users
    ADD CONSTRAINT fk_rails_cd4d9a2710 FOREIGN KEY (body_type_id) REFERENCES body_types(id);


--
-- Name: fk_rails_dc762f37c6; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY details_of_users
    ADD CONSTRAINT fk_rails_dc762f37c6 FOREIGN KEY (religion_id) REFERENCES religions(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: zMac
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "zMac";
GRANT ALL ON SCHEMA public TO "zMac";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

