--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

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
-- Name: dim_date; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dim_date (
    date_id integer NOT NULL,
    date date
);


--
-- Name: dim_date_date_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dim_date_date_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dim_date_date_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dim_date_date_id_seq OWNED BY public.dim_date.date_id;


--
-- Name: dim_post; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dim_post (
    post_id integer NOT NULL,
    post_text character varying(500),
    post_date date,
    user_id integer
);


--
-- Name: dim_post_post_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dim_post_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dim_post_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dim_post_post_id_seq OWNED BY public.dim_post.post_id;


--
-- Name: dim_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dim_user (
    user_id integer NOT NULL,
    user_name character varying(100),
    country character varying(50)
);


--
-- Name: dim_user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dim_user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dim_user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dim_user_user_id_seq OWNED BY public.dim_user.user_id;


--
-- Name: fact_daily_posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fact_daily_posts (
    daily_post_id integer NOT NULL,
    user_id integer,
    date_id integer,
    posts_count integer
);


--
-- Name: fact_daily_posts_daily_post_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fact_daily_posts_daily_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fact_daily_posts_daily_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.fact_daily_posts_daily_post_id_seq OWNED BY public.fact_daily_posts.daily_post_id;


--
-- Name: fact_post_performance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fact_post_performance (
    performance_id integer NOT NULL,
    post_id integer,
    date_id integer,
    views integer,
    likes integer
);


--
-- Name: fact_post_performance_performance_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fact_post_performance_performance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fact_post_performance_performance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.fact_post_performance_performance_id_seq OWNED BY public.fact_post_performance.performance_id;


--
-- Name: raw_likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.raw_likes (
    like_id integer,
    user_id integer,
    post_id integer,
    like_date date
);


--
-- Name: raw_posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.raw_posts (
    post_id integer,
    post_text character varying(500),
    post_date date,
    user_id integer
);


--
-- Name: raw_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.raw_users (
    user_id integer,
    user_name character varying(100),
    country character varying(50)
);


--
-- Name: dim_date date_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dim_date ALTER COLUMN date_id SET DEFAULT nextval('public.dim_date_date_id_seq'::regclass);


--
-- Name: dim_post post_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dim_post ALTER COLUMN post_id SET DEFAULT nextval('public.dim_post_post_id_seq'::regclass);


--
-- Name: dim_user user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dim_user ALTER COLUMN user_id SET DEFAULT nextval('public.dim_user_user_id_seq'::regclass);


--
-- Name: fact_daily_posts daily_post_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fact_daily_posts ALTER COLUMN daily_post_id SET DEFAULT nextval('public.fact_daily_posts_daily_post_id_seq'::regclass);


--
-- Name: fact_post_performance performance_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fact_post_performance ALTER COLUMN performance_id SET DEFAULT nextval('public.fact_post_performance_performance_id_seq'::regclass);


--
-- Name: dim_date dim_date_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dim_date
    ADD CONSTRAINT dim_date_pkey PRIMARY KEY (date_id);


--
-- Name: dim_post dim_post_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dim_post
    ADD CONSTRAINT dim_post_pkey PRIMARY KEY (post_id);


--
-- Name: dim_user dim_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dim_user
    ADD CONSTRAINT dim_user_pkey PRIMARY KEY (user_id);


--
-- Name: fact_daily_posts fact_daily_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fact_daily_posts
    ADD CONSTRAINT fact_daily_posts_pkey PRIMARY KEY (daily_post_id);


--
-- Name: fact_post_performance fact_post_performance_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fact_post_performance
    ADD CONSTRAINT fact_post_performance_pkey PRIMARY KEY (performance_id);


--
-- Name: dim_post dim_post_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dim_post
    ADD CONSTRAINT dim_post_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.dim_user(user_id);


--
-- Name: fact_daily_posts fact_daily_posts_date_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fact_daily_posts
    ADD CONSTRAINT fact_daily_posts_date_id_fkey FOREIGN KEY (date_id) REFERENCES public.dim_date(date_id);


--
-- Name: fact_daily_posts fact_daily_posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fact_daily_posts
    ADD CONSTRAINT fact_daily_posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.dim_user(user_id);


--
-- Name: fact_post_performance fact_post_performance_date_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fact_post_performance
    ADD CONSTRAINT fact_post_performance_date_id_fkey FOREIGN KEY (date_id) REFERENCES public.dim_date(date_id);


--
-- Name: fact_post_performance fact_post_performance_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fact_post_performance
    ADD CONSTRAINT fact_post_performance_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.dim_post(post_id);


--
-- PostgreSQL database dump complete
--

