----
---- PostgreSQL database cluster dump
----
--
SET default_transaction_read_only = off;
--
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
--
----
---- Drop databases (except postgres and template1)
----
--
--DROP DATABASE fusionauth;
--
--
--
--
----
---- Drop roles
----
--
--DROP ROLE fusionauth;
--DROP ROLE postgres;
--
--
----
---- Roles
----
--
CREATE ROLE fusionauth;
ALTER ROLE fusionauth WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md50b57feda0f985ea810458de6e97ed5e6';
--CREATE ROLE postgres;
--ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md53175bce1d3201d16594cebf9d7eb3f9d';
--
--
--
--
--
--
----
---- PostgreSQL database dump
----
--
---- Dumped from database version 11.9
---- Dumped by pg_dump version 11.9
--
--SET statement_timeout = 0;
--SET lock_timeout = 0;
--SET idle_in_transaction_session_timeout = 0;
--SET client_encoding = 'UTF8';
--SET standard_conforming_strings = on;
--SELECT pg_catalog.set_config('search_path', '', false);
--SET check_function_bodies = false;
--SET xmloption = content;
--SET client_min_messages = warning;
--SET row_security = off;
--
--UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
--DROP DATABASE template1;
----
---- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
----
--
--CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';
--
--
--ALTER DATABASE template1 OWNER TO postgres;
--
--\connect template1
--
--SET statement_timeout = 0;
--SET lock_timeout = 0;
--SET idle_in_transaction_session_timeout = 0;
--SET client_encoding = 'UTF8';
--SET standard_conforming_strings = on;
--SELECT pg_catalog.set_config('search_path', '', false);
--SET check_function_bodies = false;
--SET xmloption = content;
--SET client_min_messages = warning;
--SET row_security = off;
--
----
---- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
----
--
--COMMENT ON DATABASE template1 IS 'default template for new databases';
--
--
----
---- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
----
--
--ALTER DATABASE template1 IS_TEMPLATE = true;
--
--
--\connect template1
--
--SET statement_timeout = 0;
--SET lock_timeout = 0;
--SET idle_in_transaction_session_timeout = 0;
--SET client_encoding = 'UTF8';
--SET standard_conforming_strings = on;
--SELECT pg_catalog.set_config('search_path', '', false);
--SET check_function_bodies = false;
--SET xmloption = content;
--SET client_min_messages = warning;
--SET row_security = off;
--
----
---- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
----
--
--REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
--GRANT CONNECT ON DATABASE template1 TO PUBLIC;
--
--
----
---- PostgreSQL database dump complete
----
--
----
---- PostgreSQL database dump
----
--
---- Dumped from database version 11.9
---- Dumped by pg_dump version 11.9
--
--SET statement_timeout = 0;
--SET lock_timeout = 0;
--SET idle_in_transaction_session_timeout = 0;
--SET client_encoding = 'UTF8';
--SET standard_conforming_strings = on;
--SELECT pg_catalog.set_config('search_path', '', false);
--SET check_function_bodies = false;
--SET xmloption = content;
--SET client_min_messages = warning;
--SET row_security = off;

--
-- Name: fusionauth; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE fusionauth WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE fusionauth OWNER TO postgres;

\connect fusionauth

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

SET default_with_oids = false;

--
-- Name: application_daily_active_users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.application_daily_active_users (
    applications_id uuid NOT NULL,
    count integer NOT NULL,
    day integer NOT NULL
);


ALTER TABLE public.application_daily_active_users OWNER TO fusionauth;

--
-- Name: application_monthly_active_users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.application_monthly_active_users (
    applications_id uuid NOT NULL,
    count integer NOT NULL,
    month integer NOT NULL
);


ALTER TABLE public.application_monthly_active_users OWNER TO fusionauth;

--
-- Name: application_registration_counts; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.application_registration_counts (
    applications_id uuid NOT NULL,
    count integer NOT NULL,
    decremented_count integer NOT NULL,
    hour integer NOT NULL
);


ALTER TABLE public.application_registration_counts OWNER TO fusionauth;

--
-- Name: application_roles; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.application_roles (
    id uuid NOT NULL,
    applications_id uuid NOT NULL,
    description character varying(255),
    insert_instant bigint NOT NULL,
    is_default boolean NOT NULL,
    is_super_role boolean NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.application_roles OWNER TO fusionauth;

--
-- Name: applications; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.applications (
    id uuid NOT NULL,
    access_token_populate_lambdas_id uuid,
    access_token_signing_keys_id uuid,
    active boolean NOT NULL,
    admin_registration_forms_id uuid NOT NULL,
    data text NOT NULL,
    email_verification_email_templates_id uuid,
    forgot_password_email_templates_id uuid,
    forms_id uuid,
    id_token_populate_lambdas_id uuid,
    id_token_signing_keys_id uuid,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    passwordless_email_templates_id uuid,
    samlv2_default_verification_keys_id uuid,
    samlv2_issuer character varying(191),
    samlv2_keys_id uuid,
    samlv2_logout_keys_id uuid,
    samlv2_logout_default_verification_keys_id uuid,
    samlv2_populate_lambdas_id uuid,
    samlv2_single_logout_keys_id uuid,
    set_password_email_templates_id uuid,
    tenants_id uuid NOT NULL,
    verification_email_templates_id uuid
);


ALTER TABLE public.applications OWNER TO fusionauth;

--
-- Name: asynchronous_tasks; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.asynchronous_tasks (
    id uuid NOT NULL,
    data text,
    entity_id uuid,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    nodes_id uuid,
    status smallint NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.asynchronous_tasks OWNER TO fusionauth;

--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.audit_logs (
    id bigint NOT NULL,
    insert_instant bigint NOT NULL,
    insert_user character varying(255) NOT NULL,
    message text NOT NULL,
    data text
);


ALTER TABLE public.audit_logs OWNER TO fusionauth;

--
-- Name: audit_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: fusionauth
--

CREATE SEQUENCE public.audit_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audit_logs_id_seq OWNER TO fusionauth;

--
-- Name: audit_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusionauth
--

ALTER SEQUENCE public.audit_logs_id_seq OWNED BY public.audit_logs.id;


--
-- Name: authentication_keys; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.authentication_keys (
    id character varying(191) NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    permissions text,
    meta_data text,
    tenants_id uuid
);


ALTER TABLE public.authentication_keys OWNER TO fusionauth;

--
-- Name: breached_password_metrics; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.breached_password_metrics (
    tenants_id uuid NOT NULL,
    matched_exact_count integer NOT NULL,
    matched_sub_address_count integer NOT NULL,
    matched_common_password_count integer NOT NULL,
    matched_password_count integer NOT NULL,
    passwords_checked_count integer NOT NULL
);


ALTER TABLE public.breached_password_metrics OWNER TO fusionauth;

--
-- Name: clean_speak_applications; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.clean_speak_applications (
    applications_id uuid NOT NULL,
    clean_speak_application_id uuid NOT NULL
);


ALTER TABLE public.clean_speak_applications OWNER TO fusionauth;

--
-- Name: common_breached_passwords; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.common_breached_passwords (
    password character varying(191) NOT NULL
);


ALTER TABLE public.common_breached_passwords OWNER TO fusionauth;

--
-- Name: connectors; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.connectors (
    id uuid NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    reconcile_lambdas_id uuid,
    ssl_certificate_keys_id uuid,
    type smallint NOT NULL
);


ALTER TABLE public.connectors OWNER TO fusionauth;

--
-- Name: connectors_tenants; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.connectors_tenants (
    connectors_id uuid NOT NULL,
    data text NOT NULL,
    sequence smallint NOT NULL,
    tenants_id uuid NOT NULL
);


ALTER TABLE public.connectors_tenants OWNER TO fusionauth;

--
-- Name: consents; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.consents (
    id uuid NOT NULL,
    consent_email_templates_id uuid,
    data text,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    email_plus_email_templates_id uuid
);


ALTER TABLE public.consents OWNER TO fusionauth;

--
-- Name: data_sets; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.data_sets (
    name character varying(191) NOT NULL,
    last_update_instant bigint NOT NULL
);


ALTER TABLE public.data_sets OWNER TO fusionauth;

--
-- Name: email_templates; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.email_templates (
    id uuid NOT NULL,
    default_from_name character varying(255),
    default_html_template text NOT NULL,
    default_subject character varying(255) NOT NULL,
    default_text_template text NOT NULL,
    from_email character varying(255),
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    localized_from_names text,
    localized_html_templates text NOT NULL,
    localized_subjects text NOT NULL,
    localized_text_templates text NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.email_templates OWNER TO fusionauth;

--
-- Name: event_logs; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.event_logs (
    id bigint NOT NULL,
    insert_instant bigint NOT NULL,
    message text NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.event_logs OWNER TO fusionauth;

--
-- Name: event_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: fusionauth
--

CREATE SEQUENCE public.event_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_logs_id_seq OWNER TO fusionauth;

--
-- Name: event_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusionauth
--

ALTER SEQUENCE public.event_logs_id_seq OWNED BY public.event_logs.id;


--
-- Name: external_identifiers; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.external_identifiers (
    id character varying(191) NOT NULL,
    applications_id uuid,
    data text,
    insert_instant bigint NOT NULL,
    tenants_id uuid NOT NULL,
    type smallint NOT NULL,
    users_id uuid
);


ALTER TABLE public.external_identifiers OWNER TO fusionauth;

--
-- Name: failed_logins; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.failed_logins (
    count integer NOT NULL,
    last_failed_instant bigint NOT NULL,
    tenants_id uuid NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.failed_logins OWNER TO fusionauth;

--
-- Name: families; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.families (
    data text,
    family_id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    owner boolean NOT NULL,
    role smallint NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.families OWNER TO fusionauth;

--
-- Name: federated_domains; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.federated_domains (
    identity_providers_id uuid NOT NULL,
    domain character varying(191) NOT NULL
);


ALTER TABLE public.federated_domains OWNER TO fusionauth;

--
-- Name: form_fields; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.form_fields (
    id uuid NOT NULL,
    consents_id uuid,
    data text,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.form_fields OWNER TO fusionauth;

--
-- Name: form_steps; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.form_steps (
    form_fields_id uuid NOT NULL,
    forms_id uuid NOT NULL,
    sequence smallint NOT NULL,
    step smallint NOT NULL
);


ALTER TABLE public.form_steps OWNER TO fusionauth;

--
-- Name: forms; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.forms (
    id uuid NOT NULL,
    data text,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.forms OWNER TO fusionauth;

--
-- Name: global_daily_active_users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.global_daily_active_users (
    count integer NOT NULL,
    day integer NOT NULL
);


ALTER TABLE public.global_daily_active_users OWNER TO fusionauth;

--
-- Name: global_monthly_active_users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.global_monthly_active_users (
    count integer NOT NULL,
    month integer NOT NULL
);


ALTER TABLE public.global_monthly_active_users OWNER TO fusionauth;

--
-- Name: global_registration_counts; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.global_registration_counts (
    count integer NOT NULL,
    decremented_count integer NOT NULL,
    hour integer NOT NULL
);


ALTER TABLE public.global_registration_counts OWNER TO fusionauth;

--
-- Name: group_application_roles; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.group_application_roles (
    application_roles_id uuid NOT NULL,
    groups_id uuid NOT NULL
);


ALTER TABLE public.group_application_roles OWNER TO fusionauth;

--
-- Name: group_members; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.group_members (
    id uuid NOT NULL,
    groups_id uuid NOT NULL,
    data text,
    insert_instant bigint NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.group_members OWNER TO fusionauth;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.groups (
    id uuid NOT NULL,
    data text,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    tenants_id uuid NOT NULL
);


ALTER TABLE public.groups OWNER TO fusionauth;

--
-- Name: hourly_logins; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.hourly_logins (
    applications_id uuid NOT NULL,
    count integer NOT NULL,
    data text,
    hour integer NOT NULL
);


ALTER TABLE public.hourly_logins OWNER TO fusionauth;

--
-- Name: identities; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.identities (
    id bigint NOT NULL,
    breached_password_last_checked_instant bigint,
    breached_password_status smallint,
    connectors_id uuid NOT NULL,
    email character varying(191),
    encryption_scheme character varying(255) NOT NULL,
    factor integer NOT NULL,
    insert_instant bigint NOT NULL,
    last_login_instant bigint,
    last_update_instant bigint NOT NULL,
    password character varying(255) NOT NULL,
    password_change_reason smallint,
    password_change_required boolean NOT NULL,
    password_last_update_instant bigint NOT NULL,
    salt character varying(255) NOT NULL,
    status smallint NOT NULL,
    tenants_id uuid NOT NULL,
    two_factor_delivery smallint NOT NULL,
    two_factor_enabled boolean NOT NULL,
    two_factor_secret character varying(255),
    username character varying(191),
    username_index character varying(191),
    username_status smallint NOT NULL,
    users_id uuid NOT NULL,
    verified boolean NOT NULL
);


ALTER TABLE public.identities OWNER TO fusionauth;

--
-- Name: identities_id_seq; Type: SEQUENCE; Schema: public; Owner: fusionauth
--

CREATE SEQUENCE public.identities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.identities_id_seq OWNER TO fusionauth;

--
-- Name: identities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusionauth
--

ALTER SEQUENCE public.identities_id_seq OWNED BY public.identities.id;


--
-- Name: identity_providers; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.identity_providers (
    id uuid NOT NULL,
    data text NOT NULL,
    enabled boolean NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    type character varying(255) NOT NULL,
    keys_id uuid,
    request_signing_keys_id uuid,
    reconcile_lambdas_id uuid
);


ALTER TABLE public.identity_providers OWNER TO fusionauth;

--
-- Name: identity_providers_applications; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.identity_providers_applications (
    applications_id uuid NOT NULL,
    data text NOT NULL,
    enabled boolean NOT NULL,
    identity_providers_id uuid NOT NULL,
    keys_id uuid
);


ALTER TABLE public.identity_providers_applications OWNER TO fusionauth;

--
-- Name: instance; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.instance (
    id uuid NOT NULL,
    encryption_key character varying(255),
    license_id character varying(255)
);


ALTER TABLE public.instance OWNER TO fusionauth;

--
-- Name: integrations; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.integrations (
    data text NOT NULL
);


ALTER TABLE public.integrations OWNER TO fusionauth;

--
-- Name: keys; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.keys (
    id uuid NOT NULL,
    algorithm character varying(10),
    certificate text,
    expiration_instant bigint,
    insert_instant bigint NOT NULL,
    issuer character varying(255),
    kid character varying(191) NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    private_key text,
    public_key text,
    secret text,
    type character varying(10) NOT NULL
);


ALTER TABLE public.keys OWNER TO fusionauth;

--
-- Name: lambdas; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.lambdas (
    id uuid NOT NULL,
    body text NOT NULL,
    debug boolean NOT NULL,
    enabled boolean NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(255) NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.lambdas OWNER TO fusionauth;

--
-- Name: locks; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.locks (
    type character varying(191) NOT NULL,
    update_instant bigint
);


ALTER TABLE public.locks OWNER TO fusionauth;

--
-- Name: master_record; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.master_record (
    id uuid NOT NULL,
    instant bigint NOT NULL
);


ALTER TABLE public.master_record OWNER TO fusionauth;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.migrations (
    name character varying(191) NOT NULL,
    run_instant bigint NOT NULL
);


ALTER TABLE public.migrations OWNER TO fusionauth;

--
-- Name: nodes; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.nodes (
    id uuid NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_checkin_instant bigint NOT NULL,
    runtime_mode character varying(255) NOT NULL,
    url character varying(255) NOT NULL
);


ALTER TABLE public.nodes OWNER TO fusionauth;

--
-- Name: previous_passwords; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.previous_passwords (
    insert_instant bigint NOT NULL,
    encryption_scheme character varying(255) NOT NULL,
    factor integer NOT NULL,
    password character varying(255) NOT NULL,
    salt character varying(255) NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.previous_passwords OWNER TO fusionauth;

--
-- Name: raw_application_daily_active_users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.raw_application_daily_active_users (
    applications_id uuid NOT NULL,
    day integer NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.raw_application_daily_active_users OWNER TO fusionauth;

--
-- Name: raw_application_monthly_active_users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.raw_application_monthly_active_users (
    applications_id uuid NOT NULL,
    month integer NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.raw_application_monthly_active_users OWNER TO fusionauth;

--
-- Name: raw_global_daily_active_users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.raw_global_daily_active_users (
    day integer NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.raw_global_daily_active_users OWNER TO fusionauth;

--
-- Name: raw_global_monthly_active_users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.raw_global_monthly_active_users (
    month integer NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.raw_global_monthly_active_users OWNER TO fusionauth;

--
-- Name: raw_logins; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.raw_logins (
    applications_id uuid,
    instant bigint NOT NULL,
    ip_address character varying(255),
    users_id uuid NOT NULL
);


ALTER TABLE public.raw_logins OWNER TO fusionauth;

--
-- Name: refresh_tokens; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.refresh_tokens (
    id uuid NOT NULL,
    applications_id uuid,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    start_instant bigint NOT NULL,
    token character varying(191) NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.refresh_tokens OWNER TO fusionauth;

--
-- Name: system_configuration; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.system_configuration (
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    report_timezone character varying(255) NOT NULL
);


ALTER TABLE public.system_configuration OWNER TO fusionauth;

--
-- Name: tenants; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.tenants (
    id uuid NOT NULL,
    access_token_signing_keys_id uuid NOT NULL,
    admin_user_forms_id uuid NOT NULL,
    confirm_child_email_template_id uuid,
    data text,
    failed_authentication_user_actions_id uuid,
    family_request_email_template_id uuid,
    forgot_password_email_templates_id uuid,
    id_token_signing_keys_id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    parent_registration_email_template_id uuid,
    passwordless_email_templates_id uuid,
    set_password_email_templates_id uuid,
    themes_id uuid NOT NULL,
    verification_email_templates_id uuid
);


ALTER TABLE public.tenants OWNER TO fusionauth;

--
-- Name: themes; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.themes (
    id uuid NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.themes OWNER TO fusionauth;

--
-- Name: user_action_logs; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.user_action_logs (
    id uuid NOT NULL,
    actioner_users_id uuid,
    actionee_users_id uuid NOT NULL,
    comment text,
    email_user_on_end boolean NOT NULL,
    end_event_sent boolean,
    expiry bigint,
    history text,
    insert_instant bigint NOT NULL,
    localized_name character varying(191),
    localized_option character varying(255),
    localized_reason character varying(255),
    name character varying(191),
    notify_user_on_end boolean NOT NULL,
    option_name character varying(255),
    reason character varying(255),
    reason_code character varying(255),
    user_actions_id uuid NOT NULL
);


ALTER TABLE public.user_action_logs OWNER TO fusionauth;

--
-- Name: user_action_logs_applications; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.user_action_logs_applications (
    applications_id uuid NOT NULL,
    user_action_logs_id uuid NOT NULL
);


ALTER TABLE public.user_action_logs_applications OWNER TO fusionauth;

--
-- Name: user_action_reasons; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.user_action_reasons (
    id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    localized_texts text,
    text character varying(191) NOT NULL,
    code character varying(191) NOT NULL
);


ALTER TABLE public.user_action_reasons OWNER TO fusionauth;

--
-- Name: user_actions; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.user_actions (
    id uuid NOT NULL,
    active boolean NOT NULL,
    cancel_email_templates_id uuid,
    end_email_templates_id uuid,
    include_email_in_event_json boolean NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    localized_names text,
    modify_email_templates_id uuid,
    name character varying(191) NOT NULL,
    options text,
    prevent_login boolean NOT NULL,
    send_end_event boolean NOT NULL,
    start_email_templates_id uuid,
    temporal boolean NOT NULL,
    transaction_type smallint NOT NULL,
    user_notifications_enabled boolean NOT NULL,
    user_emailing_enabled boolean NOT NULL
);


ALTER TABLE public.user_actions OWNER TO fusionauth;

--
-- Name: user_comments; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.user_comments (
    id uuid NOT NULL,
    comment text,
    commenter_id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.user_comments OWNER TO fusionauth;

--
-- Name: user_consents; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.user_consents (
    id uuid NOT NULL,
    consents_id uuid NOT NULL,
    data text,
    giver_users_id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.user_consents OWNER TO fusionauth;

--
-- Name: user_consents_email_plus; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.user_consents_email_plus (
    id bigint NOT NULL,
    next_email_instant bigint NOT NULL,
    user_consents_id uuid NOT NULL
);


ALTER TABLE public.user_consents_email_plus OWNER TO fusionauth;

--
-- Name: user_consents_email_plus_id_seq; Type: SEQUENCE; Schema: public; Owner: fusionauth
--

CREATE SEQUENCE public.user_consents_email_plus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_consents_email_plus_id_seq OWNER TO fusionauth;

--
-- Name: user_consents_email_plus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusionauth
--

ALTER SEQUENCE public.user_consents_email_plus_id_seq OWNED BY public.user_consents_email_plus.id;


--
-- Name: user_registrations; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.user_registrations (
    id uuid NOT NULL,
    applications_id uuid NOT NULL,
    authentication_token character varying(255),
    clean_speak_id uuid,
    data text,
    insert_instant bigint NOT NULL,
    last_login_instant bigint,
    last_update_instant bigint NOT NULL,
    timezone character varying(255),
    username character varying(191),
    username_status smallint NOT NULL,
    users_id uuid NOT NULL,
    verified boolean NOT NULL
);


ALTER TABLE public.user_registrations OWNER TO fusionauth;

--
-- Name: user_registrations_application_roles; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.user_registrations_application_roles (
    application_roles_id uuid NOT NULL,
    user_registrations_id uuid NOT NULL
);


ALTER TABLE public.user_registrations_application_roles OWNER TO fusionauth;

--
-- Name: users; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    active boolean NOT NULL,
    birth_date character(10),
    clean_speak_id uuid,
    data text,
    expiry bigint,
    first_name character varying(255),
    full_name character varying(255),
    image_url text,
    insert_instant bigint NOT NULL,
    last_name character varying(255),
    last_update_instant bigint NOT NULL,
    middle_name character varying(255),
    mobile_phone character varying(255),
    parent_email character varying(255),
    tenants_id uuid NOT NULL,
    timezone character varying(255)
);


ALTER TABLE public.users OWNER TO fusionauth;

--
-- Name: version; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.version (
    version character varying(255) NOT NULL
);


ALTER TABLE public.version OWNER TO fusionauth;

--
-- Name: webhooks; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.webhooks (
    id uuid NOT NULL,
    connect_timeout integer NOT NULL,
    description character varying(255),
    data text,
    global boolean NOT NULL,
    headers text,
    http_authentication_username character varying(255),
    http_authentication_password character varying(255),
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    read_timeout integer NOT NULL,
    ssl_certificate text,
    url text NOT NULL
);


ALTER TABLE public.webhooks OWNER TO fusionauth;

--
-- Name: webhooks_applications; Type: TABLE; Schema: public; Owner: fusionauth
--

CREATE TABLE public.webhooks_applications (
    webhooks_id uuid NOT NULL,
    applications_id uuid NOT NULL
);


ALTER TABLE public.webhooks_applications OWNER TO fusionauth;

--
-- Name: audit_logs id; Type: DEFAULT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.audit_logs ALTER COLUMN id SET DEFAULT nextval('public.audit_logs_id_seq'::regclass);


--
-- Name: event_logs id; Type: DEFAULT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.event_logs ALTER COLUMN id SET DEFAULT nextval('public.event_logs_id_seq'::regclass);


--
-- Name: identities id; Type: DEFAULT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identities ALTER COLUMN id SET DEFAULT nextval('public.identities_id_seq'::regclass);


--
-- Name: user_consents_email_plus id; Type: DEFAULT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_consents_email_plus ALTER COLUMN id SET DEFAULT nextval('public.user_consents_email_plus_id_seq'::regclass);


--
-- Data for Name: application_daily_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.application_daily_active_users (applications_id, count, day) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	18736
1b62d181-b4f9-4b44-87ad-38a2e29066b6	1	18736
\.


--
-- Data for Name: application_monthly_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.application_monthly_active_users (applications_id, count, month) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	615
1b62d181-b4f9-4b44-87ad-38a2e29066b6	1	615
\.


--
-- Data for Name: application_registration_counts; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.application_registration_counts (applications_id, count, decremented_count, hour) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	0	449683
1b62d181-b4f9-4b44-87ad-38a2e29066b6	1	0	449683
\.


--
-- Data for Name: application_roles; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.application_roles (id, applications_id, description, insert_instant, is_default, is_super_role, last_update_instant, name) FROM stdin;
631ecd9d-8d40-4c13-8277-80cedb8236e2	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Global admin	1618860007305	f	t	1618860007305	admin
631ecd9d-8d40-4c13-8277-80cedb8236e3	3c219e58-ed0e-4b18-ad48-f4f92793ae32	API key manager	1618860007305	f	f	1618860007305	api_key_manager
631ecd9d-8d40-4c13-8277-80cedb8236e4	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Application deleter	1618860007305	f	f	1618860007305	application_deleter
631ecd9d-8d40-4c13-8277-80cedb8236e5	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Application manager	1618860007305	f	f	1618860007305	application_manager
631ecd9d-8d40-4c13-8277-80cedb8236e6	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Audit log viewer	1618860007305	f	f	1618860007305	audit_log_viewer
631ecd9d-8d40-4c13-8277-80cedb8236e7	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Email template manager	1618860007305	f	f	1618860007305	email_template_manager
631ecd9d-8d40-4c13-8277-80cedb8236e8	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Report viewer	1618860007305	f	f	1618860007305	report_viewer
631ecd9d-8d40-4c13-8277-80cedb8236e9	3c219e58-ed0e-4b18-ad48-f4f92793ae32	System configuration manager	1618860007305	f	f	1618860007305	system_manager
631ecd9d-8d40-4c13-8277-80cedb8236f0	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User action deleter	1618860007305	f	f	1618860007305	user_action_deleter
631ecd9d-8d40-4c13-8277-80cedb8236f1	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User action manager	1618860007305	f	f	1618860007305	user_action_manager
631ecd9d-8d40-4c13-8277-80cedb8236f2	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User deleter	1618860007305	f	f	1618860007305	user_deleter
631ecd9d-8d40-4c13-8277-80cedb8236f3	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User manager	1618860007305	f	f	1618860007305	user_manager
631ecd9d-8d40-4c13-8277-80cedb8236f4	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Webhook manager	1618860007305	f	f	1618860007305	webhook_manager
631ecd9d-8d40-4c13-8277-80cedb8236f5	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Group manager	1618860007305	f	f	1618860007305	group_manager
631ecd9d-8d40-4c13-8277-80cedb8236f6	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Group deleter	1618860007305	f	f	1618860007305	group_deleter
631ecd9d-8d40-4c13-8277-80cedb8236f7	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Tenant manager	1618860007305	f	f	1618860007305	tenant_manager
631ecd9d-8d40-4c13-8277-80cedb8236f8	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Tenant deleter	1618860007305	f	f	1618860007305	tenant_deleter
631ecd9d-8d40-4c13-8277-80cedb8236f9	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Lambda manager	1618860007305	f	f	1618860007305	lambda_manager
631ecd9d-8d40-4c13-8277-80cedb8236fa	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Event log viewer	1618860007305	f	f	1618860007305	event_log_viewer
631ecd9d-8d40-4c13-8277-80cedb8236fb	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Key manager	1618860007305	f	f	1618860007305	key_manager
631ecd9d-8d40-4c13-8277-80cedb8236fc	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Consent deleter	1618860007305	f	f	1618860007305	consent_deleter
631ecd9d-8d40-4c13-8277-80cedb8236fd	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Consent manager	1618860007305	f	f	1618860007305	consent_manager
631ecd9d-8d40-4c13-8277-80cedb8236fe	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Theme manager	1618860007305	f	f	1618860007305	theme_manager
631ecd9d-8d40-4c13-8277-80cedb8236ff	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Reactor manager	1618860007305	f	f	1618860007305	reactor_manager
631ecd9d-8d40-4c13-8277-80cedb823700	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Connector deleter	1618860007305	f	f	1618860007305	connector_deleter
631ecd9d-8d40-4c13-8277-80cedb823701	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Connector manager	1618860007305	f	f	1618860007305	connector_manager
631ecd9d-8d40-4c13-8277-80cedb823702	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Form deleter	1618860007305	f	f	1618860007305	form_deleter
631ecd9d-8d40-4c13-8277-80cedb823703	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Form manager	1618860007305	f	f	1618860007305	form_manager
631ecd9d-8d40-4c13-8277-80cedb823704	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User support manager	1618860007305	f	f	1618860007305	user_support_manager
631ecd9d-8d40-4c13-8277-80cedb823705	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User support viewer	1618860007305	f	f	1618860007305	user_support_viewer
\.


--
-- Data for Name: applications; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.applications (id, access_token_populate_lambdas_id, access_token_signing_keys_id, active, admin_registration_forms_id, data, email_verification_email_templates_id, forgot_password_email_templates_id, forms_id, id_token_populate_lambdas_id, id_token_signing_keys_id, insert_instant, last_update_instant, name, passwordless_email_templates_id, samlv2_default_verification_keys_id, samlv2_issuer, samlv2_keys_id, samlv2_logout_keys_id, samlv2_logout_default_verification_keys_id, samlv2_populate_lambdas_id, samlv2_single_logout_keys_id, set_password_email_templates_id, tenants_id, verification_email_templates_id) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	\N	ca626210-ee40-8442-ed72-e25febe604eb	t	19215fdc-546f-89a6-e437-326b6eeafb84	{"jwtConfiguration": {"enabled": true, "timeToLiveInSeconds": 60, "refreshTokenExpirationPolicy": "SlidingWindow", "refreshTokenTimeToLiveInMinutes": 60, "refreshTokenUsagePolicy": "Reusable"},"registrationConfiguration": {"type":"basic"}, "oauthConfiguration": {"authorizedRedirectURLs": ["/login"], "clientId": "3c219e58-ed0e-4b18-ad48-f4f92793ae32", "clientSecret": "M2ZmNTMwNDZhNWZkMzkxY2M2NTEzOWFmMzhkYjQwMDRiZDRkYTM1ZjY3NjFkZDI2NTI5YzQ2MzY2YTAyOGNkNQ==", "enabledGrants": ["authorization_code"], "logoutURL": "/", "generateRefreshTokens": true, "requireClientAuthentication": true}, "loginConfiguration": {"allowTokenRefresh": false, "generateRefreshTokens": false, "requireAuthentication": true},"state": "Active"}	\N	\N	\N	\N	092dbedc-30af-4149-9c61-b578f2c72f59	1618860007305	1618860007305	FusionAuth	\N	\N	\N	\N	\N	\N	\N	\N	\N	d993c51d-3d11-9558-de39-11d0f8801886	\N
1b62d181-b4f9-4b44-87ad-38a2e29066b6	\N	ca626210-ee40-8442-ed72-e25febe604eb	t	19215fdc-546f-89a6-e437-326b6eeafb84	{"authenticationTokenConfiguration":{"enabled":false},"data":{},"formConfiguration":{"adminRegistrationFormId":"19215fdc-546f-89a6-e437-326b6eeafb84"},"jwtConfiguration":{"enabled":false,"refreshTokenExpirationPolicy":"Fixed","refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"loginConfiguration":{"allowTokenRefresh":false,"generateRefreshTokens":false,"requireAuthentication":true},"oauthConfiguration":{"authorizedRedirectURLs":["com.example.loginsso://oauth2"],"clientId":"1b62d181-b4f9-4b44-87ad-38a2e29066b6","clientSecret":"ncTyd5K1Xz0hscITpmHBnenE5Do4hbRcJ_vxqInvctg","debug":true,"enabledGrants":["authorization_code"],"generateRefreshTokens":false,"logoutBehavior":"AllApplications","logoutURL":"http://localhost:8080/logout","requireClientAuthentication":false},"passwordlessConfiguration":{"enabled":false},"registrationConfiguration":{"birthDate":{"enabled":false,"required":false},"confirmPassword":false,"enabled":false,"firstName":{"enabled":false,"required":false},"fullName":{"enabled":false,"required":false},"lastName":{"enabled":false,"required":false},"loginIdType":"email","middleName":{"enabled":false,"required":false},"mobilePhone":{"enabled":false,"required":false},"type":"basic"},"registrationDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":30}},"samlv2Configuration":{"debug":false,"enabled":false,"logout":{"behavior":"AllParticipants","requireSignedRequests":false,"singleLogout":{"enabled":false,"xmlSignatureC14nMethod":"exclusive_with_comments"},"xmlSignatureC14nMethod":"exclusive_with_comments"},"requireSignedRequests":false,"xmlSignatureC14nMethod":"exclusive_with_comments","xmlSignatureLocation":"Assertion"},"state":"Active","verifyRegistration":false}	\N	\N	\N	a0a2054a-de24-4463-80d9-5dc78eaee66f	092dbedc-30af-4149-9c61-b578f2c72f59	1618860404314	1618860885875	IdentityServer4	\N	\N	\N	\N	\N	\N	\N	\N	\N	fd156c8e-8b55-4d81-83c8-589e6b8d15ff	\N
\.


--
-- Data for Name: asynchronous_tasks; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.asynchronous_tasks (id, data, entity_id, insert_instant, last_update_instant, nodes_id, status, type) FROM stdin;
\.


--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.audit_logs (id, insert_instant, insert_user, message, data) FROM stdin;
\.


--
-- Data for Name: authentication_keys; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.authentication_keys (id, insert_instant, last_update_instant, permissions, meta_data, tenants_id) FROM stdin;
__internal_MmFkYTQwMTYyNmYxYWUyMjEwODQ1ZmY3NDNjYjE1YWE0YmY5ZTIyNjUxYzE3YThiMDkzMzNhZTk4YTAxNzMwYw==	1618860007305	1618860007305	{"endpoints": {"/api/cache/reload": ["POST"], "/api/system/log/export": ["POST"]}}	{"attributes": {"description": "Internal Use Only. [DistributedCacheNotifier][DistributedLogDownloader]", "internalCacheReloader": "true", "internalLogDownloader": "true"}}	\N
XmDDjxZ2lN_hJ53sYr8FenCqAIhxe4Vb96uAMLrje9YTUkEl-tPowuck	1618860789204	1618860789204	{"endpoints":{"/api/user":["GET"],"/api/user/registration":["GET"]}}	{"attributes":{"description":"IdentityServer4"}}	fd156c8e-8b55-4d81-83c8-589e6b8d15ff
\.


--
-- Data for Name: breached_password_metrics; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.breached_password_metrics (tenants_id, matched_exact_count, matched_sub_address_count, matched_common_password_count, matched_password_count, passwords_checked_count) FROM stdin;
\.


--
-- Data for Name: clean_speak_applications; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.clean_speak_applications (applications_id, clean_speak_application_id) FROM stdin;
\.


--
-- Data for Name: common_breached_passwords; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.common_breached_passwords (password) FROM stdin;
\.


--
-- Data for Name: connectors; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.connectors (id, data, insert_instant, last_update_instant, name, reconcile_lambdas_id, ssl_certificate_keys_id, type) FROM stdin;
e3306678-a53a-4964-9040-1c96f36dda72	{}	1618860007305	1618860007305	Default	\N	\N	0
\.


--
-- Data for Name: connectors_tenants; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.connectors_tenants (connectors_id, data, sequence, tenants_id) FROM stdin;
e3306678-a53a-4964-9040-1c96f36dda72	{"data":{},"domains":["*"],"migrate":false}	0	d993c51d-3d11-9558-de39-11d0f8801886
e3306678-a53a-4964-9040-1c96f36dda72	{"data":{},"domains":["*"],"migrate":false}	0	fd156c8e-8b55-4d81-83c8-589e6b8d15ff
\.


--
-- Data for Name: consents; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.consents (id, consent_email_templates_id, data, insert_instant, last_update_instant, name, email_plus_email_templates_id) FROM stdin;
653b4ce9-ff18-4632-a293-81b8348672f6	e7bc6bb6-16e4-47de-9823-b3ae0945006c	{"countryMinimumAgeForSelfConsent":{},"data":{},"defaultMinimumAgeForSelfConsent":13,"emailPlus":{"enabled":true,"maximumTimeToSendEmailInHours":48,"minimumTimeToSendEmailInHours":24},"multipleValuesAllowed":false,"values":[]}	1618860094832	1618860094832	COPPA Email+	84b7724e-f9a9-45c9-9a32-90223b6e1401
149774dd-54e5-402f-a4f6-8d70bf9d5fb0	e7bc6bb6-16e4-47de-9823-b3ae0945006c	{"countryMinimumAgeForSelfConsent":{},"data":{},"defaultMinimumAgeForSelfConsent":13,"emailPlus":{"enabled":false,"maximumTimeToSendEmailInHours":48,"minimumTimeToSendEmailInHours":24},"multipleValuesAllowed":false,"values":[]}	1618860094846	1618860094846	COPPA VPC	\N
\.


--
-- Data for Name: data_sets; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.data_sets (name, last_update_instant) FROM stdin;
BreachPasswords	1581476456155
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.email_templates (id, default_from_name, default_html_template, default_subject, default_text_template, from_email, insert_instant, last_update_instant, localized_from_names, localized_html_templates, localized_subjects, localized_text_templates, name) FROM stdin;
637cfda0-d9b5-4493-92c3-998a6dafce5e	\N	[#setting url_escaping_charset="UTF-8"]\nTo change your password click on the following link.\n<p>\n  [#-- The optional 'state' map provided on the Forgot Password API call is exposed in the template as 'state' --]\n  [#assign url = "http://localhost:9011/password/change/${changePasswordId}?tenantId=${user.tenantId}" /]\n  [#list state!{} as key, value][#if key != "tenantId" && value??][#assign url = url + "&" + key?url + "=" + value?url/][/#if][/#list]\n  <a href="${url}">${url}</a>\n</p>\n- FusionAuth Admin\n	Reset your password	[#setting url_escaping_charset="UTF-8"]\nTo change your password click on the following link.\n\n[#-- The optional 'state' map provided on the Forgot Password API call is exposed in the template as 'state' --]\n[#assign url = "http://localhost:9011/password/change/${changePasswordId}?tenantId=${user.tenantId}" /]\n[#list state!{} as key, value][#if key != "tenantId" && value??][#assign url = url + "&" + key?url + "=" + value?url/][/#if][/#list]\n\n${url}\n\n- FusionAuth Admin\n	\N	1618860094771	1618860094771	{}	{}	{}	{}	Forgot Password
2db259df-4627-4bfa-9bce-7e57ab4e6515	\N	[#setting url_escaping_charset="UTF-8"]\nYou have requested to log into FusionAuth using this email address. If you do not recognize this request please ignore this email.\n<p>\n  [#-- The optional 'state' map provided on the Start Passwordless API call is exposed in the template as 'state' --]\n  [#assign url = "http://localhost:9011/oauth2/passwordless/${code}?tenantId=${user.tenantId}" /]\n  [#list state!{} as key, value][#if key != "tenantId" && value??][#assign url = url + "&" + key?url + "=" + value?url/][/#if][/#list]\n  <a href="${url}">${url}</a>\n</p>\n- FusionAuth Admin\n	Log into FusionAuth	[#setting url_escaping_charset="UTF-8"]\nYou have requested to log into FusionAuth using this email address. If you do not recognize this request please ignore this email.\n\n[#-- The optional 'state' map provided on the Start Passwordless API call is exposed in the template as 'state' --]\n[#assign url = "http://localhost:9011/oauth2/passwordless/${code}?tenantId=${user.tenantId}" /]\n[#list state!{} as key, value][#if key != "tenantId" && value??][#assign url = url + "&" + key?url + "=" + value?url/][/#if][/#list]\n\n${url}\n\n- FusionAuth Admin\n	\N	1618860094780	1618860094780	{}	{}	{}	{}	Passwordless Login
c5c76cb7-b82d-46eb-8274-c51ce60224b1	\N	Your account has been created and you must setup a password. Click on the following link to setup your password.\n<p>\n  <a href="http://localhost:9011/password/change/${changePasswordId}?tenantId=${user.tenantId}">\n    http://localhost:9011/password/change/${changePasswordId}?tenantId=${user.tenantId}\n  </a>\n</p>\n- FusionAuth Admin	Setup your password	Your account has been created and you must setup a password. Click on the following link to setup your password.\n\nhttp://localhost:9011/password/change/${changePasswordId}?tenantId=${user.tenantId}\n\n- FusionAuth Admin	\N	1618860094783	1618860094783	{}	{}	{}	{}	Setup Password
0e78620d-a149-49df-945d-db33fe166475	\N	[#if user.verified]\nPro tip, your email has already been verified, but feel free to complete the verification process to verify your verification of your email address.\n[/#if]\n\nTo complete your email verification click on the following link.\n<p>\n  <a href="http://localhost:9011/email/verify/${verificationId}?tenantId=${user.tenantId}">\n    http://localhost:9011/email/verify/${verificationId}?tenantId=${user.tenantId}\n  </a>\n</p>\n\n- FusionAuth Admin	Verify your FusionAuth email address	[#if user.verified]\nPro tip, your email has already been verified, but feel free to complete the verification process to verify your verification of your email address.\n[/#if]\n\nTo complete your email verification click on the following link.\n\nhttp://localhost:9011/email/verify/${verificationId}?tenantId=${user.tenantId}\n\n- FusionAuth Admin	\N	1618860094790	1618860094790	{}	{}	{}	{}	Email Verification
614fadf6-a93d-4162-9309-79699136d55b	\N	[#setting url_escaping_charset="UTF-8"]\n<p>This password was found in the list of vulnerable passwords, and is no longer secure.</p>\n\n<p>In order to secure your account, it is recommended to change your password at your earliest convenience.</p>\n\n<p>Follow this link to change your password.</p>\n\n<a href="http://localhost:9011/password/forgot?email=${user.email?url}&tenantId=${user.tenantId}">\n  http://localhost:9011/password/forgot?email=${user.email?url}&tenantId=${user.tenantId}\n</a>\n\n- FusionAuth Admin	Your password is not secure	[#setting url_escaping_charset="UTF-8"]\nThis password was found in the list of vulnerable passwords, and is no longer secure.\n\nIn order to secure your account, it is recommended to change your password at your earliest convenience.\n\nFollow this link to change your password.\n\nhttp://localhost:9011/password/forgot?email=${user.email?url}&tenantId=${user.tenantId}\n\n- FusionAuth Admin\n\n\n	\N	1618860094795	1618860094795	{}	{}	{}	{}	Breached Password Notification
1d63ce4e-c406-417a-a3b8-12450e181b68	\N	[#if registration.verified]\nPro tip, your registration has already been verified, but feel free to complete the verification process to verify your verification of your registration.\n[/#if]\n\nTo complete your registration verification click on the following link.\n<p>\n  <a href="http://localhost:9011/registration/verify/${verificationId}?tenantId=${user.tenantId}">\n    http://localhost:9011/registration/verify/${verificationId}?tenantId=${user.tenantId}\n  </a>\n</p>\n- FusionAuth Admin	Verify your registration	[#if registration.verified]\nPro tip, your registration has already been verified, but feel free to complete the verification process to verify your verification of your registration.\n[/#if]\n\nTo complete your registration verification click on the following link.\n\nhttp://localhost:9011/registration/verify/${verificationId}?tenantId=${user.tenantId}\n\n- FusionAuth Admin	\N	1618860094826	1618860094826	{}	{}	{}	{}	Registration Verification
e7bc6bb6-16e4-47de-9823-b3ae0945006c	\N	You recently granted your child consent in our system. This email is to notify you of this consent. If you did not grant this consent or wish to revoke this consent, click the link below:\n<p>\n  <a href="http://example.com/consent/manage">http://example.com/consent/manage</a>\n</p>\n- FusionAuth Admin	Notice of your consent	You recently granted your child consent in our system. This email is to notify you of this consent. If you did not grant this consent or wish to revoke this consent, click the link below:\n\nhttp://example.com/consent/manage\n\n- FusionAuth Admin	\N	1618860094828	1618860094828	{}	{}	{}	{}	COPPA Notice
84b7724e-f9a9-45c9-9a32-90223b6e1401	\N	A while ago, you granted your child consent in our system. This email is a second notice of this consent as required by law and also to remind to that you can revoke this consent at anytime on our website or by clicking the link below:\n<p>\n  <a href="http://example.com/consent/manage">http://example.com/consent/manage</a>\n</p>\n- FusionAuth Admin	Reminder: Notice of your consent	A while ago, you granted your child consent in our system. This email is a second notice of this consent as required by law and also to remind to that you can revoke this consent at anytime on our website or by clicking the link below:\n\nhttp://example.com/consent/manage\n\n- FusionAuth Admin	\N	1618860094829	1618860094829	{}	{}	{}	{}	COPPA Notice Reminder
\.


--
-- Data for Name: event_logs; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.event_logs (id, insert_instant, message, type) FROM stdin;
\.


--
-- Data for Name: external_identifiers; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.external_identifiers (id, applications_id, data, insert_instant, tenants_id, type, users_id) FROM stdin;
\.


--
-- Data for Name: failed_logins; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.failed_logins (count, last_failed_instant, tenants_id, users_id) FROM stdin;
\.


--
-- Data for Name: families; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.families (data, family_id, insert_instant, last_update_instant, owner, role, users_id) FROM stdin;
\.


--
-- Data for Name: federated_domains; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.federated_domains (identity_providers_id, domain) FROM stdin;
18ca0ac2-b7c4-4f18-8201-5352a3eac2d4	email.com
\.


--
-- Data for Name: form_fields; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.form_fields (id, consents_id, data, insert_instant, last_update_instant, name) FROM stdin;
5ade91c8-4d0e-bb7f-fa39-f38f0b87d19f	\N	{"key": "user.email", "control": "text", "required": true, "type": "email", "data": {"leftAddon": "user"}}	1618860007305	1618860007305	Email
1a8dd273-d28b-aacf-bf5f-ffe694af0a66	\N	{"key": "user.password", "control": "password", "required": true, "type": "string", "data": {"leftAddon": "lock"}}	1618860007305	1618860007305	Password
17093e48-2f1a-69ee-87b3-ef9d648df55c	\N	{"key": "user.firstName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1618860007305	1618860007305	First name
8be5654c-c5de-c70e-862d-08b03ecbeab4	\N	{"key": "user.middleName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1618860007305	1618860007305	Middle name
dbaf5e6f-cb85-b611-3f6b-39ad3bc83ee8	\N	{"key": "user.lastName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1618860007305	1618860007305	Last name
63be4acd-cc71-cba8-3267-fc9c2c4dada8	\N	{"key": "user.fullName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1618860007305	1618860007305	Full name
9cc1472b-14f0-11fc-2e4b-b1d1900ed1e4	\N	{"key": "user.birthDate", "control": "text", "required": false, "type": "date", "data": {"leftAddon": "calendar"}}	1618860007305	1618860007305	Birthdate
c37759a2-6dda-5099-dce2-a4110fd20d80	\N	{"key": "user.mobilePhone", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "mobile"}}	1618860007305	1618860007305	Mobile phone
9bf89c15-5273-30ea-51f7-e7afd0a1dcd1	\N	{"key": "user.username", "control": "text", "required": true, "type": "string", "data": {"leftAddon": "user"}}	1618860007305	1618860007305	Username
24fa82c6-4109-adff-2ff5-5d559b4098dd	\N	{"key": "registration.preferredLanguages", "control": "select", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1618860007305	1618860007305	[Admin Registration] preferred languages
c372dfb0-dadd-d949-061d-eac7fe6c6ae8	\N	{"key": "registration.roles", "control": "checkbox", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1618860007305	1618860007305	[Admin Registration] roles
9fd5fba6-1fd6-82d9-319c-9344a75786d1	\N	{"key": "registration.timezone", "control": "select", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1618860007305	1618860007305	[Admin Registration] timezone
911f3890-cd0b-6863-8171-188ece682fd7	\N	{"key": "registration.username", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "user"}}	1618860007305	1618860007305	[Admin Registration] username
87571671-eb35-e4ef-b555-6ce6a9d20d89	\N	{"key": "user.birthDate", "control": "text", "required": false, "type": "date", "data": {"leftAddon": "calendar"}}	1618860007305	1618860007305	[Admin User] birthdate
40d18568-f2e2-2a13-033b-701f298d05ff	\N	{"key": "user.email", "control": "text", "required": false, "type": "email", "data": {"leftAddon": "user"}}	1618860007305	1618860007305	[Admin User] email
617bcd60-3e97-8c27-aa92-da79eb92e185	\N	{"key": "user.firstName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1618860007305	1618860007305	[Admin User] first name
178b35ad-e6d2-0014-d985-db0ba04aed19	\N	{"key": "user.fullName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1618860007305	1618860007305	[Admin User] full name
fab1d174-60e0-e898-3919-768606eade58	\N	{"key": "user.imageUrl", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1618860007305	1618860007305	[Admin User] image URL
dd48bc62-1147-c620-48c1-1d05b6de00aa	\N	{"key": "user.lastName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1618860007305	1618860007305	[Admin User] last name
71ecd1fa-bff5-13e7-cd0e-d5e6e1e246e8	\N	{"key": "user.middleName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1618860007305	1618860007305	[Admin User] middle name
f959d10e-4b70-8af1-0f65-3b9653ed4129	\N	{"key": "user.mobilePhone", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "mobile"}}	1618860007305	1618860007305	[Admin User] mobile phone
4d4574c6-5564-4ca0-2b24-1057c8e97274	\N	{"key": "user.password", "control": "password", "required": true, "confirm": true, "type": "string", "data": {"leftAddon": "lock"}}	1618860007305	1618860007305	[Admin User] password
bbd7239d-b4dd-b979-20ca-cd27cdcf02bf	\N	{"key": "user.preferredLanguages", "control": "select", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1618860007305	1618860007305	[Admin User] preferred languages
6c1917a3-b225-8815-ec48-36b4d3939c8b	\N	{"key": "user.timezone", "control": "select", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1618860007305	1618860007305	[Admin User] timezone
94e2d9d8-dfc1-e804-6ed9-9727d9e8653f	\N	{"key": "user.twoFactorEnabled", "control": "checkbox", "required": false, "type": "bool", "data": {"leftAddon": "info"}}	1618860007305	1618860007305	[Admin User] enable two factor
54106cb9-a436-af1f-6fb5-ee34e7fd7d89	\N	{"key": "user.username", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "user"}}	1618860007305	1618860007305	[Admin User] username
\.


--
-- Data for Name: form_steps; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.form_steps (form_fields_id, forms_id, sequence, step) FROM stdin;
911f3890-cd0b-6863-8171-188ece682fd7	19215fdc-546f-89a6-e437-326b6eeafb84	0	0
24fa82c6-4109-adff-2ff5-5d559b4098dd	19215fdc-546f-89a6-e437-326b6eeafb84	1	0
9fd5fba6-1fd6-82d9-319c-9344a75786d1	19215fdc-546f-89a6-e437-326b6eeafb84	2	0
c372dfb0-dadd-d949-061d-eac7fe6c6ae8	19215fdc-546f-89a6-e437-326b6eeafb84	3	0
40d18568-f2e2-2a13-033b-701f298d05ff	ffd38f00-eba9-3126-4538-995cbcffdd3a	0	0
54106cb9-a436-af1f-6fb5-ee34e7fd7d89	ffd38f00-eba9-3126-4538-995cbcffdd3a	1	0
f959d10e-4b70-8af1-0f65-3b9653ed4129	ffd38f00-eba9-3126-4538-995cbcffdd3a	2	0
4d4574c6-5564-4ca0-2b24-1057c8e97274	ffd38f00-eba9-3126-4538-995cbcffdd3a	3	0
94e2d9d8-dfc1-e804-6ed9-9727d9e8653f	ffd38f00-eba9-3126-4538-995cbcffdd3a	0	1
87571671-eb35-e4ef-b555-6ce6a9d20d89	ffd38f00-eba9-3126-4538-995cbcffdd3a	0	2
617bcd60-3e97-8c27-aa92-da79eb92e185	ffd38f00-eba9-3126-4538-995cbcffdd3a	1	2
71ecd1fa-bff5-13e7-cd0e-d5e6e1e246e8	ffd38f00-eba9-3126-4538-995cbcffdd3a	2	2
dd48bc62-1147-c620-48c1-1d05b6de00aa	ffd38f00-eba9-3126-4538-995cbcffdd3a	3	2
178b35ad-e6d2-0014-d985-db0ba04aed19	ffd38f00-eba9-3126-4538-995cbcffdd3a	4	2
bbd7239d-b4dd-b979-20ca-cd27cdcf02bf	ffd38f00-eba9-3126-4538-995cbcffdd3a	5	2
6c1917a3-b225-8815-ec48-36b4d3939c8b	ffd38f00-eba9-3126-4538-995cbcffdd3a	6	2
fab1d174-60e0-e898-3919-768606eade58	ffd38f00-eba9-3126-4538-995cbcffdd3a	7	2
\.


--
-- Data for Name: forms; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.forms (id, data, insert_instant, last_update_instant, name, type) FROM stdin;
19215fdc-546f-89a6-e437-326b6eeafb84	\N	1618860007305	1618860007305	Default Admin Registration provided by FusionAuth	1
ffd38f00-eba9-3126-4538-995cbcffdd3a	\N	1618860007305	1618860007305	Default Admin User provided by FusionAuth	2
\.


--
-- Data for Name: global_daily_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.global_daily_active_users (count, day) FROM stdin;
2	18736
\.


--
-- Data for Name: global_monthly_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.global_monthly_active_users (count, month) FROM stdin;
2	615
\.


--
-- Data for Name: global_registration_counts; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.global_registration_counts (count, decremented_count, hour) FROM stdin;
2	0	449683
\.


--
-- Data for Name: group_application_roles; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.group_application_roles (application_roles_id, groups_id) FROM stdin;
\.


--
-- Data for Name: group_members; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.group_members (id, groups_id, data, insert_instant, users_id) FROM stdin;
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.groups (id, data, insert_instant, last_update_instant, name, tenants_id) FROM stdin;
\.


--
-- Data for Name: hourly_logins; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.hourly_logins (applications_id, count, data, hour) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	\N	449683
1b62d181-b4f9-4b44-87ad-38a2e29066b6	2	\N	449683
1b62d181-b4f9-4b44-87ad-38a2e29066b6	10	\N	449685
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.identities (id, breached_password_last_checked_instant, breached_password_status, connectors_id, email, encryption_scheme, factor, insert_instant, last_login_instant, last_update_instant, password, password_change_reason, password_change_required, password_last_update_instant, salt, status, tenants_id, two_factor_delivery, two_factor_enabled, two_factor_secret, username, username_index, username_status, users_id, verified) FROM stdin;
1	\N	\N	e3306678-a53a-4964-9040-1c96f36dda72	lima@jhordan.com	salted-pbkdf2-hmac-sha256	24000	1618860094465	1618860149554	1618860094465	aeX2+dzSKJ+bcgnslfUzDUOwEJcBUX98dxZpk2znr30=	\N	f	1618860094681	g9rhVCcyWwcVLWOHfd9FVZkBaUyZqCEC/37ZTMAJQ4I=	0	d993c51d-3d11-9558-de39-11d0f8801886	0	f	\N	\N	\N	0	4a4246a5-79b0-498b-a59a-8c805f4db71e	t
2	\N	\N	e3306678-a53a-4964-9040-1c96f36dda72	bobsmith@email.com	salted-pbkdf2-hmac-sha256	24000	1618861220583	1618869444964	1618869444964	HdCV2kXeD20Rk2+DkQ7O0bV8/jL93NtVhiuangxrNuo=	\N	f	1618861220667	i+pdXD430JLHwqnghBBCZJdpmEkmiHA4prDLCAL/Reg=	0	fd156c8e-8b55-4d81-83c8-589e6b8d15ff	0	f	\N	\N	\N	0	4c5e57e5-1684-4f98-bcfb-6d480cf26a29	t
\.


--
-- Data for Name: identity_providers; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.identity_providers (id, data, enabled, insert_instant, last_update_instant, name, type, keys_id, request_signing_keys_id, reconcile_lambdas_id) FROM stdin;
18ca0ac2-b7c4-4f18-8201-5352a3eac2d4	{"buttonImageURL":"https://demo.identityserver.io/icon.jpg","buttonText":"Login with IdentityServer4","data":{},"debug":true,"oauth2":{"authorization_endpoint":"https://demo.identityserver.io/connect/authorize?prompt=login","clientAuthenticationMethod":"client_secret_basic","client_id":"interactive.confidential","client_secret":"secret","emailClaim":"email","scope":"openid profile email api offline_access","token_endpoint":"https://demo.identityserver.io/connect/token","userinfo_endpoint":"https://demo.identityserver.io/connect/userinfo"},"postRequest":false}	t	1618860746845	1618861240768	IdentityServer4	OpenIDConnect	\N	\N	fb243871-37d5-4ce1-bee3-53b88476d74e
\.


--
-- Data for Name: identity_providers_applications; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.identity_providers_applications (applications_id, data, enabled, identity_providers_id, keys_id) FROM stdin;
1b62d181-b4f9-4b44-87ad-38a2e29066b6	{"createRegistration":true,"data":{},"oauth2":{}}	t	18ca0ac2-b7c4-4f18-8201-5352a3eac2d4	\N
3c219e58-ed0e-4b18-ad48-f4f92793ae32	{"createRegistration":false,"data":{},"oauth2":{}}	f	18ca0ac2-b7c4-4f18-8201-5352a3eac2d4	\N
\.


--
-- Data for Name: instance; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.instance (id, encryption_key, license_id) FROM stdin;
7ff0b101-9041-87c2-d8f9-0cf381283eac	\N	\N
\.


--
-- Data for Name: integrations; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.integrations (data) FROM stdin;
{}
\.


--
-- Data for Name: keys; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.keys (id, algorithm, certificate, expiration_instant, insert_instant, issuer, kid, last_update_instant, name, private_key, public_key, secret, type) FROM stdin;
ca626210-ee40-8442-ed72-e25febe604eb	HS256	\N	\N	1618860003305	\N	19cdbf95e	1618860003305	Default signing key	\N	\N	SWmamGDtRrli/sdttbgp/939pLDs4+xD2aJvT+H4smQ=	HMAC
092dbedc-30af-4149-9c61-b578f2c72f59	HS256	\N	\N	1618860004305	\N	5fd53ce0b	1618860004305	OpenID Connect compliant HMAC using SHA-256	\N	\N	\N	HMAC
4b8f1c06-518e-45bd-9ac5-d549686ae02a	HS384	\N	\N	1618860005305	\N	fface247b	1618860005305	OpenID Connect compliant HMAC using SHA-384	\N	\N	\N	HMAC
c753a44d-7f2e-48d3-bc4e-c2c16488a23b	HS512	\N	\N	1618860006305	\N	3df9b444f	1618860006305	OpenID Connect compliant HMAC using SHA-512	\N	\N	\N	HMAC
\.


--
-- Data for Name: lambdas; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.lambdas (id, body, debug, enabled, insert_instant, last_update_instant, name, type) FROM stdin;
0af93256-4db4-80f7-2ea5-f8c360490e82	\n// This is the default OpenID Connect reconcile, modify this to your liking.\nfunction reconcile(user, registration, jwt) {\n\n  // Un-comment this line to see the jwt object printed to the event log\n  // console.info(JSON.stringify(jwt, null, 2));\n\n  user.firstName = jwt.given_name;\n  user.middleName = jwt.middle_name;\n  user.lastName = jwt.family_name;\n  user.fullName = jwt.name;\n  user.imageUrl = jwt.picture;\n  user.mobilePhone = jwt.phone_number;\n\n  // https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims\n  if (jwt.birthdate && jwt.birthdate != '0000') {\n    if (jwt.birthdate.length == 4) {\n       // Only a year was provided, set to January 1.\n       user.birthDate = jwt.birthdate + '-01-01';\n    } else {\n      user.birthDate = jwt.birthdate;\n    }\n  }\n\n  // https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims\n  if (jwt.locale) {\n    user.preferredLanguages = user.preferredLanguages || [];\n    // Replace the dash with an under score.\n    user.preferredLanguages.push(jwt.locale.replace('-', '_'));\n  }\n\n  // Set preferred_username in registration.\n  // - This is just for display purposes, this value cannot be used to uniquely identify\n  //   the user in FusionAuth.\n  registration.username = jwt.preferred_username;\n\n}	f	t	1618860008305	1618860008305	Default OpenID Connect Reconcile provided by FusionAuth	1
b23cb615-3858-0d38-fdb1-197fec5c90a7	\n// This is the default SAML v2 reconcile, modify this to your liking.\nfunction reconcile(user, registration, samlResponse) {\n\n  // Un-comment this line to see the samlResponse object printed to the event log\n  // console.info(JSON.stringify(samlResponse, null, 2));\n\n  var getAttribute = function(samlResponse, attribute) {\n    var values = samlResponse.assertion.attributes[attribute];\n    if (values && values.length > 0) {\n      return values[0];\n    }\n\n    return null;\n  };\n\n  // Retrieve an attribute from the samlResponse\n  // - Arguments [2 .. ] provide a preferred order of attribute names to lookup the value in the response.\n  var defaultIfNull = function(samlResponse) {\n    for (var i=1; i < arguments.length; i++) {\n      var value = getAttribute(samlResponse, arguments[i]);\n      if (value !== null) {\n        return value;\n      }\n    }\n  };\n\n  user.birthDate = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/dateofbirth', 'birthdate', 'date_of_birth');\n  user.firstName = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname', 'first_name');\n  user.lastName = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname', 'last_name');\n  user.fullName = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', 'name', 'full_name');\n  user.mobilePhone = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/mobilephone', 'mobile_phone');\n\n}	f	t	1618860009305	1618860009305	Default SAML v2 Reconcile provided by FusionAuth	2
6ed05a4f-9e49-5e41-74e0-ad2774d9d100	\n// This is the default Apple reconcile, modify this to your liking.\nfunction reconcile(user, registration, idToken) {\n\n  // Un-comment this line to see the idToken object printed to the event log\n  // console.info(JSON.stringify(idToken, null, 2));\n\n  // During the first login attempt, the user object will be available which may contain first and last name.\n  if (idToken.user && idToken.user.name) {\n    user.firstName = idToken.user.name.firstName || user.firstName;\n    user.lastName = idToken.user.name.lastName || user.lastName;\n  }\n\n}	f	t	1618860010305	1618860010305	Default Apple Reconcile provided by FusionAuth	4
2c443d6d-482b-fefd-2932-a5c1e62d15bc	\n// This is the default Facebook reconcile, modify this to your liking.\nfunction reconcile(user, registration, facebookUser) {\n\n  // Un-comment this line to see the facebookUser object printed to the event log\n  // console.info(JSON.stringify(facebookUser, null, 2));\n\n  user.firstName = facebookUser.first_name;\n  user.middleName = facebookUser.middle_name;\n  user.lastName = facebookUser.last_name;\n  user.fullName = facebookUser.name;\n\n  if (facebookUser.picture && !facebookUser.picture.data.is_silhouette) {\n    user.imageUrl = facebookUser.picture.data.url;\n  }\n\n  if (facebookUser.birthday) {\n    // Convert MM/dd/yyyy -> YYYY-MM-DD\n    var parts = facebookUser.birthday.split('/');\n    user.birthDate = parts[2] + '-' +  parts[0] + '-' +  parts[1];\n  }\n\n}	f	t	1618860011305	1618860011305	Default Facebook Reconcile provided by FusionAuth	6
92e1ea41-d8f2-ea44-c371-c15e93b127f2	\n// This is the default Google reconcile, modify this to your liking.\nfunction reconcile(user, registration, idToken) {\n\n  // Un-comment this line to see the idToken object printed to the event log\n  // console.info(JSON.stringify(idToken, null, 2));\n\n  // The idToken is the response from the tokeninfo endpoint\n  // https://developers.google.com/identity/sign-in/web/backend-auth#calling-the-tokeninfo-endpoint\n  user.firstName = idToken.given_name;\n  user.lastName = idToken.family_name;\n  user.fullName = idToken.name;\n  user.imageUrl = idToken.picture;\n\n}	f	t	1618860012305	1618860012305	Default Google Reconcile provided by FusionAuth	7
17ac3d98-fe99-732c-3135-f18a423f3f27	\n// This is the default Twitter reconcile, modify this to your liking.\nfunction reconcile(user, registration, twitterUser) {\n\n  // Un-comment this line to see the twitterUser object printed to the event log\n  // console.info(JSON.stringify(twitterUser, null, 2));\n\n  // Set name if available in the response\n  if (twitterUser.name) {\n    user.fullName = twitterUser.name;\n  }\n\n  // https://developer.twitter.com/en/docs/accounts-and-users/user-profile-images-and-banners.html\n  if (twitterUser.profile_image_url_https) {\n    // Remove the _normal suffix to get the original size.\n    user.imageUrl = twitterUser.profile_image_url_https.replace('_normal.png', '.png');\n  }\n\n  // Set twitter screen_name in registration.\n  // - This is just for display purposes, this value cannot be used to uniquely identify\n  //   the user in FusionAuth.\n  registration.username = twitterUser.screen_name;\n}	f	t	1618860013305	1618860013305	Default Twitter Reconcile provided by FusionAuth	9
b7a5838c-57ab-1994-73c3-4f9c2be217a4	\n// This is the default LinkedIn reconcile, modify this to your liking.\nfunction reconcile(user, registration, linkedInUser) {\n\n  // Un-comment this line to see the linkedInUser object printed to the event log\n  // console.info(JSON.stringify(linkedInUser, null, ' '));\n\n  user.firstName = linkedInUser.localizedFirstName || user.firstName;\n  user.lastName = linkedInUser.localizedLastName || user.lastName;\n\n  // LinkedIn returns several images sizes.\n  // See https://docs.microsoft.com/en-us/linkedin/shared/references/v2/profile/profile-picture\n  var images = linkedInUser.profilePicture['displayImage~'].elements || [];\n  var image100 = images.length >= 1 ? images[0].identifiers[0].identifier : null;\n  var image200 = images.length >= 2 ? images[1].identifiers[0].identifier : null;\n  var image400 = images.length >= 3 ? images[2].identifiers[0].identifier : null;\n  var image800 = images.length >= 4 ? images[3].identifiers[0].identifier : null;\n\n  // Use the largest image.\n  user.imageUrl = image800;\n\n  // Record the LinkedIn Id\n  registration.data.linkedIn = registration.data.linkedIn || {};\n  registration.data.linkedIn.id = linkedInUser.id;\n\n}	f	t	1618860014305	1618860014305	Default LinkedIn Reconcile provided by FusionAuth	11
fb243871-37d5-4ce1-bee3-53b88476d74e	function reconcile(user, registration, jwt) {    \r\n  var email = jwt.email;\r\n  var firstname = jwt.given_name;\r\n  var lastname = jwt.family_name;\r\n  var fullName = firstname + " " + lastname;\r\n  \r\n  user.email = email;\r\n  user.firstName = firstname;\r\n  user.lastName = lastname;\r\n  user.fullName = fullName;\r\n    \r\n  registration.username = firstname.toLowerCase();\r\n}	t	t	1618860853208	1618861716140	IdentityServer4 Reconcile	1
a0a2054a-de24-4463-80d9-5dc78eaee66f	function populate(jwt, user, registration) { \r\n  jwt.email = user.email;\r\n  jwt.first_name = user.firstName;\r\n  jwt.last_name = user.lastName;\r\n  jwt.name = user.fullName;\r\n}	t	t	1618860877442	1618868408034	IdentityServer4 Populate	0
\.


--
-- Data for Name: locks; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.locks (type, update_instant) FROM stdin;
UserActionEndEvent	\N
EmailPlus	\N
Family	\N
com.inversoft.migration.Migrator	\N
Reindex	\N
\.


--
-- Data for Name: master_record; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.master_record (id, instant) FROM stdin;
60f09742-3f91-4f7a-9d7f-ad52add3307c	1618870961035
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.migrations (name, run_instant) FROM stdin;
io.fusionauth.api.migration.guice.Migration_1_6_0	1618860012594
io.fusionauth.api.migration.guice.Migration_1_7_0	1618860012603
io.fusionauth.api.migration.guice.Migration_1_8_0	1618860012628
io.fusionauth.api.migration.guice.Migration_1_9_2	1618860012654
io.fusionauth.api.migration.guice.Migration_1_10_0	1618860012679
io.fusionauth.api.migration.guice.Migration_1_13_0	1618860017692
io.fusionauth.api.migration.guice.Migration_1_15_3	1618860018057
\.


--
-- Data for Name: nodes; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.nodes (id, data, insert_instant, last_checkin_instant, runtime_mode, url) FROM stdin;
60f09742-3f91-4f7a-9d7f-ad52add3307c	{"data":{},"ipAddresses":{"eth0":["172.21.0.3"]}}	1618860586654	1618871051972	development	http://localhost:9011
\.


--
-- Data for Name: previous_passwords; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.previous_passwords (insert_instant, encryption_scheme, factor, password, salt, users_id) FROM stdin;
\.


--
-- Data for Name: raw_application_daily_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.raw_application_daily_active_users (applications_id, day, users_id) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	18736	4a4246a5-79b0-498b-a59a-8c805f4db71e
1b62d181-b4f9-4b44-87ad-38a2e29066b6	18736	4c5e57e5-1684-4f98-bcfb-6d480cf26a29
\.


--
-- Data for Name: raw_application_monthly_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.raw_application_monthly_active_users (applications_id, month, users_id) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	615	4a4246a5-79b0-498b-a59a-8c805f4db71e
1b62d181-b4f9-4b44-87ad-38a2e29066b6	615	4c5e57e5-1684-4f98-bcfb-6d480cf26a29
\.


--
-- Data for Name: raw_global_daily_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.raw_global_daily_active_users (day, users_id) FROM stdin;
18736	4a4246a5-79b0-498b-a59a-8c805f4db71e
18736	4c5e57e5-1684-4f98-bcfb-6d480cf26a29
\.


--
-- Data for Name: raw_global_monthly_active_users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.raw_global_monthly_active_users (month, users_id) FROM stdin;
615	4a4246a5-79b0-498b-a59a-8c805f4db71e
615	4c5e57e5-1684-4f98-bcfb-6d480cf26a29
\.


--
-- Data for Name: raw_logins; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.raw_logins (applications_id, instant, ip_address, users_id) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1618860149554	172.20.0.1	4a4246a5-79b0-498b-a59a-8c805f4db71e
1b62d181-b4f9-4b44-87ad-38a2e29066b6	1618861220583	172.21.0.1	4c5e57e5-1684-4f98-bcfb-6d480cf26a29
1b62d181-b4f9-4b44-87ad-38a2e29066b6	1618861319078	172.21.0.1	4c5e57e5-1684-4f98-bcfb-6d480cf26a29
1b62d181-b4f9-4b44-87ad-38a2e29066b6	1618866994943	172.21.0.1	4c5e57e5-1684-4f98-bcfb-6d480cf26a29
1b62d181-b4f9-4b44-87ad-38a2e29066b6	1618867062905	172.21.0.1	4c5e57e5-1684-4f98-bcfb-6d480cf26a29
1b62d181-b4f9-4b44-87ad-38a2e29066b6	1618868329635	172.21.0.1	4c5e57e5-1684-4f98-bcfb-6d480cf26a29
1b62d181-b4f9-4b44-87ad-38a2e29066b6	1618868552733	172.21.0.1	4c5e57e5-1684-4f98-bcfb-6d480cf26a29
1b62d181-b4f9-4b44-87ad-38a2e29066b6	1618868707289	172.21.0.1	4c5e57e5-1684-4f98-bcfb-6d480cf26a29
1b62d181-b4f9-4b44-87ad-38a2e29066b6	1618868785009	172.21.0.1	4c5e57e5-1684-4f98-bcfb-6d480cf26a29
1b62d181-b4f9-4b44-87ad-38a2e29066b6	1618868790488	172.21.0.1	4c5e57e5-1684-4f98-bcfb-6d480cf26a29
1b62d181-b4f9-4b44-87ad-38a2e29066b6	1618868909524	172.21.0.1	4c5e57e5-1684-4f98-bcfb-6d480cf26a29
1b62d181-b4f9-4b44-87ad-38a2e29066b6	1618869077553	172.21.0.1	4c5e57e5-1684-4f98-bcfb-6d480cf26a29
1b62d181-b4f9-4b44-87ad-38a2e29066b6	1618869444964	172.21.0.1	4c5e57e5-1684-4f98-bcfb-6d480cf26a29
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.refresh_tokens (id, applications_id, data, insert_instant, start_instant, token, users_id) FROM stdin;
88d96f89-0f2e-48cc-9fe0-5b9524fda69c	\N	{"data":{},"metaData":{"device":{"lastAccessedAddress":"172.21.0.1","lastAccessedInstant":1618869444987,"type":"UNKNOWN"}}}	1618869444987	1618869444987	r5M_TlAq-C1ccxVPhgbQRtNDuUvbdNcqa6DeIyzr0QPl36Rc3GmxCg	4c5e57e5-1684-4f98-bcfb-6d480cf26a29
b20a869d-1169-4743-a92a-e6650920d24d	3c219e58-ed0e-4b18-ad48-f4f92793ae32	{"data":{},"metaData":{"device":{"lastAccessedAddress":"172.21.0.1","lastAccessedInstant":1618869759557,"name":"macOS Chrome","type":"BROWSER"},"scopes":["offline_access"]}}	1618860149998	1618869759557	ibmHkT_NqsbbXoZ8ky9CwUqLFVFDqYuSk6lfNg7hm6pnD5nF1nME1A	4a4246a5-79b0-498b-a59a-8c805f4db71e
\.


--
-- Data for Name: system_configuration; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.system_configuration (data, insert_instant, last_update_instant, report_timezone) FROM stdin;
{"auditLogConfiguration":{"delete":{"enabled":false,"numberOfDaysToRetain":365}},"cookieEncryptionKey":"I7oTFitYVUspnvEWFBUoqA==","corsConfiguration":{"allowCredentials":false,"allowedHeaders":["Accept","Access-Control-Request-Headers","Access-Control-Request-Method","Authorization","Content-Type","Last-Modified","Origin","X-FusionAuth-TenantId","X-Requested-With"],"allowedMethods":["OPTIONS","GET","POST"],"allowedOrigins":["http://localhost:8080"],"debug":true,"enabled":true,"exposedHeaders":["Access-Control-Allow-Origin","Access-Control-Allow-Credentials","Origin"],"preflightMaxAgeInSeconds":1800},"data":{},"eventLogConfiguration":{"numberToRetain":10000},"loginRecordConfiguration":{"delete":{"enabled":false,"numberOfDaysToRetain":365}},"uiConfiguration":{}}	1618860007305	1618860007305	America/Denver
\.


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.tenants (id, access_token_signing_keys_id, admin_user_forms_id, confirm_child_email_template_id, data, failed_authentication_user_actions_id, family_request_email_template_id, forgot_password_email_templates_id, id_token_signing_keys_id, insert_instant, last_update_instant, name, parent_registration_email_template_id, passwordless_email_templates_id, set_password_email_templates_id, themes_id, verification_email_templates_id) FROM stdin;
d993c51d-3d11-9558-de39-11d0f8801886	ca626210-ee40-8442-ed72-e25febe604eb	ffd38f00-eba9-3126-4538-995cbcffdd3a	\N	{"configured":false,"data":{},"emailConfiguration":{"defaultFromEmail":"no-reply@fusionauth.io","host":"localhost","port":25,"verifyEmail":false,"verifyEmailWhenChanged":false},"eventConfiguration":{},"externalIdentifierConfiguration":{"authorizationGrantIdTimeToLiveInSeconds":30,"changePasswordIdGenerator":{"length":32,"type":"randomBytes"},"changePasswordIdTimeToLiveInSeconds":600,"deviceCodeTimeToLiveInSeconds":1800,"deviceUserCodeIdGenerator":{"length":6,"type":"randomAlphaNumeric"},"emailVerificationIdGenerator":{"length":32,"type":"randomBytes"},"emailVerificationIdTimeToLiveInSeconds":86400,"externalAuthenticationIdTimeToLiveInSeconds":300,"oneTimePasswordTimeToLiveInSeconds":60,"passwordlessLoginGenerator":{"length":32,"type":"randomBytes"},"passwordlessLoginTimeToLiveInSeconds":180,"registrationVerificationIdGenerator":{"length":32,"type":"randomBytes"},"registrationVerificationIdTimeToLiveInSeconds":86400,"samlv2AuthNRequestIdTimeToLiveInSeconds":300,"setupPasswordIdGenerator":{"length":32,"type":"randomBytes"},"setupPasswordIdTimeToLiveInSeconds":86400,"twoFactorIdTimeToLiveInSeconds":300,"twoFactorTrustIdTimeToLiveInSeconds":2592000},"failedAuthenticationConfiguration":{"actionDuration":3,"actionDurationUnit":"MINUTES","resetCountInSeconds":60,"tooManyAttempts":5},"familyConfiguration":{"allowChildRegistrations":true,"deleteOrphanedAccounts":false,"deleteOrphanedAccountsDays":30,"enabled":false,"maximumChildAge":12,"minimumOwnerAge":21,"parentEmailRequired":false},"formConfiguration":{"adminUserFormId":"ffd38f00-eba9-3126-4538-995cbcffdd3a"},"httpSessionMaxInactiveInterval":3600,"issuer":"acme.com","jwtConfiguration":{"enabled":true,"refreshTokenExpirationPolicy":"Fixed","refreshTokenRevocationPolicy":{"onLoginPrevented":true,"onPasswordChanged":true},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"maximumPasswordAge":{"days":180,"enabled":false},"minimumPasswordAge":{"enabled":false,"seconds":30},"passwordEncryptionConfiguration":{"encryptionScheme":"salted-pbkdf2-hmac-sha256","encryptionSchemeFactor":24000,"modifyEncryptionSchemeOnLogin":false},"passwordValidationRules":{"breachDetection":{"enabled":false,"notifyUserEmailTemplateId":"614fadf6-a93d-4162-9309-79699136d55b"},"maxLength":256,"minLength":8,"rememberPreviousPasswords":{"count":0,"enabled":false},"requireMixedCase":false,"requireNonAlpha":false,"requireNumber":false,"validateOnLogin":false},"state":"Active","userDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":0}}}	\N	\N	637cfda0-d9b5-4493-92c3-998a6dafce5e	092dbedc-30af-4149-9c61-b578f2c72f59	1618860006305	1618860094802	Default	\N	2db259df-4627-4bfa-9bce-7e57ab4e6515	c5c76cb7-b82d-46eb-8274-c51ce60224b1	75a068fd-e94b-451a-9aeb-3ddb9a3b5987	\N
fd156c8e-8b55-4d81-83c8-589e6b8d15ff	ca626210-ee40-8442-ed72-e25febe604eb	ffd38f00-eba9-3126-4538-995cbcffdd3a	\N	{"configured":true,"data":{},"emailConfiguration":{"defaultFromEmail":"no-reply@fusionauth.io","host":"localhost","port":25,"security":"NONE","verifyEmail":false,"verifyEmailWhenChanged":false},"eventConfiguration":{"events":{"user.delete":{"enabled":false,"transactionType":"None"},"user.create":{"enabled":false,"transactionType":"None"},"user.update":{"enabled":false,"transactionType":"None"},"user.deactivate":{"enabled":false,"transactionType":"None"},"user.bulk.create":{"enabled":false,"transactionType":"None"},"user.reactivate":{"enabled":false,"transactionType":"None"},"jwt.refresh-token.revoke":{"enabled":false,"transactionType":"None"},"jwt.refresh":{"enabled":false,"transactionType":"None"},"jwt.public-key.update":{"enabled":false,"transactionType":"None"},"user.login.success":{"enabled":false,"transactionType":"None"},"user.login.failed":{"enabled":false,"transactionType":"None"},"user.registration.create":{"enabled":false,"transactionType":"None"},"user.registration.update":{"enabled":false,"transactionType":"None"},"user.registration.delete":{"enabled":false,"transactionType":"None"},"user.registration.verified":{"enabled":false,"transactionType":"None"},"user.email.verified":{"enabled":false,"transactionType":"None"},"user.password.breach":{"enabled":false,"transactionType":"None"}}},"externalIdentifierConfiguration":{"authorizationGrantIdTimeToLiveInSeconds":30,"changePasswordIdGenerator":{"length":32,"type":"randomBytes"},"changePasswordIdTimeToLiveInSeconds":600,"deviceCodeTimeToLiveInSeconds":1800,"deviceUserCodeIdGenerator":{"length":6,"type":"randomAlphaNumeric"},"emailVerificationIdGenerator":{"length":32,"type":"randomBytes"},"emailVerificationIdTimeToLiveInSeconds":86400,"externalAuthenticationIdTimeToLiveInSeconds":300,"oneTimePasswordTimeToLiveInSeconds":60,"passwordlessLoginGenerator":{"length":32,"type":"randomBytes"},"passwordlessLoginTimeToLiveInSeconds":180,"registrationVerificationIdGenerator":{"length":32,"type":"randomBytes"},"registrationVerificationIdTimeToLiveInSeconds":86400,"samlv2AuthNRequestIdTimeToLiveInSeconds":300,"setupPasswordIdGenerator":{"length":32,"type":"randomBytes"},"setupPasswordIdTimeToLiveInSeconds":86400,"twoFactorIdTimeToLiveInSeconds":300,"twoFactorTrustIdTimeToLiveInSeconds":2592000},"failedAuthenticationConfiguration":{"actionDuration":3,"actionDurationUnit":"MINUTES","resetCountInSeconds":60,"tooManyAttempts":5},"familyConfiguration":{"allowChildRegistrations":true,"deleteOrphanedAccounts":false,"deleteOrphanedAccountsDays":30,"enabled":false,"maximumChildAge":12,"minimumOwnerAge":21,"parentEmailRequired":false},"formConfiguration":{"adminUserFormId":"ffd38f00-eba9-3126-4538-995cbcffdd3a"},"httpSessionMaxInactiveInterval":0,"issuer":"acme.com","jwtConfiguration":{"enabled":true,"refreshTokenExpirationPolicy":"Fixed","refreshTokenRevocationPolicy":{"onLoginPrevented":true,"onPasswordChanged":true},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"maximumPasswordAge":{"days":180,"enabled":false},"minimumPasswordAge":{"enabled":false,"seconds":30},"passwordEncryptionConfiguration":{"encryptionScheme":"salted-pbkdf2-hmac-sha256","encryptionSchemeFactor":24000,"modifyEncryptionSchemeOnLogin":false},"passwordValidationRules":{"breachDetection":{"enabled":false,"matchMode":"High","notifyUserEmailTemplateId":"614fadf6-a93d-4162-9309-79699136d55b","onLogin":"Off"},"maxLength":256,"minLength":8,"rememberPreviousPasswords":{"count":1,"enabled":false},"requireMixedCase":false,"requireNonAlpha":false,"requireNumber":false,"validateOnLogin":false},"state":"Active","userDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":30}}}	\N	\N	637cfda0-d9b5-4493-92c3-998a6dafce5e	092dbedc-30af-4149-9c61-b578f2c72f59	1618860256815	1618868837010	IdentityServer4	\N	2db259df-4627-4bfa-9bce-7e57ab4e6515	c5c76cb7-b82d-46eb-8274-c51ce60224b1	75a068fd-e94b-451a-9aeb-3ddb9a3b5987	\N
\.


--
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.themes (id, data, insert_instant, last_update_instant, name) FROM stdin;
75a068fd-e94b-451a-9aeb-3ddb9a3b5987	{}	1618860007305	1618860007305	FusionAuth
\.


--
-- Data for Name: user_action_logs; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_action_logs (id, actioner_users_id, actionee_users_id, comment, email_user_on_end, end_event_sent, expiry, history, insert_instant, localized_name, localized_option, localized_reason, name, notify_user_on_end, option_name, reason, reason_code, user_actions_id) FROM stdin;
\.


--
-- Data for Name: user_action_logs_applications; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_action_logs_applications (applications_id, user_action_logs_id) FROM stdin;
\.


--
-- Data for Name: user_action_reasons; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_action_reasons (id, insert_instant, last_update_instant, localized_texts, text, code) FROM stdin;
\.


--
-- Data for Name: user_actions; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_actions (id, active, cancel_email_templates_id, end_email_templates_id, include_email_in_event_json, insert_instant, last_update_instant, localized_names, modify_email_templates_id, name, options, prevent_login, send_end_event, start_email_templates_id, temporal, transaction_type, user_notifications_enabled, user_emailing_enabled) FROM stdin;
\.


--
-- Data for Name: user_comments; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_comments (id, comment, commenter_id, insert_instant, users_id) FROM stdin;
\.


--
-- Data for Name: user_consents; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_consents (id, consents_id, data, giver_users_id, insert_instant, last_update_instant, users_id) FROM stdin;
\.


--
-- Data for Name: user_consents_email_plus; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_consents_email_plus (id, next_email_instant, user_consents_id) FROM stdin;
\.


--
-- Data for Name: user_registrations; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_registrations (id, applications_id, authentication_token, clean_speak_id, data, insert_instant, last_login_instant, last_update_instant, timezone, username, username_status, users_id, verified) FROM stdin;
6150a07b-e44f-4126-b6f0-566040a21090	3c219e58-ed0e-4b18-ad48-f4f92793ae32	\N	\N	{"data":{},"preferredLanguages":[],"tokens":{}}	1618860094693	1618860149554	1618860094693	\N	\N	0	4a4246a5-79b0-498b-a59a-8c805f4db71e	t
cf3c2860-1081-4048-97d2-f7b878755ba2	1b62d181-b4f9-4b44-87ad-38a2e29066b6	\N	\N	{"data":{},"preferredLanguages":[],"tokens":{"18ca0ac2-b7c4-4f18-8201-5352a3eac2d4":"2D5668F3572F6B865F084CDC93CFD0D71C610E22D34A22E0F07C0A4E6B0D3380"}}	1618861220680	1618869444964	1618869444969	\N	bob	0	4c5e57e5-1684-4f98-bcfb-6d480cf26a29	t
\.


--
-- Data for Name: user_registrations_application_roles; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.user_registrations_application_roles (application_roles_id, user_registrations_id) FROM stdin;
631ecd9d-8d40-4c13-8277-80cedb8236e2	6150a07b-e44f-4126-b6f0-566040a21090
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.users (id, active, birth_date, clean_speak_id, data, expiry, first_name, full_name, image_url, insert_instant, last_name, last_update_instant, middle_name, mobile_phone, parent_email, tenants_id, timezone) FROM stdin;
4a4246a5-79b0-498b-a59a-8c805f4db71e	t	\N	\N	{"data":{},"preferredLanguages":[]}	\N	Jhordan	\N	\N	1618860094465	Lima	1618860094465	\N	\N	\N	d993c51d-3d11-9558-de39-11d0f8801886	\N
4c5e57e5-1684-4f98-bcfb-6d480cf26a29	t	\N	\N	{"data":{},"preferredLanguages":[]}	\N	Bob	Bob Smith	\N	1618861220583	Smith	1618869444964	\N	\N	\N	fd156c8e-8b55-4d81-83c8-589e6b8d15ff	\N
\.


--
-- Data for Name: version; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.version (version) FROM stdin;
1.25.0
\.


--
-- Data for Name: webhooks; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.webhooks (id, connect_timeout, description, data, global, headers, http_authentication_username, http_authentication_password, insert_instant, last_update_instant, read_timeout, ssl_certificate, url) FROM stdin;
\.


--
-- Data for Name: webhooks_applications; Type: TABLE DATA; Schema: public; Owner: fusionauth
--

COPY public.webhooks_applications (webhooks_id, applications_id) FROM stdin;
\.


--
-- Name: audit_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusionauth
--

SELECT pg_catalog.setval('public.audit_logs_id_seq', 20, true);


--
-- Name: event_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusionauth
--

SELECT pg_catalog.setval('public.event_logs_id_seq', 33, true);


--
-- Name: identities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusionauth
--

SELECT pg_catalog.setval('public.identities_id_seq', 2, true);


--
-- Name: user_consents_email_plus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusionauth
--

SELECT pg_catalog.setval('public.user_consents_email_plus_id_seq', 1, false);


--
-- Name: application_daily_active_users application_daily_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_daily_active_users
    ADD CONSTRAINT application_daily_active_users_uk_1 UNIQUE (applications_id, day);


--
-- Name: application_monthly_active_users application_monthly_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_monthly_active_users
    ADD CONSTRAINT application_monthly_active_users_uk_1 UNIQUE (applications_id, month);


--
-- Name: application_registration_counts application_registration_counts_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_registration_counts
    ADD CONSTRAINT application_registration_counts_uk_1 UNIQUE (applications_id, hour);


--
-- Name: application_roles application_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_roles
    ADD CONSTRAINT application_roles_pkey PRIMARY KEY (id);


--
-- Name: application_roles application_roles_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_roles
    ADD CONSTRAINT application_roles_uk_1 UNIQUE (name, applications_id);


--
-- Name: applications applications_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (id);


--
-- Name: applications applications_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_uk_1 UNIQUE (name, tenants_id);


--
-- Name: applications applications_uk_2; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_uk_2 UNIQUE (samlv2_issuer, tenants_id);


--
-- Name: asynchronous_tasks asynchronous_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.asynchronous_tasks
    ADD CONSTRAINT asynchronous_tasks_pkey PRIMARY KEY (id);


--
-- Name: asynchronous_tasks asynchronous_tasks_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.asynchronous_tasks
    ADD CONSTRAINT asynchronous_tasks_uk_1 UNIQUE (entity_id);


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: authentication_keys authentication_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.authentication_keys
    ADD CONSTRAINT authentication_keys_pkey PRIMARY KEY (id);


--
-- Name: breached_password_metrics breached_password_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.breached_password_metrics
    ADD CONSTRAINT breached_password_metrics_pkey PRIMARY KEY (tenants_id);


--
-- Name: clean_speak_applications clean_speak_applications_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.clean_speak_applications
    ADD CONSTRAINT clean_speak_applications_uk_1 UNIQUE (applications_id, clean_speak_application_id);


--
-- Name: common_breached_passwords common_breached_passwords_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.common_breached_passwords
    ADD CONSTRAINT common_breached_passwords_pkey PRIMARY KEY (password);


--
-- Name: connectors connectors_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.connectors
    ADD CONSTRAINT connectors_pkey PRIMARY KEY (id);


--
-- Name: connectors_tenants connectors_tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.connectors_tenants
    ADD CONSTRAINT connectors_tenants_pkey PRIMARY KEY (connectors_id, tenants_id);


--
-- Name: connectors_tenants connectors_tenants_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.connectors_tenants
    ADD CONSTRAINT connectors_tenants_uk_1 UNIQUE (connectors_id, tenants_id, sequence);


--
-- Name: connectors connectors_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.connectors
    ADD CONSTRAINT connectors_uk_1 UNIQUE (name);


--
-- Name: consents consents_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.consents
    ADD CONSTRAINT consents_pkey PRIMARY KEY (id);


--
-- Name: consents consents_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.consents
    ADD CONSTRAINT consents_uk_1 UNIQUE (name);


--
-- Name: data_sets data_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.data_sets
    ADD CONSTRAINT data_sets_pkey PRIMARY KEY (name);


--
-- Name: email_templates email_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_pkey PRIMARY KEY (id);


--
-- Name: email_templates email_templates_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_uk_1 UNIQUE (name);


--
-- Name: event_logs event_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.event_logs
    ADD CONSTRAINT event_logs_pkey PRIMARY KEY (id);


--
-- Name: external_identifiers external_identifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.external_identifiers
    ADD CONSTRAINT external_identifiers_pkey PRIMARY KEY (id);


--
-- Name: failed_logins failed_logins_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.failed_logins
    ADD CONSTRAINT failed_logins_uk_1 UNIQUE (users_id);


--
-- Name: families families_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.families
    ADD CONSTRAINT families_pkey PRIMARY KEY (family_id, users_id);


--
-- Name: federated_domains federated_domains_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.federated_domains
    ADD CONSTRAINT federated_domains_uk_1 UNIQUE (domain);


--
-- Name: form_fields form_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.form_fields
    ADD CONSTRAINT form_fields_pkey PRIMARY KEY (id);


--
-- Name: form_fields form_fields_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.form_fields
    ADD CONSTRAINT form_fields_uk_1 UNIQUE (name);


--
-- Name: form_steps form_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.form_steps
    ADD CONSTRAINT form_steps_pkey PRIMARY KEY (forms_id, form_fields_id);


--
-- Name: forms forms_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_pkey PRIMARY KEY (id);


--
-- Name: forms forms_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_uk_1 UNIQUE (name);


--
-- Name: global_daily_active_users global_daily_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.global_daily_active_users
    ADD CONSTRAINT global_daily_active_users_uk_1 UNIQUE (day);


--
-- Name: global_monthly_active_users global_monthly_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.global_monthly_active_users
    ADD CONSTRAINT global_monthly_active_users_uk_1 UNIQUE (month);


--
-- Name: global_registration_counts global_registration_counts_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.global_registration_counts
    ADD CONSTRAINT global_registration_counts_uk_1 UNIQUE (hour);


--
-- Name: group_application_roles group_application_roles_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.group_application_roles
    ADD CONSTRAINT group_application_roles_uk_1 UNIQUE (groups_id, application_roles_id);


--
-- Name: group_members group_members_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_pkey PRIMARY KEY (id);


--
-- Name: group_members group_members_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_uk_1 UNIQUE (groups_id, users_id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: groups groups_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_uk_1 UNIQUE (name, tenants_id);


--
-- Name: hourly_logins hourly_logins_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.hourly_logins
    ADD CONSTRAINT hourly_logins_uk_1 UNIQUE (applications_id, hour);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_uk_1 UNIQUE (email, tenants_id);


--
-- Name: identities identities_uk_2; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_uk_2 UNIQUE (username_index, tenants_id);


--
-- Name: identity_providers identity_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_providers
    ADD CONSTRAINT identity_providers_pkey PRIMARY KEY (id);


--
-- Name: identity_providers identity_providers_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_providers
    ADD CONSTRAINT identity_providers_uk_1 UNIQUE (name);


--
-- Name: keys keys_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_pkey PRIMARY KEY (id);


--
-- Name: keys keys_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_uk_1 UNIQUE (kid);


--
-- Name: keys keys_uk_2; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_uk_2 UNIQUE (name);


--
-- Name: lambdas lambdas_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.lambdas
    ADD CONSTRAINT lambdas_pkey PRIMARY KEY (id);


--
-- Name: locks locks_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.locks
    ADD CONSTRAINT locks_pkey PRIMARY KEY (type);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (name);


--
-- Name: nodes nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.nodes
    ADD CONSTRAINT nodes_pkey PRIMARY KEY (id);


--
-- Name: previous_passwords previous_passwords_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.previous_passwords
    ADD CONSTRAINT previous_passwords_uk_1 UNIQUE (users_id, insert_instant);


--
-- Name: raw_application_daily_active_users raw_application_daily_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.raw_application_daily_active_users
    ADD CONSTRAINT raw_application_daily_active_users_uk_1 UNIQUE (applications_id, day, users_id);


--
-- Name: raw_application_monthly_active_users raw_application_monthly_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.raw_application_monthly_active_users
    ADD CONSTRAINT raw_application_monthly_active_users_uk_1 UNIQUE (applications_id, month, users_id);


--
-- Name: raw_global_daily_active_users raw_global_daily_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.raw_global_daily_active_users
    ADD CONSTRAINT raw_global_daily_active_users_uk_1 UNIQUE (day, users_id);


--
-- Name: raw_global_monthly_active_users raw_global_monthly_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.raw_global_monthly_active_users
    ADD CONSTRAINT raw_global_monthly_active_users_uk_1 UNIQUE (month, users_id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_uk_1 UNIQUE (token);


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);


--
-- Name: tenants tenants_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_uk_1 UNIQUE (name);


--
-- Name: themes themes_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (id);


--
-- Name: themes themes_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_uk_1 UNIQUE (name);


--
-- Name: user_action_logs user_action_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_action_logs
    ADD CONSTRAINT user_action_logs_pkey PRIMARY KEY (id);


--
-- Name: user_action_reasons user_action_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_action_reasons
    ADD CONSTRAINT user_action_reasons_pkey PRIMARY KEY (id);


--
-- Name: user_action_reasons user_action_reasons_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_action_reasons
    ADD CONSTRAINT user_action_reasons_uk_1 UNIQUE (text);


--
-- Name: user_action_reasons user_action_reasons_uk_2; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_action_reasons
    ADD CONSTRAINT user_action_reasons_uk_2 UNIQUE (code);


--
-- Name: user_actions user_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_actions
    ADD CONSTRAINT user_actions_pkey PRIMARY KEY (id);


--
-- Name: user_actions user_actions_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_actions
    ADD CONSTRAINT user_actions_uk_1 UNIQUE (name);


--
-- Name: user_comments user_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_comments
    ADD CONSTRAINT user_comments_pkey PRIMARY KEY (id);


--
-- Name: user_consents_email_plus user_consents_email_plus_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_consents_email_plus
    ADD CONSTRAINT user_consents_email_plus_pkey PRIMARY KEY (id);


--
-- Name: user_consents user_consents_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_consents
    ADD CONSTRAINT user_consents_pkey PRIMARY KEY (id);


--
-- Name: user_registrations_application_roles user_registrations_application_roles_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_registrations_application_roles
    ADD CONSTRAINT user_registrations_application_roles_uk_1 UNIQUE (user_registrations_id, application_roles_id);


--
-- Name: user_registrations user_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_registrations
    ADD CONSTRAINT user_registrations_pkey PRIMARY KEY (id);


--
-- Name: user_registrations user_registrations_uk_1; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_registrations
    ADD CONSTRAINT user_registrations_uk_1 UNIQUE (applications_id, users_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: webhooks_applications webhooks_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.webhooks_applications
    ADD CONSTRAINT webhooks_applications_pkey PRIMARY KEY (webhooks_id, applications_id);


--
-- Name: webhooks webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.webhooks
    ADD CONSTRAINT webhooks_pkey PRIMARY KEY (id);


--
-- Name: applications_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX applications_i_1 ON public.applications USING btree (tenants_id);


--
-- Name: audit_logs_i1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX audit_logs_i1 ON public.audit_logs USING btree (insert_instant);


--
-- Name: event_logs_i1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX event_logs_i1 ON public.event_logs USING btree (insert_instant);


--
-- Name: external_identifiers_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX external_identifiers_i_1 ON public.external_identifiers USING btree (tenants_id, type, insert_instant);


--
-- Name: external_identifiers_i_2; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX external_identifiers_i_2 ON public.external_identifiers USING btree (type, users_id, applications_id);


--
-- Name: failed_logins_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX failed_logins_i_1 ON public.failed_logins USING btree (tenants_id, last_failed_instant);


--
-- Name: families_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX families_i_1 ON public.families USING btree (users_id);


--
-- Name: group_members_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX group_members_i_1 ON public.group_members USING btree (users_id);


--
-- Name: identities_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX identities_i_1 ON public.identities USING btree (users_id);


--
-- Name: raw_logins_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX raw_logins_i_1 ON public.raw_logins USING btree (instant);


--
-- Name: raw_logins_i_2; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX raw_logins_i_2 ON public.raw_logins USING btree (users_id, instant);


--
-- Name: refresh_tokens_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX refresh_tokens_i_1 ON public.refresh_tokens USING btree (start_instant);


--
-- Name: refresh_tokens_i_2; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX refresh_tokens_i_2 ON public.refresh_tokens USING btree (applications_id);


--
-- Name: refresh_tokens_i_3; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX refresh_tokens_i_3 ON public.refresh_tokens USING btree (users_id);


--
-- Name: user_action_logs_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX user_action_logs_i_1 ON public.user_action_logs USING btree (insert_instant);


--
-- Name: user_action_logs_i_2; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX user_action_logs_i_2 ON public.user_action_logs USING btree (expiry, end_event_sent);


--
-- Name: user_comments_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX user_comments_i_1 ON public.user_comments USING btree (insert_instant);


--
-- Name: user_comments_i_2; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX user_comments_i_2 ON public.user_comments USING btree (users_id);


--
-- Name: user_comments_i_3; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX user_comments_i_3 ON public.user_comments USING btree (commenter_id);


--
-- Name: user_consents_email_plus_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX user_consents_email_plus_i_1 ON public.user_consents_email_plus USING btree (next_email_instant);


--
-- Name: user_registrations_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX user_registrations_i_1 ON public.user_registrations USING btree (clean_speak_id);


--
-- Name: user_registrations_i_2; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX user_registrations_i_2 ON public.user_registrations USING btree (users_id);


--
-- Name: users_i_1; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX users_i_1 ON public.users USING btree (clean_speak_id);


--
-- Name: users_i_2; Type: INDEX; Schema: public; Owner: fusionauth
--

CREATE INDEX users_i_2 ON public.users USING btree (parent_email);


--
-- Name: application_daily_active_users application_daily_active_users_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_daily_active_users
    ADD CONSTRAINT application_daily_active_users_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: application_monthly_active_users application_monthly_active_users_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_monthly_active_users
    ADD CONSTRAINT application_monthly_active_users_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: application_registration_counts application_registration_counts_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_registration_counts
    ADD CONSTRAINT application_registration_counts_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: application_roles application_roles_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.application_roles
    ADD CONSTRAINT application_roles_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: applications applications_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_1 FOREIGN KEY (verification_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_10; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_10 FOREIGN KEY (email_verification_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_11; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_11 FOREIGN KEY (forgot_password_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_12; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_12 FOREIGN KEY (passwordless_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_13; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_13 FOREIGN KEY (set_password_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_14; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_14 FOREIGN KEY (samlv2_default_verification_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_15; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_15 FOREIGN KEY (admin_registration_forms_id) REFERENCES public.forms(id);


--
-- Name: applications applications_fk_16; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_16 FOREIGN KEY (samlv2_logout_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_17; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_17 FOREIGN KEY (samlv2_logout_default_verification_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_18; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_18 FOREIGN KEY (samlv2_single_logout_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_2 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: applications applications_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_3 FOREIGN KEY (access_token_populate_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: applications applications_fk_4; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_4 FOREIGN KEY (id_token_populate_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: applications applications_fk_5; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_5 FOREIGN KEY (samlv2_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_6; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_6 FOREIGN KEY (samlv2_populate_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: applications applications_fk_7; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_7 FOREIGN KEY (access_token_signing_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_8; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_8 FOREIGN KEY (id_token_signing_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_9; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_9 FOREIGN KEY (forms_id) REFERENCES public.forms(id);


--
-- Name: asynchronous_tasks asynchronous_tasks_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.asynchronous_tasks
    ADD CONSTRAINT asynchronous_tasks_fk_1 FOREIGN KEY (nodes_id) REFERENCES public.nodes(id);


--
-- Name: authentication_keys authentication_keys_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.authentication_keys
    ADD CONSTRAINT authentication_keys_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: breached_password_metrics breached_password_metrics_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.breached_password_metrics
    ADD CONSTRAINT breached_password_metrics_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: clean_speak_applications clean_speak_applications_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.clean_speak_applications
    ADD CONSTRAINT clean_speak_applications_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: connectors connectors_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.connectors
    ADD CONSTRAINT connectors_fk_1 FOREIGN KEY (ssl_certificate_keys_id) REFERENCES public.keys(id);


--
-- Name: connectors connectors_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.connectors
    ADD CONSTRAINT connectors_fk_2 FOREIGN KEY (reconcile_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: connectors_tenants connectors_tenants_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.connectors_tenants
    ADD CONSTRAINT connectors_tenants_fk_1 FOREIGN KEY (connectors_id) REFERENCES public.connectors(id);


--
-- Name: connectors_tenants connectors_tenants_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.connectors_tenants
    ADD CONSTRAINT connectors_tenants_fk_2 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: consents consents_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.consents
    ADD CONSTRAINT consents_fk_1 FOREIGN KEY (consent_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: consents consents_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.consents
    ADD CONSTRAINT consents_fk_2 FOREIGN KEY (email_plus_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: external_identifiers external_identifiers_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.external_identifiers
    ADD CONSTRAINT external_identifiers_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: external_identifiers external_identifiers_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.external_identifiers
    ADD CONSTRAINT external_identifiers_fk_2 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: external_identifiers external_identifiers_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.external_identifiers
    ADD CONSTRAINT external_identifiers_fk_3 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: failed_logins failed_logins_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.failed_logins
    ADD CONSTRAINT failed_logins_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: failed_logins failed_logins_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.failed_logins
    ADD CONSTRAINT failed_logins_fk_2 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: families families_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.families
    ADD CONSTRAINT families_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: federated_domains federated_domains_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.federated_domains
    ADD CONSTRAINT federated_domains_fk_1 FOREIGN KEY (identity_providers_id) REFERENCES public.identity_providers(id);


--
-- Name: form_fields form_fields_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.form_fields
    ADD CONSTRAINT form_fields_fk_1 FOREIGN KEY (consents_id) REFERENCES public.consents(id);


--
-- Name: form_steps form_steps_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.form_steps
    ADD CONSTRAINT form_steps_fk_1 FOREIGN KEY (forms_id) REFERENCES public.forms(id);


--
-- Name: form_steps form_steps_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.form_steps
    ADD CONSTRAINT form_steps_fk_2 FOREIGN KEY (form_fields_id) REFERENCES public.form_fields(id);


--
-- Name: group_application_roles group_application_roles_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.group_application_roles
    ADD CONSTRAINT group_application_roles_fk_1 FOREIGN KEY (groups_id) REFERENCES public.groups(id);


--
-- Name: group_application_roles group_application_roles_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.group_application_roles
    ADD CONSTRAINT group_application_roles_fk_2 FOREIGN KEY (application_roles_id) REFERENCES public.application_roles(id);


--
-- Name: group_members group_members_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: group_members group_members_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_fk_2 FOREIGN KEY (groups_id) REFERENCES public.groups(id);


--
-- Name: groups groups_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: hourly_logins hourly_logins_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.hourly_logins
    ADD CONSTRAINT hourly_logins_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: identities identities_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: identities identities_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_fk_2 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: identity_providers_applications identity_providers_applications_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_providers_applications
    ADD CONSTRAINT identity_providers_applications_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: identity_providers_applications identity_providers_applications_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_providers_applications
    ADD CONSTRAINT identity_providers_applications_fk_2 FOREIGN KEY (identity_providers_id) REFERENCES public.identity_providers(id);


--
-- Name: identity_providers_applications identity_providers_applications_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_providers_applications
    ADD CONSTRAINT identity_providers_applications_fk_3 FOREIGN KEY (keys_id) REFERENCES public.keys(id);


--
-- Name: identity_providers identity_providers_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_providers
    ADD CONSTRAINT identity_providers_fk_1 FOREIGN KEY (keys_id) REFERENCES public.keys(id);


--
-- Name: identity_providers identity_providers_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_providers
    ADD CONSTRAINT identity_providers_fk_2 FOREIGN KEY (reconcile_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: identity_providers identity_providers_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.identity_providers
    ADD CONSTRAINT identity_providers_fk_3 FOREIGN KEY (request_signing_keys_id) REFERENCES public.keys(id);


--
-- Name: previous_passwords previous_passwords_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.previous_passwords
    ADD CONSTRAINT previous_passwords_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: raw_logins raw_logins_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.raw_logins
    ADD CONSTRAINT raw_logins_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: raw_logins raw_logins_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.raw_logins
    ADD CONSTRAINT raw_logins_fk_2 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: refresh_tokens refresh_tokens_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: refresh_tokens refresh_tokens_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_fk_2 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: tenants tenants_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_1 FOREIGN KEY (forgot_password_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_10; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_10 FOREIGN KEY (access_token_signing_keys_id) REFERENCES public.keys(id);


--
-- Name: tenants tenants_fk_11; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_11 FOREIGN KEY (id_token_signing_keys_id) REFERENCES public.keys(id);


--
-- Name: tenants tenants_fk_12; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_12 FOREIGN KEY (admin_user_forms_id) REFERENCES public.forms(id);


--
-- Name: tenants tenants_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_2 FOREIGN KEY (set_password_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_3 FOREIGN KEY (verification_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_4; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_4 FOREIGN KEY (passwordless_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_5; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_5 FOREIGN KEY (confirm_child_email_template_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_6; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_6 FOREIGN KEY (family_request_email_template_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_7; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_7 FOREIGN KEY (parent_registration_email_template_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_8; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_8 FOREIGN KEY (failed_authentication_user_actions_id) REFERENCES public.user_actions(id);


--
-- Name: tenants tenants_fk_9; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_9 FOREIGN KEY (themes_id) REFERENCES public.themes(id);


--
-- Name: user_action_logs_applications user_action_logs_applications_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_action_logs_applications
    ADD CONSTRAINT user_action_logs_applications_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id) ON DELETE CASCADE;


--
-- Name: user_action_logs_applications user_action_logs_applications_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_action_logs_applications
    ADD CONSTRAINT user_action_logs_applications_fk_2 FOREIGN KEY (user_action_logs_id) REFERENCES public.user_action_logs(id) ON DELETE CASCADE;


--
-- Name: user_action_logs user_action_logs_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_action_logs
    ADD CONSTRAINT user_action_logs_fk_1 FOREIGN KEY (actioner_users_id) REFERENCES public.users(id);


--
-- Name: user_action_logs user_action_logs_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_action_logs
    ADD CONSTRAINT user_action_logs_fk_2 FOREIGN KEY (actionee_users_id) REFERENCES public.users(id);


--
-- Name: user_action_logs user_action_logs_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_action_logs
    ADD CONSTRAINT user_action_logs_fk_3 FOREIGN KEY (user_actions_id) REFERENCES public.user_actions(id);


--
-- Name: user_actions user_actions_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_actions
    ADD CONSTRAINT user_actions_fk_1 FOREIGN KEY (cancel_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: user_actions user_actions_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_actions
    ADD CONSTRAINT user_actions_fk_2 FOREIGN KEY (end_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: user_actions user_actions_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_actions
    ADD CONSTRAINT user_actions_fk_3 FOREIGN KEY (modify_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: user_actions user_actions_fk_4; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_actions
    ADD CONSTRAINT user_actions_fk_4 FOREIGN KEY (start_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: user_comments user_comments_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_comments
    ADD CONSTRAINT user_comments_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: user_comments user_comments_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_comments
    ADD CONSTRAINT user_comments_fk_2 FOREIGN KEY (commenter_id) REFERENCES public.users(id);


--
-- Name: user_consents_email_plus user_consents_email_plus_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_consents_email_plus
    ADD CONSTRAINT user_consents_email_plus_fk_1 FOREIGN KEY (user_consents_id) REFERENCES public.user_consents(id);


--
-- Name: user_consents user_consents_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_consents
    ADD CONSTRAINT user_consents_fk_1 FOREIGN KEY (consents_id) REFERENCES public.consents(id);


--
-- Name: user_consents user_consents_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_consents
    ADD CONSTRAINT user_consents_fk_2 FOREIGN KEY (giver_users_id) REFERENCES public.users(id);


--
-- Name: user_consents user_consents_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_consents
    ADD CONSTRAINT user_consents_fk_3 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: user_registrations_application_roles user_registrations_application_roles_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_registrations_application_roles
    ADD CONSTRAINT user_registrations_application_roles_fk_1 FOREIGN KEY (user_registrations_id) REFERENCES public.user_registrations(id);


--
-- Name: user_registrations_application_roles user_registrations_application_roles_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_registrations_application_roles
    ADD CONSTRAINT user_registrations_application_roles_fk_2 FOREIGN KEY (application_roles_id) REFERENCES public.application_roles(id);


--
-- Name: user_registrations user_registrations_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_registrations
    ADD CONSTRAINT user_registrations_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: user_registrations user_registrations_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.user_registrations
    ADD CONSTRAINT user_registrations_fk_2 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: users users_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: webhooks_applications webhooks_applications_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.webhooks_applications
    ADD CONSTRAINT webhooks_applications_fk_1 FOREIGN KEY (webhooks_id) REFERENCES public.webhooks(id);


--
-- Name: webhooks_applications webhooks_applications_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: fusionauth
--

ALTER TABLE ONLY public.webhooks_applications
    ADD CONSTRAINT webhooks_applications_fk_2 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.9
-- Dumped by pg_dump version 11.9

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

