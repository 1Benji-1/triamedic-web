SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict u5LLElToirhYrxtdNjeeVHZhJYjyLsExefK3IvI7P3WqQTcdaLNxjVU3QUK0bOg

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: webauthn_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."django_content_type" ("id", "app_label", "model") VALUES
	(1, 'admin', 'logentry'),
	(2, 'auth', 'group'),
	(3, 'auth', 'permission'),
	(4, 'contenttypes', 'contenttype'),
	(5, 'sessions', 'session'),
	(6, 'core', 'atencion'),
	(7, 'core', 'paciente'),
	(8, 'core', 'registroauditoria'),
	(9, 'core', 'triaje'),
	(10, 'core', 'usuario');


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."auth_permission" ("id", "name", "content_type_id", "codename") VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 3, 'add_permission'),
	(6, 'Can change permission', 3, 'change_permission'),
	(7, 'Can delete permission', 3, 'delete_permission'),
	(8, 'Can view permission', 3, 'view_permission'),
	(9, 'Can add group', 2, 'add_group'),
	(10, 'Can change group', 2, 'change_group'),
	(11, 'Can delete group', 2, 'delete_group'),
	(12, 'Can view group', 2, 'view_group'),
	(13, 'Can add content type', 4, 'add_contenttype'),
	(14, 'Can change content type', 4, 'change_contenttype'),
	(15, 'Can delete content type', 4, 'delete_contenttype'),
	(16, 'Can view content type', 4, 'view_contenttype'),
	(17, 'Can add session', 5, 'add_session'),
	(18, 'Can change session', 5, 'change_session'),
	(19, 'Can delete session', 5, 'delete_session'),
	(20, 'Can view session', 5, 'view_session'),
	(21, 'Can add Paciente', 7, 'add_paciente'),
	(22, 'Can change Paciente', 7, 'change_paciente'),
	(23, 'Can delete Paciente', 7, 'delete_paciente'),
	(24, 'Can view Paciente', 7, 'view_paciente'),
	(25, 'Can add Usuario', 10, 'add_usuario'),
	(26, 'Can change Usuario', 10, 'change_usuario'),
	(27, 'Can delete Usuario', 10, 'delete_usuario'),
	(28, 'Can view Usuario', 10, 'view_usuario'),
	(29, 'Can add Registro de Auditoría', 8, 'add_registroauditoria'),
	(30, 'Can change Registro de Auditoría', 8, 'change_registroauditoria'),
	(31, 'Can delete Registro de Auditoría', 8, 'delete_registroauditoria'),
	(32, 'Can view Registro de Auditoría', 8, 'view_registroauditoria'),
	(33, 'Can add Triaje', 9, 'add_triaje'),
	(34, 'Can change Triaje', 9, 'change_triaje'),
	(35, 'Can delete Triaje', 9, 'delete_triaje'),
	(36, 'Can view Triaje', 9, 'view_triaje'),
	(37, 'Can add Atención', 6, 'add_atencion'),
	(38, 'Can change Atención', 6, 'change_atencion'),
	(39, 'Can delete Atención', 6, 'delete_atencion'),
	(40, 'Can view Atención', 6, 'view_atencion');


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: core_paciente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: core_triaje; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: core_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."core_usuario" ("id", "password", "last_login", "is_superuser", "username", "first_name", "last_name", "email", "is_staff", "is_active", "date_joined", "rol", "nombre_completo", "fecha_creacion", "activo", "intentos_fallidos", "bloqueado_hasta") VALUES
	(1, 'pbkdf2_sha256$1200000$T1b4We7UNg3xiu8r5i99Km$uCTuo3E+ibcC10tyj2ZLFKTIW8fNyHATbzqedMv78XE=', NULL, true, 'admin', '', '', 'admin@clinica.com', true, true, '2026-10-14 05:11:08.110521+00', 'admin', 'Administrador del Sistema', '2026-10-14 05:11:08.110532+00', true, 0, NULL),
	(2, 'pbkdf2_sha256$1200000$WoGHLmOpi0O4NViLNPTKrU$m2en4PD+JUJK0OgHiRT8hYg+xjh9DXh73v6HmDu32LQ=', NULL, false, 'clinico1', '', '', 'clinico@clinica.com', false, true, '2026-10-14 05:11:08.899858+00', 'clinico', 'Dr. Juan Pérez', '2026-10-14 05:11:08.899883+00', true, 0, NULL),
	(3, 'pbkdf2_sha256$1200000$06s7EmYUp7DSfRBcmW2phV$eYqapvCX4FieygMnl0R4Ebm0Cy6eQYVifGrJOynaV0Q=', NULL, false, 'farmacia1', '', '', 'farmacia@clinica.com', false, true, '2026-10-14 05:11:09.674483+00', 'farmacia', 'María García', '2026-10-14 05:11:09.674494+00', true, 0, NULL);


--
-- Data for Name: core_atencion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: core_registroauditoria; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: core_usuario_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: core_usuario_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."django_migrations" ("id", "app", "name", "applied") VALUES
	(1, 'contenttypes', '0001_initial', '2026-10-14 05:10:41.570688+00'),
	(2, 'contenttypes', '0002_remove_content_type_name', '2026-10-14 05:10:41.602117+00'),
	(3, 'auth', '0001_initial', '2026-10-14 05:10:41.688734+00'),
	(4, 'auth', '0002_alter_permission_name_max_length', '2026-10-14 05:10:41.731024+00'),
	(5, 'auth', '0003_alter_user_email_max_length', '2026-10-14 05:10:41.742739+00'),
	(6, 'auth', '0004_alter_user_username_opts', '2026-10-14 05:10:41.757896+00'),
	(7, 'auth', '0005_alter_user_last_login_null', '2026-10-14 05:10:41.77149+00'),
	(8, 'auth', '0006_require_contenttypes_0002', '2026-10-14 05:10:41.781637+00'),
	(9, 'auth', '0007_alter_validators_add_error_messages', '2026-10-14 05:10:41.807537+00'),
	(10, 'auth', '0008_alter_user_username_max_length', '2026-10-14 05:10:41.821048+00'),
	(11, 'auth', '0009_alter_user_last_name_max_length', '2026-10-14 05:10:41.831501+00'),
	(12, 'auth', '0010_alter_group_name_max_length', '2026-10-14 05:10:41.849703+00'),
	(13, 'auth', '0011_update_proxy_permissions', '2026-10-14 05:10:41.862036+00'),
	(14, 'auth', '0012_alter_user_first_name_max_length', '2026-10-14 05:10:41.875308+00'),
	(15, 'core', '0001_initial', '2026-10-14 05:10:41.971291+00'),
	(16, 'admin', '0001_initial', '2026-10-14 05:10:42.052382+00'),
	(17, 'admin', '0002_logentry_remove_auto_add', '2026-10-14 05:10:42.07008+00'),
	(18, 'admin', '0003_logentry_add_action_flag_choices', '2026-10-14 05:10:42.093685+00'),
	(19, 'core', '0002_alter_registroauditoria_accion_alter_usuario_rol', '2026-10-14 05:10:42.141771+00'),
	(20, 'core', '0003_alter_usuario_rol', '2026-10-14 05:10:42.168092+00'),
	(21, 'core', '0004_triaje_tipo_servicio', '2026-10-14 05:10:42.186892+00'),
	(22, 'sessions', '0001_initial', '2026-10-14 05:10:42.206437+00');


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: iceberg_namespaces; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: iceberg_tables; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."auth_group_id_seq"', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."auth_group_permissions_id_seq"', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."auth_permission_id_seq"', 40, true);


--
-- Name: core_atencion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."core_atencion_id_seq"', 1, false);


--
-- Name: core_paciente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."core_paciente_id_seq"', 1, false);


--
-- Name: core_registroauditoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."core_registroauditoria_id_seq"', 1, false);


--
-- Name: core_triaje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."core_triaje_id_seq"', 1, false);


--
-- Name: core_usuario_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."core_usuario_groups_id_seq"', 1, false);


--
-- Name: core_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."core_usuario_id_seq"', 3, true);


--
-- Name: core_usuario_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."core_usuario_user_permissions_id_seq"', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."django_admin_log_id_seq"', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."django_content_type_id_seq"', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."django_migrations_id_seq"', 22, true);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

-- \unrestrict u5LLElToirhYrxtdNjeeVHZhJYjyLsExefK3IvI7P3WqQTcdaLNxjVU3QUK0bOg

RESET ALL;
