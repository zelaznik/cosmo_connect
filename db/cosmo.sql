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
\.


--
-- Name: body_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('body_types_id_seq', 10, true);


--
-- Data for Name: default_preferences; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY default_preferences (id, gender_id, desire_id, created_at, updated_at) FROM stdin;
1	1	2	2015-09-10 01:48:39.56298	2015-09-10 01:48:39.56298
2	2	1	2015-09-10 01:48:39.565634	2015-09-10 01:48:39.565634
3	3	3	2015-09-10 01:48:39.567171	2015-09-10 01:48:39.567171
4	4	4	2015-09-10 01:48:39.568603	2015-09-10 01:48:39.568603
\.


--
-- Name: default_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('default_preferences_id_seq', 4, true);


--
-- Data for Name: desired_genders; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY desired_genders (id, user_id, gender_id, created_at, updated_at, interested) FROM stdin;
42	7	4	2015-08-13 19:09:27.02488	2015-08-13 19:09:27.02488	t
47	21	2	2015-08-24 17:19:03.627613	2015-08-24 17:19:03.627613	t
22	19	2	2015-08-21 22:51:11.618895	2015-08-21 22:51:11.618895	t
50	22	1	2015-09-07 05:32:36.568962	2015-09-07 05:32:36.568962	f
2	17	1	2015-08-21 22:29:30.26859	2015-08-21 22:29:30.26859	f
3	6	1	2015-08-13 19:06:48.15266	2015-08-13 19:06:48.15266	f
4	12	1	2015-08-16 06:11:48.548833	2015-08-16 06:11:48.548833	f
52	22	3	2015-09-07 05:32:36.568962	2015-09-07 05:32:36.568962	f
8	4	1	2015-08-13 18:26:24.546648	2015-08-13 18:26:24.546648	f
9	7	1	2015-08-13 19:09:27.02488	2015-08-13 19:09:27.02488	f
53	22	4	2015-09-07 05:32:36.568962	2015-09-07 05:32:36.568962	f
12	16	1	2015-08-20 00:13:18.952628	2015-08-20 00:13:18.952628	f
16	20	2	2015-08-23 05:44:27.176509	2015-08-23 05:44:27.176509	f
20	7	2	2015-08-13 19:09:27.02488	2015-08-13 19:09:27.02488	f
24	17	3	2015-08-21 22:29:30.26859	2015-08-21 22:29:30.26859	f
25	6	3	2015-08-13 19:06:48.15266	2015-08-13 19:06:48.15266	f
26	12	3	2015-08-16 06:11:48.548833	2015-08-16 06:11:48.548833	f
27	20	3	2015-08-23 05:44:27.176509	2015-08-23 05:44:27.176509	f
29	1	3	2015-08-12 04:19:06.209106	2015-08-12 04:19:06.209106	f
30	4	3	2015-08-13 18:26:24.546648	2015-08-13 18:26:24.546648	f
31	7	3	2015-08-13 19:09:27.02488	2015-08-13 19:09:27.02488	f
33	19	3	2015-08-21 22:51:11.618895	2015-08-21 22:51:11.618895	f
34	16	3	2015-08-20 00:13:18.952628	2015-08-20 00:13:18.952628	f
35	17	4	2015-08-21 22:29:30.26859	2015-08-21 22:29:30.26859	f
36	6	4	2015-08-13 19:06:48.15266	2015-08-13 19:06:48.15266	f
37	12	4	2015-08-16 06:11:48.548833	2015-08-16 06:11:48.548833	f
38	20	4	2015-08-23 05:44:27.176509	2015-08-23 05:44:27.176509	f
43	14	4	2015-08-18 05:54:50.957263	2015-09-10 05:15:53.105797	f
40	1	4	2015-08-12 04:19:06.209106	2015-08-12 04:19:06.209106	f
41	4	4	2015-08-13 18:26:24.546648	2015-08-13 18:26:24.546648	f
21	14	2	2015-08-18 05:54:50.957263	2015-09-10 05:15:53.496203	t
44	19	4	2015-08-21 22:51:11.618895	2015-08-21 22:51:11.618895	f
45	16	4	2015-08-20 00:13:18.952628	2015-08-20 00:13:18.952628	f
46	21	1	2015-08-24 17:19:03.627613	2015-08-24 17:19:03.627613	f
48	21	3	2015-08-24 17:19:03.627613	2015-08-24 17:19:03.627613	f
49	21	4	2015-08-24 17:19:03.627613	2015-08-24 17:19:03.627613	f
7	1	1	2015-08-12 04:19:06.209106	2015-08-12 04:19:06.209106	f
5	20	1	2015-08-23 05:44:27.176509	2015-08-23 05:44:27.176509	t
10	14	1	2015-08-18 05:54:50.957263	2015-09-10 05:17:50.526645	f
11	19	1	2015-08-21 22:51:11.618895	2015-08-21 22:51:11.618895	t
13	17	2	2015-08-21 22:29:30.26859	2015-08-21 22:29:30.26859	t
14	6	2	2015-08-13 19:06:48.15266	2015-08-13 19:06:48.15266	t
15	12	2	2015-08-16 06:11:48.548833	2015-08-16 06:11:48.548833	t
19	4	2	2015-08-13 18:26:24.546648	2015-08-13 18:26:24.546648	t
18	1	2	2015-08-12 04:19:06.209106	2015-09-10 05:18:57.180152	t
23	16	2	2015-08-20 00:13:18.952628	2015-08-20 00:13:18.952628	t
61	24	4	2015-09-09 09:52:32.140723	2015-09-09 09:52:32.140723	f
63	25	2	2015-09-09 15:14:36.157421	2015-09-09 15:14:36.157421	f
64	25	3	2015-09-09 15:14:36.157421	2015-09-09 15:14:36.157421	f
65	25	4	2015-09-09 15:14:36.157421	2015-09-09 15:14:36.157421	f
39	15	4	2015-08-19 02:01:25.216819	2015-09-10 05:45:51.952333	f
17	15	2	2015-08-19 02:01:25.216819	2015-09-10 05:45:52.342828	f
6	15	1	2015-08-19 02:01:25.216819	2015-09-10 05:45:53.495128	t
28	15	3	2015-08-19 02:01:25.216819	2015-09-10 04:25:34.474121	f
55	23	2	2015-09-09 09:29:07.476717	2015-09-10 06:20:27.074805	t
57	23	4	2015-09-09 09:29:07.476717	2015-09-10 06:20:45.313175	f
56	23	3	2015-09-09 09:29:07.476717	2015-09-10 06:20:45.633101	f
54	23	1	2015-09-09 09:29:07.476717	2015-09-10 07:43:52.706192	f
51	22	2	2015-09-07 05:32:36.568962	2015-09-10 18:24:31.197941	t
62	25	1	2015-09-09 15:14:36.157421	2015-09-10 18:29:31.296734	t
60	24	3	2015-09-09 09:52:32.140723	2015-09-10 18:29:39.222837	f
32	14	3	2015-08-18 05:54:50.957263	2015-09-10 04:18:40.649664	f
59	24	2	2015-09-09 09:52:32.140723	2015-09-10 18:39:14.218426	t
58	24	1	2015-09-09 09:52:32.140723	2015-09-10 18:39:32.022426	t
\.


--
-- Name: desired_genders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('desired_genders_id_seq', 65, true);


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
10	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-21 22:29:30.273172	2015-08-21 22:29:30.273172
11	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-21 22:51:11.626985	2015-08-21 22:51:11.626985
12	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-23 05:44:27.235035	2015-08-23 05:44:27.235035
13	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-24 17:19:03.682584	2015-08-24 17:19:03.682584
14	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-07 05:32:36.616103	2015-09-07 05:32:36.616103
15	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-09 09:29:07.536597	2015-09-09 09:29:07.536597
16	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-09 09:52:32.170735	2015-09-09 09:52:32.170735
17	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-09 15:14:36.163025	2015-09-09 15:14:36.163025
\.


--
-- Name: details_of_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('details_of_users_id_seq', 17, true);


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
152	1	7	2015-09-07 01:03:10.392828	2015-09-07 01:03:10.392828
12	1	15	2015-08-19 06:58:20.589132	2015-08-19 06:58:20.589132
20	4	15	2015-08-19 18:04:47.838578	2015-08-19 18:04:47.838578
23	7	15	2015-08-19 20:35:30.574869	2015-08-19 20:35:30.574869
24	7	12	2015-08-19 21:02:32.672142	2015-08-19 21:02:32.672142
217	14	15	2015-09-07 07:33:28.920691	2015-09-07 07:33:28.920691
29	15	12	2015-08-20 04:02:28.839034	2015-08-20 04:02:28.839034
30	15	14	2015-08-20 04:02:33.569729	2015-08-20 04:02:33.569729
32	16	15	2015-08-20 04:48:42.267146	2015-08-20 04:48:42.267146
42	19	1	2015-08-21 23:13:29.393447	2015-08-21 23:13:29.393447
44	7	4	2015-08-22 23:27:47.123496	2015-08-22 23:27:47.123496
236	7	1	2015-09-09 09:09:21.744754	2015-09-09 09:09:21.744754
245	14	7	2015-09-09 23:56:51.393809	2015-09-09 23:56:51.393809
136	4	7	2015-08-29 20:17:50.956132	2015-08-29 20:17:50.956132
\.


--
-- Name: matches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('matches_id_seq', 276, true);


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY messages (id, sender_id, receiver_id, body, created_at, updated_at) FROM stdin;
2	14	15	The guy who runs the place is a little temperamental, especially about the ordering procedure. He’s secretly referred to as the Soup Nazi.	2015-08-21 06:08:12.764925	2015-08-21 06:08:12.764925
3	15	14	Why? What happens if you don’t order right?	2015-08-21 06:26:28.378487	2015-08-21 06:26:28.378487
4	14	15	He yells and you don’t get your soup.	2015-08-21 06:28:17.100806	2015-08-21 06:28:17.100806
5	16	15	No soup for you!	2015-08-21 08:35:09.786377	2015-08-21 08:35:09.786377
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
6	15	\N	2015-09-10 08:53:14.038657	2015-09-10 08:53:14.038657	http://res.cloudinary.com/cosmo-connect/image/upload/v1441875158/ijdqdeitrwden31phjvy.png	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441875158/ijdqdeitrwden31phjvy.png
7	14	\N	2015-09-10 08:57:10.996043	2015-09-10 08:57:10.996043	http://res.cloudinary.com/cosmo-connect/image/upload/v1441875430/qvf8kxsuy2nzkktzdygp.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441875430/qvf8kxsuy2nzkktzdygp.jpg
8	19	\N	2015-09-10 08:58:10.814484	2015-09-10 08:58:10.814484	http://res.cloudinary.com/cosmo-connect/image/upload/v1441875490/hxzok2qusrxnmxfaybch.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441875490/hxzok2qusrxnmxfaybch.jpg
9	1	\N	2015-09-10 09:01:20.049761	2015-09-10 09:01:20.049761	http://res.cloudinary.com/cosmo-connect/image/upload/v1441875679/pp09jj6vri2bgjvsmdau.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441875679/pp09jj6vri2bgjvsmdau.jpg
10	4	\N	2015-09-10 18:14:12.023916	2015-09-10 18:14:12.023916	http://res.cloudinary.com/cosmo-connect/image/upload/v1441908851/ctzjva6uarnvsnxlz0yy.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441908851/ctzjva6uarnvsnxlz0yy.jpg
11	6	\N	2015-09-10 18:14:42.548106	2015-09-10 18:14:42.548106	http://res.cloudinary.com/cosmo-connect/image/upload/v1441908881/ylicj1mdota2j5vaofkp.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441908881/ylicj1mdota2j5vaofkp.jpg
12	7	\N	2015-09-10 18:15:07.589469	2015-09-10 18:15:07.589469	http://res.cloudinary.com/cosmo-connect/image/upload/v1441908906/ve5mc8e7gx6suwe1qono.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441908906/ve5mc8e7gx6suwe1qono.jpg
13	12	\N	2015-09-10 18:15:44.310996	2015-09-10 18:15:44.310996	http://res.cloudinary.com/cosmo-connect/image/upload/v1441908943/eqdm1pwit2xracrrotrh.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441908943/eqdm1pwit2xracrrotrh.jpg
14	16	\N	2015-09-10 18:16:30.117464	2015-09-10 18:16:30.117464	http://res.cloudinary.com/cosmo-connect/image/upload/v1441908989/uegryjkqltdewqlbc9xn.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441908989/uegryjkqltdewqlbc9xn.jpg
15	17	\N	2015-09-10 18:16:50.047808	2015-09-10 18:16:50.047808	http://res.cloudinary.com/cosmo-connect/image/upload/v1441909009/bau7me3fwcjnnikbovoe.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441909009/bau7me3fwcjnnikbovoe.jpg
16	20	\N	2015-09-10 18:18:15.249588	2015-09-10 18:18:15.249588	http://res.cloudinary.com/cosmo-connect/image/upload/v1441909094/xmow5e420jy7g2tins3k.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441909094/xmow5e420jy7g2tins3k.jpg
17	21	\N	2015-09-10 18:20:52.355563	2015-09-10 18:20:52.355563	http://res.cloudinary.com/cosmo-connect/image/upload/v1441909251/agod0rl2qd2vexfyapnw.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441909251/agod0rl2qd2vexfyapnw.jpg
18	22	\N	2015-09-10 18:24:21.178933	2015-09-10 18:24:21.178933	http://res.cloudinary.com/cosmo-connect/image/upload/v1441909460/gtrzqaaqkpnz3bzyajec.png	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441909460/gtrzqaaqkpnz3bzyajec.png
19	23	\N	2015-09-10 18:32:07.888153	2015-09-10 18:32:07.888153	http://res.cloudinary.com/cosmo-connect/image/upload/v1441909927/ely1kpc5uh3uen0tpou0.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441909927/ely1kpc5uh3uen0tpou0.jpg
20	24	\N	2015-09-10 18:38:05.421622	2015-09-10 18:38:05.421622	http://res.cloudinary.com/cosmo-connect/image/upload/v1441910285/zoajsmlftsemigq06slp.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441910285/zoajsmlftsemigq06slp.jpg
21	25	\N	2015-09-10 18:40:41.85308	2015-09-10 18:40:41.85308	http://res.cloudinary.com/cosmo-connect/image/upload/v1441910441/x6ovjayiazgsxo9amdno.jpg	http://res.cloudinary.com/cosmo-connect/image/upload/c_limit,h_60,w_90/v1441910441/x6ovjayiazgsxo9amdno.jpg
\.


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('photos_id_seq', 21, true);


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
49	8	14	You think that Soup is still a meal.	2015-08-21 05:22:10.380868	2015-08-23 05:06:24.620138
37	3	14	Mugging old ladies for their marble rye.	2015-08-18 18:16:14.151676	2015-08-23 05:06:48.203258
38	6	14	Why Kenny Banyon gets so many laughs, that hack.	2015-08-18 18:16:22.109873	2015-08-23 05:07:04.151171
39	1	14	I'm extremely picky with women.  You have one thing wrong with you, it's over.	2015-08-18 18:16:31.221476	2015-08-23 05:07:31.015604
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
65	2	14	getting my parents kicked out of the retirement home after buying them a Caddy.	2015-08-21 22:52:42.746693	2015-08-25 02:37:17.711686
71	4	14	Mendy's	2015-08-21 22:52:42.746693	2015-09-07 04:34:15.601076
25	2	1	Attending a coding bootcamp.	2015-08-17 16:49:39.046196	2015-08-18 03:03:08.532236
29	1	1	(edit) I don't know what to say.	2015-08-17 17:00:24.367881	2015-08-18 04:02:45.024907
21	5	7	tennis balls, tennis, balls, tennis balls.  	2015-08-13 19:09:27.179685	2015-08-18 04:23:30.310019
33	3	4	charming people	2015-08-18 04:28:49.901855	2015-08-18 04:28:49.901855
34	6	4	happy gilmore	2015-08-18 04:28:56.509794	2015-08-18 04:28:56.509794
35	1	4	not sure where I'm going in life, but making lots of friends on the way.	2015-08-18 04:29:07.66948	2015-08-18 04:29:07.66948
36	7	4	working	2015-08-18 04:29:14.661676	2015-08-18 04:29:14.661676
32	8	1	(edit) You know CSS and/or bootstrap.	2015-08-17 18:52:32.824896	2015-08-18 05:26:28.823061
40	7	14	Counting my 401k.	2015-08-18 18:16:39.598132	2015-08-18 18:16:39.598132
42	8	15	You're sponge worthy.	2015-08-19 02:05:36.506112	2015-08-19 02:05:36.506112
43	3	15	dancing	2015-08-19 02:19:49.483958	2015-08-19 02:19:49.483958
44	1	15	I HAVE A 212 NUMBER NOW!!!	2015-08-19 02:20:05.982471	2015-08-19 02:20:05.982471
45	6	16	why I left my recipies in my old armoir	2015-08-20 04:43:22.102684	2015-08-20 04:43:22.102684
46	3	16	making soup, and making you feel inferior	2015-08-20 04:43:42.605408	2015-08-20 04:43:42.605408
47	1	16	take three steps to the right and I'll tell you.	2015-08-20 04:43:58.947611	2015-08-20 04:43:58.947611
48	2	4	weafasdfasdf	2015-08-20 20:51:55.17787	2015-08-20 20:51:55.17787
41	5	14	Elaine, Newman, Tom's Restaurant	2015-08-18 21:31:45.386885	2015-08-21 05:30:53.556268
50	1	17	I'm a conductor.  Like Leonard Bernstein, or do you not think I'm good enough to put myself in such esteemed ranks.	2015-08-21 22:29:58.86927	2015-08-21 22:29:58.86927
51	3	17	Conducting.	2015-08-21 22:30:05.865165	2015-08-21 22:30:05.865165
54	2	19	\N	2015-08-21 22:51:11.618895	2015-08-21 22:51:11.618895
55	4	19	\N	2015-08-21 22:51:11.618895	2015-08-21 22:51:11.618895
56	5	19	\N	2015-08-21 22:51:11.618895	2015-08-21 22:51:11.618895
57	6	19	\N	2015-08-21 22:51:11.618895	2015-08-21 22:51:11.618895
58	7	19	\N	2015-08-21 22:51:11.618895	2015-08-21 22:51:11.618895
60	3	19	\N	2015-08-21 22:51:11.618895	2015-08-21 22:51:11.618895
61	1	12	\N	2015-08-18 06:53:26.478577	2015-08-18 06:53:26.478577
62	2	12	\N	2015-08-18 06:53:26.478577	2015-08-18 06:53:26.478577
63	2	15	\N	2015-08-21 22:29:15.202328	2015-08-21 22:29:15.202328
64	2	17	\N	2015-08-21 22:29:33.242938	2015-08-21 22:29:33.242938
66	2	16	\N	2015-08-21 08:13:22.979445	2015-08-21 08:13:22.979445
67	4	4	\N	2015-08-21 19:10:25.986663	2015-08-21 19:10:25.986663
68	4	12	\N	2015-08-18 06:53:26.478577	2015-08-18 06:53:26.478577
69	4	15	\N	2015-08-21 22:29:15.202328	2015-08-21 22:29:15.202328
70	4	17	\N	2015-08-21 22:29:33.242938	2015-08-21 22:29:33.242938
72	4	16	\N	2015-08-21 08:13:22.979445	2015-08-21 08:13:22.979445
73	5	4	\N	2015-08-21 19:10:25.986663	2015-08-21 19:10:25.986663
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
85	8	4	\N	2015-08-21 19:10:25.986663	2015-08-21 19:10:25.986663
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
114	1	23	I used to own the Yankees.	2015-09-09 09:29:07.476717	2015-09-09 09:29:51.589759
122	1	24	\N	2015-09-09 09:52:32.140723	2015-09-09 09:52:32.140723
123	2	24	\N	2015-09-09 09:52:32.140723	2015-09-09 09:52:32.140723
124	4	24	\N	2015-09-09 09:52:32.140723	2015-09-09 09:52:32.140723
125	5	24	\N	2015-09-09 09:52:32.140723	2015-09-09 09:52:32.140723
126	6	24	\N	2015-09-09 09:52:32.140723	2015-09-09 09:52:32.140723
127	7	24	\N	2015-09-09 09:52:32.140723	2015-09-09 09:52:32.140723
128	8	24	\N	2015-09-09 09:52:32.140723	2015-09-09 09:52:32.140723
129	3	24	\N	2015-09-09 09:52:32.140723	2015-09-09 09:52:32.140723
130	1	25	\N	2015-09-09 15:14:36.157421	2015-09-09 15:14:36.157421
131	2	25	\N	2015-09-09 15:14:36.157421	2015-09-09 15:14:36.157421
132	4	25	\N	2015-09-09 15:14:36.157421	2015-09-09 15:14:36.157421
133	5	25	\N	2015-09-09 15:14:36.157421	2015-09-09 15:14:36.157421
134	6	25	\N	2015-09-09 15:14:36.157421	2015-09-09 15:14:36.157421
135	7	25	\N	2015-09-09 15:14:36.157421	2015-09-09 15:14:36.157421
136	8	25	\N	2015-09-09 15:14:36.157421	2015-09-09 15:14:36.157421
137	3	25	\N	2015-09-09 15:14:36.157421	2015-09-09 15:14:36.157421
53	1	19	My name rhymes with a female body part.	2015-08-21 22:51:11.618895	2015-09-10 18:17:17.233523
98	1	21	My name is George.  I'm unemployed, and I live with my parents.	2015-08-24 17:19:03.627613	2015-09-10 18:21:50.619812
\.


--
-- Name: responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('responses_id_seq', 137, true);


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
7	chloe	$2a$10$hcBR4JDKLUvLfZhrq9MU4u4iHE6geGHEsJHIVOgn6FdKpMmvCZGee	QofGD1UMQLf_O_vFPRtOYg	2010-12-01 00:00:00	4	18	92	50	\N	\N	2015-08-13 19:09:27.02488	2015-09-10 18:41:25.603266
1	zelaznik	$2a$10$GxKq.J.9qWJ2tlLU7P6UEerTRa01rIef7GLb9WaXb3FOePHzF/acC	4ZLFQuQl0-AyzmAAYVaI8w	1984-02-06 00:00:00	1	18	92	50	\N	\N	2015-08-12 04:19:06.209106	2015-09-10 18:13:46.503987
4	michael	$2a$10$L5KCtJ632ssljfS/qTaFBOtcIVowGo6aSb1XwCobV3yvjYepJNWwy	lnMrC2Q_euCBgpBXHn7Gxg	1985-07-14 00:00:00	1	18	92	50	\N	\N	2015-08-13 18:26:24.546648	2015-09-10 18:13:58.741144
6	robert	$2a$10$HbJeVTqbIhlQZ5sYRSmBB.T81AENlKFWsXru0ZLHZA8Brh.HMLsRO	mJyaN0Oy5XiSOjvRSOkeiA	1959-01-01 00:00:00	1	18	92	50	\N	\N	2015-08-13 19:06:48.15266	2015-09-10 18:14:33.861709
12	sparticus	$2a$10$LRnclwqRXbDPkp.e1vaHBeyX8wOENzhro5IETV/FC53KMICZkH3Zq	cqRPcrbmKTIhGnJ1HHa70w	1990-01-01 00:00:00	1	\N	\N	\N	\N	\N	2015-08-16 06:11:48.548833	2015-09-10 18:15:35.728284
14	seinfeld	$2a$10$WO0BighJXm2znlGFT0XxWuC/RYPtvVFfOHN.7o5.aeFb9StkJUwxe	eZ_-qtl77dgLC1LRV4C09A	1952-12-01 00:00:00	1	\N	\N	\N	\N	\N	2015-08-18 05:54:50.957263	2015-09-10 18:15:58.201583
15	elaine	$2a$10$C1iMvXxqnYvXZJ2NVwEVmeDsFizZa0CaGjQrimCZ4uNdfDNEQ./Pm	MsdeaRx40ZNnR2I-ElsTaQ	1961-01-13 00:00:00	2	\N	\N	\N	\N	\N	2015-08-19 02:01:25.216819	2015-09-10 18:16:05.924189
16	soup_nazi	$2a$10$MRxNj4rwkW0aW8mE5BCn.uAlkdI/dd0sQEqVaDGlYGGP/W/yvFIv6	95sQxtFjmtlaSspNX_-6lg	1956-09-01 00:00:00	1	\N	\N	\N	\N	\N	2015-08-20 00:13:18.952628	2015-09-10 18:16:17.144287
17	maestro	$2a$10$w3mtYswiHawuqX67CheSvO7XZk7b1zAd0z2j0S5URTBXr0Xa/poBO	deb5Po6yUF_fuk_2UkVuhQ	1946-03-11 00:00:00	1	\N	\N	\N	\N	\N	2015-08-21 22:29:30.26859	2015-09-10 18:16:43.691981
19	mulva	$2a$10$s6ci8s7FD8qocIrmLutsbuW81nx0x0AqzHNAKIwwR1LWwjXtkvHym	TO_zcvvCpfHY-I5DZfmVrA	1985-07-14 00:00:00	2	\N	\N	\N	\N	\N	2015-08-21 22:51:11.618895	2015-09-10 18:17:03.558998
20	sindra	$2a$10$A9e69J3nD2gyrpOQOeUpC.aMurVoOVyXwvpBxEuDzKUQOIpvun2qa	n815a4Vv2wlh4_6aPWK65Q	1964-12-08 00:00:00	2	\N	\N	\N	\N	\N	2015-08-23 05:44:27.176509	2015-09-10 18:17:41.099867
21	george	$2a$10$O70wgZF4MGoK/S867hsw9.7xAytIo/mN/XjReQu8jG1.sRMX91v1W	uH8xQ2FdMRrbdCdmRE4SzA	1955-09-23 00:00:00	1	\N	\N	\N	\N	\N	2015-08-24 17:19:03.627613	2015-09-10 18:21:27.691025
22	poppy	$2a$10$VYxmKfsD8nufKVJddWjIE.BHH/KbWx64iquNqEdUdFhACl5PADu0G	9AnT67cay8uhN-gtWR2XWg	1950-01-01 00:00:00	1	\N	\N	\N	\N	\N	2015-09-07 05:32:36.568962	2015-09-10 18:24:08.354236
23	steinbrenner	$2a$10$jRxoclUSpcVCHkHn58QSUu.306xxrGhUrB1wdznvp7qa673xMzx0u	WKLj0BGLFQZwjTNANw8I2Q	1930-07-04 00:00:00	1	\N	\N	\N	\N	\N	2015-09-09 09:29:07.476717	2015-09-10 18:31:59.220097
24	susan	$2a$10$ZBEv1C1jduNz5M7/RKA/HOcc.opkJB1cAiFz3Joa8iBSkTCuFM2iK	0BKaMob8Uo8hvIWB3LqsPg	1966-03-03 00:00:00	2	\N	\N	\N	\N	\N	2015-09-09 09:52:32.140723	2015-09-10 18:36:30.659651
25	marissa_tomei	$2a$10$LnoUupujW/4Qrko6wSIDku75K6/020hiLoKfctfDHKfr/wRXiv89K	KF0hhcg4p_isubaczTJLyA	\N	2	\N	\N	\N	\N	\N	2015-09-09 15:14:36.157421	2015-09-10 18:39:45.737726
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('users_id_seq', 25, true);


--
-- Data for Name: visits; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY visits (id, visitor_id, profile_id, created_at, updated_at) FROM stdin;
21	14	1	2015-08-21 21:00:14.322911	2015-08-21 21:00:14.322911
22	14	6	2015-08-21 21:01:49.472968	2015-08-21 21:01:49.472968
23	14	4	2015-08-21 21:01:53.195409	2015-08-21 21:01:53.195409
24	14	7	2015-08-21 21:02:14.787251	2015-08-21 21:02:14.787251
25	14	15	2015-08-21 21:40:41.156517	2015-08-21 21:40:41.156517
26	1	14	2015-08-21 22:10:41.319663	2015-08-21 22:10:41.319663
27	19	1	2015-08-21 23:13:27.200809	2015-08-21 23:13:27.200809
28	14	19	2015-08-21 23:18:14.506299	2015-08-21 23:18:14.506299
29	7	4	2015-08-22 21:53:31.566258	2015-08-22 21:53:31.566258
30	7	6	2015-08-22 22:24:00.33281	2015-08-22 22:24:00.33281
31	7	15	2015-08-22 23:27:49.871793	2015-08-22 23:27:49.871793
32	14	20	2015-08-23 05:46:52.960447	2015-08-23 05:46:52.960447
33	20	17	2015-08-23 05:51:14.752279	2015-08-23 05:51:14.752279
34	14	17	2015-08-23 20:59:50.795196	2015-08-23 20:59:50.795196
35	1	19	2015-08-23 22:29:00.151599	2015-08-23 22:29:00.151599
36	1	6	2015-08-23 23:40:37.613645	2015-08-23 23:40:37.613645
37	4	7	2015-08-24 03:37:22.964418	2015-08-24 03:37:22.964418
38	21	19	2015-08-24 20:55:03.15347	2015-08-24 20:55:03.15347
39	21	1	2015-08-24 20:56:42.77153	2015-08-24 20:56:42.77153
40	21	14	2015-08-24 20:57:01.468029	2015-08-24 20:57:01.468029
41	14	12	2015-08-29 07:03:40.453172	2015-08-29 07:03:40.453172
42	1	4	2015-09-07 00:41:48.745067	2015-09-07 00:41:48.745067
43	1	7	2015-09-07 01:02:54.801866	2015-09-07 01:02:54.801866
44	1	17	2015-09-07 02:04:41.520284	2015-09-07 02:04:41.520284
45	14	16	2015-09-07 03:39:16.943302	2015-09-07 03:39:16.943302
46	21	4	2015-09-07 05:21:35.815185	2015-09-07 05:21:35.815185
47	21	20	2015-09-07 05:24:49.770804	2015-09-07 05:24:49.770804
48	14	21	2015-09-08 19:55:26.296327	2015-09-08 19:55:26.296327
49	23	20	2015-09-09 09:34:04.730958	2015-09-09 09:34:04.730958
50	23	4	2015-09-09 09:34:59.532872	2015-09-09 09:34:59.532872
51	24	1	2015-09-09 10:08:11.433286	2015-09-09 10:08:11.433286
52	24	4	2015-09-09 10:10:43.482506	2015-09-09 10:10:43.482506
53	25	17	2015-09-09 15:26:53.547213	2015-09-09 15:26:53.547213
54	16	17	2015-09-09 19:52:24.117905	2015-09-09 19:52:24.117905
55	16	24	2015-09-09 19:52:30.191405	2015-09-09 19:52:30.191405
56	15	14	2015-09-10 03:42:01.601311	2015-09-10 03:42:01.601311
57	15	4	2015-09-10 03:48:49.520099	2015-09-10 03:48:49.520099
58	15	7	2015-09-10 05:44:12.748511	2015-09-10 05:44:12.748511
59	23	19	2015-09-10 07:22:02.66469	2015-09-10 07:22:02.66469
60	15	23	2015-09-10 08:09:24.211803	2015-09-10 08:09:24.211803
61	15	6	2015-09-10 08:27:18.41184	2015-09-10 08:27:18.41184
62	19	6	2015-09-10 08:58:25.204181	2015-09-10 08:58:25.204181
63	19	14	2015-09-10 08:58:34.279065	2015-09-10 08:58:34.279065
64	1	15	2015-09-10 09:08:57.987414	2015-09-10 09:08:57.987414
65	1	20	2015-09-10 09:09:12.356821	2015-09-10 09:09:12.356821
66	25	23	2015-09-10 18:40:54.160922	2015-09-10 18:40:54.160922
\.


--
-- Name: visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('visits_id_seq', 66, true);


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
-- Name: trg_aft_ins_users; Type: TRIGGER; Schema: public; Owner: zMac
--

CREATE TRIGGER trg_aft_ins_users AFTER INSERT ON users FOR EACH ROW EXECUTE PROCEDURE _trg_aft_ins_users();


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
-- Name: fk_rails_581ad36714; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY default_preferences
    ADD CONSTRAINT fk_rails_581ad36714 FOREIGN KEY (gender_id) REFERENCES genders(id);


--
-- Name: fk_rails_67c67d2963; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT fk_rails_67c67d2963 FOREIGN KEY (receiver_id) REFERENCES users(id);


--
-- Name: fk_rails_9ff6a2bac0; Type: FK CONSTRAINT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY default_preferences
    ADD CONSTRAINT fk_rails_9ff6a2bac0 FOREIGN KEY (desire_id) REFERENCES genders(id);


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

