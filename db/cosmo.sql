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

--
-- Name: _trg_aft_ins_response_categories(); Type: FUNCTION; Schema: public; Owner: zMac
--

CREATE FUNCTION _trg_aft_ins_response_categories() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
        INSERT INTO responses (
        response_category_id, user_id, created_at, updated_at)
        SELECT NEW.id, id, NEW.updated_at, NEW.updated_at
        FROM users;
        RETURN NULL;
      END
    $$;


ALTER FUNCTION public._trg_aft_ins_response_categories() OWNER TO "zMac";

--
-- Name: _trg_aft_ins_users(); Type: FUNCTION; Schema: public; Owner: zMac
--

CREATE FUNCTION _trg_aft_ins_users() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
        INSERT INTO desired_genders (
        gender_id, user_id, created_at, updated_at)
        SELECT id, NEW.id, NEW.created_at, NEW.created_at
        FROM genders;

        INSERT INTO responses (
        response_category_id, user_id, created_at, updated_at)
        SELECT id, NEW.id, NEW.updated_at, NEW.updated_at
        FROM response_categories;

        RETURN NULL;
      END
    $$;


ALTER FUNCTION public._trg_aft_ins_users() OWNER TO "zMac";

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
-- Name: default_preferences; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE default_preferences (
    id integer NOT NULL,
    gender_id integer NOT NULL,
    desire_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE default_preferences OWNER TO "zMac";

--
-- Name: default_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE default_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE default_preferences_id_seq OWNER TO "zMac";

--
-- Name: default_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE default_preferences_id_seq OWNED BY default_preferences.id;


--
-- Name: desired_genders; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE desired_genders (
    id integer NOT NULL,
    user_id integer,
    gender_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    interested boolean DEFAULT false NOT NULL
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
    updated_at timestamp without time zone NOT NULL,
    plural character varying NOT NULL
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
-- Name: user_options_json_cache; Type: MATERIALIZED VIEW; Schema: public; Owner: zMac; Tablespace: 
--

CREATE MATERIALIZED VIEW user_options_json_cache AS
 SELECT (array_to_json(array_agg(genders.*)))::text AS genders,
    (array_to_json(array_agg(religions.*)))::text AS religions,
    (array_to_json(array_agg(relationship_statuses.*)))::text AS relationship_statuses,
    (array_to_json(array_agg(body_types.*)))::text AS body_types,
    (array_to_json(array_agg(ethnicities.*)))::text AS ethnicities
   FROM genders,
    religions,
    relationship_statuses,
    body_types,
    ethnicities
  WITH NO DATA;


ALTER TABLE user_options_json_cache OWNER TO "zMac";

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
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT check_visits_visitor_neq_profile CHECK ((visitor_id <> profile_id))
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

ALTER TABLE ONLY default_preferences ALTER COLUMN id SET DEFAULT nextval('default_preferences_id_seq'::regclass);


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
11	Gladiator	2015-11-01 21:37:41.493286	2015-11-01 21:37:41.493286
\.


--
-- Name: body_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('body_types_id_seq', 11, true);


--
-- Data for Name: default_preferences; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY default_preferences (id, gender_id, desire_id, created_at, updated_at) FROM stdin;
1	1	2	2015-09-10 01:48:39.56298	2015-09-10 01:48:39.56298
2	2	1	2015-09-10 01:48:39.565634	2015-09-10 01:48:39.565634
3	3	3	2015-09-10 01:48:39.567171	2015-09-10 01:48:39.567171
\.


--
-- Name: default_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('default_preferences_id_seq', 4, true);


--
-- Data for Name: desired_genders; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY desired_genders (id, user_id, gender_id, created_at, updated_at, interested) FROM stdin;
47	21	2	2015-08-24 17:19:03.627613	2015-08-24 17:19:03.627613	t
22	19	2	2015-08-21 22:51:11.618895	2015-08-21 22:51:11.618895	t
50	22	1	2015-09-07 05:32:36.568962	2015-09-07 05:32:36.568962	f
2	17	1	2015-08-21 22:29:30.26859	2015-08-21 22:29:30.26859	f
4	12	1	2015-08-16 06:11:48.548833	2015-08-16 06:11:48.548833	f
52	22	3	2015-09-07 05:32:36.568962	2015-09-07 05:32:36.568962	f
77	29	2	2015-10-26 10:34:30.81212	2015-10-26 10:34:30.81212	f
78	29	3	2015-10-26 10:34:30.81212	2015-10-26 10:34:30.81212	f
12	16	1	2015-08-20 00:13:18.952628	2015-08-20 00:13:18.952628	f
16	20	2	2015-08-23 05:44:27.176509	2015-08-23 05:44:27.176509	f
24	17	3	2015-08-21 22:29:30.26859	2015-08-21 22:29:30.26859	f
26	12	3	2015-08-16 06:11:48.548833	2015-08-16 06:11:48.548833	f
27	20	3	2015-08-23 05:44:27.176509	2015-08-23 05:44:27.176509	f
76	29	1	2015-10-26 10:34:30.81212	2015-10-26 10:35:32.14104	t
33	19	3	2015-08-21 22:51:11.618895	2015-08-21 22:51:11.618895	f
34	16	3	2015-08-20 00:13:18.952628	2015-08-20 00:13:18.952628	f
79	30	1	2015-10-26 10:50:13.274341	2015-10-26 10:50:13.274341	f
81	30	3	2015-10-26 10:50:13.274341	2015-10-26 10:50:13.274341	f
80	30	2	2015-10-26 10:50:13.274341	2015-10-26 10:51:29.241927	t
82	31	1	2015-10-26 10:55:20.045129	2015-10-26 10:55:20.045129	f
84	31	3	2015-10-26 10:55:20.045129	2015-10-26 10:55:20.045129	f
83	31	2	2015-10-26 10:55:20.045129	2015-10-26 10:56:06.753812	t
21	14	2	2015-08-18 05:54:50.957263	2015-10-26 21:42:55.181121	t
46	21	1	2015-08-24 17:19:03.627613	2015-08-24 17:19:03.627613	f
48	21	3	2015-08-24 17:19:03.627613	2015-08-24 17:19:03.627613	f
86	32	2	2015-10-28 04:33:37.318651	2015-10-28 04:33:37.318651	f
5	20	1	2015-08-23 05:44:27.176509	2015-08-23 05:44:27.176509	t
87	32	3	2015-10-28 04:33:37.318651	2015-10-28 04:33:37.318651	f
11	19	1	2015-08-21 22:51:11.618895	2015-08-21 22:51:11.618895	t
13	17	2	2015-08-21 22:29:30.26859	2015-08-21 22:29:30.26859	t
15	12	2	2015-08-16 06:11:48.548833	2015-08-16 06:11:48.548833	t
85	32	1	2015-10-28 04:33:37.318651	2015-10-28 04:35:25.114976	t
23	16	2	2015-08-20 00:13:18.952628	2015-08-20 00:13:18.952628	t
63	25	2	2015-09-09 15:14:36.157421	2015-09-09 15:14:36.157421	f
64	25	3	2015-09-09 15:14:36.157421	2015-09-09 15:14:36.157421	f
18	1	2	2015-08-12 04:19:06.209106	2015-10-31 09:43:20.390071	t
17	15	2	2015-08-19 02:01:25.216819	2015-09-10 05:45:52.342828	f
94	35	1	2015-10-28 07:51:38.641464	2015-10-28 07:51:38.641464	f
6	15	1	2015-08-19 02:01:25.216819	2015-09-10 05:45:53.495128	t
95	35	2	2015-10-28 07:51:38.641464	2015-10-28 07:51:38.641464	f
96	35	3	2015-10-28 07:51:38.641464	2015-10-28 07:51:38.641464	f
28	15	3	2015-08-19 02:01:25.216819	2015-09-10 04:25:34.474121	f
55	23	2	2015-09-09 09:29:07.476717	2015-09-10 06:20:27.074805	t
56	23	3	2015-09-09 09:29:07.476717	2015-09-10 06:20:45.633101	f
54	23	1	2015-09-09 09:29:07.476717	2015-09-10 07:43:52.706192	f
51	22	2	2015-09-07 05:32:36.568962	2015-09-10 18:24:31.197941	t
62	25	1	2015-09-09 15:14:36.157421	2015-09-10 18:29:31.296734	t
60	24	3	2015-09-09 09:52:32.140723	2015-09-10 18:29:39.222837	f
32	14	3	2015-08-18 05:54:50.957263	2015-09-10 04:18:40.649664	f
59	24	2	2015-09-09 09:52:32.140723	2015-09-10 18:39:14.218426	t
10	14	1	2015-08-18 05:54:50.957263	2015-10-26 06:23:18.05604	f
58	24	1	2015-09-09 09:52:32.140723	2015-09-10 18:39:32.022426	t
72	27	3	2015-10-26 10:10:49.734297	2015-10-26 10:10:49.734297	f
71	27	2	2015-10-26 10:10:49.734297	2015-10-26 10:12:49.90991	f
70	27	1	2015-10-26 10:10:49.734297	2015-10-26 10:12:50.201665	t
74	28	2	2015-10-26 10:22:11.021718	2015-10-26 10:22:11.021718	f
75	28	3	2015-10-26 10:22:11.021718	2015-10-26 10:22:11.021718	f
73	28	1	2015-10-26 10:22:11.021718	2015-10-26 10:22:25.711044	t
29	1	3	2015-08-12 04:19:06.209106	2015-10-30 13:36:15.496924	f
200	70	2	2015-11-04 13:20:17.493183	2015-11-04 13:20:17.493183	f
201	70	3	2015-11-04 13:20:17.493183	2015-11-04 13:20:17.493183	f
199	70	1	2015-11-04 13:20:17.493183	2015-11-04 13:20:52.749073	t
203	71	2	2015-11-04 13:29:09.971571	2015-11-04 13:29:09.971571	f
204	71	3	2015-11-04 13:29:09.971571	2015-11-04 13:29:09.971571	f
202	71	1	2015-11-04 13:29:09.971571	2015-11-04 13:29:36.483627	t
205	72	1	2015-11-04 13:31:45.29859	2015-11-04 13:31:45.29859	f
206	72	2	2015-11-04 13:31:45.29859	2015-11-04 13:31:45.29859	f
207	72	3	2015-11-04 13:31:45.29859	2015-11-04 13:31:45.29859	f
209	73	2	2015-11-04 13:36:20.42061	2015-11-04 13:36:20.42061	f
210	73	3	2015-11-04 13:36:20.42061	2015-11-04 13:36:20.42061	f
208	73	1	2015-11-04 13:36:20.42061	2015-11-04 13:37:41.446409	t
212	74	2	2015-11-04 13:39:20.637977	2015-11-04 13:39:20.637977	f
213	74	3	2015-11-04 13:39:20.637977	2015-11-04 13:39:20.637977	f
211	74	1	2015-11-04 13:39:20.637977	2015-11-04 13:39:55.741586	t
215	75	2	2015-11-04 13:42:07.403933	2015-11-04 13:42:07.403933	f
216	75	3	2015-11-04 13:42:07.403933	2015-11-04 13:42:07.403933	f
214	75	1	2015-11-04 13:42:07.403933	2015-11-04 13:42:54.994088	t
219	76	3	2015-11-04 13:48:28.696195	2015-11-04 13:48:28.696195	f
218	76	2	2015-11-04 13:48:28.696195	2015-11-04 14:03:13.989501	t
217	76	1	2015-11-04 13:48:28.696195	2015-11-04 14:03:15.612091	t
221	77	2	2015-11-04 14:16:43.404933	2015-11-04 14:16:43.404933	f
222	77	3	2015-11-04 14:16:43.404933	2015-11-04 14:16:43.404933	f
220	77	1	2015-11-04 14:16:43.404933	2015-11-04 14:17:03.196612	t
228	79	3	2015-11-04 14:34:58.458572	2015-11-04 14:34:58.458572	f
226	79	1	2015-11-04 14:34:58.458572	2015-11-04 14:37:22.563788	t
227	79	2	2015-11-04 14:34:58.458572	2015-11-04 14:39:23.188189	t
230	80	2	2015-11-04 14:41:52.729485	2015-11-04 14:41:52.729485	f
231	80	3	2015-11-04 14:41:52.729485	2015-11-04 14:41:52.729485	f
229	80	1	2015-11-04 14:41:52.729485	2015-11-04 14:43:12.597662	t
233	81	2	2015-11-04 14:47:21.856584	2015-11-04 14:47:21.856584	f
234	81	3	2015-11-04 14:47:21.856584	2015-11-04 14:47:21.856584	f
232	81	1	2015-11-04 14:47:21.856584	2015-11-04 14:48:14.589854	t
236	82	2	2015-11-04 14:56:06.629871	2015-11-04 14:56:06.629871	f
237	82	3	2015-11-04 14:56:06.629871	2015-11-04 14:56:06.629871	f
235	82	1	2015-11-04 14:56:06.629871	2015-11-04 14:59:28.77688	t
239	83	2	2015-11-04 15:11:45.667269	2015-11-04 15:11:45.667269	f
240	83	3	2015-11-04 15:11:45.667269	2015-11-04 15:11:45.667269	f
238	83	1	2015-11-04 15:11:45.667269	2015-11-04 15:12:00.977646	t
242	84	2	2015-11-04 15:15:21.795056	2015-11-04 15:15:21.795056	f
243	84	3	2015-11-04 15:15:21.795056	2015-11-04 15:15:21.795056	f
241	84	1	2015-11-04 15:15:21.795056	2015-11-04 15:15:44.062037	t
7	1	1	2015-08-12 04:19:06.209106	2015-11-05 08:24:47.013852	f
\.


--
-- Name: desired_genders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('desired_genders_id_seq', 243, true);


--
-- Data for Name: details_of_users; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY details_of_users (id, user_id, last_online, ethnicity_id, height, body_type_id, relationship_status_id, religion_id, zip_code, latitude, longitude, created_at, updated_at) FROM stdin;
72	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-04 14:41:52.801242	2015-11-04 14:41:52.801242
7	14	\N	8	0.263269438408315	8	2	4	\N	\N	\N	2015-08-18 05:54:50.962866	2015-08-18 05:54:50.962866
8	15	\N	7	0.410240525379777	4	2	2	\N	\N	\N	2015-08-19 02:01:25.223789	2015-08-19 02:01:25.223789
9	16	\N	4	0.943967923521996	3	1	2	\N	\N	\N	2015-08-20 00:13:18.959154	2015-08-20 00:13:18.959154
12	20	\N	4	0.25182442413643	10	1	9	\N	\N	\N	2015-08-23 05:44:27.235035	2015-08-23 05:44:27.235035
13	21	\N	3	0.467802129685879	2	1	8	\N	\N	\N	2015-08-24 17:19:03.682584	2015-08-24 17:19:03.682584
14	22	\N	6	0.942871085368097	2	2	4	\N	\N	\N	2015-09-07 05:32:36.616103	2015-09-07 05:32:36.616103
73	81	\N	8	65.0	5	5	8	\N	\N	\N	2015-11-04 14:47:21.942425	2015-11-04 14:50:07.802874
19	27	\N	7	0.393975667655468	4	2	8	\N	\N	\N	2015-10-26 10:10:49.784208	2015-10-26 10:10:49.784208
21	29	\N	4	0.532795597799122	6	1	2	\N	\N	\N	2015-10-26 10:34:30.856963	2015-10-26 10:34:30.856963
23	31	\N	9	0.662414016202092	1	2	4	\N	\N	\N	2015-10-26 10:55:20.101623	2015-10-26 10:55:20.101623
27	35	\N	5	0.486075033899397	9	1	9	\N	\N	\N	2015-10-28 07:51:38.680436	2015-10-28 07:51:38.680436
10	17	\N	4	0.973466495983303	2	5	3	\N	\N	\N	2015-08-21 22:29:30.273172	2015-08-21 22:29:30.273172
15	23	\N	2	0.922466627322137	9	5	2	\N	\N	\N	2015-09-09 09:29:07.536597	2015-09-09 09:29:07.536597
24	32	\N	3	0.933729295153171	1	5	8	\N	\N	\N	2015-10-28 04:33:37.394771	2015-10-28 04:33:37.394771
6	12	\N	3	0.569024481810629	9	4	2	\N	\N	\N	2015-08-16 06:11:48.564177	2015-08-16 06:11:48.564177
11	19	\N	5	0.909354694653302	10	4	6	\N	\N	\N	2015-08-21 22:51:11.626985	2015-08-21 22:51:11.626985
16	24	\N	5	0.232591027393937	9	4	3	\N	\N	\N	2015-09-09 09:52:32.170735	2015-09-09 09:52:32.170735
17	25	\N	8	0.370952188968658	6	4	4	\N	\N	\N	2015-09-09 15:14:36.163025	2015-09-09 15:14:36.163025
20	28	\N	6	0.896546702366322	10	4	6	\N	\N	\N	2015-10-26 10:22:11.037495	2015-10-26 10:22:11.037495
22	30	\N	6	0.589184261858463	1	4	2	\N	\N	\N	2015-10-26 10:50:13.315402	2015-10-26 10:50:13.315402
74	82	\N	8	71.0	4	1	3	\N	\N	\N	2015-11-04 14:56:06.710371	2015-11-04 15:00:20.549706
62	70	\N	\N	\N	\N	3	8	\N	\N	\N	2015-11-04 13:20:17.575871	2015-11-04 13:26:12.22027
63	71	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-04 13:29:09.97948	2015-11-04 13:29:09.97948
64	72	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-04 13:31:45.309056	2015-11-04 13:31:45.309056
75	83	\N	9	60.0	3	2	2	\N	\N	\N	2015-11-04 15:11:45.705551	2015-11-04 15:12:58.949538
65	73	\N	8	64.0	5	4	4	\N	\N	\N	2015-11-04 13:36:20.428703	2015-11-04 13:38:10.64595
76	84	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-04 15:15:21.833147	2015-11-04 15:15:21.833147
66	74	\N	8	70.0	7	4	4	\N	\N	\N	2015-11-04 13:39:20.661176	2015-11-04 13:40:28.177352
1	1	\N	8	73.0	4	1	5	\N	\N	\N	2015-08-12 04:19:06.212864	2015-11-05 21:23:39.471015
67	75	\N	8	68.0	1	1	3	\N	\N	\N	2015-11-04 13:42:07.416625	2015-11-04 13:43:36.366485
68	76	\N	8	64.0	8	1	7	\N	\N	\N	2015-11-04 13:48:28.707204	2015-11-04 14:03:12.858923
69	77	\N	8	66.0	5	2	9	\N	\N	\N	2015-11-04 14:16:43.416395	2015-11-04 14:26:30.374895
71	79	\N	8	64.0	2	2	1	\N	\N	\N	2015-11-04 14:34:58.467919	2015-11-04 14:39:01.417567
\.


--
-- Name: details_of_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('details_of_users_id_seq', 76, true);


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

COPY genders (id, name, created_at, updated_at, plural) FROM stdin;
1	man	2015-08-12 04:13:25.555234	2015-10-28 12:31:57.788088	men
2	woman	2015-08-12 04:13:25.559638	2015-10-28 12:31:57.800021	women
3	other	2015-08-12 04:13:25.561399	2015-10-28 12:31:57.802042	others
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
277	25	21	2015-09-10 18:45:56.297037	2015-09-10 18:45:56.297037
278	25	17	2015-09-10 18:46:05.018135	2015-09-10 18:46:05.018135
279	21	25	2015-09-10 18:46:35.183739	2015-09-10 18:46:35.183739
12	1	15	2015-08-19 06:58:20.589132	2015-08-19 06:58:20.589132
293	14	15	2015-10-26 08:59:12.31539	2015-10-26 08:59:12.31539
294	27	14	2015-10-26 10:13:35.353988	2015-10-26 10:13:35.353988
295	27	1	2015-10-26 10:13:36.376068	2015-10-26 10:13:36.376068
296	30	15	2015-10-26 10:51:49.185902	2015-10-26 10:51:49.185902
297	15	30	2015-10-26 10:52:14.327591	2015-10-26 10:52:14.327591
29	15	12	2015-08-20 04:02:28.839034	2015-08-20 04:02:28.839034
30	15	14	2015-08-20 04:02:33.569729	2015-08-20 04:02:33.569729
298	14	29	2015-10-26 19:39:22.437302	2015-10-26 19:39:22.437302
32	16	15	2015-08-20 04:48:42.267146	2015-08-20 04:48:42.267146
42	19	1	2015-08-21 23:13:29.393447	2015-08-21 23:13:29.393447
358	1	32	2015-11-01 06:32:04.93729	2015-11-01 06:32:04.93729
360	1	27	2015-11-05 06:01:47.062914	2015-11-05 06:01:47.062914
362	1	25	2015-11-05 06:14:27.520868	2015-11-05 06:14:27.520868
363	1	19	2015-11-05 06:14:37.205212	2015-11-05 06:14:37.205212
365	1	84	2015-11-05 08:39:30.802156	2015-11-05 08:39:30.802156
\.


--
-- Name: matches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('matches_id_seq', 365, true);


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY messages (id, sender_id, receiver_id, body, created_at, updated_at) FROM stdin;
2	14	15	The guy who runs the place is a little temperamental, especially about the ordering procedure. He’s secretly referred to as the Soup Nazi.	2015-08-21 06:08:12.764925	2015-08-21 06:08:12.764925
3	15	14	Why? What happens if you don’t order right?	2015-08-21 06:26:28.378487	2015-08-21 06:26:28.378487
4	14	15	He yells and you don’t get your soup.	2015-08-21 06:28:17.100806	2015-08-21 06:28:17.100806
5	16	15	No soup for you!	2015-08-21 08:35:09.786377	2015-08-21 08:35:09.786377
12	14	19	So your name rhymes with a female body part?	2015-10-26 09:11:13.731405	2015-10-26 09:11:13.731405
14	19	14	Nice to meet you.	2015-10-26 10:02:38.470516	2015-10-26 10:02:38.470516
15	27	14	So, it must've been ninety-five degrees that night, and everyone's just standing around the pool with little drinks in their hands. I was wearing my old jeans and T-shirt. And I don't know, I was just in one of those moods - so I said to myself, "Marlene, just do it," and I jumped in. And as I'm getting out, I feel all these eyes on me, and I look up and everyone is just staring at me.	2015-10-26 10:14:39.861303	2015-10-26 10:14:39.861303
16	14	27	So what'd you do?	2015-10-26 10:15:03.602553	2015-10-26 10:15:03.602553
17	27	14	Well, nothing. It's not skin off my hide if people like to look. I just didn't see what the big attraction was.	2015-10-26 10:15:45.421433	2015-10-26 10:15:45.421433
18	14	27	Well, I have a general idea what it was. I could take a guess.	2015-10-26 10:16:07.107451	2015-10-26 10:16:07.107451
19	27	14	Hey, you know, Jerry, just because George and I don't see each other anymore, it doesn't mean we shouldn't stay friends.	2015-10-26 10:16:46.517324	2015-10-26 10:16:46.517324
20	14	27	No.	2015-10-26 10:17:10.29398	2015-10-26 10:17:10.29398
21	27	14	Good enough. I'm really glad we got that settled.	2015-10-26 10:17:30.071613	2015-10-26 10:17:30.071613
22	14	28	Come on, try it. Let me hear you try a Scottish accent.	2015-10-26 10:24:30.927458	2015-10-26 10:24:30.927458
23	28	14	That's Irish.	2015-10-26 10:24:55.823301	2015-10-26 10:24:55.823301
24	14	28	Irish, Scottish, what's the difference, lassie?	2015-10-26 10:26:17.61445	2015-10-26 10:26:17.61445
25	14	29	So Sherry, what do you remember about that day at the library?	2015-10-26 10:38:39.184343	2015-10-26 10:38:39.184343
26	29	14	I remember it like it was yesterday. It was a Friday afternoon. I wore a purple dress.	2015-10-26 10:39:21.882567	2015-10-26 10:39:21.882567
28	14	29	Purple? Ya' sure it wasn't orange?	2015-10-26 10:41:30.555918	2015-10-26 10:41:30.555918
29	29	14	Positive. And I was chewin' Dentyne. I always chewed dentyne. Remember Jerry? Dentyne?	2015-10-26 10:42:02.542736	2015-10-26 10:42:02.542736
30	14	29	No Black Jack?	2015-10-26 10:42:27.217433	2015-10-26 10:42:27.217433
31	29	14	Licorice gum? Never! We were reading passages to each other from that Henry Miller book,	2015-10-26 10:43:00.641241	2015-10-26 10:43:00.641241
32	14	29	Tropic of Cancer.	2015-10-26 10:43:19.519644	2015-10-26 10:43:19.519644
33	29	14	No, Tropic of Capricorn	2015-10-26 10:44:47.252304	2015-10-26 10:44:47.252304
34	14	29	Tropic of Capricorn?	2015-10-26 10:45:38.41206	2015-10-26 10:45:38.41206
35	29	14	Rememba? What holds the world togetha' ... "As I have learned from bitter experience is sexual intercourse ."	2015-10-26 10:46:14.329874	2015-10-26 10:46:14.329874
36	14	29	Wait a second. Wait a second. You're right. I had both of them.	2015-10-26 10:47:05.624965	2015-10-26 10:47:05.624965
52	25	21	Marry me!	2015-10-26 21:50:54.490625	2015-10-26 21:50:54.490625
54	1	19	This is just a test.	2015-10-30 05:54:15.333416	2015-10-30 05:54:15.333416
55	19	1	Hi there.	2015-10-30 05:54:37.386977	2015-10-30 05:54:37.386977
\.


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('messages_id_seq', 55, true);


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY photos (id, user_id, description, created_at, updated_at, url, thumb_url) FROM stdin;
6	15	\N	2015-09-10 08:53:14.038657	2015-09-10 08:53:14.038657	http://res.cloudinary.com/cosmo-connect/image/upload/v1441875158/ijdqdeitrwden31phjvy.png	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441875158/ijdqdeitrwden31phjvy.png
7	14	\N	2015-09-10 08:57:10.996043	2015-09-10 08:57:10.996043	http://res.cloudinary.com/cosmo-connect/image/upload/v1441875430/qvf8kxsuy2nzkktzdygp.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441875430/qvf8kxsuy2nzkktzdygp.jpg
8	19	\N	2015-09-10 08:58:10.814484	2015-09-10 08:58:10.814484	http://res.cloudinary.com/cosmo-connect/image/upload/v1441875490/hxzok2qusrxnmxfaybch.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441875490/hxzok2qusrxnmxfaybch.jpg
9	1	\N	2015-09-10 09:01:20.049761	2015-09-10 09:01:20.049761	http://res.cloudinary.com/cosmo-connect/image/upload/v1441875679/pp09jj6vri2bgjvsmdau.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441875679/pp09jj6vri2bgjvsmdau.jpg
13	12	\N	2015-09-10 18:15:44.310996	2015-09-10 18:15:44.310996	http://res.cloudinary.com/cosmo-connect/image/upload/v1441908943/eqdm1pwit2xracrrotrh.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441908943/eqdm1pwit2xracrrotrh.jpg
14	16	\N	2015-09-10 18:16:30.117464	2015-09-10 18:16:30.117464	http://res.cloudinary.com/cosmo-connect/image/upload/v1441908989/uegryjkqltdewqlbc9xn.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441908989/uegryjkqltdewqlbc9xn.jpg
15	17	\N	2015-09-10 18:16:50.047808	2015-09-10 18:16:50.047808	http://res.cloudinary.com/cosmo-connect/image/upload/v1441909009/bau7me3fwcjnnikbovoe.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441909009/bau7me3fwcjnnikbovoe.jpg
16	20	\N	2015-09-10 18:18:15.249588	2015-09-10 18:18:15.249588	http://res.cloudinary.com/cosmo-connect/image/upload/v1441909094/xmow5e420jy7g2tins3k.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441909094/xmow5e420jy7g2tins3k.jpg
17	21	\N	2015-09-10 18:20:52.355563	2015-09-10 18:20:52.355563	http://res.cloudinary.com/cosmo-connect/image/upload/v1441909251/agod0rl2qd2vexfyapnw.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441909251/agod0rl2qd2vexfyapnw.jpg
18	22	\N	2015-09-10 18:24:21.178933	2015-09-10 18:24:21.178933	http://res.cloudinary.com/cosmo-connect/image/upload/v1441909460/gtrzqaaqkpnz3bzyajec.png	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441909460/gtrzqaaqkpnz3bzyajec.png
19	23	\N	2015-09-10 18:32:07.888153	2015-09-10 18:32:07.888153	http://res.cloudinary.com/cosmo-connect/image/upload/v1441909927/ely1kpc5uh3uen0tpou0.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441909927/ely1kpc5uh3uen0tpou0.jpg
20	24	\N	2015-09-10 18:38:05.421622	2015-09-10 18:38:05.421622	http://res.cloudinary.com/cosmo-connect/image/upload/v1441910285/zoajsmlftsemigq06slp.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441910285/zoajsmlftsemigq06slp.jpg
21	25	\N	2015-09-10 18:40:41.85308	2015-09-10 18:40:41.85308	http://res.cloudinary.com/cosmo-connect/image/upload/v1441910441/x6ovjayiazgsxo9amdno.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441910441/x6ovjayiazgsxo9amdno.jpg
23	27	\N	2015-10-26 10:11:35.230039	2015-10-26 10:11:35.230039	http://res.cloudinary.com/cosmo-connect/image/upload/v1445854295/pzsw50xkkn805g90iyuo.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1445854295/pzsw50xkkn805g90iyuo.jpg
24	28	\N	2015-10-26 10:23:24.44765	2015-10-26 10:23:24.44765	http://res.cloudinary.com/cosmo-connect/image/upload/v1445855004/q4gipeeihtw8v36f2mwj.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1445855004/q4gipeeihtw8v36f2mwj.jpg
25	29	\N	2015-10-26 10:34:46.730176	2015-10-26 10:34:46.730176	http://res.cloudinary.com/cosmo-connect/image/upload/v1445855686/uig2ikem4rvjmytxxrzq.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1445855686/uig2ikem4rvjmytxxrzq.jpg
26	30	\N	2015-10-26 10:50:24.48591	2015-10-26 10:50:24.48591	http://res.cloudinary.com/cosmo-connect/image/upload/v1445856624/pocftjkowz0bclxg0j5i.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1445856624/pocftjkowz0bclxg0j5i.jpg
27	31	\N	2015-10-26 10:55:52.055267	2015-10-26 10:55:52.055267	http://res.cloudinary.com/cosmo-connect/image/upload/v1445856951/ykptrasu39iiw0knxvmh.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1445856951/ykptrasu39iiw0knxvmh.jpg
30	32	\N	2015-10-28 04:34:38.396499	2015-10-28 04:34:38.396499	http://res.cloudinary.com/cosmo-connect/image/upload/v1446006877/huzj9ctoiedr7b9k9v1q.png	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1446006877/huzj9ctoiedr7b9k9v1q.png
32	70	\N	2015-11-04 13:21:13.219544	2015-11-04 13:21:13.219544	https://res.cloudinary.com/cosmo-connect/image/upload/v1446643272/ccri5jmywdtfjkekpz16.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1446643272/ccri5jmywdtfjkekpz16.jpg
33	71	\N	2015-11-04 13:29:48.00548	2015-11-04 13:29:48.00548	https://res.cloudinary.com/cosmo-connect/image/upload/v1446643787/oa9cebeg7jlxaggqouqf.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1446643787/oa9cebeg7jlxaggqouqf.jpg
34	72	\N	2015-11-04 13:32:41.173147	2015-11-04 13:32:41.173147	https://res.cloudinary.com/cosmo-connect/image/upload/v1446643960/pjcsogxiifoyfcnxxqpk.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1446643960/pjcsogxiifoyfcnxxqpk.jpg
35	73	\N	2015-11-04 13:37:01.121529	2015-11-04 13:37:01.121529	https://res.cloudinary.com/cosmo-connect/image/upload/v1446644220/pb2djetm6wolac6e9ymd.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1446644220/pb2djetm6wolac6e9ymd.jpg
36	74	\N	2015-11-04 13:40:47.342926	2015-11-04 13:40:47.342926	https://res.cloudinary.com/cosmo-connect/image/upload/v1446644446/dxb1uyrov4wpm6h27rvf.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1446644446/dxb1uyrov4wpm6h27rvf.jpg
37	75	\N	2015-11-04 13:47:05.383886	2015-11-04 13:47:05.383886	https://res.cloudinary.com/cosmo-connect/image/upload/v1446644824/hb5vjgwh82xyqcta6g7z.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1446644824/hb5vjgwh82xyqcta6g7z.jpg
38	76	\N	2015-11-04 13:48:44.494442	2015-11-04 13:48:44.494442	https://res.cloudinary.com/cosmo-connect/image/upload/v1446644924/csin6c2dvetjm9rmiusb.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1446644924/csin6c2dvetjm9rmiusb.jpg
39	77	\N	2015-11-04 14:18:28.208404	2015-11-04 14:18:28.208404	https://res.cloudinary.com/cosmo-connect/image/upload/v1446646702/zbuvnxdv6ofzdtwm41en.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1446646702/zbuvnxdv6ofzdtwm41en.jpg
41	79	\N	2015-11-04 14:38:04.355764	2015-11-04 14:38:04.355764	https://res.cloudinary.com/cosmo-connect/image/upload/v1446647880/rbdexx8oj9ejgxzxgpb4.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1446647880/rbdexx8oj9ejgxzxgpb4.jpg
42	80	\N	2015-11-04 14:43:41.443214	2015-11-04 14:43:41.443214	https://res.cloudinary.com/cosmo-connect/image/upload/v1446648211/fbmibfblfgqyshfn57tv.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1446648211/fbmibfblfgqyshfn57tv.jpg
43	81	\N	2015-11-04 14:48:44.653284	2015-11-04 14:48:44.653284	https://res.cloudinary.com/cosmo-connect/image/upload/v1446648524/jfj0x1dqy7lz2gejk9rg.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1446648524/jfj0x1dqy7lz2gejk9rg.jpg
44	82	\N	2015-11-04 15:02:32.469262	2015-11-04 15:02:32.469262	https://res.cloudinary.com/cosmo-connect/image/upload/v1446649352/cegykg0bdbk6qbh1ocbq.png	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1446649352/cegykg0bdbk6qbh1ocbq.png
45	83	\N	2015-11-04 15:12:11.617615	2015-11-04 15:12:11.617615	https://res.cloudinary.com/cosmo-connect/image/upload/v1446649931/x8eno0qvfiv4xw6vixh6.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1446649931/x8eno0qvfiv4xw6vixh6.jpg
46	84	\N	2015-11-04 15:15:56.07307	2015-11-04 15:15:56.07307	https://res.cloudinary.com/cosmo-connect/image/upload/v1446650155/jonfngzehircuhb9hi3m.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1446650155/jonfngzehircuhb9hi3m.jpg
\.


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('photos_id_seq', 46, true);


--
-- Data for Name: relationship_statuses; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY relationship_statuses (id, description, created_at, updated_at) FROM stdin;
1	Single	2015-08-12 04:13:25.622709	2015-08-12 04:13:25.622709
2	Seeing Someone	2015-08-12 04:13:25.624851	2015-08-12 04:13:25.624851
5	In An Open Relationship	2015-08-12 04:13:25.627692	2015-08-12 04:13:25.627692
4	Married	2015-08-12 04:13:25.62632	2015-08-12 04:13:25.62632
3	Engaged	2015-11-04 13:24:25.598302	2015-11-04 13:24:25.598302
\.


--
-- Name: relationship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('relationship_statuses_id_seq', 6, true);


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

SELECT pg_catalog.setval('response_categories_id_seq', 2, true);


--
-- Data for Name: responses; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY responses (id, response_category_id, user_id, body, created_at, updated_at) FROM stdin;
49	8	14	You think that Soup is still a meal.	2015-08-21 05:22:10.380868	2015-08-23 05:06:24.620138
37	3	14	Mugging old ladies for their marble rye.	2015-08-18 18:16:14.151676	2015-08-23 05:06:48.203258
38	6	14	Why Kenny Banyon gets so many laughs, that hack.	2015-08-18 18:16:22.109873	2015-08-23 05:07:04.151171
39	1	14	I'm extremely picky with women.  You have one thing wrong with you, it's over.	2015-08-18 18:16:31.221476	2015-08-23 05:07:31.015604
27	6	1	how far behind I am.	2015-08-17 16:49:56.34562	2015-08-17 16:49:56.34562
30	4	1	power of habit, memento, west wing, deadmau5 I remember, pizza.	2015-08-17 17:00:59.337161	2015-08-17 17:00:59.337161
65	2	14	getting my parents kicked out of the retirement home after buying them a Caddy.	2015-08-21 22:52:42.746693	2015-08-25 02:37:17.711686
71	4	14	Mendy's	2015-08-21 22:52:42.746693	2015-09-07 04:34:15.601076
32	8	1	(edit) You know CSS and/or bootstrap.	2015-08-17 18:52:32.824896	2015-08-18 05:26:28.823061
40	7	14	Counting my 401k.	2015-08-18 18:16:39.598132	2015-08-18 18:16:39.598132
42	8	15	You're sponge worthy.	2015-08-19 02:05:36.506112	2015-08-19 02:05:36.506112
43	3	15	dancing	2015-08-19 02:19:49.483958	2015-08-19 02:19:49.483958
44	1	15	I HAVE A 212 NUMBER NOW!!!	2015-08-19 02:20:05.982471	2015-08-19 02:20:05.982471
45	6	16	why I left my recipies in my old armoir	2015-08-20 04:43:22.102684	2015-08-20 04:43:22.102684
46	3	16	making soup, and making you feel inferior	2015-08-20 04:43:42.605408	2015-08-20 04:43:42.605408
47	1	16	take three steps to the right and I'll tell you.	2015-08-20 04:43:58.947611	2015-08-20 04:43:58.947611
41	5	14	Elaine, Newman, Tom's Restaurant	2015-08-18 21:31:45.386885	2015-08-21 05:30:53.556268
50	1	17	I'm a conductor.  Like Leonard Bernstein, or do you not think I'm good enough to put myself in such esteemed ranks.	2015-08-21 22:29:58.86927	2015-08-21 22:29:58.86927
51	3	17	Conducting.	2015-08-21 22:30:05.865165	2015-08-21 22:30:05.865165
55	4	19	\N	2015-08-21 22:51:11.618895	2015-08-21 22:51:11.618895
56	5	19	\N	2015-08-21 22:51:11.618895	2015-08-21 22:51:11.618895
57	6	19	\N	2015-08-21 22:51:11.618895	2015-08-21 22:51:11.618895
58	7	19	\N	2015-08-21 22:51:11.618895	2015-08-21 22:51:11.618895
60	3	19	\N	2015-08-21 22:51:11.618895	2015-08-21 22:51:11.618895
61	1	12	\N	2015-08-18 06:53:26.478577	2015-08-18 06:53:26.478577
62	2	12	\N	2015-08-18 06:53:26.478577	2015-08-18 06:53:26.478577
64	2	17	\N	2015-08-21 22:29:33.242938	2015-08-21 22:29:33.242938
66	2	16	\N	2015-08-21 08:13:22.979445	2015-08-21 08:13:22.979445
68	4	12	\N	2015-08-18 06:53:26.478577	2015-08-18 06:53:26.478577
69	4	15	\N	2015-08-21 22:29:15.202328	2015-08-21 22:29:15.202328
70	4	17	\N	2015-08-21 22:29:33.242938	2015-08-21 22:29:33.242938
72	4	16	\N	2015-08-21 08:13:22.979445	2015-08-21 08:13:22.979445
74	5	12	\N	2015-08-18 06:53:26.478577	2015-08-18 06:53:26.478577
75	5	15	\N	2015-08-21 22:29:15.202328	2015-08-21 22:29:15.202328
76	5	17	\N	2015-08-21 22:29:33.242938	2015-08-21 22:29:33.242938
77	5	16	\N	2015-08-21 08:13:22.979445	2015-08-21 08:13:22.979445
78	6	12	\N	2015-08-18 06:53:26.478577	2015-08-18 06:53:26.478577
79	6	15	\N	2015-08-21 22:29:15.202328	2015-08-21 22:29:15.202328
80	6	17	\N	2015-08-21 22:29:33.242938	2015-08-21 22:29:33.242938
81	7	12	\N	2015-08-18 06:53:26.478577	2015-08-18 06:53:26.478577
82	7	15	\N	2015-08-21 22:29:15.202328	2015-08-21 22:29:15.202328
83	7	17	\N	2015-08-21 22:29:33.242938	2015-08-21 22:29:33.242938
84	7	16	\N	2015-08-21 08:13:22.979445	2015-08-21 08:13:22.979445
86	8	12	\N	2015-08-18 06:53:26.478577	2015-08-18 06:53:26.478577
87	8	17	\N	2015-08-21 22:29:33.242938	2015-08-21 22:29:33.242938
88	8	16	\N	2015-08-21 08:13:22.979445	2015-08-21 08:13:22.979445
89	3	12	\N	2015-08-18 06:53:26.478577	2015-08-18 06:53:26.478577
91	2	20	\N	2015-08-23 05:44:27.176509	2015-08-23 05:44:27.176509
92	4	20	\N	2015-08-23 05:44:27.176509	2015-08-23 05:44:27.176509
93	5	20	\N	2015-08-23 05:44:27.176509	2015-08-23 05:44:27.176509
94	6	20	\N	2015-08-23 05:44:27.176509	2015-08-23 05:44:27.176509
95	7	20	\N	2015-08-23 05:44:27.176509	2015-08-23 05:44:27.176509
96	8	20	\N	2015-08-23 05:44:27.176509	2015-08-23 05:44:27.176509
97	3	20	\N	2015-08-23 05:44:27.176509	2015-08-23 05:44:27.176509
90	1	20	they're real, and they're spectacular	2015-08-23 05:44:27.176509	2015-08-23 19:09:18.093132
99	2	21	\N	2015-08-24 17:19:03.627613	2015-08-24 17:19:03.627613
100	4	21	\N	2015-08-24 17:19:03.627613	2015-08-24 17:19:03.627613
101	5	21	\N	2015-08-24 17:19:03.627613	2015-08-24 17:19:03.627613
102	6	21	\N	2015-08-24 17:19:03.627613	2015-08-24 17:19:03.627613
103	7	21	\N	2015-08-24 17:19:03.627613	2015-08-24 17:19:03.627613
104	8	21	\N	2015-08-24 17:19:03.627613	2015-08-24 17:19:03.627613
105	3	21	\N	2015-08-24 17:19:03.627613	2015-08-24 17:19:03.627613
106	1	22	\N	2015-09-07 05:32:36.568962	2015-09-07 05:32:36.568962
107	2	22	\N	2015-09-07 05:32:36.568962	2015-09-07 05:32:36.568962
108	4	22	\N	2015-09-07 05:32:36.568962	2015-09-07 05:32:36.568962
109	5	22	\N	2015-09-07 05:32:36.568962	2015-09-07 05:32:36.568962
110	6	22	\N	2015-09-07 05:32:36.568962	2015-09-07 05:32:36.568962
111	7	22	\N	2015-09-07 05:32:36.568962	2015-09-07 05:32:36.568962
112	8	22	\N	2015-09-07 05:32:36.568962	2015-09-07 05:32:36.568962
113	3	22	\N	2015-09-07 05:32:36.568962	2015-09-07 05:32:36.568962
115	2	23	\N	2015-09-09 09:29:07.476717	2015-09-09 09:29:07.476717
116	4	23	\N	2015-09-09 09:29:07.476717	2015-09-09 09:29:07.476717
117	5	23	\N	2015-09-09 09:29:07.476717	2015-09-09 09:29:07.476717
118	6	23	\N	2015-09-09 09:29:07.476717	2015-09-09 09:29:07.476717
119	7	23	\N	2015-09-09 09:29:07.476717	2015-09-09 09:29:07.476717
120	8	23	\N	2015-09-09 09:29:07.476717	2015-09-09 09:29:07.476717
121	3	23	\N	2015-09-09 09:29:07.476717	2015-09-09 09:29:07.476717
59	8	19	You're better with names than Jerry Seinfeld.	2015-08-21 22:51:11.618895	2015-09-10 18:17:28.694727
54	2	19		2015-08-21 22:51:11.618895	2015-10-26 10:06:21.247167
63	2	15	Trying to stay friends with my best friend, Jerry.  We have a few rules.  Rule number one? No calls, afterward. Rule two? Spending the night is optional!	2015-08-21 22:29:15.202328	2015-10-26 10:20:00.382497
26	5	1	1,2,3,4,5,6	2015-08-17 16:49:48.15748	2015-10-26 03:40:51.859741
31	7	1	Catching up on my project.	2015-08-17 18:52:23.285127	2015-10-26 04:19:05.172851
114	1	23	I used to own the Yankees.	2015-09-09 09:29:07.476717	2015-09-09 09:29:51.589759
122	1	24	\N	2015-09-09 09:52:32.140723	2015-09-09 09:52:32.140723
123	2	24	\N	2015-09-09 09:52:32.140723	2015-09-09 09:52:32.140723
124	4	24	\N	2015-09-09 09:52:32.140723	2015-09-09 09:52:32.140723
125	5	24	\N	2015-09-09 09:52:32.140723	2015-09-09 09:52:32.140723
126	6	24	\N	2015-09-09 09:52:32.140723	2015-09-09 09:52:32.140723
127	7	24	\N	2015-09-09 09:52:32.140723	2015-09-09 09:52:32.140723
128	8	24	\N	2015-09-09 09:52:32.140723	2015-09-09 09:52:32.140723
129	3	24	\N	2015-09-09 09:52:32.140723	2015-09-09 09:52:32.140723
131	2	25	\N	2015-09-09 15:14:36.157421	2015-09-09 15:14:36.157421
133	5	25	\N	2015-09-09 15:14:36.157421	2015-09-09 15:14:36.157421
134	6	25	\N	2015-09-09 15:14:36.157421	2015-09-09 15:14:36.157421
25	2	1	Attending a coding bootcamp6.	2015-08-17 16:49:39.046196	2015-10-31 03:32:05.815345
135	7	25	\N	2015-09-09 15:14:36.157421	2015-09-09 15:14:36.157421
137	3	25	\N	2015-09-09 15:14:36.157421	2015-09-09 15:14:36.157421
53	1	19	My name rhymes with a female body part.	2015-08-21 22:51:11.618895	2015-09-10 18:17:17.233523
98	1	21	My name is George.  I'm unemployed, and I live with my parents.	2015-08-24 17:19:03.627613	2015-09-10 18:21:50.619812
29	1	1	I'm a big fan of Python.  Rails is pretty awesome too.  Javascript and CSS are acquired tastes.\r\n\r\nTakes some getting used to.	2015-08-17 17:00:24.367881	2015-11-05 01:18:01.456246
28	3	1	I thought computer programming, but I'm reevaluating.	2015-08-17 16:50:10.479905	2015-10-26 04:22:43.700275
147	2	27	\N	2015-10-26 10:10:49.734297	2015-10-26 10:10:49.734297
148	4	27	\N	2015-10-26 10:10:49.734297	2015-10-26 10:10:49.734297
149	5	27	\N	2015-10-26 10:10:49.734297	2015-10-26 10:10:49.734297
150	6	27	\N	2015-10-26 10:10:49.734297	2015-10-26 10:10:49.734297
151	7	27	\N	2015-10-26 10:10:49.734297	2015-10-26 10:10:49.734297
152	8	27	\N	2015-10-26 10:10:49.734297	2015-10-26 10:10:49.734297
153	3	27	\N	2015-10-26 10:10:49.734297	2015-10-26 10:10:49.734297
146	1	27	When Marlene and George break up, Jerry gets involved romantically with her while retrieving George’s books from her apartment. Jerry learns that although Marlene is really sexy she has a tendency to act very annoying, especially over the phone. Later, Marlene says that she can’t date Jerry anymore because she saw his act and loses respect for his profession. To which Jerry replies “but you’re a cashier!”	2015-10-26 10:10:49.734297	2015-10-26 10:13:18.877976
155	2	28	\N	2015-10-26 10:22:11.021718	2015-10-26 10:22:11.021718
156	4	28	\N	2015-10-26 10:22:11.021718	2015-10-26 10:22:11.021718
157	5	28	\N	2015-10-26 10:22:11.021718	2015-10-26 10:22:11.021718
158	6	28	\N	2015-10-26 10:22:11.021718	2015-10-26 10:22:11.021718
159	7	28	\N	2015-10-26 10:22:11.021718	2015-10-26 10:22:11.021718
160	8	28	\N	2015-10-26 10:22:11.021718	2015-10-26 10:22:11.021718
161	3	28	\N	2015-10-26 10:22:11.021718	2015-10-26 10:22:11.021718
154	1	28	Jerry begins talking about his tan cotton dockers and how much he hates the commercial. When Donna says that she kinda likes the commercial because the dialog rings true for her, Jerry is perplexed and tells all of his friends. Donna gets upset with Jerry when Kramer and George both meet her and mention that she likes the commercial.	2015-10-26 10:22:11.021718	2015-10-26 10:22:18.819689
163	2	29	\N	2015-10-26 10:34:30.81212	2015-10-26 10:34:30.81212
164	4	29	\N	2015-10-26 10:34:30.81212	2015-10-26 10:34:30.81212
165	5	29	\N	2015-10-26 10:34:30.81212	2015-10-26 10:34:30.81212
166	6	29	\N	2015-10-26 10:34:30.81212	2015-10-26 10:34:30.81212
167	7	29	\N	2015-10-26 10:34:30.81212	2015-10-26 10:34:30.81212
168	8	29	\N	2015-10-26 10:34:30.81212	2015-10-26 10:34:30.81212
169	3	29	\N	2015-10-26 10:34:30.81212	2015-10-26 10:34:30.81212
162	1	29	Jerry’s doesn’t believe that he owes some money to the New York Public Library, so he looks up his old high school girlfriend, Sherry Becker. Jerry meets with her at the coffee shop and he finds out that his recollection of Sherry was a bit different than reality. For one, Sherry says she wore a purple dress, and not an orange dress as Jerry originally thought. Second, the book they read to each other was actually Tropic of Capricorn, not Tropic of Cancer.	2015-10-26 10:34:30.81212	2015-10-26 10:36:03.601389
171	2	30	\N	2015-10-26 10:50:13.274341	2015-10-26 10:50:13.274341
172	4	30	\N	2015-10-26 10:50:13.274341	2015-10-26 10:50:13.274341
173	5	30	\N	2015-10-26 10:50:13.274341	2015-10-26 10:50:13.274341
174	6	30	\N	2015-10-26 10:50:13.274341	2015-10-26 10:50:13.274341
175	7	30	\N	2015-10-26 10:50:13.274341	2015-10-26 10:50:13.274341
176	8	30	\N	2015-10-26 10:50:13.274341	2015-10-26 10:50:13.274341
177	3	30	\N	2015-10-26 10:50:13.274341	2015-10-26 10:50:13.274341
170	1	30	Being amazing at baseball.  Taking Jerry's best friend Elaine out on dates.	2015-10-26 10:50:13.274341	2015-10-26 10:50:46.180194
179	2	31	\N	2015-10-26 10:55:20.045129	2015-10-26 10:55:20.045129
180	4	31	\N	2015-10-26 10:55:20.045129	2015-10-26 10:55:20.045129
181	5	31	\N	2015-10-26 10:55:20.045129	2015-10-26 10:55:20.045129
182	6	31	\N	2015-10-26 10:55:20.045129	2015-10-26 10:55:20.045129
183	7	31	\N	2015-10-26 10:55:20.045129	2015-10-26 10:55:20.045129
184	8	31	\N	2015-10-26 10:55:20.045129	2015-10-26 10:55:20.045129
185	3	31	\N	2015-10-26 10:55:20.045129	2015-10-26 10:55:20.045129
178	1	31	Elaine’s boyfriend Ned is a Communist, but Elaine doesn’t notice until George finds copy of The Daily Worker lying around her apartment.  He reads everything, hes very well read. Really? Well maybe he’s very well… red.  Elaine finds Ned’s political beliefs interesting, but is unimpressed with his drab clothing. Ned’s and Elaine break up when she gets him blacklisted from Hop Sing’s, using his name in a failed attempt to get delivery.	2015-10-26 10:55:20.045129	2015-10-26 10:55:42.158244
130	1	25	I have a weakness for short fat unemployed bald men.	2015-09-09 15:14:36.157421	2015-10-26 21:45:40.050613
136	8	25	See my self-summary.	2015-09-09 15:14:36.157421	2015-10-26 21:45:51.461914
132	4	25		2015-09-09 15:14:36.157421	2015-10-26 21:46:16.347992
186	1	32	\N	2015-10-28 04:33:37.318651	2015-10-28 04:33:37.318651
187	2	32	\N	2015-10-28 04:33:37.318651	2015-10-28 04:33:37.318651
188	4	32	\N	2015-10-28 04:33:37.318651	2015-10-28 04:33:37.318651
189	5	32	\N	2015-10-28 04:33:37.318651	2015-10-28 04:33:37.318651
190	6	32	\N	2015-10-28 04:33:37.318651	2015-10-28 04:33:37.318651
191	7	32	\N	2015-10-28 04:33:37.318651	2015-10-28 04:33:37.318651
192	8	32	\N	2015-10-28 04:33:37.318651	2015-10-28 04:33:37.318651
193	3	32	\N	2015-10-28 04:33:37.318651	2015-10-28 04:33:37.318651
210	1	35	\N	2015-10-28 07:51:38.641464	2015-10-28 07:51:38.641464
211	2	35	\N	2015-10-28 07:51:38.641464	2015-10-28 07:51:38.641464
212	4	35	\N	2015-10-28 07:51:38.641464	2015-10-28 07:51:38.641464
213	5	35	\N	2015-10-28 07:51:38.641464	2015-10-28 07:51:38.641464
214	6	35	\N	2015-10-28 07:51:38.641464	2015-10-28 07:51:38.641464
215	7	35	\N	2015-10-28 07:51:38.641464	2015-10-28 07:51:38.641464
216	8	35	\N	2015-10-28 07:51:38.641464	2015-10-28 07:51:38.641464
217	3	35	\N	2015-10-28 07:51:38.641464	2015-10-28 07:51:38.641464
514	4	70	\N	2015-11-04 13:20:17.493183	2015-11-04 13:20:17.493183
515	5	70	\N	2015-11-04 13:20:17.493183	2015-11-04 13:20:17.493183
516	6	70	\N	2015-11-04 13:20:17.493183	2015-11-04 13:20:17.493183
517	7	70	\N	2015-11-04 13:20:17.493183	2015-11-04 13:20:17.493183
519	3	70	\N	2015-11-04 13:20:17.493183	2015-11-04 13:20:17.493183
512	1	70	Laura calls Jerry to ask if she can stay with him while she is visiting New York. Jerry is interested in Laura but is having a hard time reading her signals. When she comes to stay at Jerry’s, he is surprised to learn that she’s engaged after her fiance calls her at Jerry’s apartment. Unfortunately for Jerry, he agreed to take a 4 hour boat ride around Manhattan with her before learning about her fiance.	2015-11-04 13:20:17.493183	2015-11-04 13:27:35.650083
513	2	70	http://kramersapartment.com/characters/laura-the-seinfeld-chronicles/	2015-11-04 13:20:17.493183	2015-11-04 13:27:38.694424
518	8	70		2015-11-04 13:20:17.493183	2015-11-04 13:27:05.272971
521	2	71	\N	2015-11-04 13:29:09.971571	2015-11-04 13:29:09.971571
522	4	71	\N	2015-11-04 13:29:09.971571	2015-11-04 13:29:09.971571
523	5	71	\N	2015-11-04 13:29:09.971571	2015-11-04 13:29:09.971571
524	6	71	\N	2015-11-04 13:29:09.971571	2015-11-04 13:29:09.971571
525	7	71	\N	2015-11-04 13:29:09.971571	2015-11-04 13:29:09.971571
526	8	71	\N	2015-11-04 13:29:09.971571	2015-11-04 13:29:09.971571
527	3	71	\N	2015-11-04 13:29:09.971571	2015-11-04 13:29:09.971571
520	1	71	Ellen, played by Christine Taylor, was portrayed as perfect in every single way. But red flags went up for Jerry when he realized she didn’t have any friends and he started to fear she may be “a loser.” Kramer and George share the same suspicion (George referring to someone as a loser, oh the irony!). Finally, Jerry’s parents meet her and vehemently approve of her in every way. This was the last straw for Jerry, because if his parents thought she was perfect, then there had to be something seriously wrong.	2015-11-04 13:29:09.971571	2015-11-04 13:30:36.25548
529	2	72	\N	2015-11-04 13:31:45.29859	2015-11-04 13:31:45.29859
530	4	72	\N	2015-11-04 13:31:45.29859	2015-11-04 13:31:45.29859
531	5	72	\N	2015-11-04 13:31:45.29859	2015-11-04 13:31:45.29859
532	6	72	\N	2015-11-04 13:31:45.29859	2015-11-04 13:31:45.29859
533	7	72	\N	2015-11-04 13:31:45.29859	2015-11-04 13:31:45.29859
534	8	72	\N	2015-11-04 13:31:45.29859	2015-11-04 13:31:45.29859
535	3	72	\N	2015-11-04 13:31:45.29859	2015-11-04 13:31:45.29859
528	1	72	Jerry and Donna met on the phone when her phone line got crossed with George’s. He managed to score a date with her (only Jerry could pull that off). He was so excited to meet Donna Chang because he had never dated a Chinese girl. Much to his dismay, her name was actually “Donna Changstein” and she shortened it. Jerry ponders if this is simply a coincidence, or does she actually think she’s Chinese? Throughout the episode she portrays Chinese stereotypes, such as having an interest for acupuncture and mispronouncing words, notably referring to the word “ridiculous” as “ridicurous.” Jerry finally blurts out: “You know, you’re not Chinese!”	2015-11-04 13:31:45.29859	2015-11-04 13:33:01.999666
537	2	73	\N	2015-11-04 13:36:20.42061	2015-11-04 13:36:20.42061
538	4	73	\N	2015-11-04 13:36:20.42061	2015-11-04 13:36:20.42061
539	5	73	\N	2015-11-04 13:36:20.42061	2015-11-04 13:36:20.42061
540	6	73	\N	2015-11-04 13:36:20.42061	2015-11-04 13:36:20.42061
541	7	73	\N	2015-11-04 13:36:20.42061	2015-11-04 13:36:20.42061
542	8	73	\N	2015-11-04 13:36:20.42061	2015-11-04 13:36:20.42061
543	3	73	\N	2015-11-04 13:36:20.42061	2015-11-04 13:36:20.42061
536	1	73	Jerry and George were attending a tennis match, and Jerry was just infatuated with the line judge played by Marlee Matlin (George was more infatuated with the hot fudge sundae). He tried to get her attention and she kept ignoring him. She finally turned around and sarcastically asked if she was deaf. To which she replied: “bingo!” George is convinced that his girlfriend Gwen, broke up with him because she saw him sloppily eating the sundae on TV. Laura has the ability to read lips, and George comes up with the bright idea to bring her to a party to read his ex girlfriend’s lips to see what she’s saying about him. Gwen starts to converse with a man, and Laura springs into action, signing out the whole conversation while Kramer (who apparently knows sign language) reports to George. Kramer messes up one of the signs and says “sleep” instead of “sweep” and George goes on a rant, and ultimately gets poked in the eye and topples over a table. Another relationship thwarted for Jerry by his friends.	2015-11-04 13:36:20.42061	2015-11-04 13:38:30.230021
545	2	74	\N	2015-11-04 13:39:20.637977	2015-11-04 13:39:20.637977
546	4	74	\N	2015-11-04 13:39:20.637977	2015-11-04 13:39:20.637977
547	5	74	\N	2015-11-04 13:39:20.637977	2015-11-04 13:39:20.637977
548	6	74	\N	2015-11-04 13:39:20.637977	2015-11-04 13:39:20.637977
549	7	74	\N	2015-11-04 13:39:20.637977	2015-11-04 13:39:20.637977
550	8	74	\N	2015-11-04 13:39:20.637977	2015-11-04 13:39:20.637977
551	3	74	\N	2015-11-04 13:39:20.637977	2015-11-04 13:39:20.637977
544	1	74	Jane Leeves is mostly known for her role as Daphne on the show “Frasier,” but she also played the role of an extremely attractive Brit named Marla on Seinfeld. Jerry hired her to expand his closet space and they ended up dating but the x-factor here is that she was a virgin. Jerry really had a knack for saying the wrong thing before coitus was imminent…and of course this time was no exception. He divulges that he, George, Kramer and Elaine were in a contest to see who could last the longest without “gratifying” themselves. She was scandalized and ended up with John F. Kennedy Jr.	2015-11-04 13:39:20.637977	2015-11-04 13:41:07.375606
553	2	75	\N	2015-11-04 13:42:07.403933	2015-11-04 13:42:07.403933
554	4	75	\N	2015-11-04 13:42:07.403933	2015-11-04 13:42:07.403933
555	5	75	\N	2015-11-04 13:42:07.403933	2015-11-04 13:42:07.403933
556	6	75	\N	2015-11-04 13:42:07.403933	2015-11-04 13:42:07.403933
557	7	75	\N	2015-11-04 13:42:07.403933	2015-11-04 13:42:07.403933
558	8	75	\N	2015-11-04 13:42:07.403933	2015-11-04 13:42:07.403933
559	3	75	\N	2015-11-04 13:42:07.403933	2015-11-04 13:42:07.403933
568	1	77	It’s okay to admit it, we all thought the same thing when Lori Loughlin was portrayed as Jerry’s girlfriend: “what is Aunt Becky from Full House doing on Seinfeld?” Her character and storyline as to why they broke up actually wasn’t that intriguing. She accused Jerry of bottling his emotions up inside and demanded that he get “real angry.” He was reluctant at first, but then started to like it a bit too much and used his new open personality as an excuse to be a jerk. We’ve seen Jerry do a lot worse.\r\n\r\nRegardless of the subpar storyline, Lori Loughlin is an ageless wonder, stunning in any role she plays. She continues to slap father time in the face to this day.	2015-11-04 14:16:43.404933	2015-11-04 14:19:21.57944
552	1	75	This episode represents all kind of weirdness, so naturally it’s a personal favorite. Jerry and George imagine a scenario in which the stomach of Claire makes sounds during the night. They imitate the sound by singing “HELLLLOOOOO, La La La,” in an deep, exaggerated tone. Claire finds out about this and is obviously insulted. She then gives Jerry an ultimatum, their relationship or the voice. Jerry hilariously chooses the voice over her (words cannot do it justice). He finally gives it up and gets back together with Claire because George and Kramer are tired of the voice. The episode ends with Kramer testing out his oil tanker bladder idea as he drops a rubber ball full of oil off the top of Jerry’s apartment which lands directly on Claire’s head. Jerry tried to warn her to move but she ignored him because she thought he was doing the voice again.	2015-11-04 13:42:07.403933	2015-11-04 13:47:29.216448
561	2	76	\N	2015-11-04 13:48:28.696195	2015-11-04 13:48:28.696195
562	4	76	\N	2015-11-04 13:48:28.696195	2015-11-04 13:48:28.696195
563	5	76	\N	2015-11-04 13:48:28.696195	2015-11-04 13:48:28.696195
564	6	76	\N	2015-11-04 13:48:28.696195	2015-11-04 13:48:28.696195
565	7	76	\N	2015-11-04 13:48:28.696195	2015-11-04 13:48:28.696195
566	8	76	\N	2015-11-04 13:48:28.696195	2015-11-04 13:48:28.696195
567	3	76	\N	2015-11-04 13:48:28.696195	2015-11-04 13:48:28.696195
560	1	76	People may disagree with having her this high on the list, but she was very underrated. She was gorgeous and lasted two more episodes than most of Jerry’s girlfriends. As an added bonus, she walked in on George naked after he was in the pool, and the term “shrinkage” was officially coined. Jerry and Rachel had a tumultuous run, including an incident where Newman caught them making out during Schindler’s list. It was anticlimactic though as they’re breakup was rather mundane. She informed Jerry that she didn’t think they should see each other anymore, which he was fine with because things always even out for him.	2015-11-04 13:48:28.696195	2015-11-04 14:03:44.018132
569	2	77	\N	2015-11-04 14:16:43.404933	2015-11-04 14:16:43.404933
570	4	77	\N	2015-11-04 14:16:43.404933	2015-11-04 14:16:43.404933
571	5	77	\N	2015-11-04 14:16:43.404933	2015-11-04 14:16:43.404933
572	6	77	\N	2015-11-04 14:16:43.404933	2015-11-04 14:16:43.404933
573	7	77	\N	2015-11-04 14:16:43.404933	2015-11-04 14:16:43.404933
574	8	77	\N	2015-11-04 14:16:43.404933	2015-11-04 14:16:43.404933
575	3	77	\N	2015-11-04 14:16:43.404933	2015-11-04 14:16:43.404933
585	2	79	\N	2015-11-04 14:34:58.458572	2015-11-04 14:34:58.458572
586	4	79	\N	2015-11-04 14:34:58.458572	2015-11-04 14:34:58.458572
587	5	79	\N	2015-11-04 14:34:58.458572	2015-11-04 14:34:58.458572
588	6	79	\N	2015-11-04 14:34:58.458572	2015-11-04 14:34:58.458572
589	7	79	\N	2015-11-04 14:34:58.458572	2015-11-04 14:34:58.458572
590	8	79	\N	2015-11-04 14:34:58.458572	2015-11-04 14:34:58.458572
591	3	79	\N	2015-11-04 14:34:58.458572	2015-11-04 14:34:58.458572
584	1	79	This episode had a different dynamic to it. In this case, the relationship and break up had already occurred. Jerry points her out, and claims they previously dated but he broke up with her because she refused to kiss him goodnight after three dates. She ultimately ends up with Kramer who claims “she’s wearing him out.”\r\n\r\nJerry is obviously miffed but cannot cut ties because he and George need a favor from her. The president of NBC refuses to take their calls but they know that he often frequents the restaurant that Gail is a chef at. She agrees to let Jerry and George know the next time he comes in so they can corner him…on 1 condition. Elaine has to give Gail her shoes, the Botticelli’s!	2015-11-04 14:34:58.458572	2015-11-04 14:39:15.822895
593	2	80	\N	2015-11-04 14:41:52.729485	2015-11-04 14:41:52.729485
594	4	80	\N	2015-11-04 14:41:52.729485	2015-11-04 14:41:52.729485
595	5	80	\N	2015-11-04 14:41:52.729485	2015-11-04 14:41:52.729485
596	6	80	\N	2015-11-04 14:41:52.729485	2015-11-04 14:41:52.729485
597	7	80	\N	2015-11-04 14:41:52.729485	2015-11-04 14:41:52.729485
598	8	80	\N	2015-11-04 14:41:52.729485	2015-11-04 14:41:52.729485
599	3	80	\N	2015-11-04 14:41:52.729485	2015-11-04 14:41:52.729485
592	1	80	Nicki did not have a big impact as Jerry’s girlfriend and is somewhat forgotten among Seinfeld fans. In real life, Danette Tays is also kind of an afterthought as she hasn’t been involved in many notable shows or films. This is rather baffling because she is stunning!\r\n\r\nIn the episode, she uses her ravishing good looks to get whatever she wants. Jerry obviously takes advantage to get whatever he wants, including obtaining tickets to a sold out movie and getting out of a speeding ticket. Ironically, Jerry loses her to Todd Gack, a guy Elaine is dating, who is the founder of the “dating loophole.”	2015-11-04 14:41:52.729485	2015-11-04 14:45:04.643188
601	2	81	\N	2015-11-04 14:47:21.856584	2015-11-04 14:47:21.856584
602	4	81	\N	2015-11-04 14:47:21.856584	2015-11-04 14:47:21.856584
603	5	81	\N	2015-11-04 14:47:21.856584	2015-11-04 14:47:21.856584
604	6	81	\N	2015-11-04 14:47:21.856584	2015-11-04 14:47:21.856584
605	7	81	\N	2015-11-04 14:47:21.856584	2015-11-04 14:47:21.856584
606	8	81	\N	2015-11-04 14:47:21.856584	2015-11-04 14:47:21.856584
607	3	81	\N	2015-11-04 14:47:21.856584	2015-11-04 14:47:21.856584
600	1	81	Where to begin. It was par for the course to see “The Sein” overachieve with the ladies, but this portion of the list is where business officially picks up.\r\n\r\nMeryl poses as Jerry’s wife in this episode to obtain a 25% discount on dry cleaning. The two of them end up having fun with the idea of being married and eerily start acting like a married couple. Jerry eventually cheats on her with a girl who’s in financial peril so that she could use the discount too… Cheating on Courteney Cox, way to go Jerry.	2015-11-04 14:47:21.856584	2015-11-04 14:50:25.401417
609	2	82	\N	2015-11-04 14:56:06.629871	2015-11-04 14:56:06.629871
610	4	82	\N	2015-11-04 14:56:06.629871	2015-11-04 14:56:06.629871
611	5	82	\N	2015-11-04 14:56:06.629871	2015-11-04 14:56:06.629871
612	6	82	\N	2015-11-04 14:56:06.629871	2015-11-04 14:56:06.629871
613	7	82	\N	2015-11-04 14:56:06.629871	2015-11-04 14:56:06.629871
614	8	82	\N	2015-11-04 14:56:06.629871	2015-11-04 14:56:06.629871
615	3	82	\N	2015-11-04 14:56:06.629871	2015-11-04 14:56:06.629871
608	1	82	Tia Van Camp will go down as the best looking woman Jerry Seinfeld dated in the 9 seasons of Seinfeld. Naturally, he blew it.\r\n\r\nJerry and Elaine were on a flight heading back to New York, and there was a situation where one of them was to be bumped up to first class. Jerry was the needless volunteer. He ended up sitting next to Tia Van Camp, who was portraying a super model. The two instantly hit it off for the entire flight and exchanged numbers in the airport as the paparazzi was snapping pictures of her. Elaine was also at her best in this episode as she got stuck in coach and had a hilarious flight.\r\n\r\nJerry and Tia meet up the next episode and seem to be getting along again…until she caught Jerry in “a pick” at a red light. Her cab pulled up next to Jerry while he was at a red light, and he was seemingly picking his nose. She was horrified and spent the rest of the episode avoiding him.	2015-11-04 14:56:06.629871	2015-11-04 15:02:10.747294
617	2	83	\N	2015-11-04 15:11:45.667269	2015-11-04 15:11:45.667269
618	4	83	\N	2015-11-04 15:11:45.667269	2015-11-04 15:11:45.667269
619	5	83	\N	2015-11-04 15:11:45.667269	2015-11-04 15:11:45.667269
620	6	83	\N	2015-11-04 15:11:45.667269	2015-11-04 15:11:45.667269
621	7	83	\N	2015-11-04 15:11:45.667269	2015-11-04 15:11:45.667269
622	8	83	\N	2015-11-04 15:11:45.667269	2015-11-04 15:11:45.667269
623	3	83	\N	2015-11-04 15:11:45.667269	2015-11-04 15:11:45.667269
616	1	83	After a suicide attempt by Jerry's neighbor lands him in a coma, Jerry begins a relationship with his girlfriend. George visits a psychic who predicts trouble on his upcoming trip. Elaine agonizes over having to fast before surgery.	2015-11-04 15:11:45.667269	2015-11-04 15:12:37.214262
625	2	84	\N	2015-11-04 15:15:21.795056	2015-11-04 15:15:21.795056
626	4	84	\N	2015-11-04 15:15:21.795056	2015-11-04 15:15:21.795056
627	5	84	\N	2015-11-04 15:15:21.795056	2015-11-04 15:15:21.795056
628	6	84	\N	2015-11-04 15:15:21.795056	2015-11-04 15:15:21.795056
629	7	84	\N	2015-11-04 15:15:21.795056	2015-11-04 15:15:21.795056
630	8	84	\N	2015-11-04 15:15:21.795056	2015-11-04 15:15:21.795056
631	3	84	\N	2015-11-04 15:15:21.795056	2015-11-04 15:15:21.795056
624	1	84	"The Good Samaritan" is the 37th episode of the sitcom Seinfeld. It is the 20th episode of the third season, and first aired on March 4, 1992. This is the only episode of Seinfeld to be directed by one of the show's stars, Jason Alexander, who played George Costanza.\r\n\r\nWithin this episode are several memorable moments. One is Jerry's suggestion that there should be an alternative to saying, "God bless you" after someone sneezes. In real life, the cast and crew had hoped the saying, "You are so good looking", would catch on with fans just as "These pretzels are making me thirsty" did. In 2009, an Iowa man was fired from his job for sexual harassment, partially stemming from his use of the phrase.[1]\r\n\r\nAnother bit concerns Kramer having seizures every time he hears Mary Hart's voice. This bit is based on an actual case reported in the New England Journal of Medicine.[2]	2015-11-04 15:15:21.795056	2015-11-04 15:16:42.796239
\.


--
-- Name: responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('responses_id_seq', 631, true);


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
20150821174918
20150821180648
20150821205508
20150821224429
20150821230838
20150824050346
20150824050437
20150824051350
20150825021835
20150910013604
20150910073815
20151028122730
20151028124908
20151030003921
20151103085104
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
25	marissa_tomei	$2a$10$LnoUupujW/4Qrko6wSIDku75K6/020hiLoKfctfDHKfr/wRXiv89K	MJO-1hfieoTrTuCRe2iu2A	1964-12-04 00:00:00	2	\N	\N	\N	\N	\N	2015-09-09 15:14:36.157421	2015-10-26 21:45:23.879086
28	donna	$2a$10$V8cdI3MKbgIJgyDGSl/MU.Dl6sDBco.h/F4OfM6y/bJ4WDfIXD.YG	f_mFeQfundkFpMUxNwn__A	1981-04-28 00:00:00	2	\N	\N	\N	\N	\N	2015-10-26 10:22:11.021718	2015-10-26 10:24:37.446473
27	marlene	$2a$10$dT9Q7dUV.tEJY1GcyUHmFuT693IH6JWZGOcglUiEFndCKVN/Z4d3C	WZaQOg-pz7qPoPydFws4gQ	1962-04-06 00:00:00	2	\N	\N	\N	\N	\N	2015-10-26 10:10:49.734297	2015-10-26 10:17:16.837698
30	keith_hernandez	$2a$10$LaZuasVYz9vPntVMHB6LmuacwMnzWR7.gZ2Qerd71AeQU6313KpsC	wequHHecKO8AM8RQaOIMIw	1953-10-20 00:00:00	1	\N	\N	\N	\N	\N	2015-10-26 10:50:13.274341	2015-10-26 10:51:28.274383
12	sparticus	$2a$10$LRnclwqRXbDPkp.e1vaHBeyX8wOENzhro5IETV/FC53KMICZkH3Zq	cqRPcrbmKTIhGnJ1HHa70w	1990-01-01 00:00:00	1	\N	\N	\N	\N	\N	2015-08-16 06:11:48.548833	2015-09-10 18:15:35.728284
32	peas_1_at_a_time	$2a$10$acA3P/OO4XMZKB9PVXNgxe8PSQLswZSExZ5txausKOj5zqyuAU/Uu	zt9BBFtCdIjLbVCwKUnYWg	1972-01-01 00:00:00	2	\N	\N	\N	\N	\N	2015-10-28 04:33:37.318651	2015-10-28 04:35:22.951281
15	elaine	$2a$10$C1iMvXxqnYvXZJ2NVwEVmeDsFizZa0CaGjQrimCZ4uNdfDNEQ./Pm	0tU76MdL4nLHSayhX7hWWw	1961-01-13 00:00:00	2	\N	\N	\N	\N	\N	2015-08-19 02:01:25.216819	2015-10-26 10:52:01.008373
29	sherry_becker	$2a$10$8M/g837sco7uJd1x24p1c.HuLbIs6u4uU7EcOcUH1cV71r6/zvmui	CPH_nu_YM_i9gng_SMkGwg	1974-08-20 00:00:00	2	\N	\N	\N	\N	\N	2015-10-26 10:34:30.81212	2015-10-26 10:46:01.027869
16	soup_nazi	$2a$10$MRxNj4rwkW0aW8mE5BCn.uAlkdI/dd0sQEqVaDGlYGGP/W/yvFIv6	95sQxtFjmtlaSspNX_-6lg	1956-09-01 00:00:00	1	\N	\N	\N	\N	\N	2015-08-20 00:13:18.952628	2015-09-10 18:16:17.144287
35	deaf_tennis_judge	$2a$10$f1X0dP2aAaAzlp/B8rJWiuHHhrmTRJD.BcrfYuQGlRgrwTRGPTHMq	cROQdV3f1a3JD5b9WSracA	\N	\N	\N	\N	\N	\N	\N	2015-10-28 07:51:38.641464	2015-10-28 07:51:38.68502
17	maestro	$2a$10$w3mtYswiHawuqX67CheSvO7XZk7b1zAd0z2j0S5URTBXr0Xa/poBO	deb5Po6yUF_fuk_2UkVuhQ	1946-03-11 00:00:00	1	\N	\N	\N	\N	\N	2015-08-21 22:29:30.26859	2015-09-10 18:16:43.691981
21	george	$2a$10$O70wgZF4MGoK/S867hsw9.7xAytIo/mN/XjReQu8jG1.sRMX91v1W	jDwlnuEEZT0CocjXFDdsaw	1955-09-23 00:00:00	1	\N	\N	\N	\N	\N	2015-08-24 17:19:03.627613	2015-09-10 18:46:15.59881
20	sindra	$2a$10$A9e69J3nD2gyrpOQOeUpC.aMurVoOVyXwvpBxEuDzKUQOIpvun2qa	n815a4Vv2wlh4_6aPWK65Q	1964-12-08 00:00:00	2	\N	\N	\N	\N	\N	2015-08-23 05:44:27.176509	2015-09-10 18:17:41.099867
22	poppy	$2a$10$VYxmKfsD8nufKVJddWjIE.BHH/KbWx64iquNqEdUdFhACl5PADu0G	9AnT67cay8uhN-gtWR2XWg	1950-01-01 00:00:00	1	\N	\N	\N	\N	\N	2015-09-07 05:32:36.568962	2015-09-10 18:24:08.354236
31	ned_isakoff	$2a$10$ixEZEikRFFT6lkc2UaCAIetjIyyXV4ZMuiHLov3/QtROcNn0bFvKu	eSp3yPbNL1updDNjbvfHNQ	1969-05-15 00:00:00	1	\N	\N	\N	\N	\N	2015-10-26 10:55:20.045129	2015-10-26 10:56:18.913925
23	steinbrenner	$2a$10$jRxoclUSpcVCHkHn58QSUu.306xxrGhUrB1wdznvp7qa673xMzx0u	WKLj0BGLFQZwjTNANw8I2Q	1930-07-04 00:00:00	1	\N	\N	\N	\N	\N	2015-09-09 09:29:07.476717	2015-09-10 18:31:59.220097
24	susan	$2a$10$ZBEv1C1jduNz5M7/RKA/HOcc.opkJB1cAiFz3Joa8iBSkTCuFM2iK	0BKaMob8Uo8hvIWB3LqsPg	1966-03-03 00:00:00	2	\N	\N	\N	\N	\N	2015-09-09 09:52:32.140723	2015-09-10 18:36:30.659651
19	mulva	$2a$10$s6ci8s7FD8qocIrmLutsbuW81nx0x0AqzHNAKIwwR1LWwjXtkvHym	rr1RLgG8nY0cFF550nEYXA	1985-07-14 00:00:00	2	\N	\N	\N	\N	\N	2015-08-21 22:51:11.618895	2015-10-30 05:54:28.965035
71	ellen	$2a$10$.8826jWeQ7jDi.dqX0iNMOT3opIxMtQGJLTuekaBm4L10JdAtLldO	JAhljjyZ5dZUCi3v25VAjw	1971-01-30 00:00:00	2	\N	\N	\N	\N	\N	2015-11-04 13:29:09.971571	2015-11-04 13:29:36.474732
72	donna_chang	$2a$10$nPQoGn74lk/voArP7gHmkexEGMzyNjlpWh0Ni1kq13XhKn6pOI5QO	9jf2J4xxhjj0buKaz0xFLw	1965-08-17 00:00:00	\N	\N	\N	\N	\N	\N	2015-11-04 13:31:45.29859	2015-11-04 13:32:24.291157
70	laura_seinfeld_chronicles	$2a$10$1kR.UueWkF1QWGtti4ND5OlRyV7K4LryUHLQGM1FwqDSZ6fe55Zry	6PiY9V5-VEgBIUehewrzeQ	1953-08-25 00:00:00	2	30	70	\N	\N	\N	2015-11-04 13:20:17.493183	2015-11-04 13:33:33.723095
77	patty	$2a$10$vOJfr8D4UXRID4VWcd7J7.sohiMRulkS1mTIKHuLShUrXTwX5jPEq	APui_PCC0FlxTlwdIP1c2Q	1964-07-28 00:00:00	2	40	60	\N	\N	\N	2015-11-04 14:16:43.404933	2015-11-04 14:17:09.238154
73	laura_the_tennis_judge	$2a$10$KVE3cf.GU3.yFiMvDh/dOOX5DdXVkMtUvxUvZtz5cSFmr0s54sdCK	1YCfBojhqUWDogUF0ZrDkA	1965-08-24 00:00:00	2	45	55	\N	\N	\N	2015-11-04 13:36:20.42061	2015-11-04 13:37:47.176747
74	marla	$2a$10$U5zKVPtfafdo36QdTH0g..dqrN2cfXmgiFp2EGIoZSBhOznoh5Lne	Ph79PS-K3zCUgzg9jRob8w	1961-04-18 00:00:00	2	50	60	\N	\N	\N	2015-11-04 13:39:20.637977	2015-11-04 13:40:03.684473
75	claire	$2a$10$ayfviJ6EPKV5ECQHAnVZsOt2DhwXNnAvuUvrdV2ih8aVxPWET8rdm	GQWshmCKVKcKWMtafdilKg	1980-05-01 00:00:00	2	30	40	\N	\N	\N	2015-11-04 13:42:07.403933	2015-11-04 13:43:08.870609
76	rachel_goldstein	$2a$10$xQBw3YCycH8ZSqZspRfdAu/inaVyNQwZSHHA8RI1dpy0ZRkb5dwT.	VjhrxBSHYtIWiplNH928BQ	1985-07-14 00:00:00	2	22	35	\N	\N	\N	2015-11-04 13:48:28.696195	2015-11-04 14:03:27.771282
79	gail_cunningham	$2a$10$FYD3zv9UFV15QeaW2Oga8OBG.ejjjg/0RyOOgVYGnR7PmZroAzu/6	g_oNq4x-eomAAH9TGwA5OA	1964-09-25 00:00:00	2	45	60	\N	\N	\N	2015-11-04 14:34:58.458572	2015-11-04 14:38:39.148491
80	nicki	$2a$10$jZT64Ik7I554LnAa1gNrWOWDc.35e59/S1UOiqTcjCH2tz0Iqmvz.	waYmWMLW7zMUWDn9Lq4LQg	1975-09-01 00:00:00	2	\N	\N	\N	\N	\N	2015-11-04 14:41:52.729485	2015-11-04 14:43:12.513729
81	meryl	$2a$10$Zd5Jgy3hPsBn8uVwCveo/O.PsZpCbVJsw3.Merl4lVrrWABERmt1W	OQFxKNg3wqZ7coBgZnACvg	1964-06-15 00:00:00	2	22	30	\N	\N	\N	2015-11-04 14:47:21.856584	2015-11-04 14:48:34.315676
82	tia_van_camp	$2a$10$jOBmBFA6qCY3Ec.5kREfG.78Dmdo4.MaQhBoZ4QmcecvrTY340Age	mJ1FBxGuNh_CeVSdThdDcw	1967-10-03 00:00:00	2	30	45	\N	\N	\N	2015-11-04 14:56:06.629871	2015-11-04 14:59:48.822274
83	gina	$2a$10$11nlnzltUoQec/N/MKdYtePddKuIKiAJp/M2S9WqVK7GMxZfeBL6K	LAbIsnsDLF7Bo-9AsHeftw	1970-01-01 00:00:00	2	40	55	\N	\N	\N	2015-11-04 15:11:45.667269	2015-11-04 15:12:00.933624
14	seinfeld	$2a$10$WO0BighJXm2znlGFT0XxWuC/RYPtvVFfOHN.7o5.aeFb9StkJUwxe	x2OcCVeb2x2v5kiYzOAC-g	1952-12-01 00:00:00	1	\N	\N	\N	\N	\N	2015-08-18 05:54:50.957263	2015-11-04 15:18:45.413103
1	zelaznik	$2a$10$GxKq.J.9qWJ2tlLU7P6UEerTRa01rIef7GLb9WaXb3FOePHzF/acC	9mUP8pP3nHye_BT7W-5E1g	1984-02-06 00:00:00	1	26	34	50	\N	\N	2015-08-12 04:19:06.209106	2015-11-05 08:24:08.609281
84	angela	$2a$10$tov3pZUSd92bw2MGxpJ8k.cyH1FaKSDOcoKp4TjEDrIO6BGIKAHO.	OUyYG5omm_--SvHpyRr2jQ	1967-11-22 00:00:00	2	21	40	\N	\N	\N	2015-11-04 15:15:21.795056	2015-11-04 15:15:44.030044
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('users_id_seq', 84, true);


--
-- Data for Name: visits; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY visits (id, visitor_id, profile_id, created_at, updated_at) FROM stdin;
21	14	1	2015-08-21 21:00:14.322911	2015-08-21 21:00:14.322911
25	14	15	2015-08-21 21:40:41.156517	2015-08-21 21:40:41.156517
26	1	14	2015-08-21 22:10:41.319663	2015-08-21 22:10:41.319663
27	19	1	2015-08-21 23:13:27.200809	2015-08-21 23:13:27.200809
28	14	19	2015-08-21 23:18:14.506299	2015-08-21 23:18:14.506299
32	14	20	2015-08-23 05:46:52.960447	2015-08-23 05:46:52.960447
33	20	17	2015-08-23 05:51:14.752279	2015-08-23 05:51:14.752279
34	14	17	2015-08-23 20:59:50.795196	2015-08-23 20:59:50.795196
35	1	19	2015-08-23 22:29:00.151599	2015-08-23 22:29:00.151599
38	21	19	2015-08-24 20:55:03.15347	2015-08-24 20:55:03.15347
39	21	1	2015-08-24 20:56:42.77153	2015-08-24 20:56:42.77153
40	21	14	2015-08-24 20:57:01.468029	2015-08-24 20:57:01.468029
41	14	12	2015-08-29 07:03:40.453172	2015-08-29 07:03:40.453172
44	1	17	2015-09-07 02:04:41.520284	2015-09-07 02:04:41.520284
45	14	16	2015-09-07 03:39:16.943302	2015-09-07 03:39:16.943302
47	21	20	2015-09-07 05:24:49.770804	2015-09-07 05:24:49.770804
48	14	21	2015-09-08 19:55:26.296327	2015-09-08 19:55:26.296327
49	23	20	2015-09-09 09:34:04.730958	2015-09-09 09:34:04.730958
51	24	1	2015-09-09 10:08:11.433286	2015-09-09 10:08:11.433286
53	25	17	2015-09-09 15:26:53.547213	2015-09-09 15:26:53.547213
54	16	17	2015-09-09 19:52:24.117905	2015-09-09 19:52:24.117905
55	16	24	2015-09-09 19:52:30.191405	2015-09-09 19:52:30.191405
56	15	14	2015-09-10 03:42:01.601311	2015-09-10 03:42:01.601311
59	23	19	2015-09-10 07:22:02.66469	2015-09-10 07:22:02.66469
60	15	23	2015-09-10 08:09:24.211803	2015-09-10 08:09:24.211803
63	19	14	2015-09-10 08:58:34.279065	2015-09-10 08:58:34.279065
64	1	15	2015-09-10 09:08:57.987414	2015-09-10 09:08:57.987414
65	1	20	2015-09-10 09:09:12.356821	2015-09-10 09:09:12.356821
66	25	23	2015-09-10 18:40:54.160922	2015-09-10 18:40:54.160922
68	14	25	2015-10-26 08:41:05.021386	2015-10-26 08:41:05.021386
69	27	14	2015-10-26 10:14:23.304201	2015-10-26 10:14:23.304201
70	14	27	2015-10-26 10:14:53.269703	2015-10-26 10:14:53.269703
71	14	28	2015-10-26 10:24:24.639377	2015-10-26 10:24:24.639377
72	28	14	2015-10-26 10:24:47.844438	2015-10-26 10:24:47.844438
73	14	29	2015-10-26 10:38:35.642461	2015-10-26 10:38:35.642461
74	29	14	2015-10-26 10:39:15.296307	2015-10-26 10:39:15.296307
75	15	30	2015-10-26 10:52:53.696922	2015-10-26 10:52:53.696922
77	1	29	2015-10-26 14:07:59.638421	2015-10-26 14:07:59.638421
78	1	28	2015-10-26 16:30:36.578602	2015-10-26 16:30:36.578602
79	14	24	2015-10-26 19:45:44.781062	2015-10-26 19:45:44.781062
80	1	25	2015-10-26 21:45:15.665524	2015-10-26 21:45:15.665524
81	25	19	2015-10-26 21:48:34.567467	2015-10-26 21:48:34.567467
82	25	29	2015-10-26 21:48:37.916946	2015-10-26 21:48:37.916946
83	25	14	2015-10-26 21:48:41.104764	2015-10-26 21:48:41.104764
84	25	1	2015-10-26 21:48:45.089903	2015-10-26 21:48:45.089903
85	25	21	2015-10-26 21:48:58.584	2015-10-26 21:48:58.584
86	1	32	2015-10-28 07:50:51.346831	2015-10-28 07:50:51.346831
98	1	31	2015-10-30 20:29:39.143574	2015-10-30 20:29:39.143574
99	1	24	2015-10-30 21:19:30.813171	2015-10-30 21:19:30.813171
101	1	30	2015-10-30 21:39:03.368388	2015-10-30 21:39:03.368388
104	1	27	2015-10-30 22:10:13.174893	2015-10-30 22:10:13.174893
115	1	76	2015-11-04 14:11:09.370795	2015-11-04 14:11:09.370795
116	1	82	2015-11-04 15:07:03.411871	2015-11-04 15:07:03.411871
117	1	84	2015-11-04 16:55:15.086034	2015-11-04 16:55:15.086034
118	1	83	2015-11-04 17:00:30.614146	2015-11-04 17:00:30.614146
119	1	79	2015-11-04 22:07:22.158484	2015-11-04 22:07:22.158484
120	1	71	2015-11-05 05:53:44.980936	2015-11-05 05:53:44.980936
\.


--
-- Name: visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('visits_id_seq', 120, true);


--
-- Name: body_types_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY body_types
    ADD CONSTRAINT body_types_pkey PRIMARY KEY (id);


--
-- Name: default_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY default_preferences
    ADD CONSTRAINT default_preferences_pkey PRIMARY KEY (id);


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
-- Name: index_default_preferences_on_gender_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_default_preferences_on_gender_id ON default_preferences USING btree (gender_id);


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
-- Name: index_genders_on_plural; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_genders_on_plural ON genders USING btree (plural);


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

CREATE UNIQUE INDEX index_photos_on_user_id ON photos USING btree (user_id);


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
-- Name: trg_aft_ins_response_categories; Type: TRIGGER; Schema: public; Owner: zMac
--

CREATE TRIGGER trg_aft_ins_response_categories AFTER INSERT ON response_categories FOR EACH ROW EXECUTE PROCEDURE _trg_aft_ins_response_categories();


--
-- Name: trg_aft_ins_users; Type: TRIGGER; Schema: public; Owner: zMac
--

CREATE TRIGGER trg_aft_ins_users AFTER INSERT ON users FOR EACH ROW EXECUTE PROCEDURE _trg_aft_ins_users();


--
-- Name: fk_rails_06f41649f1; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY details_of_users
    ADD CONSTRAINT fk_rails_06f41649f1 FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_0e82c8a925; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY details_of_users
    ADD CONSTRAINT fk_rails_0e82c8a925 FOREIGN KEY (relationship_status_id) REFERENCES relationship_statuses(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_1d76cf6954; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY user_interest_links
    ADD CONSTRAINT fk_rails_1d76cf6954 FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_226f7867bd; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY details_of_users
    ADD CONSTRAINT fk_rails_226f7867bd FOREIGN KEY (ethnicity_id) REFERENCES ethnicities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_2bd9a0753e; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY responses
    ADD CONSTRAINT fk_rails_2bd9a0753e FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_3d5495eb35; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT fk_rails_3d5495eb35 FOREIGN KEY (sender_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_4154aab8fd; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT fk_rails_4154aab8fd FOREIGN KEY (receiver_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_47055e3204; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_47055e3204 FOREIGN KEY (gender_id) REFERENCES genders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_4bcdc22c1b; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY responses
    ADD CONSTRAINT fk_rails_4bcdc22c1b FOREIGN KEY (response_category_id) REFERENCES response_categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_5118b56961; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY visits
    ADD CONSTRAINT fk_rails_5118b56961 FOREIGN KEY (profile_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_581ad36714; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY default_preferences
    ADD CONSTRAINT fk_rails_581ad36714 FOREIGN KEY (gender_id) REFERENCES genders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_67c67d2963; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT fk_rails_67c67d2963 FOREIGN KEY (receiver_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_9ff6a2bac0; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY default_preferences
    ADD CONSTRAINT fk_rails_9ff6a2bac0 FOREIGN KEY (desire_id) REFERENCES genders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_a407c53dcd; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY user_interest_links
    ADD CONSTRAINT fk_rails_a407c53dcd FOREIGN KEY (interest_id) REFERENCES interests(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_ac8d78ef71; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY desired_genders
    ADD CONSTRAINT fk_rails_ac8d78ef71 FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_b156c396f4; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY visits
    ADD CONSTRAINT fk_rails_b156c396f4 FOREIGN KEY (visitor_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_b8f26a382d; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT fk_rails_b8f26a382d FOREIGN KEY (sender_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_c15204215a; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY desired_genders
    ADD CONSTRAINT fk_rails_c15204215a FOREIGN KEY (gender_id) REFERENCES genders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_c79d76afc0; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT fk_rails_c79d76afc0 FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_cd4d9a2710; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY details_of_users
    ADD CONSTRAINT fk_rails_cd4d9a2710 FOREIGN KEY (body_type_id) REFERENCES body_types(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_rails_dc762f37c6; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY details_of_users
    ADD CONSTRAINT fk_rails_dc762f37c6 FOREIGN KEY (religion_id) REFERENCES religions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_options_json_cache; Type: MATERIALIZED VIEW DATA; Schema: public; Owner: zMac
--

REFRESH MATERIALIZED VIEW user_options_json_cache;


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

