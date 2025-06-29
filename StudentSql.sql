--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2025-06-29 15:11:17

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
-- TOC entry 219 (class 1259 OID 17200)
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts (
    id_contact bigint NOT NULL,
    phone bigint,
    email character varying(50),
    home character varying(100)
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17199)
-- Name: contacts_id_contact_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.contacts ALTER COLUMN id_contact ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.contacts_id_contact_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 17644)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id_department bigint NOT NULL,
    department_name character varying(100) NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17643)
-- Name: departments_id_department_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.departments ALTER COLUMN id_department ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.departments_id_department_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 17665)
-- Name: disciplines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disciplines (
    id_discipline bigint NOT NULL,
    discipline_name character varying(100) NOT NULL,
    id_department bigint
);


ALTER TABLE public.disciplines OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17664)
-- Name: disciplines_id_discipline_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.disciplines ALTER COLUMN id_discipline ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.disciplines_id_discipline_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 17306)
-- Name: education_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.education_documents (
    id_education_doc bigint NOT NULL,
    series character varying(20) NOT NULL,
    number character varying(50) NOT NULL,
    institution_name character varying(100) NOT NULL,
    graduation_year integer NOT NULL,
    organization_type_id integer,
    CONSTRAINT education_documents_graduation_year_check CHECK (((graduation_year > 1900) AND (graduation_year < 2100)))
);


ALTER TABLE public.education_documents OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17305)
-- Name: education_documents_id_education_doc_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.education_documents ALTER COLUMN id_education_doc ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.education_documents_id_education_doc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 17314)
-- Name: ege_results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ege_results (
    id_ege bigint NOT NULL,
    id_person bigint,
    score integer NOT NULL,
    exam_year integer NOT NULL,
    id_subject integer,
    CONSTRAINT ege_results_exam_year_check CHECK (((exam_year > 2000) AND (exam_year < 2100))),
    CONSTRAINT ege_results_score_check CHECK (((score >= 0) AND (score <= 100)))
);


ALTER TABLE public.ege_results OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17313)
-- Name: ege_results_id_ege_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ege_results ALTER COLUMN id_ege ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ege_results_id_ege_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 245 (class 1259 OID 17817)
-- Name: ege_subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ege_subjects (
    id_subject integer NOT NULL,
    subject_name character varying(50) NOT NULL
);


ALTER TABLE public.ege_subjects OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 17816)
-- Name: ege_subjects_id_subject_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ege_subjects_id_subject_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ege_subjects_id_subject_seq OWNER TO postgres;

--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 244
-- Name: ege_subjects_id_subject_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ege_subjects_id_subject_seq OWNED BY public.ege_subjects.id_subject;


--
-- TOC entry 230 (class 1259 OID 17652)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id_group bigint NOT NULL,
    group_name character varying(50) NOT NULL,
    id_department bigint
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17651)
-- Name: groups_id_group_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.groups ALTER COLUMN id_group ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.groups_id_group_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 247 (class 1259 OID 17831)
-- Name: order_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_person (
    id_order_person integer NOT NULL,
    id_order bigint NOT NULL,
    id_person bigint NOT NULL
);


ALTER TABLE public.order_person OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 17830)
-- Name: order_person_id_order_person_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_person_id_order_person_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_person_id_order_person_seq OWNER TO postgres;

--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 246
-- Name: order_person_id_order_person_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_person_id_order_person_seq OWNED BY public.order_person.id_order_person;


--
-- TOC entry 240 (class 1259 OID 17720)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id_order bigint NOT NULL,
    office_date date NOT NULL,
    office_number integer NOT NULL,
    id_plan bigint,
    id_group bigint,
    start_date date
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17719)
-- Name: orders_id_order_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id_order ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_id_order_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 241 (class 1259 OID 17766)
-- Name: orders_office_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_office_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_office_number_seq OWNER TO postgres;

--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 241
-- Name: orders_office_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_office_number_seq OWNED BY public.orders.office_number;


--
-- TOC entry 243 (class 1259 OID 17803)
-- Name: organization_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organization_types (
    id_type integer NOT NULL,
    type_name character varying(50) NOT NULL
);


ALTER TABLE public.organization_types OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 17802)
-- Name: organization_types_id_type_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organization_types_id_type_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.organization_types_id_type_seq OWNER TO postgres;

--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 242
-- Name: organization_types_id_type_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organization_types_id_type_seq OWNED BY public.organization_types.id_type;


--
-- TOC entry 215 (class 1259 OID 16875)
-- Name: passport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passport (
    id_passport bigint NOT NULL,
    "Number" integer,
    "Series" integer,
    "Date_of_receipt" date,
    "Expiry_date" date,
    "Registration" character varying(100),
    issued_by_whom character varying
);


ALTER TABLE public.passport OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17218)
-- Name: person_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person_roles (
    id_person bigint NOT NULL,
    "id_role " bigint NOT NULL,
    "FK_person" bigint
);


ALTER TABLE public.person_roles OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17153)
-- Name: physical_persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.physical_persons (
    id_person bigint NOT NULL,
    surname character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    patronymic character varying(50),
    birthday date NOT NULL,
    place_of_birth character varying(100),
    contact_id bigint,
    passport_id bigint,
    "ed.doc_id" bigint
);


ALTER TABLE public.physical_persons OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17152)
-- Name: physical_persons_id_person_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.physical_persons ALTER COLUMN id_person ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.physical_persons_id_person_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 17688)
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id_profile bigint NOT NULL,
    profile_name character varying(100) NOT NULL,
    id_specialty bigint
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17687)
-- Name: profiles_id_profile_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.profiles ALTER COLUMN id_profile ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.profiles_id_profile_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 17353)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id_role bigint NOT NULL,
    role_name character varying(50) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17352)
-- Name: roles_id_role_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.roles ALTER COLUMN id_role ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_id_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 17678)
-- Name: specialties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specialties (
    id_specialty bigint NOT NULL,
    specialty_name character varying(100) NOT NULL,
    specialty_code character varying(20) NOT NULL
);


ALTER TABLE public.specialties OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17677)
-- Name: specialties_id_specialty_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.specialties ALTER COLUMN id_specialty ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.specialties_id_specialty_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 249 (class 1259 OID 17850)
-- Name: study_plan_disciplines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.study_plan_disciplines (
    id_plan_discipline integer NOT NULL,
    id_plan bigint NOT NULL,
    id_discipline bigint NOT NULL
);


ALTER TABLE public.study_plan_disciplines OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 17849)
-- Name: study_plan_disciplines_id_plan_discipline_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.study_plan_disciplines_id_plan_discipline_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.study_plan_disciplines_id_plan_discipline_seq OWNER TO postgres;

--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 248
-- Name: study_plan_disciplines_id_plan_discipline_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.study_plan_disciplines_id_plan_discipline_seq OWNED BY public.study_plan_disciplines.id_plan_discipline;


--
-- TOC entry 238 (class 1259 OID 17701)
-- Name: study_plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.study_plans (
    id_plan bigint NOT NULL,
    id_profile bigint,
    id_specialties bigint,
    id_departments bigint,
    years text
);


ALTER TABLE public.study_plans OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 17700)
-- Name: study_plans_id_plan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.study_plans ALTER COLUMN id_plan ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.study_plans_id_plan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4774 (class 2604 OID 17820)
-- Name: ege_subjects id_subject; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ege_subjects ALTER COLUMN id_subject SET DEFAULT nextval('public.ege_subjects_id_subject_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 17834)
-- Name: order_person id_order_person; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_person ALTER COLUMN id_order_person SET DEFAULT nextval('public.order_person_id_order_person_seq'::regclass);


--
-- TOC entry 4772 (class 2604 OID 17767)
-- Name: orders office_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN office_number SET DEFAULT nextval('public.orders_office_number_seq'::regclass);


--
-- TOC entry 4773 (class 2604 OID 17806)
-- Name: organization_types id_type; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization_types ALTER COLUMN id_type SET DEFAULT nextval('public.organization_types_id_type_seq'::regclass);


--
-- TOC entry 4776 (class 2604 OID 17853)
-- Name: study_plan_disciplines id_plan_discipline; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_plan_disciplines ALTER COLUMN id_plan_discipline SET DEFAULT nextval('public.study_plan_disciplines_id_plan_discipline_seq'::regclass);


--
-- TOC entry 5007 (class 0 OID 17200)
-- Dependencies: 219
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (1, 79991234567, 'ivanov@mail.ru', 'Москва, ул. Ленина, д.10');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (2, 79881234568, 'petrov@gmail.com', 'Санкт-Петербург, Невский пр., д.15');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (3, 79771234569, 'sidorova@yandex.ru', 'Екатеринбург, ул. Мира, д.25');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (4, 79661234560, 'fedorov@mail.ru', 'Казань, ул. Баумана, д.5');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (5, 79551234561, 'smirnov@gmail.com', 'Новосибирск, Красный пр., д.18');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (6, 79991234562, 'alexeeva@yandex.ru', 'Самара, ул. Гагарина, д.3');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (7, 79881234563, 'volkov@mail.ru', 'Тюмень, ул. Республики, д.42');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (8, 79771234564, 'vasilieva@gmail.com', 'Челябинск, ул. Кирова, д.22');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (9, 79661234565, 'sergeev@yandex.ru', 'Омск, ул. Лермонтова, д.11');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (10, 79551234566, 'romanova@mail.ru', 'Ростов-на-Дону, ул. Садовая, д.8');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (11, 79991234567, 'nikolaev@gmail.com', 'Воронеж, ул. Плехановская, д.30');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (12, 79881234568, 'stepanova@yandex.ru', 'Краснодар, ул. Северная, д.12');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (13, 79771234569, 'pavlov@mail.ru', 'Уфа, пр. Октября, д.7');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (14, 79661234560, 'elena.ivanova@gmail.com', 'Пермь, ул. Комсомольская, д.19');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (15, 79551234561, 'andreev@yandex.ru', 'Волгоград, ул. Советская, д.14');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (16, 79991234562, 'popova@mail.ru', 'Саратов, ул. Чернышевского, д.21');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (17, 79881234563, 'grigoriev@gmail.com', 'Тула, ул. Ленина, д.9');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (18, 79771234564, 'maria.smirnova@yandex.ru', 'Ижевск, ул. Удмуртская, д.5');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (19, 79661234565, 'timofeev@mail.ru', 'Барнаул, пр. Ленина, д.27');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (20, 79551234566, 'zaytseva@gmail.com', 'Хабаровск, ул. Калинина, д.15');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (21, 79876543210, 'anna.petrova@mail.ru', 'Москва, ул. Пушкина, д. 12');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (22, 78901234567, 'ivan.ivanov@gmail.com', 'Санкт-Петербург, пр. Невский, д. 25');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (23, 77651239874, 'maria.smirnova@yandex.ru', 'Екатеринбург, ул. Ленина, д. 33');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (24, 75431298706, 'alex.fedorov@mail.ru', 'Новосибирск, ул. Советская, д. 41');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (25, 73219875640, 'katya.morozova@gmail.com', 'Казань, ул. Баумана, д. 55');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (26, 71236547809, 'olga.vasilyeva@yandex.ru', 'Ростов-на-Дону, ул. Горького, д. 62');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (27, 72349871056, 'sergey.sidorov@mail.ru', 'Челябинск, ул. Труда, д. 74');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (28, 74561237891, 'elena.kuznetsova@gmail.com', 'Владивосток, ул. Океанская, д. 81');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (29, 76781230985, 'dmitry.petrov@yandex.ru', 'Нижний Новгород, ул. Большая Покровская, д. 93');
INSERT INTO public.contacts (id_contact, phone, email, home) OVERRIDING SYSTEM VALUE VALUES (30, 70981256347, 'natalia.nikolaeva@mail.ru', 'Омск, ул. Красный Путь, д. 100');


--
-- TOC entry 5016 (class 0 OID 17644)
-- Dependencies: 228
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departments (id_department, department_name) OVERRIDING SYSTEM VALUE VALUES (1, 'Кафедра программной инженерии');
INSERT INTO public.departments (id_department, department_name) OVERRIDING SYSTEM VALUE VALUES (2, 'Кафедра информационной безопасности');
INSERT INTO public.departments (id_department, department_name) OVERRIDING SYSTEM VALUE VALUES (3, 'Кафедра компьютерных сетей');
INSERT INTO public.departments (id_department, department_name) OVERRIDING SYSTEM VALUE VALUES (4, 'Кафедра искусственного интеллекта');
INSERT INTO public.departments (id_department, department_name) OVERRIDING SYSTEM VALUE VALUES (5, 'Кафедра мобильных технологий');
INSERT INTO public.departments (id_department, department_name) OVERRIDING SYSTEM VALUE VALUES (6, 'Кафедра киберфизических систем');
INSERT INTO public.departments (id_department, department_name) OVERRIDING SYSTEM VALUE VALUES (7, 'Кафедра экономической информатики');
INSERT INTO public.departments (id_department, department_name) OVERRIDING SYSTEM VALUE VALUES (8, 'Кафедра цифрового дизайна');
INSERT INTO public.departments (id_department, department_name) OVERRIDING SYSTEM VALUE VALUES (9, 'Кафедра вычислительной техники');
INSERT INTO public.departments (id_department, department_name) OVERRIDING SYSTEM VALUE VALUES (10, 'Кафедра системного анализа и управления');


--
-- TOC entry 5020 (class 0 OID 17665)
-- Dependencies: 232
-- Data for Name: disciplines; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.disciplines (id_discipline, discipline_name, id_department) OVERRIDING SYSTEM VALUE VALUES (1, 'Алгоритмы и структуры данных', 1);
INSERT INTO public.disciplines (id_discipline, discipline_name, id_department) OVERRIDING SYSTEM VALUE VALUES (2, 'Операционные системы', 1);
INSERT INTO public.disciplines (id_discipline, discipline_name, id_department) OVERRIDING SYSTEM VALUE VALUES (3, 'Компьютерные сети', 3);
INSERT INTO public.disciplines (id_discipline, discipline_name, id_department) OVERRIDING SYSTEM VALUE VALUES (4, 'Криптография и защита информации', 2);
INSERT INTO public.disciplines (id_discipline, discipline_name, id_department) OVERRIDING SYSTEM VALUE VALUES (5, 'Машинное обучение', 4);
INSERT INTO public.disciplines (id_discipline, discipline_name, id_department) OVERRIDING SYSTEM VALUE VALUES (6, 'Разработка мобильных приложений', 5);
INSERT INTO public.disciplines (id_discipline, discipline_name, id_department) OVERRIDING SYSTEM VALUE VALUES (7, 'Базы данных', 1);
INSERT INTO public.disciplines (id_discipline, discipline_name, id_department) OVERRIDING SYSTEM VALUE VALUES (8, 'Цифровая экономика', 7);
INSERT INTO public.disciplines (id_discipline, discipline_name, id_department) OVERRIDING SYSTEM VALUE VALUES (9, 'Основы веб-разработки', 6);
INSERT INTO public.disciplines (id_discipline, discipline_name, id_department) OVERRIDING SYSTEM VALUE VALUES (10, 'Теория вероятностей и статистика', 10);


--
-- TOC entry 5010 (class 0 OID 17306)
-- Dependencies: 222
-- Data for Name: education_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.education_documents (id_education_doc, series, number, institution_name, graduation_year, organization_type_id) OVERRIDING SYSTEM VALUE VALUES (1, 'A01', '123456', 'Московский государственный университет', 2020, 1);
INSERT INTO public.education_documents (id_education_doc, series, number, institution_name, graduation_year, organization_type_id) OVERRIDING SYSTEM VALUE VALUES (2, 'B02', '654321', 'Санкт-Петербургский государственный университет', 2021, 1);
INSERT INTO public.education_documents (id_education_doc, series, number, institution_name, graduation_year, organization_type_id) OVERRIDING SYSTEM VALUE VALUES (3, 'C03', '789012', 'Новосибирский государственный университет', 2019, 2);
INSERT INTO public.education_documents (id_education_doc, series, number, institution_name, graduation_year, organization_type_id) OVERRIDING SYSTEM VALUE VALUES (4, 'D04', '345678', 'Казанский федеральный университет', 2022, 3);
INSERT INTO public.education_documents (id_education_doc, series, number, institution_name, graduation_year, organization_type_id) OVERRIDING SYSTEM VALUE VALUES (5, 'E05', '987654', 'Уфимский государственный авиационный университет', 2021, 4);
INSERT INTO public.education_documents (id_education_doc, series, number, institution_name, graduation_year, organization_type_id) OVERRIDING SYSTEM VALUE VALUES (6, 'F06', '234567', 'Самарский государственный университет', 2020, 2);
INSERT INTO public.education_documents (id_education_doc, series, number, institution_name, graduation_year, organization_type_id) OVERRIDING SYSTEM VALUE VALUES (7, 'G07', '890123', 'Ростовский государственный университет', 2018, 4);
INSERT INTO public.education_documents (id_education_doc, series, number, institution_name, graduation_year, organization_type_id) OVERRIDING SYSTEM VALUE VALUES (8, 'H08', '567890', 'Воронежский государственный университет', 2022, 6);
INSERT INTO public.education_documents (id_education_doc, series, number, institution_name, graduation_year, organization_type_id) OVERRIDING SYSTEM VALUE VALUES (9, 'I09', '678901', 'Томский государственный университет', 2021, 4);
INSERT INTO public.education_documents (id_education_doc, series, number, institution_name, graduation_year, organization_type_id) OVERRIDING SYSTEM VALUE VALUES (10, 'J10', '123789', 'Рязанский государственный университет', 2020, 3);


--
-- TOC entry 5012 (class 0 OID 17314)
-- Dependencies: 224
-- Data for Name: ege_results; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (1, 1, 85, 2020, 1);
INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (2, 1, 90, 2020, 3);
INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (3, 2, 75, 2021, 4);
INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (4, 2, 80, 2021, 2);
INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (5, 3, 88, 2020, 3);
INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (6, 3, 92, 2020, 5);
INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (7, 4, 70, 2021, 3);
INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (8, 4, 85, 2021, 4);
INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (9, 5, 78, 2021, 2);
INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (10, 5, 82, 2021, 3);
INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (11, 6, 85, 2020, 2);
INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (12, 6, 90, 2020, 1);
INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (13, 7, 92, 2021, 5);
INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (14, 7, 88, 2021, 3);
INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (15, 8, 79, 2020, 2);
INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (16, 8, 84, 2020, 1);
INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (17, 9, 91, 2021, 4);
INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (18, 9, 87, 2021, 2);
INSERT INTO public.ege_results (id_ege, id_person, score, exam_year, id_subject) OVERRIDING SYSTEM VALUE VALUES (19, 10, 93, 2020, 2);


--
-- TOC entry 5033 (class 0 OID 17817)
-- Dependencies: 245
-- Data for Name: ege_subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ege_subjects (id_subject, subject_name) VALUES (6, 'Обществознание');
INSERT INTO public.ege_subjects (id_subject, subject_name) VALUES (5, 'Ин.яз
');
INSERT INTO public.ege_subjects (id_subject, subject_name) VALUES (4, 'История');
INSERT INTO public.ege_subjects (id_subject, subject_name) VALUES (3, 'Литература');
INSERT INTO public.ege_subjects (id_subject, subject_name) VALUES (2, 'Математика');
INSERT INTO public.ege_subjects (id_subject, subject_name) VALUES (1, 'Русский');


--
-- TOC entry 5018 (class 0 OID 17652)
-- Dependencies: 230
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.groups (id_group, group_name, id_department) OVERRIDING SYSTEM VALUE VALUES (1, 'ЭИ-122', 1);
INSERT INTO public.groups (id_group, group_name, id_department) OVERRIDING SYSTEM VALUE VALUES (2, 'ЭИ-123', 1);
INSERT INTO public.groups (id_group, group_name, id_department) OVERRIDING SYSTEM VALUE VALUES (3, 'ЭИ-124', 2);
INSERT INTO public.groups (id_group, group_name, id_department) OVERRIDING SYSTEM VALUE VALUES (4, 'ЭИ-125', 2);
INSERT INTO public.groups (id_group, group_name, id_department) OVERRIDING SYSTEM VALUE VALUES (5, 'ЭИ-126', 3);
INSERT INTO public.groups (id_group, group_name, id_department) OVERRIDING SYSTEM VALUE VALUES (6, 'ЭИ-127', 3);
INSERT INTO public.groups (id_group, group_name, id_department) OVERRIDING SYSTEM VALUE VALUES (7, 'ЭИ-128', 4);
INSERT INTO public.groups (id_group, group_name, id_department) OVERRIDING SYSTEM VALUE VALUES (8, 'ЭИ-129', 4);
INSERT INTO public.groups (id_group, group_name, id_department) OVERRIDING SYSTEM VALUE VALUES (9, 'ЭИ-130', 5);
INSERT INTO public.groups (id_group, group_name, id_department) OVERRIDING SYSTEM VALUE VALUES (10, 'ЭИ-131', 5);


--
-- TOC entry 5035 (class 0 OID 17831)
-- Dependencies: 247
-- Data for Name: order_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_person (id_order_person, id_order, id_person) VALUES (2, 23, 1);
INSERT INTO public.order_person (id_order_person, id_order, id_person) VALUES (9, 29, 4);
INSERT INTO public.order_person (id_order_person, id_order, id_person) VALUES (10, 28, 1);
INSERT INTO public.order_person (id_order_person, id_order, id_person) VALUES (11, 27, 2);
INSERT INTO public.order_person (id_order_person, id_order, id_person) VALUES (12, 26, 3);
INSERT INTO public.order_person (id_order_person, id_order, id_person) VALUES (13, 25, 5);
INSERT INTO public.order_person (id_order_person, id_order, id_person) VALUES (14, 33, 1);
INSERT INTO public.order_person (id_order_person, id_order, id_person) VALUES (15, 32, 3);
INSERT INTO public.order_person (id_order_person, id_order, id_person) VALUES (16, 31, 4);
INSERT INTO public.order_person (id_order_person, id_order, id_person) VALUES (17, 30, 2);


--
-- TOC entry 5028 (class 0 OID 17720)
-- Dependencies: 240
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id_order, office_date, office_number, id_plan, id_group, start_date) OVERRIDING SYSTEM VALUE VALUES (23, '2020-04-13', 567890, 27, 4, '2019-03-12');
INSERT INTO public.orders (id_order, office_date, office_number, id_plan, id_group, start_date) OVERRIDING SYSTEM VALUE VALUES (25, '2020-04-14', 567891, 28, 2, '2019-03-13');
INSERT INTO public.orders (id_order, office_date, office_number, id_plan, id_group, start_date) OVERRIDING SYSTEM VALUE VALUES (26, '2020-04-15', 567892, 29, 3, '2019-03-14');
INSERT INTO public.orders (id_order, office_date, office_number, id_plan, id_group, start_date) OVERRIDING SYSTEM VALUE VALUES (27, '2020-04-16', 567893, 30, 4, '2019-03-15');
INSERT INTO public.orders (id_order, office_date, office_number, id_plan, id_group, start_date) OVERRIDING SYSTEM VALUE VALUES (28, '2020-04-17', 567894, 31, 5, '2019-03-16');
INSERT INTO public.orders (id_order, office_date, office_number, id_plan, id_group, start_date) OVERRIDING SYSTEM VALUE VALUES (29, '2020-04-18', 567895, 32, 6, '2019-03-17');
INSERT INTO public.orders (id_order, office_date, office_number, id_plan, id_group, start_date) OVERRIDING SYSTEM VALUE VALUES (30, '2020-04-19', 567896, 33, 7, '2019-03-18');
INSERT INTO public.orders (id_order, office_date, office_number, id_plan, id_group, start_date) OVERRIDING SYSTEM VALUE VALUES (31, '2020-04-20', 567897, 34, 8, '2019-03-19');
INSERT INTO public.orders (id_order, office_date, office_number, id_plan, id_group, start_date) OVERRIDING SYSTEM VALUE VALUES (32, '2020-04-21', 567898, 35, 9, '2019-03-20');
INSERT INTO public.orders (id_order, office_date, office_number, id_plan, id_group, start_date) OVERRIDING SYSTEM VALUE VALUES (33, '2020-04-22', 567899, 36, 10, '2019-03-21');


--
-- TOC entry 5031 (class 0 OID 17803)
-- Dependencies: 243
-- Data for Name: organization_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.organization_types (id_type, type_name) VALUES (6, 'Университет');
INSERT INTO public.organization_types (id_type, type_name) VALUES (5, 'Колледж');
INSERT INTO public.organization_types (id_type, type_name) VALUES (4, 'Гимназия');
INSERT INTO public.organization_types (id_type, type_name) VALUES (3, 'Училище');
INSERT INTO public.organization_types (id_type, type_name) VALUES (2, 'Лицей');
INSERT INTO public.organization_types (id_type, type_name) VALUES (1, 'Школа');


--
-- TOC entry 5003 (class 0 OID 16875)
-- Dependencies: 215
-- Data for Name: passport; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (1, 454655, 1214, '2006-02-09', '2026-02-09', '256168, Магаданская область, город Видное, въезд Космонавтов, 53
', 'Территориальный отдел МВД России по г. Новосибирску');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (2, 454777, 1167, '2020-04-09', '2026-04-09', '701681, Костромская область, город Дмитров, бульвар Гагарина, 12
', 'Управление по вопросам миграции МВД России по Челябинской области');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (3, 890987, 8987, '2021-01-15', '1998-12-09', '833563, Сахалинская область, город Можайск, наб. Гагарина, 73
', 'Управление по вопросам миграции МВД России по Московской области');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (4, 565656, 1214, '2022-06-27', '2003-12-09', '833563, Сахалинская область, город Можайск, наб. Гагарина, 73
', 'Управление по вопросам миграции МВД России по Московской области');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (5, 543276, 1617, '2022-05-19', '2004-09-12', '877768, Магаданская область, город Шатура, наб. Бухарестская, 67
', 'Отдел по вопросам миграции ОМВД России по г. Воронежу');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (6, 456788, 1819, '2019-09-22', '2005-02-18', '896751, Ивановская область, город Одинцово, ул. Будапештсткая, 67
', 'Отдел МВД России по Приморскому району г. Санкт-Петербурга
');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (7, 343565, 9002, '2022-09-21', '2005-02-18', '832358, Омская область, город Пушкино, спуск Будапештсткая, 97
', 'Отдел УФМС России по г. Москве в районе Пресненский');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (8, 457654, 8943, '2020-02-17', '2005-02-18', '500453, Смоленская область, город Лотошино, наб. Будапештсткая, 04
', 'Отдел по вопросам миграции ОМВД России по Советскому району г. Казани');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (9, 565432, 5783, '2020-02-25', '2003-12-09', '133606, Амурская область, город Зарайск, проезд Косиора, 35
', 'Отдел по вопросам миграции МВД России по Центральному району г. Москвы');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (10, 454567, 3838, '2017-10-18', '2005-02-18', '466938, Костромская область, город Подольск, ул. Бухарестская, 19
', 'Отдел МВД России по Нижегородской области в г. Арзамасе');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (11, 345443, 2424, '2020-02-14', '2004-09-12', '348149, Мурманская область, город Можайск, пер. Бухарестская, 89
', 'Отдел по вопросам миграции ОМВД России по Советскому району г. Казани');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (12, 434343, 3454, '2021-04-12', '2005-02-18', '118042, Пензенская область, город Наро-Фоминск, пер. Бухарестская, 31
', 'Главное управление МВД России по г. Санкт-Петербургу и Ленинградской области');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (14, 434343, 4554, '2003-12-15', '2005-02-18', '450226, Вологодская область, город Пушкино, пл. Славы, 72
', 'Отдел по вопросам миграции ОМВД России по г. Воронежу');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (15, 444444, 7676, '2004-03-11', '2003-12-09', '230488, Иркутская область, город Серпухов, пр. Будапештсткая, 72
', 'Территориальный отдел МВД России по г. Новосибирску');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (16, 567896, 5432, '2021-09-18', '2005-02-18', '097140, Иркутская область, город Сергиев Посад, ул. Балканская, 65
', 'Межрайонный отдел УФМС России по Владимирской области');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (17, 458765, 2346, '2020-09-19', '2004-09-12', '407554, Брянская область, город Воскресенск, проезд Гоголя, 12
', 'Управление по вопросам миграции МВД России по Ставропольскому краю');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (18, 246687, 5463, '2020-02-18', '2003-12-09', '112556, Кемеровская область, город Солнечногорск, спуск Чехова, 71
', 'Отдел по вопросам миграции ОМВД России по Советскому району г. Казани');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (19, 555666, 7643, '2021-02-19', '2004-09-12', '158378, Калужская область, город Одинцово, ул. 1905 года, 71
', 'Отдел по вопросам миграции ОМВД России по Калининскому району г. Санкт-Петербурга
');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (20, 666845, 7865, '2023-02-24', '2003-12-09', '132450, Брянская область, город Серпухов, спуск Гагарина, 99
', 'Отдел УФМС России по г. Москве в районе Пресненский');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (31, 89765, 555, '2008-09-12', '2018-08-11', 'Нижний Новгород, город Нижний Новгород, улица Большая Покровская, дом 6', 'Отдел по вопросам миграции МВД по Республике Татарстан');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (30, 6754321, 444, '2021-03-17', '2031-02-16', 'Нижний Новгород, город Нижний Новгород, улица Большая Покровская, дом 6', 'Отдел по вопросам миграции ГУ МВД России по Новосибирской области');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (29, 456789, 123, '2017-06-20', '2027-05-19', 'Екатеринбург, город Екатеринбург, улица Малышева, дом 34', 'Территориальный отдел МВД России по Свердловской области');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (28, 987654, 321, '2020-08-28', '2030-07-27', 'Новосибирск, город Новосибирск, проспект Красный, дом 5', 'Отдел по вопросам миграции УМВД России по Санкт-Петербургу');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (27, 765432, 432, '2022-09-15', '2032-08-14', 'Казань, город Казань, улица Баумана, дом 42', 'Отдел по вопросам миграции ОМВД России по городу Москве');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (26, 908765, 321, '2019-05-25', '2029-04-24', 'Нижний Новгород, город Нижний Новгород, улица Большая Покровская, дом 6', 'Отдел по вопросам миграции МВД по Республике Татарстан');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (25, 897654, 123, '2008-09-12', '2018-08-11', 'Казань, город Казань, улица Баумана, дом 42', 'Отдел по вопросам миграции ГУ МВД России по Новосибирской области');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (24, 786543, 987, '2021-03-17', '2031-02-16', 'Новосибирск, город Новосибирск, проспект Красный, дом 5', 'Территориальный отдел МВД России по Свердловской области');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (23, 6754321, 876, '2017-06-20', '2027-05-19', 'Екатеринбург, город Екатеринбург, улица Малышева, дом 34', 'Отдел по вопросам миграции УМВД России по Санкт-Петербургу');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (22, 567432, 765, '2022-01-15', '2032-07-14', 'Москва, город Москва, улица Ленина, дом 10', 'Отдел по вопросам миграции ОМВД России по городу Москве');
INSERT INTO public.passport (id_passport, "Number", "Series", "Date_of_receipt", "Expiry_date", "Registration", issued_by_whom) VALUES (21, 456789, 789, '2020-08-28', '2030-07-27', 'Санкт-Петербург, город Санкт-Петербург, проспект Невский, дом 25', 'Отдел по вопросам миграции ГУ МВД России по Новосибирской области');


--
-- TOC entry 5008 (class 0 OID 17218)
-- Dependencies: 220
-- Data for Name: person_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (1, 2, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (2, 3, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (3, 2, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (4, 1, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (5, 3, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (6, 5, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (7, 1, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (8, 2, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (9, 4, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (10, 3, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (11, 2, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (12, 1, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (13, 4, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (14, 3, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (15, 2, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (16, 1, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (17, 3, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (18, 2, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (19, 1, NULL);
INSERT INTO public.person_roles (id_person, "id_role ", "FK_person") VALUES (20, 3, NULL);


--
-- TOC entry 5005 (class 0 OID 17153)
-- Dependencies: 217
-- Data for Name: physical_persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (18, 'Смирнова', 'Мария', 'Александровна', '1997-06-09', 'Ижевск', 18, 4, 6);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (19, 'Тимофеев', 'Анатолий', 'Георгиевич', '2000-03-28', 'Барнаул', 19, 3, 7);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (1, 'Иванов', 'Алексей', 'Сергеевич', '2000-05-15', 'Москва', 1, 1, 2);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (2, 'Петров', 'Дмитрий', 'Алексеевич', '1998-09-22', 'Санкт-Петербург', 2, 2, 4);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (3, 'Сидорова', 'Марина', 'Игоревна', '2002-07-10', 'Екатеринбург', 3, 3, 2);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (4, 'Федоров', 'Олег', 'Петрович', '1995-12-01', 'Казань', 4, 2, 3);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (5, 'Смирнова', 'Елена', 'Владимировна', '2001-03-17', 'Новосибирск', 5, 1, 4);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (6, 'Алексеев', 'Иван', 'Андреевич', '1997-06-25', 'Самара', 6, 3, 2);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (7, 'Волков', 'Сергей', 'Николаевич', '1999-08-30', 'Тюмень', 7, 3, 1);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (8, 'Васильева', 'Наталья', 'Евгеньевна', '2000-11-11', 'Челябинск', 8, 2, 5);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (9, 'Сергеев', 'Артем', 'Олегович', '2003-02-20', 'Омск', 9, 5, 6);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (10, 'Романова', 'Анна', 'Дмитриевна', '1996-04-05', 'Ростов-на-Дону', 10, 6, 7);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (11, 'Николаев', 'Григорий', 'Федорович', '1998-10-19', 'Воронеж', 11, 7, 5);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (12, 'Степанова', 'Вероника', 'Артемовна', '1994-01-27', 'Краснодар', 12, 8, 4);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (13, 'Павлов', 'Максим', 'Александрович', '2002-09-14', 'Уфа', 13, 2, 3);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (14, 'Иванова', 'Елена', 'Сергеевна', '1995-05-21', 'Пермь', 14, 5, 2);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (15, 'Андреев', 'Юрий', 'Павлович', '1999-07-03', 'Волгоград', 15, 4, 1);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (16, 'Попова', 'Маргарита', 'Константиновна', '2001-08-08', 'Саратов', 16, 6, 3);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (17, 'Григорьев', 'Кирилл', 'Денисович', '2003-12-12', 'Тула', 17, 5, 3);
INSERT INTO public.physical_persons (id_person, surname, name, patronymic, birthday, place_of_birth, contact_id, passport_id, "ed.doc_id") OVERRIDING SYSTEM VALUE VALUES (20, 'Зайцева', 'Людмила', 'Викторовна', '1996-09-07', 'Хабаровск', 20, 2, 8);


--
-- TOC entry 5024 (class 0 OID 17688)
-- Dependencies: 236
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.profiles (id_profile, profile_name, id_specialty) OVERRIDING SYSTEM VALUE VALUES (21, 'Программная инженерия', 1);
INSERT INTO public.profiles (id_profile, profile_name, id_specialty) OVERRIDING SYSTEM VALUE VALUES (22, 'Информационная безопасность', 2);
INSERT INTO public.profiles (id_profile, profile_name, id_specialty) OVERRIDING SYSTEM VALUE VALUES (23, 'Компьютерные сети и телекоммуникации', 3);
INSERT INTO public.profiles (id_profile, profile_name, id_specialty) OVERRIDING SYSTEM VALUE VALUES (24, 'Искусственный интеллект и анализ данных', 4);
INSERT INTO public.profiles (id_profile, profile_name, id_specialty) OVERRIDING SYSTEM VALUE VALUES (25, 'Мобильные технологии и разработка', 5);
INSERT INTO public.profiles (id_profile, profile_name, id_specialty) OVERRIDING SYSTEM VALUE VALUES (26, 'Киберфизические системы', 6);
INSERT INTO public.profiles (id_profile, profile_name, id_specialty) OVERRIDING SYSTEM VALUE VALUES (27, 'Экономическая информатика', 7);
INSERT INTO public.profiles (id_profile, profile_name, id_specialty) OVERRIDING SYSTEM VALUE VALUES (28, 'Цифровой дизайн и мультимедиа', 8);
INSERT INTO public.profiles (id_profile, profile_name, id_specialty) OVERRIDING SYSTEM VALUE VALUES (29, 'Вычислительная техника и автоматизация', 9);
INSERT INTO public.profiles (id_profile, profile_name, id_specialty) OVERRIDING SYSTEM VALUE VALUES (30, 'Системный анализ и управление', 10);


--
-- TOC entry 5014 (class 0 OID 17353)
-- Dependencies: 226
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles (id_role, role_name) OVERRIDING SYSTEM VALUE VALUES (1, 'Абитуриент');
INSERT INTO public.roles (id_role, role_name) OVERRIDING SYSTEM VALUE VALUES (2, 'Выпускник');
INSERT INTO public.roles (id_role, role_name) OVERRIDING SYSTEM VALUE VALUES (3, 'Отчисленный');
INSERT INTO public.roles (id_role, role_name) OVERRIDING SYSTEM VALUE VALUES (4, 'В академическом отпуске');
INSERT INTO public.roles (id_role, role_name) OVERRIDING SYSTEM VALUE VALUES (5, 'Сотрудник');


--
-- TOC entry 5022 (class 0 OID 17678)
-- Dependencies: 234
-- Data for Name: specialties; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.specialties (id_specialty, specialty_name, specialty_code) OVERRIDING SYSTEM VALUE VALUES (1, 'Программная инженерия', '09.03.04');
INSERT INTO public.specialties (id_specialty, specialty_name, specialty_code) OVERRIDING SYSTEM VALUE VALUES (2, 'Информационная безопасность', '10.03.01');
INSERT INTO public.specialties (id_specialty, specialty_name, specialty_code) OVERRIDING SYSTEM VALUE VALUES (3, 'Компьютерные сети и телекоммуникации', '11.03.02');
INSERT INTO public.specialties (id_specialty, specialty_name, specialty_code) OVERRIDING SYSTEM VALUE VALUES (4, 'Искусственный интеллект и анализ данных', '09.03.05');
INSERT INTO public.specialties (id_specialty, specialty_name, specialty_code) OVERRIDING SYSTEM VALUE VALUES (5, 'Мобильные технологии и разработка', '09.03.06');
INSERT INTO public.specialties (id_specialty, specialty_name, specialty_code) OVERRIDING SYSTEM VALUE VALUES (6, 'Киберфизические системы', '15.03.04');
INSERT INTO public.specialties (id_specialty, specialty_name, specialty_code) OVERRIDING SYSTEM VALUE VALUES (7, 'Экономическая информатика', '38.03.05');
INSERT INTO public.specialties (id_specialty, specialty_name, specialty_code) OVERRIDING SYSTEM VALUE VALUES (8, 'Цифровой дизайн и мультимедиа', '54.03.01');
INSERT INTO public.specialties (id_specialty, specialty_name, specialty_code) OVERRIDING SYSTEM VALUE VALUES (9, 'Вычислительная техника и автоматизация', '15.03.01');
INSERT INTO public.specialties (id_specialty, specialty_name, specialty_code) OVERRIDING SYSTEM VALUE VALUES (10, 'Системный анализ и управление', '27.03.03');


--
-- TOC entry 5037 (class 0 OID 17850)
-- Dependencies: 249
-- Data for Name: study_plan_disciplines; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.study_plan_disciplines (id_plan_discipline, id_plan, id_discipline) VALUES (3, 27, 2);
INSERT INTO public.study_plan_disciplines (id_plan_discipline, id_plan, id_discipline) VALUES (5, 28, 3);
INSERT INTO public.study_plan_disciplines (id_plan_discipline, id_plan, id_discipline) VALUES (6, 31, 5);
INSERT INTO public.study_plan_disciplines (id_plan_discipline, id_plan, id_discipline) VALUES (7, 31, 7);
INSERT INTO public.study_plan_disciplines (id_plan_discipline, id_plan, id_discipline) VALUES (8, 30, 6);
INSERT INTO public.study_plan_disciplines (id_plan_discipline, id_plan, id_discipline) VALUES (9, 29, 5);
INSERT INTO public.study_plan_disciplines (id_plan_discipline, id_plan, id_discipline) VALUES (10, 36, 3);
INSERT INTO public.study_plan_disciplines (id_plan_discipline, id_plan, id_discipline) VALUES (11, 28, 4);
INSERT INTO public.study_plan_disciplines (id_plan_discipline, id_plan, id_discipline) VALUES (12, 28, 2);


--
-- TOC entry 5026 (class 0 OID 17701)
-- Dependencies: 238
-- Data for Name: study_plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.study_plans (id_plan, id_profile, id_specialties, id_departments, years) OVERRIDING SYSTEM VALUE VALUES (28, 21, 1, 2, '2001-2011');
INSERT INTO public.study_plans (id_plan, id_profile, id_specialties, id_departments, years) OVERRIDING SYSTEM VALUE VALUES (29, 22, 1, 2, '2002-2012');
INSERT INTO public.study_plans (id_plan, id_profile, id_specialties, id_departments, years) OVERRIDING SYSTEM VALUE VALUES (27, 23, 1, 2, '2003-2013');
INSERT INTO public.study_plans (id_plan, id_profile, id_specialties, id_departments, years) OVERRIDING SYSTEM VALUE VALUES (30, 23, 1, 2, '2003-2013');
INSERT INTO public.study_plans (id_plan, id_profile, id_specialties, id_departments, years) OVERRIDING SYSTEM VALUE VALUES (31, 24, 1, 2, '2004-2014');
INSERT INTO public.study_plans (id_plan, id_profile, id_specialties, id_departments, years) OVERRIDING SYSTEM VALUE VALUES (32, 25, 1, 2, '2005-2015');
INSERT INTO public.study_plans (id_plan, id_profile, id_specialties, id_departments, years) OVERRIDING SYSTEM VALUE VALUES (33, 26, 1, 2, '2006-2016');
INSERT INTO public.study_plans (id_plan, id_profile, id_specialties, id_departments, years) OVERRIDING SYSTEM VALUE VALUES (34, 27, 1, 2, '2007-2017');
INSERT INTO public.study_plans (id_plan, id_profile, id_specialties, id_departments, years) OVERRIDING SYSTEM VALUE VALUES (35, 28, 1, 2, '2008-2018');
INSERT INTO public.study_plans (id_plan, id_profile, id_specialties, id_departments, years) OVERRIDING SYSTEM VALUE VALUES (36, 29, 1, 2, '2009-2019');
INSERT INTO public.study_plans (id_plan, id_profile, id_specialties, id_departments, years) OVERRIDING SYSTEM VALUE VALUES (37, 30, 1, 2, '2010-2020');


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 218
-- Name: contacts_id_contact_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_id_contact_seq', 30, true);


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 227
-- Name: departments_id_department_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_id_department_seq', 10, true);


--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 231
-- Name: disciplines_id_discipline_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disciplines_id_discipline_seq', 10, true);


--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 221
-- Name: education_documents_id_education_doc_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.education_documents_id_education_doc_seq', 10, true);


--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 223
-- Name: ege_results_id_ege_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ege_results_id_ege_seq', 19, true);


--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 244
-- Name: ege_subjects_id_subject_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ege_subjects_id_subject_seq', 1, false);


--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 229
-- Name: groups_id_group_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_group_seq', 10, true);


--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 246
-- Name: order_person_id_order_person_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_person_id_order_person_seq', 17, true);


--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 239
-- Name: orders_id_order_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_order_seq', 33, true);


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 241
-- Name: orders_office_number_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_office_number_seq', 1, true);


--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 242
-- Name: organization_types_id_type_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.organization_types_id_type_seq', 1, false);


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 216
-- Name: physical_persons_id_person_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.physical_persons_id_person_seq', 60, true);


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 235
-- Name: profiles_id_profile_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profiles_id_profile_seq', 30, true);


--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 225
-- Name: roles_id_role_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_role_seq', 5, true);


--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 233
-- Name: specialties_id_specialty_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.specialties_id_specialty_seq', 10, true);


--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 248
-- Name: study_plan_disciplines_id_plan_discipline_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.study_plan_disciplines_id_plan_discipline_seq', 12, true);


--
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 237
-- Name: study_plans_id_plan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.study_plans_id_plan_seq', 37, true);


--
-- TOC entry 4785 (class 2606 OID 17204)
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id_contact);


--
-- TOC entry 4797 (class 2606 OID 17650)
-- Name: departments departments_department_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_department_name_key UNIQUE (department_name);


--
-- TOC entry 4799 (class 2606 OID 17648)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id_department);


--
-- TOC entry 4805 (class 2606 OID 17671)
-- Name: disciplines disciplines_discipline_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_discipline_name_key UNIQUE (discipline_name);


--
-- TOC entry 4807 (class 2606 OID 17669)
-- Name: disciplines disciplines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_pkey PRIMARY KEY (id_discipline);


--
-- TOC entry 4789 (class 2606 OID 17312)
-- Name: education_documents education_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education_documents
    ADD CONSTRAINT education_documents_pkey PRIMARY KEY (id_education_doc);


--
-- TOC entry 4791 (class 2606 OID 17320)
-- Name: ege_results ege_results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ege_results
    ADD CONSTRAINT ege_results_pkey PRIMARY KEY (id_ege);


--
-- TOC entry 4829 (class 2606 OID 17822)
-- Name: ege_subjects ege_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ege_subjects
    ADD CONSTRAINT ege_subjects_pkey PRIMARY KEY (id_subject);


--
-- TOC entry 4831 (class 2606 OID 17824)
-- Name: ege_subjects ege_subjects_subject_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ege_subjects
    ADD CONSTRAINT ege_subjects_subject_name_key UNIQUE (subject_name);


--
-- TOC entry 4801 (class 2606 OID 17658)
-- Name: groups groups_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_group_name_key UNIQUE (group_name);


--
-- TOC entry 4803 (class 2606 OID 17656)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id_group);


--
-- TOC entry 4833 (class 2606 OID 17838)
-- Name: order_person order_person_id_order_id_person_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_person
    ADD CONSTRAINT order_person_id_order_id_person_key UNIQUE (id_order, id_person);


--
-- TOC entry 4835 (class 2606 OID 17836)
-- Name: order_person order_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_person
    ADD CONSTRAINT order_person_pkey PRIMARY KEY (id_order_person);


--
-- TOC entry 4821 (class 2606 OID 17769)
-- Name: orders orders_office_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_office_number_key UNIQUE (office_number);


--
-- TOC entry 4823 (class 2606 OID 17725)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id_order);


--
-- TOC entry 4825 (class 2606 OID 17808)
-- Name: organization_types organization_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization_types
    ADD CONSTRAINT organization_types_pkey PRIMARY KEY (id_type);


--
-- TOC entry 4827 (class 2606 OID 17810)
-- Name: organization_types organization_types_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization_types
    ADD CONSTRAINT organization_types_type_name_key UNIQUE (type_name);


--
-- TOC entry 4781 (class 2606 OID 16879)
-- Name: passport passport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passport
    ADD CONSTRAINT passport_pkey PRIMARY KEY (id_passport);


--
-- TOC entry 4787 (class 2606 OID 17366)
-- Name: person_roles person_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_roles
    ADD CONSTRAINT person_roles_pkey PRIMARY KEY (id_person);


--
-- TOC entry 4783 (class 2606 OID 17157)
-- Name: physical_persons physical_persons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physical_persons
    ADD CONSTRAINT physical_persons_pkey PRIMARY KEY (id_person);


--
-- TOC entry 4815 (class 2606 OID 17692)
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id_profile);


--
-- TOC entry 4817 (class 2606 OID 17694)
-- Name: profiles profiles_profile_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_profile_name_key UNIQUE (profile_name);


--
-- TOC entry 4793 (class 2606 OID 17357)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id_role);


--
-- TOC entry 4795 (class 2606 OID 17359)
-- Name: roles roles_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_role_name_key UNIQUE (role_name);


--
-- TOC entry 4809 (class 2606 OID 17682)
-- Name: specialties specialties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialties
    ADD CONSTRAINT specialties_pkey PRIMARY KEY (id_specialty);


--
-- TOC entry 4811 (class 2606 OID 17686)
-- Name: specialties specialties_specialty_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialties
    ADD CONSTRAINT specialties_specialty_code_key UNIQUE (specialty_code);


--
-- TOC entry 4813 (class 2606 OID 17684)
-- Name: specialties specialties_specialty_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialties
    ADD CONSTRAINT specialties_specialty_name_key UNIQUE (specialty_name);


--
-- TOC entry 4837 (class 2606 OID 17857)
-- Name: study_plan_disciplines study_plan_disciplines_id_plan_id_discipline_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_plan_disciplines
    ADD CONSTRAINT study_plan_disciplines_id_plan_id_discipline_key UNIQUE (id_plan, id_discipline);


--
-- TOC entry 4839 (class 2606 OID 17855)
-- Name: study_plan_disciplines study_plan_disciplines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_plan_disciplines
    ADD CONSTRAINT study_plan_disciplines_pkey PRIMARY KEY (id_plan_discipline);


--
-- TOC entry 4819 (class 2606 OID 17708)
-- Name: study_plans study_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_plans
    ADD CONSTRAINT study_plans_pkey PRIMARY KEY (id_plan);


--
-- TOC entry 4849 (class 2606 OID 17672)
-- Name: disciplines disciplines_id_department_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT disciplines_id_department_fkey FOREIGN KEY (id_department) REFERENCES public.departments(id_department) ON DELETE CASCADE;


--
-- TOC entry 4847 (class 2606 OID 17321)
-- Name: ege_results ege_results_id_person_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ege_results
    ADD CONSTRAINT ege_results_id_person_fkey FOREIGN KEY (id_person) REFERENCES public.physical_persons(id_person) ON DELETE CASCADE;


--
-- TOC entry 4840 (class 2606 OID 17205)
-- Name: physical_persons fk_contact; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physical_persons
    ADD CONSTRAINT fk_contact FOREIGN KEY (contact_id) REFERENCES public.contacts(id_contact) ON DELETE SET NULL;


--
-- TOC entry 4841 (class 2606 OID 17347)
-- Name: physical_persons fk_ed.doc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physical_persons
    ADD CONSTRAINT "fk_ed.doc" FOREIGN KEY ("ed.doc_id") REFERENCES public.education_documents(id_education_doc) NOT VALID;


--
-- TOC entry 4846 (class 2606 OID 17811)
-- Name: education_documents fk_organization_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education_documents
    ADD CONSTRAINT fk_organization_type FOREIGN KEY (organization_type_id) REFERENCES public.organization_types(id_type) ON DELETE SET NULL;


--
-- TOC entry 4842 (class 2606 OID 17342)
-- Name: physical_persons fk_passport; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physical_persons
    ADD CONSTRAINT fk_passport FOREIGN KEY (passport_id) REFERENCES public.passport(id_passport) NOT VALID;


--
-- TOC entry 4848 (class 2606 OID 17825)
-- Name: ege_results fk_subject; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ege_results
    ADD CONSTRAINT fk_subject FOREIGN KEY (id_subject) REFERENCES public.ege_subjects(id_subject);


--
-- TOC entry 4856 (class 2606 OID 17839)
-- Name: order_person order_person_id_order_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_person
    ADD CONSTRAINT order_person_id_order_fkey FOREIGN KEY (id_order) REFERENCES public.orders(id_order) ON DELETE CASCADE;


--
-- TOC entry 4857 (class 2606 OID 17844)
-- Name: order_person order_person_id_person_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_person
    ADD CONSTRAINT order_person_id_person_fkey FOREIGN KEY (id_person) REFERENCES public.physical_persons(id_person) ON DELETE CASCADE;


--
-- TOC entry 4854 (class 2606 OID 17781)
-- Name: orders orders_id_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_id_group_fkey FOREIGN KEY (id_group) REFERENCES public.groups(id_group) ON DELETE CASCADE;


--
-- TOC entry 4855 (class 2606 OID 17776)
-- Name: orders orders_id_plan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_id_plan_fkey FOREIGN KEY (id_plan) REFERENCES public.study_plans(id_plan) ON DELETE CASCADE;


--
-- TOC entry 4843 (class 2606 OID 17871)
-- Name: person_roles person_roles_FK_person_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_roles
    ADD CONSTRAINT "person_roles_FK_person_fkey" FOREIGN KEY ("FK_person") REFERENCES public.physical_persons(id_person) NOT VALID;


--
-- TOC entry 4844 (class 2606 OID 17224)
-- Name: person_roles person_roles_id_person_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_roles
    ADD CONSTRAINT person_roles_id_person_fkey FOREIGN KEY (id_person) REFERENCES public.physical_persons(id_person) ON DELETE CASCADE;


--
-- TOC entry 4845 (class 2606 OID 17360)
-- Name: person_roles person_roles_id_role _fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_roles
    ADD CONSTRAINT "person_roles_id_role _fkey" FOREIGN KEY ("id_role ") REFERENCES public.roles(id_role) NOT VALID;


--
-- TOC entry 4850 (class 2606 OID 17695)
-- Name: profiles profiles_id_specialty_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_id_specialty_fkey FOREIGN KEY (id_specialty) REFERENCES public.specialties(id_specialty) ON DELETE CASCADE;


--
-- TOC entry 4858 (class 2606 OID 17863)
-- Name: study_plan_disciplines study_plan_disciplines_id_discipline_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_plan_disciplines
    ADD CONSTRAINT study_plan_disciplines_id_discipline_fkey FOREIGN KEY (id_discipline) REFERENCES public.disciplines(id_discipline) ON DELETE CASCADE;


--
-- TOC entry 4859 (class 2606 OID 17858)
-- Name: study_plan_disciplines study_plan_disciplines_id_plan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_plan_disciplines
    ADD CONSTRAINT study_plan_disciplines_id_plan_fkey FOREIGN KEY (id_plan) REFERENCES public.study_plans(id_plan) ON DELETE CASCADE;


--
-- TOC entry 4851 (class 2606 OID 17792)
-- Name: study_plans study_plans_id_departments_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_plans
    ADD CONSTRAINT study_plans_id_departments_fkey FOREIGN KEY (id_departments) REFERENCES public.departments(id_department) NOT VALID;


--
-- TOC entry 4852 (class 2606 OID 17709)
-- Name: study_plans study_plans_id_profile_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_plans
    ADD CONSTRAINT study_plans_id_profile_fkey FOREIGN KEY (id_profile) REFERENCES public.profiles(id_profile) ON DELETE CASCADE;


--
-- TOC entry 4853 (class 2606 OID 17787)
-- Name: study_plans study_plans_id_specialties_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_plans
    ADD CONSTRAINT study_plans_id_specialties_fkey FOREIGN KEY (id_specialties) REFERENCES public.specialties(id_specialty) NOT VALID;


-- Completed on 2025-06-29 15:11:18

--
-- PostgreSQL database dump complete
--

