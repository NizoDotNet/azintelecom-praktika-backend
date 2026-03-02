--
-- PostgreSQL database dump
--

\restrict cZq2m6wiw3wJnNP4I3TepUoiUdl6P3effVdBq7qSofWTjSEqh4OaDacZQEo3CI4

-- Dumped from database version 17.8 (Debian 17.8-1.pgdg13+1)
-- Dumped by pg_dump version 17.8 (Debian 17.8-1.pgdg13+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: achievement_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.achievement_type (
    id uuid NOT NULL
);


ALTER TABLE public.achievement_type OWNER TO postgres;

--
-- Name: achievement_type_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.achievement_type_translation (
    id bigint NOT NULL,
    language_code character varying(4) DEFAULT 'En'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    achievment_type_id uuid NOT NULL
);


ALTER TABLE public.achievement_type_translation OWNER TO postgres;

--
-- Name: achievements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.achievements (
    id uuid NOT NULL,
    date text NOT NULL,
    achievement_type_id uuid NOT NULL
);


ALTER TABLE public.achievements OWNER TO postgres;

--
-- Name: club_forum_disccussions_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.club_forum_disccussions_comments (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    date timestamp with time zone NOT NULL,
    text text NOT NULL,
    club_forum_discussions_id uuid NOT NULL
);


ALTER TABLE public.club_forum_disccussions_comments OWNER TO postgres;

--
-- Name: club_forum_discussions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.club_forum_discussions (
    id uuid NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.club_forum_discussions OWNER TO postgres;

--
-- Name: games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games (
    id uuid NOT NULL,
    opponent_id integer NOT NULL,
    game_date timestamp with time zone NOT NULL,
    is_home boolean NOT NULL,
    score_id uuid NOT NULL
);


ALTER TABLE public.games OWNER TO postgres;

--
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news (
    id uuid NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.news OWNER TO postgres;

--
-- Name: news_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news_translation (
    title character varying(255) NOT NULL,
    description text NOT NULL,
    id bigint NOT NULL,
    news_id uuid NOT NULL,
    language_code character varying(4) DEFAULT 'En'::character varying NOT NULL
);


ALTER TABLE public.news_translation OWNER TO postgres;

--
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    id uuid NOT NULL,
    firstname text,
    middlename text,
    lastname text,
    kit_number text,
    position_id uuid
);


ALTER TABLE public.players OWNER TO postgres;

--
-- Name: position_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.position_translation (
    title character varying(255) NOT NULL,
    id bigint NOT NULL,
    language_code character varying(4) DEFAULT 'En'::character varying NOT NULL,
    position_id uuid NOT NULL
);


ALTER TABLE public.position_translation OWNER TO postgres;

--
-- Name: positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.positions (
    id uuid NOT NULL
);


ALTER TABLE public.positions OWNER TO postgres;

--
-- Name: product_stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_stock (
    product_id uuid NOT NULL,
    size_id uuid,
    count integer NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE public.product_stock OWNER TO postgres;

--
-- Name: product_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_translation (
    name character varying(255) NOT NULL,
    language_code character varying(4) DEFAULT 'En'::character varying NOT NULL,
    id bigint NOT NULL,
    product_id uuid NOT NULL
);


ALTER TABLE public.product_translation OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id uuid NOT NULL,
    season text
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: scores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scores (
    id uuid NOT NULL,
    game_id uuid NOT NULL,
    opponent_score integer DEFAULT 0 NOT NULL,
    team_score integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.scores OWNER TO postgres;

--
-- Name: sizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sizes (
    id uuid NOT NULL,
    size_name text NOT NULL
);


ALTER TABLE public.sizes OWNER TO postgres;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: COLUMN users.password; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.password IS 'must be stored hashed';


--
-- Name: vacancies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vacancies (
    id uuid NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL
);


ALTER TABLE public.vacancies OWNER TO postgres;

--
-- Name: vacancies_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vacancies_translation (
    id uuid NOT NULL,
    vacancy_id uuid NOT NULL,
    language_code character varying(4) DEFAULT 'En'::character varying NOT NULL,
    title character varying(255) NOT NULL,
    details character varying NOT NULL
);


ALTER TABLE public.vacancies_translation OWNER TO postgres;

--
-- Name: vacancy_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vacancy_requests (
    id uuid NOT NULL,
    vacancy_id uuid NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    email character varying(255) NOT NULL,
    phone_number character varying NOT NULL
);


ALTER TABLE public.vacancy_requests OWNER TO postgres;

--
-- Name: vacancy_requests_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vacancy_requests_translation (
    id uuid NOT NULL,
    vacancy_request_id uuid NOT NULL,
    about_me text,
    languge_code text DEFAULT 'En'::text NOT NULL
);


ALTER TABLE public.vacancy_requests_translation OWNER TO postgres;

--
-- Data for Name: achievement_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.achievement_type (id) FROM stdin;
\.


--
-- Data for Name: achievement_type_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.achievement_type_translation (id, language_code, name, achievment_type_id) FROM stdin;
\.


--
-- Data for Name: achievements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.achievements (id, date, achievement_type_id) FROM stdin;
\.


--
-- Data for Name: club_forum_disccussions_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.club_forum_disccussions_comments (id, user_id, date, text, club_forum_discussions_id) FROM stdin;
\.


--
-- Data for Name: club_forum_discussions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.club_forum_discussions (id, date) FROM stdin;
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games (id, opponent_id, game_date, is_home, score_id) FROM stdin;
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news (id, date) FROM stdin;
\.


--
-- Data for Name: news_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news_translation (title, description, id, news_id, language_code) FROM stdin;
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (id, firstname, middlename, lastname, kit_number, position_id) FROM stdin;
\.


--
-- Data for Name: position_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.position_translation (title, id, language_code, position_id) FROM stdin;
\.


--
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.positions (id) FROM stdin;
\.


--
-- Data for Name: product_stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_stock (product_id, size_id, count, id) FROM stdin;
\.


--
-- Data for Name: product_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_translation (name, language_code, id, product_id) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, season) FROM stdin;
\.


--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scores (id, game_id, opponent_score, team_score) FROM stdin;
\.


--
-- Data for Name: sizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sizes (id, size_name) FROM stdin;
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (id, name) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, name, surname, password) FROM stdin;
\.


--
-- Data for Name: vacancies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vacancies (id, start_date, end_date) FROM stdin;
\.


--
-- Data for Name: vacancies_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vacancies_translation (id, vacancy_id, language_code, title, details) FROM stdin;
\.


--
-- Data for Name: vacancy_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vacancy_requests (id, vacancy_id, name, surname, email, phone_number) FROM stdin;
\.


--
-- Data for Name: vacancy_requests_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vacancy_requests_translation (id, vacancy_request_id, about_me, languge_code) FROM stdin;
\.


--
-- Name: achievement_type pk_achievement_type; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievement_type
    ADD CONSTRAINT pk_achievement_type PRIMARY KEY (id);


--
-- Name: achievements pk_achievements; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievements
    ADD CONSTRAINT pk_achievements PRIMARY KEY (id);


--
-- Name: club_forum_disccussions_comments pk_club_forum_disccussions_comments; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.club_forum_disccussions_comments
    ADD CONSTRAINT pk_club_forum_disccussions_comments PRIMARY KEY (id);


--
-- Name: club_forum_discussions pk_club_forum_discussions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.club_forum_discussions
    ADD CONSTRAINT pk_club_forum_discussions PRIMARY KEY (id);


--
-- Name: games pk_games; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT pk_games PRIMARY KEY (id);


--
-- Name: news pk_news; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT pk_news PRIMARY KEY (id);


--
-- Name: news_translation pk_news_translation; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_translation
    ADD CONSTRAINT pk_news_translation PRIMARY KEY (id);


--
-- Name: players pk_players; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT pk_players PRIMARY KEY (id);


--
-- Name: positions pk_positions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT pk_positions PRIMARY KEY (id);


--
-- Name: product_stock pk_product_stock; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_stock
    ADD CONSTRAINT pk_product_stock PRIMARY KEY (id);


--
-- Name: product_translation pk_product_translation; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_translation
    ADD CONSTRAINT pk_product_translation PRIMARY KEY (id);


--
-- Name: products pk_products; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT pk_products PRIMARY KEY (id);


--
-- Name: scores pk_scores; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT pk_scores PRIMARY KEY (id);


--
-- Name: sizes pk_sizes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT pk_sizes PRIMARY KEY (id);


--
-- Name: teams pk_team; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT pk_team PRIMARY KEY (id);


--
-- Name: users pk_users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT pk_users PRIMARY KEY (id);


--
-- Name: vacancies pk_vacancies; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT pk_vacancies PRIMARY KEY (id);


--
-- Name: vacancies_translation pk_vacancies_translation; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies_translation
    ADD CONSTRAINT pk_vacancies_translation PRIMARY KEY (id);


--
-- Name: vacancy_requests pk_vacancy_requests; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancy_requests
    ADD CONSTRAINT pk_vacancy_requests PRIMARY KEY (id);


--
-- Name: vacancy_requests_translation pk_vacancy_requests_translation; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancy_requests_translation
    ADD CONSTRAINT pk_vacancy_requests_translation PRIMARY KEY (id);


--
-- Name: achievement_type_translation unq_achievement_type_translation_achievment_type_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievement_type_translation
    ADD CONSTRAINT unq_achievement_type_translation_achievment_type_id UNIQUE (achievment_type_id);


--
-- Name: club_forum_disccussions_comments unq_club_forum_disccussions_comments_club_forum_discussions_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.club_forum_disccussions_comments
    ADD CONSTRAINT unq_club_forum_disccussions_comments_club_forum_discussions_id UNIQUE (club_forum_discussions_id);


--
-- Name: games unq_games_score_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT unq_games_score_id UNIQUE (score_id);


--
-- Name: players unq_players_position_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT unq_players_position_id UNIQUE (position_id);


--
-- Name: position_translation unq_position_translation_position_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.position_translation
    ADD CONSTRAINT unq_position_translation_position_id UNIQUE (position_id);


--
-- Name: product_stock unq_product_stock_product_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_stock
    ADD CONSTRAINT unq_product_stock_product_id UNIQUE (product_id);


--
-- Name: achievement_type fk_achievement_type_achievement_type_translation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievement_type
    ADD CONSTRAINT fk_achievement_type_achievement_type_translation FOREIGN KEY (id) REFERENCES public.achievement_type_translation(achievment_type_id);


--
-- Name: achievements fk_achievements_achievement_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievements
    ADD CONSTRAINT fk_achievements_achievement_type FOREIGN KEY (achievement_type_id) REFERENCES public.achievement_type(id);


--
-- Name: club_forum_disccussions_comments fk_club_forum_disccussions_comments_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.club_forum_disccussions_comments
    ADD CONSTRAINT fk_club_forum_disccussions_comments_users FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: club_forum_discussions fk_club_forum_discussions_club_forum_disccussions_comments; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.club_forum_discussions
    ADD CONSTRAINT fk_club_forum_discussions_club_forum_disccussions_comments FOREIGN KEY (id) REFERENCES public.club_forum_disccussions_comments(club_forum_discussions_id);


--
-- Name: games fk_games_scores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_games_scores FOREIGN KEY (score_id) REFERENCES public.scores(id);


--
-- Name: games fk_games_teams; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_games_teams FOREIGN KEY (opponent_id) REFERENCES public.teams(id);


--
-- Name: news_translation fk_news_translation_news; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_translation
    ADD CONSTRAINT fk_news_translation_news FOREIGN KEY (news_id) REFERENCES public.news(id);


--
-- Name: positions fk_positions_players; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT fk_positions_players FOREIGN KEY (id) REFERENCES public.players(position_id);


--
-- Name: positions fk_positions_position_translation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT fk_positions_position_translation FOREIGN KEY (id) REFERENCES public.position_translation(position_id);


--
-- Name: product_stock fk_product_stock_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_stock
    ADD CONSTRAINT fk_product_stock_products FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: product_stock fk_product_stock_sizes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_stock
    ADD CONSTRAINT fk_product_stock_sizes FOREIGN KEY (size_id) REFERENCES public.sizes(id);


--
-- Name: product_translation fk_product_translation_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_translation
    ADD CONSTRAINT fk_product_translation_products FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: scores fk_scores_games_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT fk_scores_games_0 FOREIGN KEY (game_id) REFERENCES public.games(id);


--
-- Name: vacancies_translation fk_vacancies_translation_vacancies; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies_translation
    ADD CONSTRAINT fk_vacancies_translation_vacancies FOREIGN KEY (vacancy_id) REFERENCES public.vacancies(id);


--
-- Name: vacancy_requests_translation fk_vacancy_requests_translation_vacancy_requests; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancy_requests_translation
    ADD CONSTRAINT fk_vacancy_requests_translation_vacancy_requests FOREIGN KEY (vacancy_request_id) REFERENCES public.vacancy_requests(id);


--
-- Name: vacancy_requests fk_vacancy_requests_vacancies; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancy_requests
    ADD CONSTRAINT fk_vacancy_requests_vacancies FOREIGN KEY (vacancy_id) REFERENCES public.vacancies(id);


--
-- PostgreSQL database dump complete
--

\unrestrict cZq2m6wiw3wJnNP4I3TepUoiUdl6P3effVdBq7qSofWTjSEqh4OaDacZQEo3CI4

