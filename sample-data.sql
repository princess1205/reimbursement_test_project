--
-- PostgreSQL database dump
--

-- Dumped from database version 11.20
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
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-07-16 15:17:06.5767	2023-07-16 15:17:06.5767
\.


--
-- Data for Name: bils; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bils (id, amount, claim_for, employee_id, created_at, updated_at, expense_date) FROM stdin;
14	4000	Food	8	2023-07-16 19:21:47.427624	2023-07-16 19:21:47.427624	\N
15	5000	Travel	20	2023-07-16 19:25:22.975658	2023-07-16 19:25:22.975658	\N
16	5000	Meeting Offsite	20	2023-07-16 19:26:47.210979	2023-07-16 19:26:47.210979	\N
17	4000	Food	8	2023-07-16 19:27:11.667919	2023-07-16 19:27:11.667919	\N
18	10000	Travel	8	2023-07-16 19:30:08.682702	2023-07-16 19:30:08.682702	\N
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (id, dept_name) FROM stdin;
1	Sales
2	Engineering
3	Design
4	Quality Analysist
5	Product Management
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (id, first_name, last_name, email_address, designation, dept_id, created_at, updated_at) FROM stdin;
8	Test	Try	test@gmail.com	Developer	2	2023-07-16 18:29:48.111	2023-07-16 18:29:48.111
20	Test123	Try	test123@gmail.com	QA	4	2023-07-16 19:24:51.730397	2023-07-16 19:24:51.730397
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20230710174120
20230710174458
\.


--
-- Name: bils_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bils_id_seq', 18, true);


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_id_seq', 5, true);


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_id_seq', 20, true);


--
-- PostgreSQL database dump complete
--

