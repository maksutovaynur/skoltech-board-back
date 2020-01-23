--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: skolboard_reaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skolboard_reaction (
    id integer NOT NULL,
    created_dttm timestamp with time zone NOT NULL,
    description text,
    type integer NOT NULL,
    owner_id integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE public.skolboard_reaction OWNER TO postgres;

--
-- Name: board_reaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.board_reaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.board_reaction_id_seq OWNER TO postgres;

--
-- Name: board_reaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.board_reaction_id_seq OWNED BY public.skolboard_reaction.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: skolboard_post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skolboard_post (
    id integer NOT NULL,
    created_dttm timestamp with time zone NOT NULL,
    title character varying(256) NOT NULL,
    body text NOT NULL,
    profile_id integer NOT NULL
);


ALTER TABLE public.skolboard_post OWNER TO postgres;

--
-- Name: skolboard_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skolboard_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skolboard_post_id_seq OWNER TO postgres;

--
-- Name: skolboard_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skolboard_post_id_seq OWNED BY public.skolboard_post.id;


--
-- Name: skolboard_post_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skolboard_post_tags (
    id integer NOT NULL,
    post_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.skolboard_post_tags OWNER TO postgres;

--
-- Name: skolboard_post_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skolboard_post_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skolboard_post_tags_id_seq OWNER TO postgres;

--
-- Name: skolboard_post_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skolboard_post_tags_id_seq OWNED BY public.skolboard_post_tags.id;


--
-- Name: skolboard_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skolboard_profile (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    type integer NOT NULL,
    created_dttm timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    first_name character varying(30) NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone,
    last_name character varying(150) NOT NULL,
    password character varying(128) NOT NULL,
    username character varying(150) NOT NULL,
    telegram_chat_id character varying(256)
);


ALTER TABLE public.skolboard_profile OWNER TO postgres;

--
-- Name: skolboard_profile_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skolboard_profile_groups (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.skolboard_profile_groups OWNER TO postgres;

--
-- Name: skolboard_profile_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skolboard_profile_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skolboard_profile_groups_id_seq OWNER TO postgres;

--
-- Name: skolboard_profile_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skolboard_profile_groups_id_seq OWNED BY public.skolboard_profile_groups.id;


--
-- Name: skolboard_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skolboard_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skolboard_profile_id_seq OWNER TO postgres;

--
-- Name: skolboard_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skolboard_profile_id_seq OWNED BY public.skolboard_profile.id;


--
-- Name: skolboard_profile_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skolboard_profile_link (
    id integer NOT NULL,
    link character varying(200) NOT NULL,
    description character varying(256),
    profile_id integer NOT NULL
);


ALTER TABLE public.skolboard_profile_link OWNER TO postgres;

--
-- Name: skolboard_profile_link_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skolboard_profile_link_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skolboard_profile_link_id_seq OWNER TO postgres;

--
-- Name: skolboard_profile_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skolboard_profile_link_id_seq OWNED BY public.skolboard_profile_link.id;


--
-- Name: skolboard_profile_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skolboard_profile_user_permissions (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.skolboard_profile_user_permissions OWNER TO postgres;

--
-- Name: skolboard_profile_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skolboard_profile_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skolboard_profile_user_permissions_id_seq OWNER TO postgres;

--
-- Name: skolboard_profile_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skolboard_profile_user_permissions_id_seq OWNED BY public.skolboard_profile_user_permissions.id;


--
-- Name: skolboard_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skolboard_tag (
    id integer NOT NULL,
    created_dttm timestamp with time zone NOT NULL,
    name character varying(64) NOT NULL,
    level integer NOT NULL
);


ALTER TABLE public.skolboard_tag OWNER TO postgres;

--
-- Name: skolboard_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skolboard_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skolboard_tag_id_seq OWNER TO postgres;

--
-- Name: skolboard_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skolboard_tag_id_seq OWNED BY public.skolboard_tag.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: skolboard_post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_post ALTER COLUMN id SET DEFAULT nextval('public.skolboard_post_id_seq'::regclass);


--
-- Name: skolboard_post_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_post_tags ALTER COLUMN id SET DEFAULT nextval('public.skolboard_post_tags_id_seq'::regclass);


--
-- Name: skolboard_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_profile ALTER COLUMN id SET DEFAULT nextval('public.skolboard_profile_id_seq'::regclass);


--
-- Name: skolboard_profile_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_profile_groups ALTER COLUMN id SET DEFAULT nextval('public.skolboard_profile_groups_id_seq'::regclass);


--
-- Name: skolboard_profile_link id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_profile_link ALTER COLUMN id SET DEFAULT nextval('public.skolboard_profile_link_id_seq'::regclass);


--
-- Name: skolboard_profile_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_profile_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.skolboard_profile_user_permissions_id_seq'::regclass);


--
-- Name: skolboard_reaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_reaction ALTER COLUMN id SET DEFAULT nextval('public.board_reaction_id_seq'::regclass);


--
-- Name: skolboard_tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_tag ALTER COLUMN id SET DEFAULT nextval('public.skolboard_tag_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add post	6	add_post
22	Can change post	6	change_post
23	Can delete post	6	delete_post
24	Can view post	6	view_post
25	Can add profile	7	add_profile
26	Can change profile	7	change_profile
27	Can delete profile	7	delete_profile
28	Can view profile	7	view_profile
29	Can add tag	8	add_tag
30	Can change tag	8	change_tag
31	Can delete tag	8	delete_tag
32	Can view tag	8	view_tag
33	Can add reaction	9	add_reaction
34	Can change reaction	9	change_reaction
35	Can delete reaction	9	delete_reaction
36	Can view reaction	9	view_reaction
37	Can add profile link	10	add_profilelink
38	Can change profile link	10	change_profilelink
39	Can delete profile link	10	delete_profilelink
40	Can view profile link	10	view_profilelink
41	Can add post tag relation	11	add_posttagrelation
42	Can change post tag relation	11	change_posttagrelation
43	Can delete post tag relation	11	delete_posttagrelation
44	Can view post tag relation	11	view_posttagrelation
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-01-22 21:35:25.605182+00	1	ProfileLink object (1)	1	[{"added": {}}]	10	2
2	2020-01-22 21:38:32.522789+00	4	amam1	1	[{"added": {}}]	7	2
3	2020-01-22 21:43:56.994817+00	2	maksutov_aynur	2	[{"changed": {"fields": ["Telegram chat id"]}}]	7	2
4	2020-01-22 21:44:02.093365+00	4	amam1	2	[{"changed": {"fields": ["Telegram chat id"]}}]	7	2
36	2020-01-22 21:46:12.483116+00	5	MySuperOrg2	1	[{"added": {}}]	7	2
37	2020-01-22 21:46:49.458038+00	6	my-super-org3	1	[{"added": {}}]	7	2
38	2020-01-22 21:47:18.479363+00	7	ALab	1	[{"added": {}}]	7	2
39	2020-01-22 21:47:53.059249+00	8	wefwgeufy	1	[{"added": {}}]	7	2
40	2020-01-22 21:48:35.53375+00	9	badboy	1	[{"added": {}}]	7	2
41	2020-01-22 21:49:05.03486+00	2	ProfileLink object (2)	1	[{"added": {}}]	10	2
42	2020-01-22 21:49:21.659264+00	3	ProfileLink object (3)	1	[{"added": {}}]	10	2
43	2020-01-22 21:49:41.513793+00	4	ProfileLink object (4)	1	[{"added": {}}]	10	2
44	2020-01-22 21:50:01.266435+00	5	ProfileLink object (5)	1	[{"added": {}}]	10	2
45	2020-01-22 21:54:06.611969+00	1	Tag object (1)	1	[{"added": {}}]	8	2
46	2020-01-22 21:55:35.828622+00	2	Tag object (2)	1	[{"added": {}}]	8	2
47	2020-01-22 21:56:56.447698+00	3	Tag object (3)	1	[{"added": {}}]	8	2
48	2020-01-22 21:57:03.827553+00	4	Tag object (4)	1	[{"added": {}}]	8	2
49	2020-01-22 21:57:14.0677+00	5	Tag object (5)	1	[{"added": {}}]	8	2
50	2020-01-22 21:58:59.428357+00	6	Tag object (6)	1	[{"added": {}}]	8	2
51	2020-01-22 22:07:04.595412+00	3	org_12	2	[{"changed": {"fields": ["Username"]}}]	7	2
52	2020-01-22 22:10:16.488311+00	3	org_12	2	[]	7	2
53	2020-01-22 22:11:38.46838+00	3	org_12	2	[]	7	2
54	2020-01-22 22:11:44.790947+00	3	org_12	2	[]	7	2
55	2020-01-23 00:10:05.828906+00	3	org_12	2	[{"changed": {"fields": ["password"]}}]	7	2
56	2020-01-23 00:10:12.722565+00	3	org_12	2	[]	7	2
57	2020-01-23 00:10:22.6573+00	7	ALab	2	[{"changed": {"fields": ["password"]}}]	7	2
58	2020-01-23 00:10:38.444115+00	4	amam1	2	[{"changed": {"fields": ["password"]}}]	7	2
59	2020-01-23 00:10:50.5264+00	9	badboy	2	[{"changed": {"fields": ["password"]}}]	7	2
60	2020-01-23 00:11:03.429827+00	5	MySuperOrg2	2	[{"changed": {"fields": ["password"]}}]	7	2
61	2020-01-23 00:11:15.910551+00	6	my-super-org3	2	[{"changed": {"fields": ["password"]}}]	7	2
62	2020-01-23 00:11:37.549741+00	8	wefwgeufy	2	[{"changed": {"fields": ["password"]}}]	7	2
63	2020-01-23 00:13:09.39125+00	7	Tag object (7)	1	[{"added": {}}]	8	2
64	2020-01-23 00:13:21.900408+00	8	Tag object (8)	1	[{"added": {}}]	8	2
65	2020-01-23 00:14:15.651914+00	9	Tag object (9)	1	[{"added": {}}]	8	2
66	2020-01-23 00:14:38.17895+00	10	Tag object (10)	1	[{"added": {}}]	8	2
67	2020-01-23 00:15:23.354341+00	11	Tag object (11)	1	[{"added": {}}]	8	2
68	2020-01-23 00:15:31.04235+00	12	Tag object (12)	1	[{"added": {}}]	8	2
69	2020-01-23 00:21:12.000815+00	1	Post object (1)	1	[{"added": {}}]	6	2
70	2020-01-23 00:21:39.496409+00	2	Post object (2)	1	[{"added": {}}]	6	2
71	2020-01-23 00:22:12.072391+00	3	Post object (3)	1	[{"added": {}}]	6	2
72	2020-01-23 00:22:40.345089+00	1	Reaction object (1)	1	[{"added": {}}]	9	2
73	2020-01-23 00:22:58.404739+00	2	Reaction object (2)	1	[{"added": {}}]	9	2
74	2020-01-23 00:23:27.10011+00	3	Reaction object (3)	1	[{"added": {}}]	9	2
75	2020-01-23 00:34:39.406354+00	6	ProfileLink object (6)	1	[{"added": {}}]	10	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	board	post
7	board	profile
8	board	tag
9	board	reaction
10	board	profilelink
11	board	posttagrelation
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-01-22 18:27:58.885702+00
2	board	0001_initial	2020-01-22 18:27:58.93345+00
3	admin	0001_initial	2020-01-22 18:27:58.98354+00
4	admin	0002_logentry_remove_auto_add	2020-01-22 18:27:59.023895+00
5	admin	0003_logentry_add_action_flag_choices	2020-01-22 18:27:59.039603+00
6	contenttypes	0002_remove_content_type_name	2020-01-22 18:27:59.059128+00
7	auth	0001_initial	2020-01-22 18:27:59.107292+00
8	auth	0002_alter_permission_name_max_length	2020-01-22 18:27:59.129859+00
9	auth	0003_alter_user_email_max_length	2020-01-22 18:27:59.13729+00
10	auth	0004_alter_user_username_opts	2020-01-22 18:27:59.144965+00
11	auth	0005_alter_user_last_login_null	2020-01-22 18:27:59.152602+00
12	auth	0006_require_contenttypes_0002	2020-01-22 18:27:59.154608+00
13	auth	0007_alter_validators_add_error_messages	2020-01-22 18:27:59.162066+00
14	auth	0008_alter_user_username_max_length	2020-01-22 18:27:59.170082+00
15	auth	0009_alter_user_last_name_max_length	2020-01-22 18:27:59.186479+00
16	auth	0010_alter_group_name_max_length	2020-01-22 18:27:59.196461+00
17	auth	0011_update_proxy_permissions	2020-01-22 18:27:59.211016+00
18	board	0002_auto_20200122_1534	2020-01-22 18:27:59.218129+00
19	board	0003_profile_created_dttm	2020-01-22 18:27:59.226361+00
20	sessions	0001_initial	2020-01-22 18:27:59.234103+00
21	board	0004_auto_20200122_1829	2020-01-22 18:29:12.980402+00
22	board	0005_auto_20200122_1936	2020-01-22 19:36:13.319103+00
23	board	0006_profile_telegram_chat_id	2020-01-22 19:59:39.103143+00
24	board	0007_auto_20200122_2139	2020-01-22 21:39:46.173378+00
25	board	0008_auto_20200122_2145	2020-01-22 21:45:08.887119+00
58	board	0009_tag_level	2020-01-22 21:53:19.621122+00
59	board	0010_auto_20200122_2153	2020-01-22 21:53:19.628649+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
mb4vyheexku9ita650rhlh6ur33s2zrz	YTkyM2M4ODAwZmY4NTdmMGRjZDdjMDBhMDRiMWFmMTJkNzFhZjdmNzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYTQyNTRmOWZhZGY4YmZkMDg3MTcxMTNmYWFmNTQyZTZiNzQzMDNkIn0=	2020-02-05 21:14:18.310566+00
dgpsrnme3bkoaxhk70fqbth4o1i0m1r9	YTkyM2M4ODAwZmY4NTdmMGRjZDdjMDBhMDRiMWFmMTJkNzFhZjdmNzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYTQyNTRmOWZhZGY4YmZkMDg3MTcxMTNmYWFmNTQyZTZiNzQzMDNkIn0=	2020-02-06 00:11:37.5558+00
\.


--
-- Data for Name: skolboard_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skolboard_post (id, created_dttm, title, body, profile_id) FROM stdin;
1	2020-01-23 00:21:11.995702+00	Needed a Botan	Come here if you are a Botan	7
2	2020-01-23 00:21:39.492527+00	Hoho	Lalala	5
3	2020-01-23 00:22:12.068059+00	Search for job	Anybody, Help!	4
\.


--
-- Data for Name: skolboard_post_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skolboard_post_tags (id, post_id, tag_id) FROM stdin;
1	1	1
2	1	4
3	1	6
4	1	9
5	1	11
6	2	1
7	2	12
8	2	5
9	3	8
10	3	2
11	3	4
\.


--
-- Data for Name: skolboard_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skolboard_profile (id, email, type, created_dttm, date_joined, first_name, is_active, is_staff, is_superuser, last_login, last_name, password, username, telegram_chat_id) FROM stdin;
2	maksutov_aynur@mail.ru	0	2020-01-22 18:30:21.662725+00	2020-01-22 18:30:21+00		t	t	t	2020-01-22 21:27:23+00		pbkdf2_sha256$180000$SwVjSwJNyybi$lpcrVroqPnh6CmVH08IGs8UqAdnl07+XDRYuMgZKHIY=	maksutov_aynur	\N
3	e1@example.com	1	2020-01-22 20:09:26.320559+00	2020-01-22 20:09:26+00	Homo	t	f	f	\N	Sapiens	pbkdf2_sha256$150000$m74ANr6xH6Ez$9PrypOLN1+OoZmlF1kULCfR3XjWbha9wxtkItcNH90A=	org_12	\N
7	alab@example.com	1	2020-01-22 21:47:18.47122+00	2020-01-22 21:46:55+00	A	t	f	f	\N	Lab	pbkdf2_sha256$150000$g4WlaRjPaoyk$itWxNbQqZH+UQEI6d8EJUrNVZusdfOlUFodCxcWuxk8=	ALab	\N
4	amam@mama.com	0	2020-01-22 21:38:32.513393+00	2020-01-22 21:35:45+00	amam	t	f	f	\N	mama	pbkdf2_sha256$150000$Uhgj2h05FZOB$K0sSv91pO4D6Olcfm9Z5voEBb2ljNo7wCc6SB6Fr7qI=	amam1	\N
9	asm@example.com	0	2020-01-22 21:48:35.526908+00	2020-01-22 21:48:09+00	Andrey	t	f	f	\N	Smirnoff	pbkdf2_sha256$150000$uzIC1PDvo0JA$f4yY+DCRUZK+D3pBzDMaD/WvpI/AO7VL7YwDADOH/CY=	badboy	\N
5	superorg@example.com	1	2020-01-22 21:46:12.474626+00	2020-01-22 21:45:35+00	Super	t	f	f	\N	Organization	pbkdf2_sha256$150000$yRUVkBbihFXE$m0HmW/60hFli7U4CFQT+n5a8MpA7Up5pYbn+5IhAIVw=	MySuperOrg2	\N
6	org3@example.com	1	2020-01-22 21:46:49.449888+00	2020-01-22 21:46:20+00	A wonderful	t	f	f	\N	Organization	pbkdf2_sha256$150000$OjAHmFejfb86$fTFPdXeWgCMH2OJPxGykowkimgZpsoJfpzw/AUDPalE=	my-super-org3	\N
8	jsnow@example.com	0	2020-01-22 21:47:53.051072+00	2020-01-22 21:47:23+00	John	t	f	f	\N	Snow	pbkdf2_sha256$150000$pviyOFuu1eGh$q6yYg9XqU1pgHA4IKJpBDv/38mR2chL+szbS+YVfxGE=	wefwgeufy	\N
10	ivs@example.com	0	2020-01-23 00:18:50.998402+00	2020-01-23 00:18:50.880581+00		t	t	t	\N		pbkdf2_sha256$150000$p1fenptNRVGN$OqeZ9N1c8ebq6293Is1aaGa2iV8cEM6qhKDLm0VtcBs=	ivs	\N
11	emial@ameil.emil	0	2020-01-23 00:45:10.847061+00	2020-01-23 00:45:10.846785+00	New par par	t	f	f	\N	New par par last	pbkdf2_sha256$150000$SUvfeoWxgTNR$LP02MlBJzTFv8Kzb/PvzrqW/33RwlZ3S7hOKhGprq6I=	ololo	\N
\.


--
-- Data for Name: skolboard_profile_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skolboard_profile_groups (id, profile_id, group_id) FROM stdin;
\.


--
-- Data for Name: skolboard_profile_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skolboard_profile_link (id, link, description, profile_id) FROM stdin;
1	http://vk.com/razvitiye	My VK profile	2
2	https://vk.com/razvitiye	My VK page	9
3	https://vk.com/razvitiye	My super vk page	8
4	http://tg.com/12345	\N	7
5	http://org.com	Our official site	5
6	https://yandex.ru	Best Search Engine	7
\.


--
-- Data for Name: skolboard_profile_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skolboard_profile_user_permissions (id, profile_id, permission_id) FROM stdin;
\.


--
-- Data for Name: skolboard_reaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skolboard_reaction (id, created_dttm, description, type, owner_id, post_id) FROM stdin;
1	2020-01-23 00:22:40.344073+00	Not bad	0	10	1
2	2020-01-23 00:22:58.404003+00	Why not	1	2	2
3	2020-01-23 00:23:27.09926+00	Does not worth it	2	8	2
\.


--
-- Data for Name: skolboard_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skolboard_tag (id, created_dttm, name, level) FROM stdin;
1	2020-01-22 21:54:06.610643+00	Offer	1
2	2020-01-22 21:55:35.827469+00	Get	1
3	2020-01-22 21:56:56.446621+00	Help	2
4	2020-01-22 21:57:03.826299+00	Job	2
5	2020-01-22 21:57:14.066463+00	Lab	2
6	2020-01-22 21:58:59.427295+00	Event	2
7	2020-01-23 00:13:09.390211+00	Official	3
8	2020-01-23 00:13:21.899595+00	Party	3
9	2020-01-23 00:14:15.65111+00	Quickly	3
10	2020-01-23 00:14:38.178075+00	Beer	3
11	2020-01-23 00:15:23.353427+00	Fun	3
12	2020-01-23 00:15:31.041466+00	Bored	3
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: board_reaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.board_reaction_id_seq', 3, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 75, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 59, true);


--
-- Name: skolboard_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skolboard_post_id_seq', 3, true);


--
-- Name: skolboard_post_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skolboard_post_tags_id_seq', 11, true);


--
-- Name: skolboard_profile_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skolboard_profile_groups_id_seq', 1, false);


--
-- Name: skolboard_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skolboard_profile_id_seq', 11, true);


--
-- Name: skolboard_profile_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skolboard_profile_link_id_seq', 6, true);


--
-- Name: skolboard_profile_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skolboard_profile_user_permissions_id_seq', 1, false);


--
-- Name: skolboard_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skolboard_tag_id_seq', 12, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: skolboard_reaction board_reaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_reaction
    ADD CONSTRAINT board_reaction_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: skolboard_post skolboard_post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_post
    ADD CONSTRAINT skolboard_post_pkey PRIMARY KEY (id);


--
-- Name: skolboard_post_tags skolboard_post_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_post_tags
    ADD CONSTRAINT skolboard_post_tags_pkey PRIMARY KEY (id);


--
-- Name: skolboard_post_tags skolboard_post_tags_post_id_tag_id_4d40054f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_post_tags
    ADD CONSTRAINT skolboard_post_tags_post_id_tag_id_4d40054f_uniq UNIQUE (post_id, tag_id);


--
-- Name: skolboard_profile_groups skolboard_profile_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_profile_groups
    ADD CONSTRAINT skolboard_profile_groups_pkey PRIMARY KEY (id);


--
-- Name: skolboard_profile_groups skolboard_profile_groups_profile_id_group_id_b70c1ee3_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_profile_groups
    ADD CONSTRAINT skolboard_profile_groups_profile_id_group_id_b70c1ee3_uniq UNIQUE (profile_id, group_id);


--
-- Name: skolboard_profile_link skolboard_profile_link_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_profile_link
    ADD CONSTRAINT skolboard_profile_link_pkey PRIMARY KEY (id);


--
-- Name: skolboard_profile skolboard_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_profile
    ADD CONSTRAINT skolboard_profile_pkey PRIMARY KEY (id);


--
-- Name: skolboard_profile_user_permissions skolboard_profile_user_p_profile_id_permission_id_d6be96d0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_profile_user_permissions
    ADD CONSTRAINT skolboard_profile_user_p_profile_id_permission_id_d6be96d0_uniq UNIQUE (profile_id, permission_id);


--
-- Name: skolboard_profile_user_permissions skolboard_profile_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_profile_user_permissions
    ADD CONSTRAINT skolboard_profile_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: skolboard_profile skolboard_profile_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_profile
    ADD CONSTRAINT skolboard_profile_username_key UNIQUE (username);


--
-- Name: skolboard_tag skolboard_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_tag
    ADD CONSTRAINT skolboard_tag_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: board_reaction_owner_id_c2786366; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX board_reaction_owner_id_c2786366 ON public.skolboard_reaction USING btree (owner_id);


--
-- Name: board_reaction_post_id_79ee8a11; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX board_reaction_post_id_79ee8a11 ON public.skolboard_reaction USING btree (post_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: skolboard_post_profile_id_4dbf7195; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX skolboard_post_profile_id_4dbf7195 ON public.skolboard_post USING btree (profile_id);


--
-- Name: skolboard_post_tags_post_id_53219f83; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX skolboard_post_tags_post_id_53219f83 ON public.skolboard_post_tags USING btree (post_id);


--
-- Name: skolboard_post_tags_tag_id_dff05e76; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX skolboard_post_tags_tag_id_dff05e76 ON public.skolboard_post_tags USING btree (tag_id);


--
-- Name: skolboard_profile_groups_group_id_64f29817; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX skolboard_profile_groups_group_id_64f29817 ON public.skolboard_profile_groups USING btree (group_id);


--
-- Name: skolboard_profile_groups_profile_id_9c87593f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX skolboard_profile_groups_profile_id_9c87593f ON public.skolboard_profile_groups USING btree (profile_id);


--
-- Name: skolboard_profile_link_profile_id_7b68bfef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX skolboard_profile_link_profile_id_7b68bfef ON public.skolboard_profile_link USING btree (profile_id);


--
-- Name: skolboard_profile_user_permissions_permission_id_b48a0508; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX skolboard_profile_user_permissions_permission_id_b48a0508 ON public.skolboard_profile_user_permissions USING btree (permission_id);


--
-- Name: skolboard_profile_user_permissions_profile_id_4f12e6d0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX skolboard_profile_user_permissions_profile_id_4f12e6d0 ON public.skolboard_profile_user_permissions USING btree (profile_id);


--
-- Name: skolboard_profile_username_c01fd041_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX skolboard_profile_username_c01fd041_like ON public.skolboard_profile USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skolboard_reaction board_reaction_owner_id_c2786366_fk_skolboard_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_reaction
    ADD CONSTRAINT board_reaction_owner_id_c2786366_fk_skolboard_profile_id FOREIGN KEY (owner_id) REFERENCES public.skolboard_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skolboard_reaction board_reaction_post_id_79ee8a11_fk_skolboard_post_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_reaction
    ADD CONSTRAINT board_reaction_post_id_79ee8a11_fk_skolboard_post_id FOREIGN KEY (post_id) REFERENCES public.skolboard_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_skolboard_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_skolboard_profile_id FOREIGN KEY (user_id) REFERENCES public.skolboard_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skolboard_post skolboard_post_profile_id_4dbf7195_fk_skolboard_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_post
    ADD CONSTRAINT skolboard_post_profile_id_4dbf7195_fk_skolboard_profile_id FOREIGN KEY (profile_id) REFERENCES public.skolboard_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skolboard_post_tags skolboard_post_tags_post_id_53219f83_fk_skolboard_post_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_post_tags
    ADD CONSTRAINT skolboard_post_tags_post_id_53219f83_fk_skolboard_post_id FOREIGN KEY (post_id) REFERENCES public.skolboard_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skolboard_post_tags skolboard_post_tags_tag_id_dff05e76_fk_skolboard_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_post_tags
    ADD CONSTRAINT skolboard_post_tags_tag_id_dff05e76_fk_skolboard_tag_id FOREIGN KEY (tag_id) REFERENCES public.skolboard_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skolboard_profile_groups skolboard_profile_gr_profile_id_9c87593f_fk_skolboard; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_profile_groups
    ADD CONSTRAINT skolboard_profile_gr_profile_id_9c87593f_fk_skolboard FOREIGN KEY (profile_id) REFERENCES public.skolboard_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skolboard_profile_groups skolboard_profile_groups_group_id_64f29817_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_profile_groups
    ADD CONSTRAINT skolboard_profile_groups_group_id_64f29817_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skolboard_profile_link skolboard_profile_li_profile_id_7b68bfef_fk_skolboard; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_profile_link
    ADD CONSTRAINT skolboard_profile_li_profile_id_7b68bfef_fk_skolboard FOREIGN KEY (profile_id) REFERENCES public.skolboard_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skolboard_profile_user_permissions skolboard_profile_us_permission_id_b48a0508_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_profile_user_permissions
    ADD CONSTRAINT skolboard_profile_us_permission_id_b48a0508_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skolboard_profile_user_permissions skolboard_profile_us_profile_id_4f12e6d0_fk_skolboard; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skolboard_profile_user_permissions
    ADD CONSTRAINT skolboard_profile_us_profile_id_4f12e6d0_fk_skolboard FOREIGN KEY (profile_id) REFERENCES public.skolboard_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

