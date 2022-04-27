--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: DelayType; Type: TYPE; Schema: public; Owner: cendana_user
--

CREATE TYPE public."DelayType" AS ENUM (
    'PAYABLE',
    'RECEIVABLE'
);


ALTER TYPE public."DelayType" OWNER TO cendana_user;

--
-- Name: OrderStatus; Type: TYPE; Schema: public; Owner: cendana_user
--

CREATE TYPE public."OrderStatus" AS ENUM (
    'OPEN',
    'SEALED'
);


ALTER TYPE public."OrderStatus" OWNER TO cendana_user;

--
-- Name: OrderType; Type: TYPE; Schema: public; Owner: cendana_user
--

CREATE TYPE public."OrderType" AS ENUM (
    'SALE',
    'BUY'
);


ALTER TYPE public."OrderType" OWNER TO cendana_user;

--
-- Name: PaymentMethod; Type: TYPE; Schema: public; Owner: cendana_user
--

CREATE TYPE public."PaymentMethod" AS ENUM (
    'OFFLINE',
    'CASH',
    'ON_DELIVERY',
    'CHEQUE_DRAFT',
    'WIRED',
    'ONLINE'
);


ALTER TYPE public."PaymentMethod" OWNER TO cendana_user;

--
-- Name: Role; Type: TYPE; Schema: public; Owner: cendana_user
--

CREATE TYPE public."Role" AS ENUM (
    'ADMIN',
    'CUSTOMER',
    'SUPPLIER',
    'STAF'
);


ALTER TYPE public."Role" OWNER TO cendana_user;

--
-- Name: TransactionStatus; Type: TYPE; Schema: public; Owner: cendana_user
--

CREATE TYPE public."TransactionStatus" AS ENUM (
    'NEW',
    'CANCELLED',
    'FAILED',
    'PENDING',
    'DECLINED',
    'REJECTED',
    'SUCCESS'
);


ALTER TYPE public."TransactionStatus" OWNER TO cendana_user;

--
-- Name: TransactionType; Type: TYPE; Schema: public; Owner: cendana_user
--

CREATE TYPE public."TransactionType" AS ENUM (
    'DEBIT',
    'CREDIT'
);


ALTER TYPE public."TransactionType" OWNER TO cendana_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Delay; Type: TABLE; Schema: public; Owner: cendana_user
--

CREATE TABLE public."Delay" (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "authorId" integer NOT NULL,
    type public."DelayType" NOT NULL,
    "orderId" integer NOT NULL,
    "dueDate" timestamp(3) without time zone NOT NULL,
    total numeric(65,30) NOT NULL,
    complete boolean NOT NULL
);


ALTER TABLE public."Delay" OWNER TO cendana_user;

--
-- Name: Delay_id_seq; Type: SEQUENCE; Schema: public; Owner: cendana_user
--

CREATE SEQUENCE public."Delay_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Delay_id_seq" OWNER TO cendana_user;

--
-- Name: Delay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cendana_user
--

ALTER SEQUENCE public."Delay_id_seq" OWNED BY public."Delay".id;


--
-- Name: EquityChange; Type: TABLE; Schema: public; Owner: cendana_user
--

CREATE TABLE public."EquityChange" (
    id integer NOT NULL,
    "user" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."EquityChange" OWNER TO cendana_user;

--
-- Name: EquityChange_id_seq; Type: SEQUENCE; Schema: public; Owner: cendana_user
--

CREATE SEQUENCE public."EquityChange_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."EquityChange_id_seq" OWNER TO cendana_user;

--
-- Name: EquityChange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cendana_user
--

ALTER SEQUENCE public."EquityChange_id_seq" OWNED BY public."EquityChange".id;


--
-- Name: FinanceReport; Type: TABLE; Schema: public; Owner: cendana_user
--

CREATE TABLE public."FinanceReport" (
    target timestamp(3) without time zone NOT NULL,
    "totalPenjualan" numeric(65,30),
    "hppAwal" numeric(65,30),
    "hppAkhir" numeric(65,30),
    hpp numeric(65,30),
    "labaKotor" numeric(65,30),
    opex numeric(65,30),
    "labaSebelumPajak" numeric(65,30),
    pajak numeric(65,30),
    "labaBersih" numeric(65,30),
    kas numeric(65,30),
    piutang numeric(65,30),
    persediaan numeric(65,30),
    "aktivaLancar" numeric(65,30),
    peralatan numeric(65,30),
    "akumulasiPeralatan" numeric(65,30),
    "aktivaTetap" numeric(65,30),
    passiva numeric(65,30),
    "utangDagang" numeric(65,30),
    "modalAwal" numeric(65,30),
    "modalAkhir" numeric(65,30),
    "totalRetur" numeric(65,30),
    "pembelianBarangDagang" numeric(65,30),
    "totalBiayaPengeluaran" numeric(65,30),
    "pajakUsaha" numeric(65,30),
    prive numeric(65,30),
    "kendaraanBaru" numeric(65,30),
    investasi numeric(65,30),
    "penambahanModalUsaha" numeric(65,30),
    roc numeric(65,30),
    "arusKasOperasional" numeric(65,30),
    "arusKasInvestasi" numeric(65,30)
);


ALTER TABLE public."FinanceReport" OWNER TO cendana_user;

--
-- Name: Investment; Type: TABLE; Schema: public; Owner: cendana_user
--

CREATE TABLE public."Investment" (
    id integer NOT NULL,
    title text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    description text
);


ALTER TABLE public."Investment" OWNER TO cendana_user;

--
-- Name: Investment_id_seq; Type: SEQUENCE; Schema: public; Owner: cendana_user
--

CREATE SEQUENCE public."Investment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Investment_id_seq" OWNER TO cendana_user;

--
-- Name: Investment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cendana_user
--

ALTER SEQUENCE public."Investment_id_seq" OWNED BY public."Investment".id;


--
-- Name: Opex; Type: TABLE; Schema: public; Owner: cendana_user
--

CREATE TABLE public."Opex" (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    title character varying(255) NOT NULL,
    description text
);


ALTER TABLE public."Opex" OWNER TO cendana_user;

--
-- Name: Opex_id_seq; Type: SEQUENCE; Schema: public; Owner: cendana_user
--

CREATE SEQUENCE public."Opex_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Opex_id_seq" OWNER TO cendana_user;

--
-- Name: Opex_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cendana_user
--

ALTER SEQUENCE public."Opex_id_seq" OWNED BY public."Opex".id;


--
-- Name: Order; Type: TABLE; Schema: public; Owner: cendana_user
--

CREATE TABLE public."Order" (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "authorId" integer NOT NULL,
    "targetUserId" integer NOT NULL,
    "orderType" public."OrderType" NOT NULL,
    "orderStatus" public."OrderStatus" NOT NULL,
    "itemDiscount" numeric(65,30) DEFAULT 0 NOT NULL,
    tax integer DEFAULT 0 NOT NULL,
    shipping numeric(65,30) DEFAULT 0 NOT NULL,
    total numeric(65,30) DEFAULT 0 NOT NULL,
    "subTotal" numeric(65,30) DEFAULT 0 NOT NULL,
    "grandTotal" numeric(65,30) DEFAULT 0 NOT NULL,
    discount integer DEFAULT 0 NOT NULL,
    promo text,
    description text
);


ALTER TABLE public."Order" OWNER TO cendana_user;

--
-- Name: OrderItem; Type: TABLE; Schema: public; Owner: cendana_user
--

CREATE TABLE public."OrderItem" (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "authorId" integer NOT NULL,
    "productId" integer NOT NULL,
    "orderId" integer NOT NULL,
    "buyPrice" numeric(65,30) NOT NULL,
    "sellPrice" numeric(65,30) NOT NULL,
    quantity integer NOT NULL,
    discount integer DEFAULT 0 NOT NULL,
    description text
);


ALTER TABLE public."OrderItem" OWNER TO cendana_user;

--
-- Name: OrderItem_id_seq; Type: SEQUENCE; Schema: public; Owner: cendana_user
--

CREATE SEQUENCE public."OrderItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."OrderItem_id_seq" OWNER TO cendana_user;

--
-- Name: OrderItem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cendana_user
--

ALTER SEQUENCE public."OrderItem_id_seq" OWNED BY public."OrderItem".id;


--
-- Name: Order_id_seq; Type: SEQUENCE; Schema: public; Owner: cendana_user
--

CREATE SEQUENCE public."Order_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Order_id_seq" OWNER TO cendana_user;

--
-- Name: Order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cendana_user
--

ALTER SEQUENCE public."Order_id_seq" OWNED BY public."Order".id;


--
-- Name: Product; Type: TABLE; Schema: public; Owner: cendana_user
--

CREATE TABLE public."Product" (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    name character varying(255) NOT NULL,
    "buyPrice" numeric(65,30) DEFAULT 0 NOT NULL,
    "sellPrice" numeric(65,30) DEFAULT 0 NOT NULL,
    discount integer DEFAULT 0 NOT NULL,
    available integer DEFAULT 0 NOT NULL,
    sold integer DEFAULT 0 NOT NULL,
    defect integer DEFAULT 0 NOT NULL,
    returned integer DEFAULT 0 NOT NULL,
    unit text NOT NULL
);


ALTER TABLE public."Product" OWNER TO cendana_user;

--
-- Name: ProductCategory; Type: TABLE; Schema: public; Owner: cendana_user
--

CREATE TABLE public."ProductCategory" (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public."ProductCategory" OWNER TO cendana_user;

--
-- Name: ProductCategory_id_seq; Type: SEQUENCE; Schema: public; Owner: cendana_user
--

CREATE SEQUENCE public."ProductCategory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ProductCategory_id_seq" OWNER TO cendana_user;

--
-- Name: ProductCategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cendana_user
--

ALTER SEQUENCE public."ProductCategory_id_seq" OWNED BY public."ProductCategory".id;


--
-- Name: Product_id_seq; Type: SEQUENCE; Schema: public; Owner: cendana_user
--

CREATE SEQUENCE public."Product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Product_id_seq" OWNER TO cendana_user;

--
-- Name: Product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cendana_user
--

ALTER SEQUENCE public."Product_id_seq" OWNED BY public."Product".id;


--
-- Name: RecordEquity; Type: TABLE; Schema: public; Owner: cendana_user
--

CREATE TABLE public."RecordEquity" (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nominal numeric(65,30) DEFAULT 0 NOT NULL
);


ALTER TABLE public."RecordEquity" OWNER TO cendana_user;

--
-- Name: RecordEquity_id_seq; Type: SEQUENCE; Schema: public; Owner: cendana_user
--

CREATE SEQUENCE public."RecordEquity_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RecordEquity_id_seq" OWNER TO cendana_user;

--
-- Name: RecordEquity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cendana_user
--

ALTER SEQUENCE public."RecordEquity_id_seq" OWNED BY public."RecordEquity".id;


--
-- Name: RecordProduct; Type: TABLE; Schema: public; Owner: cendana_user
--

CREATE TABLE public."RecordProduct" (
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    hpp numeric(65,30) DEFAULT 0 NOT NULL,
    persediaan numeric(65,30) DEFAULT 0 NOT NULL
);


ALTER TABLE public."RecordProduct" OWNER TO cendana_user;

--
-- Name: StockItem; Type: TABLE; Schema: public; Owner: cendana_user
--

CREATE TABLE public."StockItem" (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "authorId" integer NOT NULL,
    "productId" integer NOT NULL,
    "orderId" integer NOT NULL,
    "buyPrice" numeric(65,30) NOT NULL,
    "sellPrice" numeric(65,30) NOT NULL,
    discount integer DEFAULT 0 NOT NULL,
    quantity integer DEFAULT 0 NOT NULL,
    available integer DEFAULT 0 NOT NULL,
    sold integer DEFAULT 0 NOT NULL,
    defect integer DEFAULT 0 NOT NULL,
    returned integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."StockItem" OWNER TO cendana_user;

--
-- Name: StockItem_id_seq; Type: SEQUENCE; Schema: public; Owner: cendana_user
--

CREATE SEQUENCE public."StockItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."StockItem_id_seq" OWNER TO cendana_user;

--
-- Name: StockItem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cendana_user
--

ALTER SEQUENCE public."StockItem_id_seq" OWNED BY public."StockItem".id;


--
-- Name: Tool; Type: TABLE; Schema: public; Owner: cendana_user
--

CREATE TABLE public."Tool" (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    title character varying(255) NOT NULL,
    description text
);


ALTER TABLE public."Tool" OWNER TO cendana_user;

--
-- Name: Tool_id_seq; Type: SEQUENCE; Schema: public; Owner: cendana_user
--

CREATE SEQUENCE public."Tool_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tool_id_seq" OWNER TO cendana_user;

--
-- Name: Tool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cendana_user
--

ALTER SEQUENCE public."Tool_id_seq" OWNED BY public."Tool".id;


--
-- Name: Transaction; Type: TABLE; Schema: public; Owner: cendana_user
--

CREATE TABLE public."Transaction" (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "authorId" integer NOT NULL,
    type public."TransactionType" NOT NULL,
    status public."TransactionStatus" NOT NULL,
    "paymentMethod" public."PaymentMethod" NOT NULL,
    nominal numeric(65,30) NOT NULL,
    "orderId" integer,
    "delayId" integer,
    "opexId" integer,
    "toolId" integer,
    "equityChangeId" integer,
    "investmentId" integer,
    "pengembalianModalFlag" integer,
    description text
);


ALTER TABLE public."Transaction" OWNER TO cendana_user;

--
-- Name: Transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: cendana_user
--

CREATE SEQUENCE public."Transaction_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Transaction_id_seq" OWNER TO cendana_user;

--
-- Name: Transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cendana_user
--

ALTER SEQUENCE public."Transaction_id_seq" OWNED BY public."Transaction".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: cendana_user
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    username text,
    password text,
    role public."Role" NOT NULL,
    address text,
    mobile text,
    email text
);


ALTER TABLE public."User" OWNER TO cendana_user;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: cendana_user
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_id_seq" OWNER TO cendana_user;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cendana_user
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: _ProductToProductCategory; Type: TABLE; Schema: public; Owner: cendana_user
--

CREATE TABLE public."_ProductToProductCategory" (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public."_ProductToProductCategory" OWNER TO cendana_user;

--
-- Name: Delay id; Type: DEFAULT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Delay" ALTER COLUMN id SET DEFAULT nextval('public."Delay_id_seq"'::regclass);


--
-- Name: EquityChange id; Type: DEFAULT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."EquityChange" ALTER COLUMN id SET DEFAULT nextval('public."EquityChange_id_seq"'::regclass);


--
-- Name: Investment id; Type: DEFAULT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Investment" ALTER COLUMN id SET DEFAULT nextval('public."Investment_id_seq"'::regclass);


--
-- Name: Opex id; Type: DEFAULT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Opex" ALTER COLUMN id SET DEFAULT nextval('public."Opex_id_seq"'::regclass);


--
-- Name: Order id; Type: DEFAULT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Order" ALTER COLUMN id SET DEFAULT nextval('public."Order_id_seq"'::regclass);


--
-- Name: OrderItem id; Type: DEFAULT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."OrderItem" ALTER COLUMN id SET DEFAULT nextval('public."OrderItem_id_seq"'::regclass);


--
-- Name: Product id; Type: DEFAULT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Product" ALTER COLUMN id SET DEFAULT nextval('public."Product_id_seq"'::regclass);


--
-- Name: ProductCategory id; Type: DEFAULT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."ProductCategory" ALTER COLUMN id SET DEFAULT nextval('public."ProductCategory_id_seq"'::regclass);


--
-- Name: RecordEquity id; Type: DEFAULT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."RecordEquity" ALTER COLUMN id SET DEFAULT nextval('public."RecordEquity_id_seq"'::regclass);


--
-- Name: StockItem id; Type: DEFAULT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."StockItem" ALTER COLUMN id SET DEFAULT nextval('public."StockItem_id_seq"'::regclass);


--
-- Name: Tool id; Type: DEFAULT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Tool" ALTER COLUMN id SET DEFAULT nextval('public."Tool_id_seq"'::regclass);


--
-- Name: Transaction id; Type: DEFAULT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Transaction" ALTER COLUMN id SET DEFAULT nextval('public."Transaction_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Data for Name: Delay; Type: TABLE DATA; Schema: public; Owner: cendana_user
--

INSERT INTO public."Delay" (id, "createdAt", "updatedAt", "authorId", type, "orderId", "dueDate", total, complete) VALUES (1, '2021-01-17 16:00:00', '2022-04-22 08:44:29.433', 75, 'RECEIVABLE', 73, '2021-01-19 16:00:00', 440000.000000000000000000000000000000, false);


--
-- Data for Name: EquityChange; Type: TABLE DATA; Schema: public; Owner: cendana_user
--

INSERT INTO public."EquityChange" (id, "user", "createdAt") VALUES (1, 'Admin Zero', '2015-01-14 00:00:00');


--
-- Data for Name: FinanceReport; Type: TABLE DATA; Schema: public; Owner: cendana_user
--

INSERT INTO public."FinanceReport" (target, "totalPenjualan", "hppAwal", "hppAkhir", hpp, "labaKotor", opex, "labaSebelumPajak", pajak, "labaBersih", kas, piutang, persediaan, "aktivaLancar", peralatan, "akumulasiPeralatan", "aktivaTetap", passiva, "utangDagang", "modalAwal", "modalAkhir", "totalRetur", "pembelianBarangDagang", "totalBiayaPengeluaran", "pajakUsaha", prive, "kendaraanBaru", investasi, "penambahanModalUsaha", roc, "arusKasOperasional", "arusKasInvestasi") VALUES ('2021-01-30 16:00:00', 24168500.000000000000000000000000000000, 43462000.000000000000000000000000000000, 26473500.000000000000000000000000000000, 16988500.000000000000000000000000000000, 7180000.000000000000000000000000000000, 4040500.000000000000000000000000000000, 3139500.000000000000000000000000000000, 54000.000000000000000000000000000000, 3085500.000000000000000000000000000000, 24168500.000000000000000000000000000000, 0.000000000000000000000000000000, 26473500.000000000000000000000000000000, 50642000.000000000000000000000000000000, 124000.000000000000000000000000000000, 4000.000000000000000000000000000000, 120000.000000000000000000000000000000, 50762000.000000000000000000000000000000, 4598000.000000000000000000000000000000, 43078500.000000000000000000000000000000, 46164000.000000000000000000000000000000, 0.000000000000000000000000000000, 4598000.000000000000000000000000000000, 4164500.000000000000000000000000000000, NULL, 0.000000000000000000000000000000, NULL, 0.000000000000000000000000000000, NULL, 0.000000000000000000000000000000, 15352000.000000000000000000000000000000, 0.000000000000000000000000000000);


--
-- Data for Name: Investment; Type: TABLE DATA; Schema: public; Owner: cendana_user
--



--
-- Data for Name: Opex; Type: TABLE DATA; Schema: public; Owner: cendana_user
--

INSERT INTO public."Opex" (id, "createdAt", "updatedAt", title, description) VALUES (1, '2022-04-22 08:15:06.454', '2022-04-22 08:15:06.454', 'Pembayaran Bensin Kendaraan', '');
INSERT INTO public."Opex" (id, "createdAt", "updatedAt", title, description) VALUES (2, '2022-04-22 08:15:06.454', '2022-04-22 08:15:06.454', 'Pembayaran BPJS Kesehatan', '');
INSERT INTO public."Opex" (id, "createdAt", "updatedAt", title, description) VALUES (3, '2022-04-22 08:15:06.454', '2022-04-22 08:15:06.454', 'Pembayaran Lainnya', '');
INSERT INTO public."Opex" (id, "createdAt", "updatedAt", title, description) VALUES (4, '2022-04-22 08:15:06.454', '2022-04-22 08:15:06.454', 'Pembayaran PDAM', '');
INSERT INTO public."Opex" (id, "createdAt", "updatedAt", title, description) VALUES (5, '2022-04-22 08:15:06.454', '2022-04-22 08:15:06.454', 'Pembayaran KIR Kendaran', '');
INSERT INTO public."Opex" (id, "createdAt", "updatedAt", title, description) VALUES (6, '2022-04-22 08:15:06.454', '2022-04-22 08:15:06.454', 'Pembayaran Ekspedisi', '');
INSERT INTO public."Opex" (id, "createdAt", "updatedAt", title, description) VALUES (7, '2022-04-22 08:15:06.454', '2022-04-22 08:15:06.454', 'Pembayaran Indihome', '');
INSERT INTO public."Opex" (id, "createdAt", "updatedAt", title, description) VALUES (8, '2022-04-22 08:15:06.454', '2022-04-22 08:15:06.454', 'Service Kendaraan', '');
INSERT INTO public."Opex" (id, "createdAt", "updatedAt", title, description) VALUES (9, '2022-04-22 08:15:06.454', '2022-04-22 08:15:06.454', 'Pembayaran Listrik', '');
INSERT INTO public."Opex" (id, "createdAt", "updatedAt", title, description) VALUES (10, '2022-04-22 08:15:06.454', '2022-04-22 08:15:06.454', 'Pembayaran Gaji Pegawai', '');


--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: cendana_user
--

INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (26, '2021-01-10 16:00:00', '2022-04-22 08:15:17.954', 1, 25, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 111000.000000000000000000000000000000, 111000.000000000000000000000000000000, 111000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (20, '2021-01-07 16:00:00', '2022-04-22 08:15:15.142', 1, 19, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 966000.000000000000000000000000000000, 966000.000000000000000000000000000000, 966000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (44, '2021-01-18 16:00:00', '2022-04-22 08:15:27.375', 1, 43, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 216000.000000000000000000000000000000, 216000.000000000000000000000000000000, 216000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (34, '2021-01-12 16:00:00', '2022-04-22 08:15:22.674', 1, 33, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 336000.000000000000000000000000000000, 336000.000000000000000000000000000000, 336000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (13, '2021-01-06 16:00:00', '2022-04-22 08:15:12.126', 1, 12, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 289500.000000000000000000000000000000, 289500.000000000000000000000000000000, 289500.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (1, '2021-01-17 16:00:00', '2022-04-22 08:15:07.7', 1, 73, 'BUY', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 4348000.000000000000000000000000000000, 4348000.000000000000000000000000000000, 4348000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (2, '2021-01-28 16:00:00', '2022-04-22 08:15:07.887', 1, 74, 'BUY', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 250000.000000000000000000000000000000, 250000.000000000000000000000000000000, 250000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (3, '2021-01-04 16:00:00', '2022-04-22 08:15:08.199', 1, 2, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 39000.000000000000000000000000000000, 39000.000000000000000000000000000000, 39000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (41, '2021-01-14 16:00:00', '2022-04-22 08:15:26.162', 1, 40, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 267000.000000000000000000000000000000, 267000.000000000000000000000000000000, 267000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (14, '2021-01-06 16:00:00', '2022-04-22 08:15:12.385', 1, 13, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 38500.000000000000000000000000000000, 38500.000000000000000000000000000000, 38500.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (4, '2021-01-04 16:00:00', '2022-04-22 08:15:08.59', 1, 3, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 184500.000000000000000000000000000000, 184500.000000000000000000000000000000, 184500.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (5, '2021-01-04 16:00:00', '2022-04-22 08:15:08.769', 1, 4, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 90000.000000000000000000000000000000, 90000.000000000000000000000000000000, 90000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (54, '2021-01-22 16:00:00', '2022-04-22 08:15:31.275', 1, 53, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 630000.000000000000000000000000000000, 630000.000000000000000000000000000000, 630000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (6, '2021-01-04 16:00:00', '2022-04-22 08:15:08.932', 1, 5, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 60000.000000000000000000000000000000, 60000.000000000000000000000000000000, 60000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (38, '2021-01-14 16:00:00', '2022-04-22 08:15:24.791', 1, 37, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 585000.000000000000000000000000000000, 585000.000000000000000000000000000000, 585000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (15, '2021-01-06 16:00:00', '2022-04-22 08:15:12.687', 1, 14, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 142000.000000000000000000000000000000, 142000.000000000000000000000000000000, 142000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (7, '2021-01-04 16:00:00', '2022-04-22 08:15:09.248', 1, 6, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 379500.000000000000000000000000000000, 379500.000000000000000000000000000000, 379500.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (31, '2021-01-10 16:00:00', '2022-04-22 08:15:21.08', 1, 30, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 405000.000000000000000000000000000000, 405000.000000000000000000000000000000, 405000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (27, '2021-01-10 16:00:00', '2022-04-22 08:15:18.923', 1, 26, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 618500.000000000000000000000000000000, 618500.000000000000000000000000000000, 618500.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (8, '2021-01-04 16:00:00', '2022-04-22 08:15:09.591', 1, 7, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 379500.000000000000000000000000000000, 379500.000000000000000000000000000000, 379500.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (16, '2021-01-06 16:00:00', '2022-04-22 08:15:12.999', 1, 15, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 76000.000000000000000000000000000000, 76000.000000000000000000000000000000, 76000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (9, '2021-01-04 16:00:00', '2022-04-22 08:15:09.897', 1, 8, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 120000.000000000000000000000000000000, 120000.000000000000000000000000000000, 120000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (45, '2021-01-18 16:00:00', '2022-04-22 08:15:27.522', 1, 44, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 63000.000000000000000000000000000000, 63000.000000000000000000000000000000, 63000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (10, '2021-01-04 16:00:00', '2022-04-22 08:15:10.297', 1, 9, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 255000.000000000000000000000000000000, 255000.000000000000000000000000000000, 255000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (17, '2021-01-06 16:00:00', '2022-04-22 08:15:13.443', 1, 16, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 627000.000000000000000000000000000000, 627000.000000000000000000000000000000, 627000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (28, '2021-01-10 16:00:00', '2022-04-22 08:15:19.254', 1, 27, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 159000.000000000000000000000000000000, 159000.000000000000000000000000000000, 159000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (21, '2021-01-07 16:00:00', '2022-04-22 08:15:16.656', 1, 20, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 1227000.000000000000000000000000000000, 1227000.000000000000000000000000000000, 1227000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (18, '2021-01-07 16:00:00', '2022-04-22 08:15:13.823', 1, 17, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 276000.000000000000000000000000000000, 276000.000000000000000000000000000000, 276000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (11, '2021-01-04 16:00:00', '2022-04-22 08:15:11.018', 1, 10, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 446000.000000000000000000000000000000, 446000.000000000000000000000000000000, 446000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (35, '2021-01-12 16:00:00', '2022-04-22 08:15:23.332', 1, 34, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 606000.000000000000000000000000000000, 606000.000000000000000000000000000000, 606000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (19, '2021-01-07 16:00:00', '2022-04-22 08:15:13.97', 1, 18, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 159000.000000000000000000000000000000, 159000.000000000000000000000000000000, 159000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (22, '2021-01-10 16:00:00', '2022-04-22 08:15:16.863', 1, 21, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 120000.000000000000000000000000000000, 120000.000000000000000000000000000000, 120000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (12, '2021-01-04 16:00:00', '2022-04-22 08:15:11.433', 1, 11, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 774000.000000000000000000000000000000, 774000.000000000000000000000000000000, 774000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (42, '2021-01-14 16:00:00', '2022-04-22 08:15:26.467', 1, 41, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 165000.000000000000000000000000000000, 165000.000000000000000000000000000000, 165000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (32, '2021-01-10 16:00:00', '2022-04-22 08:15:21.623', 1, 31, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 376000.000000000000000000000000000000, 376000.000000000000000000000000000000, 376000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (36, '2021-01-12 16:00:00', '2022-04-22 08:15:23.499', 1, 35, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 216000.000000000000000000000000000000, 216000.000000000000000000000000000000, 216000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (23, '2021-01-10 16:00:00', '2022-04-22 08:15:17.278', 1, 22, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 292500.000000000000000000000000000000, 292500.000000000000000000000000000000, 292500.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (29, '2021-01-10 16:00:00', '2022-04-22 08:15:19.783', 1, 28, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 388500.000000000000000000000000000000, 388500.000000000000000000000000000000, 388500.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (24, '2021-01-10 16:00:00', '2022-04-22 08:15:17.435', 1, 23, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 40000.000000000000000000000000000000, 40000.000000000000000000000000000000, 40000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (25, '2021-01-10 16:00:00', '2022-04-22 08:15:17.662', 1, 24, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 255000.000000000000000000000000000000, 255000.000000000000000000000000000000, 255000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (39, '2021-01-14 16:00:00', '2022-04-22 08:15:25.248', 1, 38, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 597000.000000000000000000000000000000, 597000.000000000000000000000000000000, 597000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (37, '2021-01-12 16:00:00', '2022-04-22 08:15:23.958', 1, 36, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 415000.000000000000000000000000000000, 415000.000000000000000000000000000000, 415000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (48, '2021-01-18 16:00:00', '2022-04-22 08:15:28.69', 1, 47, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 362500.000000000000000000000000000000, 362500.000000000000000000000000000000, 362500.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (30, '2021-01-10 16:00:00', '2022-04-22 08:15:20.376', 1, 29, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 285000.000000000000000000000000000000, 285000.000000000000000000000000000000, 285000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (33, '2021-01-12 16:00:00', '2022-04-22 08:15:22.368', 1, 32, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 563000.000000000000000000000000000000, 563000.000000000000000000000000000000, 563000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (46, '2021-01-18 16:00:00', '2022-04-22 08:15:27.821', 1, 45, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 87000.000000000000000000000000000000, 87000.000000000000000000000000000000, 87000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (40, '2021-01-14 16:00:00', '2022-04-22 08:15:25.702', 1, 39, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 198000.000000000000000000000000000000, 198000.000000000000000000000000000000, 198000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (43, '2021-01-18 16:00:00', '2022-04-22 08:15:26.973', 1, 42, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 442500.000000000000000000000000000000, 442500.000000000000000000000000000000, 442500.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (47, '2021-01-18 16:00:00', '2022-04-22 08:15:27.999', 1, 46, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 45000.000000000000000000000000000000, 45000.000000000000000000000000000000, 45000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (58, '2021-01-22 16:00:00', '2022-04-22 08:15:32.829', 1, 57, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 620500.000000000000000000000000000000, 620500.000000000000000000000000000000, 620500.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (50, '2021-01-19 16:00:00', '2022-04-22 08:15:29.588', 1, 43, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 321000.000000000000000000000000000000, 321000.000000000000000000000000000000, 321000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (55, '2021-01-22 16:00:00', '2022-04-22 08:15:31.507', 1, 54, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 108000.000000000000000000000000000000, 108000.000000000000000000000000000000, 108000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (49, '2021-01-18 16:00:00', '2022-04-22 08:15:29.078', 1, 48, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 170000.000000000000000000000000000000, 170000.000000000000000000000000000000, 170000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (53, '2021-01-22 16:00:00', '2022-04-22 08:15:31.044', 1, 52, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 367500.000000000000000000000000000000, 367500.000000000000000000000000000000, 367500.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (57, '2021-01-22 16:00:00', '2022-04-22 08:15:32.103', 1, 56, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 72000.000000000000000000000000000000, 72000.000000000000000000000000000000, 72000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (52, '2021-01-19 16:00:00', '2022-04-22 08:15:30.561', 1, 51, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 982500.000000000000000000000000000000, 982500.000000000000000000000000000000, 982500.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (51, '2021-01-19 16:00:00', '2022-04-22 08:15:29.904', 1, 50, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 265000.000000000000000000000000000000, 265000.000000000000000000000000000000, 265000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (56, '2021-01-22 16:00:00', '2022-04-22 08:15:31.874', 1, 55, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 186000.000000000000000000000000000000, 186000.000000000000000000000000000000, 186000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (60, '2021-01-24 16:00:00', '2022-04-22 08:15:33.434', 1, 59, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 333000.000000000000000000000000000000, 333000.000000000000000000000000000000, 333000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (59, '2021-01-24 16:00:00', '2022-04-22 08:15:33.069', 1, 58, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 630000.000000000000000000000000000000, 630000.000000000000000000000000000000, 630000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (61, '2021-01-24 16:00:00', '2022-04-22 08:15:33.804', 1, 60, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 261000.000000000000000000000000000000, 261000.000000000000000000000000000000, 261000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (62, '2021-01-24 16:00:00', '2022-04-22 08:15:34.016', 1, 52, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 60000.000000000000000000000000000000, 60000.000000000000000000000000000000, 60000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (65, '2021-01-26 16:00:00', '2022-04-22 08:15:36.153', 1, 11, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 756500.000000000000000000000000000000, 756500.000000000000000000000000000000, 756500.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (63, '2021-01-24 16:00:00', '2022-04-22 08:15:34.439', 1, 62, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 456500.000000000000000000000000000000, 456500.000000000000000000000000000000, 456500.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (64, '2021-01-26 16:00:00', '2022-04-22 08:15:35.293', 1, 9, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 649000.000000000000000000000000000000, 649000.000000000000000000000000000000, 649000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (66, '2021-01-26 16:00:00', '2022-04-22 08:15:37.051', 1, 65, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 717000.000000000000000000000000000000, 717000.000000000000000000000000000000, 717000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (67, '2021-01-26 16:00:00', '2022-04-22 08:15:37.361', 1, 66, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 105000.000000000000000000000000000000, 105000.000000000000000000000000000000, 105000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (68, '2021-01-26 16:00:00', '2022-04-22 08:15:38.165', 1, 67, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 462000.000000000000000000000000000000, 462000.000000000000000000000000000000, 462000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (69, '2021-01-26 16:00:00', '2022-04-22 08:15:38.931', 1, 68, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 540000.000000000000000000000000000000, 540000.000000000000000000000000000000, 540000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (70, '2021-01-28 16:00:00', '2022-04-22 08:15:39.307', 1, 69, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 361000.000000000000000000000000000000, 361000.000000000000000000000000000000, 361000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (71, '2021-01-28 16:00:00', '2022-04-22 08:15:39.805', 1, 70, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 312000.000000000000000000000000000000, 312000.000000000000000000000000000000, 312000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (72, '2021-01-28 16:00:00', '2022-04-22 08:15:40.02', 1, 71, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 60000.000000000000000000000000000000, 60000.000000000000000000000000000000, 60000.000000000000000000000000000000, 0, NULL, '');
INSERT INTO public."Order" (id, "createdAt", "updatedAt", "authorId", "targetUserId", "orderType", "orderStatus", "itemDiscount", tax, shipping, total, "subTotal", "grandTotal", discount, promo, description) VALUES (73, '2021-01-17 16:00:00', '2022-04-22 08:44:29.432', 75, 59, 'SALE', 'SEALED', 0.000000000000000000000000000000, 0, 0.000000000000000000000000000000, 740000.000000000000000000000000000000, 740000.000000000000000000000000000000, 740000.000000000000000000000000000000, 0, NULL, '');


--
-- Data for Name: OrderItem; Type: TABLE DATA; Schema: public; Owner: cendana_user
--

INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (1, '2022-04-22 08:15:08.064', '2022-04-22 08:15:08.065', 1, 129, 3, 38500.000000000000000000000000000000, 39000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (2, '2022-04-22 08:15:08.307', '2022-04-22 08:15:08.308', 1, 111, 4, 7000.000000000000000000000000000000, 7500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (3, '2022-04-22 08:15:08.403', '2022-04-22 08:15:08.403', 1, 171, 4, 26500.000000000000000000000000000000, 27000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (4, '2022-04-22 08:15:08.479', '2022-04-22 08:15:08.48', 1, 133, 4, 18250.000000000000000000000000000000, 18750.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (5, '2022-04-22 08:15:08.673', '2022-04-22 08:15:08.674', 1, 111, 5, 7000.000000000000000000000000000000, 7500.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (6, '2022-04-22 08:15:08.837', '2022-04-22 08:15:08.838', 1, 65, 6, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (7, '2022-04-22 08:15:09', '2022-04-22 08:15:09.001', 1, 65, 7, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (8, '2022-04-22 08:15:09.075', '2022-04-22 08:15:09.076', 1, 135, 7, 24000.000000000000000000000000000000, 24500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (9, '2022-04-22 08:15:09.148', '2022-04-22 08:15:09.149', 1, 133, 7, 18250.000000000000000000000000000000, 18750.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (10, '2022-04-22 08:15:09.32', '2022-04-22 08:15:09.32', 1, 65, 8, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (11, '2022-04-22 08:15:09.4', '2022-04-22 08:15:09.401', 1, 135, 8, 24000.000000000000000000000000000000, 24500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (12, '2022-04-22 08:15:09.475', '2022-04-22 08:15:09.476', 1, 133, 8, 18250.000000000000000000000000000000, 18750.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (13, '2022-04-22 08:15:09.671', '2022-04-22 08:15:09.672', 1, 105, 9, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (14, '2022-04-22 08:15:09.807', '2022-04-22 08:15:09.807', 1, 106, 9, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (15, '2022-04-22 08:15:09.97', '2022-04-22 08:15:09.971', 1, 55, 10, 11500.000000000000000000000000000000, 12000.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (16, '2022-04-22 08:15:10.051', '2022-04-22 08:15:10.052', 1, 82, 10, 12000.000000000000000000000000000000, 12500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (17, '2022-04-22 08:15:10.121', '2022-04-22 08:15:10.122', 1, 157, 10, 52000.000000000000000000000000000000, 52500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (18, '2022-04-22 08:15:10.194', '2022-04-22 08:15:10.195', 1, 154, 10, 25000.000000000000000000000000000000, 39000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (19, '2022-04-22 08:15:10.374', '2022-04-22 08:15:10.375', 1, 58, 11, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (20, '2022-04-22 08:15:10.447', '2022-04-22 08:15:10.448', 1, 57, 11, 47500.000000000000000000000000000000, 48000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (21, '2022-04-22 08:15:10.524', '2022-04-22 08:15:10.525', 1, 43, 11, 71500.000000000000000000000000000000, 72000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (22, '2022-04-22 08:15:10.602', '2022-04-22 08:15:10.603', 1, 84, 11, 10000.000000000000000000000000000000, 10500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (23, '2022-04-22 08:15:10.678', '2022-04-22 08:15:10.679', 1, 85, 11, 5500.000000000000000000000000000000, 10500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (24, '2022-04-22 08:15:10.752', '2022-04-22 08:15:10.753', 1, 87, 11, 15000.000000000000000000000000000000, 15500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (25, '2022-04-22 08:15:10.83', '2022-04-22 08:15:10.831', 1, 155, 11, 41500.000000000000000000000000000000, 42000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (26, '2022-04-22 08:15:10.911', '2022-04-22 08:15:10.912', 1, 187, 11, 22000.000000000000000000000000000000, 22500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (27, '2022-04-22 08:15:11.107', '2022-04-22 08:15:11.108', 1, 157, 12, 52000.000000000000000000000000000000, 52500.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (28, '2022-04-22 08:15:11.179', '2022-04-22 08:15:11.18', 1, 135, 12, 24000.000000000000000000000000000000, 24500.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (29, '2022-04-22 08:15:11.261', '2022-04-22 08:15:11.262', 1, 134, 12, 22000.000000000000000000000000000000, 22500.000000000000000000000000000000, 9, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (30, '2022-04-22 08:15:11.339', '2022-04-22 08:15:11.34', 1, 133, 12, 18250.000000000000000000000000000000, 18750.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (31, '2022-04-22 08:15:11.502', '2022-04-22 08:15:11.503', 1, 96, 13, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (32, '2022-04-22 08:15:11.577', '2022-04-22 08:15:11.578', 1, 97, 13, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (33, '2022-04-22 08:15:11.65', '2022-04-22 08:15:11.651', 1, 98, 13, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (34, '2022-04-22 08:15:11.722', '2022-04-22 08:15:11.723', 1, 99, 13, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (35, '2022-04-22 08:15:11.797', '2022-04-22 08:15:11.798', 1, 100, 13, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (36, '2022-04-22 08:15:11.87', '2022-04-22 08:15:11.871', 1, 101, 13, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (37, '2022-04-22 08:15:11.941', '2022-04-22 08:15:11.942', 1, 120, 13, 13000.000000000000000000000000000000, 13500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (38, '2022-04-22 08:15:12.018', '2022-04-22 08:15:12.019', 1, 171, 13, 26500.000000000000000000000000000000, 27000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (39, '2022-04-22 08:15:12.217', '2022-04-22 08:15:12.218', 1, 3, 14, 12000.000000000000000000000000000000, 12500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (40, '2022-04-22 08:15:12.289', '2022-04-22 08:15:12.29', 1, 120, 14, 13000.000000000000000000000000000000, 13500.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (41, '2022-04-22 08:15:12.452', '2022-04-22 08:15:12.453', 1, 2, 15, 5500.000000000000000000000000000000, 6000.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (42, '2022-04-22 08:15:12.527', '2022-04-22 08:15:12.528', 1, 173, 15, 24500.000000000000000000000000000000, 25000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (43, '2022-04-22 08:15:12.6', '2022-04-22 08:15:12.601', 1, 139, 15, 7000.000000000000000000000000000000, 7500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (44, '2022-04-22 08:15:12.756', '2022-04-22 08:15:12.757', 1, 10, 16, 23500.000000000000000000000000000000, 24000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (45, '2022-04-22 08:15:12.834', '2022-04-22 08:15:12.835', 1, 31, 16, 26500.000000000000000000000000000000, 27000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (46, '2022-04-22 08:15:12.903', '2022-04-22 08:15:12.904', 1, 174, 16, 24500.000000000000000000000000000000, 25000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (47, '2022-04-22 08:15:13.07', '2022-04-22 08:15:13.071', 1, 65, 17, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (48, '2022-04-22 08:15:13.141', '2022-04-22 08:15:13.142', 1, 66, 17, 22000.000000000000000000000000000000, 22500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (49, '2022-04-22 08:15:13.262', '2022-04-22 08:15:13.263', 1, 135, 17, 24000.000000000000000000000000000000, 24500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (50, '2022-04-22 08:15:13.344', '2022-04-22 08:15:13.345', 1, 133, 17, 18250.000000000000000000000000000000, 18750.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (51, '2022-04-22 08:15:13.512', '2022-04-22 08:15:13.513', 1, 84, 18, 10000.000000000000000000000000000000, 10500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (52, '2022-04-22 08:15:13.588', '2022-04-22 08:15:13.589', 1, 87, 18, 15000.000000000000000000000000000000, 15500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (53, '2022-04-22 08:15:13.664', '2022-04-22 08:15:13.665', 1, 105, 18, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (54, '2022-04-22 08:15:13.73', '2022-04-22 08:15:13.731', 1, 106, 18, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (55, '2022-04-22 08:15:13.891', '2022-04-22 08:15:13.892', 1, 188, 19, 26000.000000000000000000000000000000, 26500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (56, '2022-04-22 08:15:14.035', '2022-04-22 08:15:14.036', 1, 32, 20, 71500.000000000000000000000000000000, 72000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (57, '2022-04-22 08:15:14.114', '2022-04-22 08:15:14.115', 1, 36, 20, 89500.000000000000000000000000000000, 90000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (58, '2022-04-22 08:15:14.19', '2022-04-22 08:15:14.191', 1, 58, 20, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (59, '2022-04-22 08:15:14.255', '2022-04-22 08:15:14.256', 1, 123, 20, 74500.000000000000000000000000000000, 75000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (60, '2022-04-22 08:15:14.327', '2022-04-22 08:15:14.328', 1, 124, 20, 71500.000000000000000000000000000000, 72000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (61, '2022-04-22 08:15:14.396', '2022-04-22 08:15:14.397', 1, 142, 20, 47500.000000000000000000000000000000, 48000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (62, '2022-04-22 08:15:14.469', '2022-04-22 08:15:14.47', 1, 141, 20, 47500.000000000000000000000000000000, 48000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (63, '2022-04-22 08:15:14.539', '2022-04-22 08:15:14.539', 1, 148, 20, 41500.000000000000000000000000000000, 42000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (64, '2022-04-22 08:15:14.612', '2022-04-22 08:15:14.613', 1, 149, 20, 41500.000000000000000000000000000000, 42000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (65, '2022-04-22 08:15:14.684', '2022-04-22 08:15:14.685', 1, 150, 20, 54500.000000000000000000000000000000, 55000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (66, '2022-04-22 08:15:14.768', '2022-04-22 08:15:14.77', 1, 152, 20, 109500.000000000000000000000000000000, 110000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (67, '2022-04-22 08:15:14.857', '2022-04-22 08:15:14.858', 1, 164, 20, 2500.000000000000000000000000000000, 3000.000000000000000000000000000000, 24, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (68, '2022-04-22 08:15:14.944', '2022-04-22 08:15:14.945', 1, 166, 20, 2000.000000000000000000000000000000, 2500.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (69, '2022-04-22 08:15:15.018', '2022-04-22 08:15:15.019', 1, 138, 20, 65500.000000000000000000000000000000, 60000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (70, '2022-04-22 08:15:15.239', '2022-04-22 08:15:15.24', 1, 2, 21, 5500.000000000000000000000000000000, 6000.000000000000000000000000000000, 24, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (71, '2022-04-22 08:15:15.314', '2022-04-22 08:15:15.316', 1, 35, 21, 95500.000000000000000000000000000000, 96000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (72, '2022-04-22 08:15:15.39', '2022-04-22 08:15:15.391', 1, 32, 21, 71500.000000000000000000000000000000, 72000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (73, '2022-04-22 08:15:15.47', '2022-04-22 08:15:15.471', 1, 36, 21, 89500.000000000000000000000000000000, 90000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (74, '2022-04-22 08:15:15.545', '2022-04-22 08:15:15.546', 1, 141, 21, 47500.000000000000000000000000000000, 48000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (75, '2022-04-22 08:15:15.633', '2022-04-22 08:15:15.634', 1, 142, 21, 47500.000000000000000000000000000000, 48000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (76, '2022-04-22 08:15:15.709', '2022-04-22 08:15:15.71', 1, 148, 21, 41500.000000000000000000000000000000, 42000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (77, '2022-04-22 08:15:15.795', '2022-04-22 08:15:15.796', 1, 149, 21, 41500.000000000000000000000000000000, 42000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (78, '2022-04-22 08:15:15.885', '2022-04-22 08:15:15.886', 1, 150, 21, 54500.000000000000000000000000000000, 55000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (79, '2022-04-22 08:15:15.976', '2022-04-22 08:15:15.977', 1, 145, 21, 98500.000000000000000000000000000000, 99000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (80, '2022-04-22 08:15:16.05', '2022-04-22 08:15:16.051', 1, 151, 21, 54500.000000000000000000000000000000, 55000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (81, '2022-04-22 08:15:16.133', '2022-04-22 08:15:16.134', 1, 152, 21, 109500.000000000000000000000000000000, 110000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (82, '2022-04-22 08:15:16.221', '2022-04-22 08:15:16.222', 1, 153, 21, 119500.000000000000000000000000000000, 120000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (83, '2022-04-22 08:15:16.295', '2022-04-22 08:15:16.296', 1, 164, 21, 2500.000000000000000000000000000000, 3000.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (84, '2022-04-22 08:15:16.376', '2022-04-22 08:15:16.377', 1, 162, 21, 2500.000000000000000000000000000000, 3000.000000000000000000000000000000, 24, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (85, '2022-04-22 08:15:16.452', '2022-04-22 08:15:16.453', 1, 173, 21, 24500.000000000000000000000000000000, 25000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (86, '2022-04-22 08:15:16.526', '2022-04-22 08:15:16.527', 1, 174, 21, 24500.000000000000000000000000000000, 25000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (87, '2022-04-22 08:15:16.765', '2022-04-22 08:15:16.766', 1, 65, 22, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (88, '2022-04-22 08:15:16.921', '2022-04-22 08:15:16.922', 1, 10, 23, 23500.000000000000000000000000000000, 24000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (89, '2022-04-22 08:15:16.991', '2022-04-22 08:15:16.992', 1, 29, 23, 13250.000000000000000000000000000000, 13750.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (90, '2022-04-22 08:15:17.055', '2022-04-22 08:15:17.056', 1, 84, 23, 10000.000000000000000000000000000000, 10500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (91, '2022-04-22 08:15:17.123', '2022-04-22 08:15:17.125', 1, 111, 23, 7000.000000000000000000000000000000, 7500.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (92, '2022-04-22 08:15:17.192', '2022-04-22 08:15:17.193', 1, 119, 23, 5000.000000000000000000000000000000, 5500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (93, '2022-04-22 08:15:17.35', '2022-04-22 08:15:17.351', 1, 58, 24, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (94, '2022-04-22 08:15:17.502', '2022-04-22 08:15:17.503', 1, 66, 25, 22000.000000000000000000000000000000, 22500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (95, '2022-04-22 08:15:17.582', '2022-04-22 08:15:17.583', 1, 65, 25, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (96, '2022-04-22 08:15:17.724', '2022-04-22 08:15:17.725', 1, 22, 26, 6000.000000000000000000000000000000, 6500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (97, '2022-04-22 08:15:17.795', '2022-04-22 08:15:17.796', 1, 76, 26, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (98, '2022-04-22 08:15:17.868', '2022-04-22 08:15:17.869', 1, 120, 26, 13000.000000000000000000000000000000, 13500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (99, '2022-04-22 08:15:18.028', '2022-04-22 08:15:18.029', 1, 25, 27, 5500.000000000000000000000000000000, 6000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (100, '2022-04-22 08:15:18.101', '2022-04-22 08:15:18.102', 1, 62, 27, 47000.000000000000000000000000000000, 47500.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (101, '2022-04-22 08:15:18.169', '2022-04-22 08:15:18.169', 1, 67, 27, 107000.000000000000000000000000000000, 107500.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (102, '2022-04-22 08:15:18.289', '2022-04-22 08:15:18.291', 1, 82, 27, 12000.000000000000000000000000000000, 12500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (103, '2022-04-22 08:15:18.404', '2022-04-22 08:15:18.405', 1, 87, 27, 15000.000000000000000000000000000000, 15500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (104, '2022-04-22 08:15:18.478', '2022-04-22 08:15:18.479', 1, 56, 27, 11500.000000000000000000000000000000, 12000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (105, '2022-04-22 08:15:18.551', '2022-04-22 08:15:18.553', 1, 158, 27, 50500.000000000000000000000000000000, 51000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (106, '2022-04-22 08:15:18.624', '2022-04-22 08:15:18.625', 1, 120, 27, 13000.000000000000000000000000000000, 13500.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (107, '2022-04-22 08:15:18.713', '2022-04-22 08:15:18.714', 1, 142, 27, 47500.000000000000000000000000000000, 48000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (108, '2022-04-22 08:15:18.786', '2022-04-22 08:15:18.787', 1, 134, 27, 22000.000000000000000000000000000000, 22500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (109, '2022-04-22 08:15:19.028', '2022-04-22 08:15:19.03', 1, 76, 28, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (110, '2022-04-22 08:15:19.098', '2022-04-22 08:15:19.099', 1, 84, 28, 10000.000000000000000000000000000000, 10500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (111, '2022-04-22 08:15:19.167', '2022-04-22 08:15:19.168', 1, 158, 28, 50500.000000000000000000000000000000, 51000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (112, '2022-04-22 08:15:19.318', '2022-04-22 08:15:19.319', 1, 32, 29, 71500.000000000000000000000000000000, 72000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (113, '2022-04-22 08:15:19.389', '2022-04-22 08:15:19.391', 1, 56, 29, 11500.000000000000000000000000000000, 12000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (114, '2022-04-22 08:15:19.465', '2022-04-22 08:15:19.467', 1, 110, 29, 59500.000000000000000000000000000000, 60000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (115, '2022-04-22 08:15:19.54', '2022-04-22 08:15:19.541', 1, 111, 29, 7000.000000000000000000000000000000, 7500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (116, '2022-04-22 08:15:19.609', '2022-04-22 08:15:19.61', 1, 187, 29, 22000.000000000000000000000000000000, 22500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (117, '2022-04-22 08:15:19.692', '2022-04-22 08:15:19.693', 1, 65, 29, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (118, '2022-04-22 08:15:19.86', '2022-04-22 08:15:19.861', 1, 105, 30, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (119, '2022-04-22 08:15:19.925', '2022-04-22 08:15:19.926', 1, 106, 30, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (120, '2022-04-22 08:15:19.989', '2022-04-22 08:15:19.99', 1, 96, 30, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (121, '2022-04-22 08:15:20.057', '2022-04-22 08:15:20.058', 1, 97, 30, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (122, '2022-04-22 08:15:20.122', '2022-04-22 08:15:20.123', 1, 98, 30, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (123, '2022-04-22 08:15:20.193', '2022-04-22 08:15:20.194', 1, 129, 30, 38500.000000000000000000000000000000, 39000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (124, '2022-04-22 08:15:20.265', '2022-04-22 08:15:20.265', 1, 130, 30, 35500.000000000000000000000000000000, 36000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (125, '2022-04-22 08:15:20.453', '2022-04-22 08:15:20.454', 1, 105, 31, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (126, '2022-04-22 08:15:20.522', '2022-04-22 08:15:20.523', 1, 106, 31, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (127, '2022-04-22 08:15:20.596', '2022-04-22 08:15:20.597', 1, 96, 31, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 4, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (128, '2022-04-22 08:15:20.668', '2022-04-22 08:15:20.669', 1, 97, 31, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 4, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (129, '2022-04-22 08:15:20.741', '2022-04-22 08:15:20.742', 1, 98, 31, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 4, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (130, '2022-04-22 08:15:20.819', '2022-04-22 08:15:20.82', 1, 99, 31, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (131, '2022-04-22 08:15:20.897', '2022-04-22 08:15:20.898', 1, 100, 31, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (132, '2022-04-22 08:15:20.975', '2022-04-22 08:15:20.976', 1, 101, 31, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (133, '2022-04-22 08:15:21.169', '2022-04-22 08:15:21.17', 1, 31, 32, 26500.000000000000000000000000000000, 27000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (134, '2022-04-22 08:15:21.255', '2022-04-22 08:15:21.256', 1, 76, 32, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (135, '2022-04-22 08:15:21.321', '2022-04-22 08:15:21.322', 1, 147, 32, 47500.000000000000000000000000000000, 48000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (136, '2022-04-22 08:15:21.389', '2022-04-22 08:15:21.39', 1, 151, 32, 54500.000000000000000000000000000000, 55000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (137, '2022-04-22 08:15:21.459', '2022-04-22 08:15:21.46', 1, 154, 32, 25000.000000000000000000000000000000, 39000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (138, '2022-04-22 08:15:21.532', '2022-04-22 08:15:21.533', 1, 171, 32, 26500.000000000000000000000000000000, 27000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (139, '2022-04-22 08:15:21.693', '2022-04-22 08:15:21.694', 1, 32, 33, 71500.000000000000000000000000000000, 72000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (140, '2022-04-22 08:15:21.756', '2022-04-22 08:15:21.756', 1, 39, 33, 98500.000000000000000000000000000000, 99000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (141, '2022-04-22 08:15:21.825', '2022-04-22 08:15:21.826', 1, 58, 33, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (142, '2022-04-22 08:15:21.894', '2022-04-22 08:15:21.895', 1, 76, 33, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (143, '2022-04-22 08:15:21.961', '2022-04-22 08:15:21.962', 1, 160, 33, 65500.000000000000000000000000000000, 66000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (144, '2022-04-22 08:15:22.028', '2022-04-22 08:15:22.029', 1, 168, 33, 59500.000000000000000000000000000000, 60000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (145, '2022-04-22 08:15:22.121', '2022-04-22 08:15:22.121', 1, 169, 33, 65500.000000000000000000000000000000, 66000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (146, '2022-04-22 08:15:22.191', '2022-04-22 08:15:22.193', 1, 173, 33, 24500.000000000000000000000000000000, 25000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (147, '2022-04-22 08:15:22.265', '2022-04-22 08:15:22.266', 1, 174, 33, 24500.000000000000000000000000000000, 25000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (148, '2022-04-22 08:15:22.451', '2022-04-22 08:15:22.452', 1, 31, 34, 26500.000000000000000000000000000000, 27000.000000000000000000000000000000, 4, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (149, '2022-04-22 08:15:22.524', '2022-04-22 08:15:22.525', 1, 171, 34, 26500.000000000000000000000000000000, 27000.000000000000000000000000000000, 4, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (150, '2022-04-22 08:15:22.589', '2022-04-22 08:15:22.59', 1, 172, 34, 2000.000000000000000000000000000000, 2500.000000000000000000000000000000, 48, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (151, '2022-04-22 08:15:22.739', '2022-04-22 08:15:22.74', 1, 145, 35, 98500.000000000000000000000000000000, 99000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (152, '2022-04-22 08:15:22.811', '2022-04-22 08:15:22.812', 1, 147, 35, 47500.000000000000000000000000000000, 48000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (153, '2022-04-22 08:15:22.885', '2022-04-22 08:15:22.886', 1, 148, 35, 41500.000000000000000000000000000000, 42000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (154, '2022-04-22 08:15:22.958', '2022-04-22 08:15:22.959', 1, 149, 35, 41500.000000000000000000000000000000, 42000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (155, '2022-04-22 08:15:23.023', '2022-04-22 08:15:23.024', 1, 150, 35, 54500.000000000000000000000000000000, 55000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (156, '2022-04-22 08:15:23.095', '2022-04-22 08:15:23.096', 1, 152, 35, 109500.000000000000000000000000000000, 110000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (157, '2022-04-22 08:15:23.168', '2022-04-22 08:15:23.169', 1, 153, 35, 119500.000000000000000000000000000000, 120000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (158, '2022-04-22 08:15:23.241', '2022-04-22 08:15:23.242', 1, 76, 35, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (159, '2022-04-22 08:15:23.417', '2022-04-22 08:15:23.418', 1, 2, 36, 5500.000000000000000000000000000000, 6000.000000000000000000000000000000, 36, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (160, '2022-04-22 08:15:23.555', '2022-04-22 08:15:23.556', 1, 26, 37, 113500.000000000000000000000000000000, 114000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (161, '2022-04-22 08:15:23.641', '2022-04-22 08:15:23.642', 1, 28, 37, 144500.000000000000000000000000000000, 145000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (162, '2022-04-22 08:15:23.728', '2022-04-22 08:15:23.729', 1, 81, 37, 23500.000000000000000000000000000000, 24000.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (163, '2022-04-22 08:15:23.794', '2022-04-22 08:15:23.795', 1, 119, 37, 5000.000000000000000000000000000000, 5500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (164, '2022-04-22 08:15:23.869', '2022-04-22 08:15:23.87', 1, 158, 37, 50500.000000000000000000000000000000, 51000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (165, '2022-04-22 08:15:24.032', '2022-04-22 08:15:24.033', 1, 77, 38, 18250.000000000000000000000000000000, 18750.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (166, '2022-04-22 08:15:24.101', '2022-04-22 08:15:24.102', 1, 105, 38, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (167, '2022-04-22 08:15:24.173', '2022-04-22 08:15:24.174', 1, 106, 38, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (168, '2022-04-22 08:15:24.238', '2022-04-22 08:15:24.238', 1, 96, 38, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 4, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (169, '2022-04-22 08:15:24.305', '2022-04-22 08:15:24.306', 1, 97, 38, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 4, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (170, '2022-04-22 08:15:24.385', '2022-04-22 08:15:24.386', 1, 98, 38, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 4, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (171, '2022-04-22 08:15:24.464', '2022-04-22 08:15:24.465', 1, 99, 38, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (172, '2022-04-22 08:15:24.535', '2022-04-22 08:15:24.536', 1, 100, 38, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (173, '2022-04-22 08:15:24.61', '2022-04-22 08:15:24.611', 1, 101, 38, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (174, '2022-04-22 08:15:24.692', '2022-04-22 08:15:24.693', 1, 118, 38, 10750.000000000000000000000000000000, 11250.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (175, '2022-04-22 08:15:24.878', '2022-04-22 08:15:24.879', 1, 99, 39, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 4, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (176, '2022-04-22 08:15:24.946', '2022-04-22 08:15:24.947', 1, 100, 39, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 4, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (177, '2022-04-22 08:15:25.016', '2022-04-22 08:15:25.017', 1, 101, 39, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 4, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (178, '2022-04-22 08:15:25.084', '2022-04-22 08:15:25.085', 1, 65, 39, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (179, '2022-04-22 08:15:25.151', '2022-04-22 08:15:25.152', 1, 135, 39, 24000.000000000000000000000000000000, 24500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (180, '2022-04-22 08:15:25.32', '2022-04-22 08:15:25.321', 1, 2, 40, 5500.000000000000000000000000000000, 6000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (181, '2022-04-22 08:15:25.396', '2022-04-22 08:15:25.397', 1, 76, 40, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (182, '2022-04-22 08:15:25.475', '2022-04-22 08:15:25.476', 1, 185, 40, 5500.000000000000000000000000000000, 6000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (183, '2022-04-22 08:15:25.541', '2022-04-22 08:15:25.541', 1, 184, 40, 950.000000000000000000000000000000, 4000.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (184, '2022-04-22 08:15:25.61', '2022-04-22 08:15:25.611', 1, 179, 40, 7500.000000000000000000000000000000, 8000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (185, '2022-04-22 08:15:25.769', '2022-04-22 08:15:25.77', 1, 58, 41, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (186, '2022-04-22 08:15:25.838', '2022-04-22 08:15:25.839', 1, 159, 41, 65500.000000000000000000000000000000, 60000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (187, '2022-04-22 08:15:25.914', '2022-04-22 08:15:25.914', 1, 158, 41, 50500.000000000000000000000000000000, 51000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (188, '2022-04-22 08:15:25.983', '2022-04-22 08:15:25.984', 1, 162, 41, 2500.000000000000000000000000000000, 3000.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (189, '2022-04-22 08:15:26.055', '2022-04-22 08:15:26.056', 1, 138, 41, 65500.000000000000000000000000000000, 60000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (190, '2022-04-22 08:15:26.236', '2022-04-22 08:15:26.237', 1, 55, 42, 11500.000000000000000000000000000000, 12000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (191, '2022-04-22 08:15:26.309', '2022-04-22 08:15:26.31', 1, 84, 42, 10000.000000000000000000000000000000, 10500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (192, '2022-04-22 08:15:26.381', '2022-04-22 08:15:26.382', 1, 111, 42, 7000.000000000000000000000000000000, 7500.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (193, '2022-04-22 08:15:26.532', '2022-04-22 08:15:26.533', 1, 23, 43, 2500.000000000000000000000000000000, 4000.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (194, '2022-04-22 08:15:26.61', '2022-04-22 08:15:26.611', 1, 82, 43, 12000.000000000000000000000000000000, 12500.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (195, '2022-04-22 08:15:26.679', '2022-04-22 08:15:26.68', 1, 147, 43, 47500.000000000000000000000000000000, 48000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (196, '2022-04-22 08:15:26.749', '2022-04-22 08:15:26.75', 1, 148, 43, 41500.000000000000000000000000000000, 42000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (197, '2022-04-22 08:15:26.815', '2022-04-22 08:15:26.816', 1, 149, 43, 41500.000000000000000000000000000000, 42000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (198, '2022-04-22 08:15:26.89', '2022-04-22 08:15:26.891', 1, 187, 43, 22000.000000000000000000000000000000, 22500.000000000000000000000000000000, 5, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (199, '2022-04-22 08:15:27.046', '2022-04-22 08:15:27.047', 1, 42, 44, 5750.000000000000000000000000000000, 6250.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (200, '2022-04-22 08:15:27.123', '2022-04-22 08:15:27.124', 1, 56, 44, 11500.000000000000000000000000000000, 12000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (201, '2022-04-22 08:15:27.206', '2022-04-22 08:15:27.207', 1, 111, 44, 7000.000000000000000000000000000000, 7500.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (202, '2022-04-22 08:15:27.273', '2022-04-22 08:15:27.274', 1, 129, 44, 38500.000000000000000000000000000000, 39000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (203, '2022-04-22 08:15:27.442', '2022-04-22 08:15:27.443', 1, 84, 45, 10000.000000000000000000000000000000, 10500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (204, '2022-04-22 08:15:27.583', '2022-04-22 08:15:27.584', 1, 76, 46, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (205, '2022-04-22 08:15:27.66', '2022-04-22 08:15:27.661', 1, 111, 46, 7000.000000000000000000000000000000, 7500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (206, '2022-04-22 08:15:27.731', '2022-04-22 08:15:27.732', 1, 120, 46, 13000.000000000000000000000000000000, 13500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (207, '2022-04-22 08:15:27.89', '2022-04-22 08:15:27.89', 1, 76, 47, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (208, '2022-04-22 08:15:28.073', '2022-04-22 08:15:28.074', 1, 10, 48, 23500.000000000000000000000000000000, 24000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (209, '2022-04-22 08:15:28.151', '2022-04-22 08:15:28.152', 1, 3, 48, 12000.000000000000000000000000000000, 12500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (210, '2022-04-22 08:15:28.23', '2022-04-22 08:15:28.231', 1, 105, 48, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (211, '2022-04-22 08:15:28.306', '2022-04-22 08:15:28.307', 1, 106, 48, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (212, '2022-04-22 08:15:28.379', '2022-04-22 08:15:28.38', 1, 96, 48, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 4, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (213, '2022-04-22 08:15:28.45', '2022-04-22 08:15:28.451', 1, 97, 48, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 4, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (214, '2022-04-22 08:15:28.52', '2022-04-22 08:15:28.521', 1, 98, 48, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 4, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (215, '2022-04-22 08:15:28.591', '2022-04-22 08:15:28.592', 1, 120, 48, 13000.000000000000000000000000000000, 13500.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (216, '2022-04-22 08:15:28.775', '2022-04-22 08:15:28.776', 1, 58, 49, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (217, '2022-04-22 08:15:28.847', '2022-04-22 08:15:28.848', 1, 121, 49, 74500.000000000000000000000000000000, 75000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (218, '2022-04-22 08:15:28.919', '2022-04-22 08:15:28.92', 1, 129, 49, 38500.000000000000000000000000000000, 39000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (219, '2022-04-22 08:15:28.992', '2022-04-22 08:15:28.993', 1, 130, 49, 35500.000000000000000000000000000000, 36000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (220, '2022-04-22 08:15:29.151', '2022-04-22 08:15:29.152', 1, 31, 50, 26500.000000000000000000000000000000, 27000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (221, '2022-04-22 08:15:29.224', '2022-04-22 08:15:29.225', 1, 55, 50, 11500.000000000000000000000000000000, 12000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (222, '2022-04-22 08:15:29.291', '2022-04-22 08:15:29.292', 1, 56, 50, 11500.000000000000000000000000000000, 12000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (223, '2022-04-22 08:15:29.359', '2022-04-22 08:15:29.36', 1, 157, 50, 52000.000000000000000000000000000000, 52500.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (224, '2022-04-22 08:15:29.433', '2022-04-22 08:15:29.434', 1, 65, 50, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (225, '2022-04-22 08:15:29.498', '2022-04-22 08:15:29.499', 1, 135, 50, 24000.000000000000000000000000000000, 24500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (226, '2022-04-22 08:15:29.667', '2022-04-22 08:15:29.668', 1, 28, 51, 144500.000000000000000000000000000000, 145000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (227, '2022-04-22 08:15:29.739', '2022-04-22 08:15:29.74', 1, 30, 51, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (228, '2022-04-22 08:15:29.808', '2022-04-22 08:15:29.809', 1, 76, 51, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (229, '2022-04-22 08:15:29.968', '2022-04-22 08:15:29.969', 1, 41, 52, 9000.000000000000000000000000000000, 9500.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (230, '2022-04-22 08:15:30.036', '2022-04-22 08:15:30.037', 1, 3, 52, 12000.000000000000000000000000000000, 12500.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (231, '2022-04-22 08:15:30.106', '2022-04-22 08:15:30.107', 1, 92, 52, 64500.000000000000000000000000000000, 65000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (232, '2022-04-22 08:15:30.172', '2022-04-22 08:15:30.173', 1, 95, 52, 74500.000000000000000000000000000000, 75000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (233, '2022-04-22 08:15:30.242', '2022-04-22 08:15:30.243', 1, 185, 52, 5500.000000000000000000000000000000, 6000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (234, '2022-04-22 08:15:30.316', '2022-04-22 08:15:30.317', 1, 153, 52, 119500.000000000000000000000000000000, 120000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (235, '2022-04-22 08:15:30.388', '2022-04-22 08:15:30.389', 1, 197, 52, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (236, '2022-04-22 08:15:30.461', '2022-04-22 08:15:30.462', 1, 66, 52, 22000.000000000000000000000000000000, 22500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (237, '2022-04-22 08:15:30.642', '2022-04-22 08:15:30.643', 1, 85, 53, 5500.000000000000000000000000000000, 10500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (238, '2022-04-22 08:15:30.709', '2022-04-22 08:15:30.71', 1, 191, 53, 27000.000000000000000000000000000000, 27500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (239, '2022-04-22 08:15:30.811', '2022-04-22 08:15:30.812', 1, 195, 53, 21500.000000000000000000000000000000, 22000.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (240, '2022-04-22 08:15:30.887', '2022-04-22 08:15:30.888', 1, 192, 53, 28000.000000000000000000000000000000, 28500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (241, '2022-04-22 08:15:30.957', '2022-04-22 08:15:30.958', 1, 136, 53, 23000.000000000000000000000000000000, 23500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (242, '2022-04-22 08:15:31.114', '2022-04-22 08:15:31.115', 1, 131, 54, 35000.000000000000000000000000000000, 47500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (243, '2022-04-22 08:15:31.184', '2022-04-22 08:15:31.185', 1, 132, 54, 45000.000000000000000000000000000000, 57500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (244, '2022-04-22 08:15:31.331', '2022-04-22 08:15:31.332', 1, 10, 55, 23500.000000000000000000000000000000, 24000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (245, '2022-04-22 08:15:31.397', '2022-04-22 08:15:31.398', 1, 9, 55, 29500.000000000000000000000000000000, 30000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (246, '2022-04-22 08:15:31.571', '2022-04-22 08:15:31.572', 1, 10, 56, 23500.000000000000000000000000000000, 24000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (247, '2022-04-22 08:15:31.64', '2022-04-22 08:15:31.641', 1, 105, 56, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (248, '2022-04-22 08:15:31.719', '2022-04-22 08:15:31.72', 1, 106, 56, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (249, '2022-04-22 08:15:31.787', '2022-04-22 08:15:31.788', 1, 148, 56, 41500.000000000000000000000000000000, 42000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (250, '2022-04-22 08:15:31.952', '2022-04-22 08:15:31.953', 1, 31, 57, 26500.000000000000000000000000000000, 27000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (251, '2022-04-22 08:15:32.019', '2022-04-22 08:15:32.02', 1, 111, 57, 7000.000000000000000000000000000000, 7500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (252, '2022-04-22 08:15:32.164', '2022-04-22 08:15:32.165', 1, 188, 58, 26000.000000000000000000000000000000, 26500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (253, '2022-04-22 08:15:32.232', '2022-04-22 08:15:32.233', 1, 191, 58, 27000.000000000000000000000000000000, 27500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (254, '2022-04-22 08:15:32.327', '2022-04-22 08:15:32.328', 1, 189, 58, 27000.000000000000000000000000000000, 27500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (255, '2022-04-22 08:15:32.454', '2022-04-22 08:15:32.455', 1, 192, 58, 28000.000000000000000000000000000000, 28500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (256, '2022-04-22 08:15:32.522', '2022-04-22 08:15:32.522', 1, 204, 58, 21000.000000000000000000000000000000, 21500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (257, '2022-04-22 08:15:32.6', '2022-04-22 08:15:32.601', 1, 205, 58, 22000.000000000000000000000000000000, 22500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (258, '2022-04-22 08:15:32.669', '2022-04-22 08:15:32.67', 1, 209, 58, 29000.000000000000000000000000000000, 29500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (259, '2022-04-22 08:15:32.736', '2022-04-22 08:15:32.737', 1, 186, 58, 34500.000000000000000000000000000000, 35000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (260, '2022-04-22 08:15:32.911', '2022-04-22 08:15:32.912', 1, 131, 59, 35000.000000000000000000000000000000, 47500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (261, '2022-04-22 08:15:32.986', '2022-04-22 08:15:32.987', 1, 132, 59, 45000.000000000000000000000000000000, 57500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (262, '2022-04-22 08:15:33.132', '2022-04-22 08:15:33.133', 1, 147, 60, 47500.000000000000000000000000000000, 48000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (263, '2022-04-22 08:15:33.203', '2022-04-22 08:15:33.204', 1, 151, 60, 54500.000000000000000000000000000000, 55000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (264, '2022-04-22 08:15:33.273', '2022-04-22 08:15:33.274', 1, 152, 60, 109500.000000000000000000000000000000, 110000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (265, '2022-04-22 08:15:33.348', '2022-04-22 08:15:33.349', 1, 153, 60, 119500.000000000000000000000000000000, 120000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (266, '2022-04-22 08:15:33.509', '2022-04-22 08:15:33.51', 1, 76, 61, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (267, '2022-04-22 08:15:33.577', '2022-04-22 08:15:33.577', 1, 111, 61, 7000.000000000000000000000000000000, 7500.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (268, '2022-04-22 08:15:33.65', '2022-04-22 08:15:33.651', 1, 172, 61, 2000.000000000000000000000000000000, 2500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (269, '2022-04-22 08:15:33.721', '2022-04-22 08:15:33.722', 1, 136, 61, 23000.000000000000000000000000000000, 23500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (270, '2022-04-22 08:15:33.867', '2022-04-22 08:15:33.868', 1, 23, 62, 2500.000000000000000000000000000000, 4000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (271, '2022-04-22 08:15:33.932', '2022-04-22 08:15:33.933', 1, 185, 62, 5500.000000000000000000000000000000, 6000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (272, '2022-04-22 08:15:34.079', '2022-04-22 08:15:34.08', 1, 43, 63, 71500.000000000000000000000000000000, 72000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (273, '2022-04-22 08:15:34.145', '2022-04-22 08:15:34.146', 1, 161, 63, 59500.000000000000000000000000000000, 60000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (274, '2022-04-22 08:15:34.213', '2022-04-22 08:15:34.213', 1, 10, 63, 23500.000000000000000000000000000000, 24000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (275, '2022-04-22 08:15:34.28', '2022-04-22 08:15:34.281', 1, 70, 63, 101000.000000000000000000000000000000, 101500.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (276, '2022-04-22 08:15:34.348', '2022-04-22 08:15:34.349', 1, 186, 63, 34500.000000000000000000000000000000, 35000.000000000000000000000000000000, 5, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (277, '2022-04-22 08:15:34.505', '2022-04-22 08:15:34.506', 1, 31, 64, 26500.000000000000000000000000000000, 27000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (278, '2022-04-22 08:15:34.576', '2022-04-22 08:15:34.576', 1, 85, 64, 5500.000000000000000000000000000000, 10500.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (279, '2022-04-22 08:15:34.641', '2022-04-22 08:15:34.642', 1, 111, 64, 7000.000000000000000000000000000000, 7500.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (280, '2022-04-22 08:15:34.707', '2022-04-22 08:15:34.708', 1, 99, 64, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (281, '2022-04-22 08:15:34.771', '2022-04-22 08:15:34.772', 1, 100, 64, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (282, '2022-04-22 08:15:34.843', '2022-04-22 08:15:34.844', 1, 101, 64, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (283, '2022-04-22 08:15:34.915', '2022-04-22 08:15:34.916', 1, 131, 64, 35000.000000000000000000000000000000, 47500.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (284, '2022-04-22 08:15:34.983', '2022-04-22 08:15:34.984', 1, 105, 64, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (285, '2022-04-22 08:15:35.052', '2022-04-22 08:15:35.053', 1, 106, 64, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (286, '2022-04-22 08:15:35.123', '2022-04-22 08:15:35.124', 1, 157, 64, 52000.000000000000000000000000000000, 52500.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (287, '2022-04-22 08:15:35.198', '2022-04-22 08:15:35.199', 1, 171, 64, 26500.000000000000000000000000000000, 27000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (288, '2022-04-22 08:15:35.384', '2022-04-22 08:15:35.385', 1, 56, 65, 11500.000000000000000000000000000000, 12000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (289, '2022-04-22 08:15:35.458', '2022-04-22 08:15:35.459', 1, 87, 65, 15000.000000000000000000000000000000, 15500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (290, '2022-04-22 08:15:35.534', '2022-04-22 08:15:35.535', 1, 157, 65, 52000.000000000000000000000000000000, 52500.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (291, '2022-04-22 08:15:35.61', '2022-04-22 08:15:35.611', 1, 186, 65, 34500.000000000000000000000000000000, 35000.000000000000000000000000000000, 4, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (292, '2022-04-22 08:15:35.684', '2022-04-22 08:15:35.685', 1, 32, 65, 71500.000000000000000000000000000000, 72000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (293, '2022-04-22 08:15:35.758', '2022-04-22 08:15:35.759', 1, 76, 65, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (294, '2022-04-22 08:15:35.828', '2022-04-22 08:15:35.829', 1, 22, 65, 6000.000000000000000000000000000000, 6500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (295, '2022-04-22 08:15:35.902', '2022-04-22 08:15:35.903', 1, 154, 65, 25000.000000000000000000000000000000, 39000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (296, '2022-04-22 08:15:35.977', '2022-04-22 08:15:35.978', 1, 65, 65, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (297, '2022-04-22 08:15:36.051', '2022-04-22 08:15:36.052', 1, 135, 65, 24000.000000000000000000000000000000, 24500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (298, '2022-04-22 08:15:36.243', '2022-04-22 08:15:36.244', 1, 31, 66, 26500.000000000000000000000000000000, 27000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (299, '2022-04-22 08:15:36.312', '2022-04-22 08:15:36.313', 1, 43, 66, 71500.000000000000000000000000000000, 72000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (300, '2022-04-22 08:15:36.378', '2022-04-22 08:15:36.379', 1, 76, 66, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (301, '2022-04-22 08:15:36.447', '2022-04-22 08:15:36.448', 1, 99, 66, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 4, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (302, '2022-04-22 08:15:36.515', '2022-04-22 08:15:36.516', 1, 100, 66, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 4, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (303, '2022-04-22 08:15:36.588', '2022-04-22 08:15:36.588', 1, 101, 66, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 4, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (304, '2022-04-22 08:15:36.661', '2022-04-22 08:15:36.662', 1, 111, 66, 7000.000000000000000000000000000000, 7500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (305, '2022-04-22 08:15:36.734', '2022-04-22 08:15:36.735', 1, 154, 66, 25000.000000000000000000000000000000, 39000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (306, '2022-04-22 08:15:36.802', '2022-04-22 08:15:36.803', 1, 171, 66, 26500.000000000000000000000000000000, 27000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (307, '2022-04-22 08:15:36.877', '2022-04-22 08:15:36.878', 1, 65, 66, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (308, '2022-04-22 08:15:36.951', '2022-04-22 08:15:36.951', 1, 135, 66, 24000.000000000000000000000000000000, 24500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (309, '2022-04-22 08:15:37.139', '2022-04-22 08:15:37.14', 1, 105, 67, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (310, '2022-04-22 08:15:37.207', '2022-04-22 08:15:37.208', 1, 106, 67, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (311, '2022-04-22 08:15:37.277', '2022-04-22 08:15:37.278', 1, 187, 67, 22000.000000000000000000000000000000, 22500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (312, '2022-04-22 08:15:37.433', '2022-04-22 08:15:37.434', 1, 96, 68, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (313, '2022-04-22 08:15:37.499', '2022-04-22 08:15:37.5', 1, 97, 68, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (314, '2022-04-22 08:15:37.571', '2022-04-22 08:15:37.572', 1, 98, 68, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (315, '2022-04-22 08:15:37.64', '2022-04-22 08:15:37.641', 1, 107, 68, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (316, '2022-04-22 08:15:37.706', '2022-04-22 08:15:37.707', 1, 108, 68, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (317, '2022-04-22 08:15:37.774', '2022-04-22 08:15:37.775', 1, 99, 68, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (318, '2022-04-22 08:15:37.847', '2022-04-22 08:15:37.848', 1, 100, 68, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (319, '2022-04-22 08:15:37.923', '2022-04-22 08:15:37.924', 1, 101, 68, 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (320, '2022-04-22 08:15:37.994', '2022-04-22 08:15:37.995', 1, 188, 68, 26000.000000000000000000000000000000, 26500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (321, '2022-04-22 08:15:38.064', '2022-04-22 08:15:38.065', 1, 191, 68, 27000.000000000000000000000000000000, 27500.000000000000000000000000000000, 3, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (322, '2022-04-22 08:15:38.251', '2022-04-22 08:15:38.252', 1, 3, 69, 12000.000000000000000000000000000000, 12500.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (323, '2022-04-22 08:15:38.325', '2022-04-22 08:15:38.326', 1, 56, 69, 11500.000000000000000000000000000000, 12000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (324, '2022-04-22 08:15:38.4', '2022-04-22 08:15:38.4', 1, 31, 69, 26500.000000000000000000000000000000, 27000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (325, '2022-04-22 08:15:38.469', '2022-04-22 08:15:38.47', 1, 84, 69, 10000.000000000000000000000000000000, 10500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (326, '2022-04-22 08:15:38.54', '2022-04-22 08:15:38.541', 1, 85, 69, 5500.000000000000000000000000000000, 10500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (327, '2022-04-22 08:15:38.615', '2022-04-22 08:15:38.616', 1, 87, 69, 15000.000000000000000000000000000000, 15500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (328, '2022-04-22 08:15:38.689', '2022-04-22 08:15:38.69', 1, 111, 69, 7000.000000000000000000000000000000, 7500.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (329, '2022-04-22 08:15:38.759', '2022-04-22 08:15:38.76', 1, 186, 69, 34500.000000000000000000000000000000, 35000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (330, '2022-04-22 08:15:38.833', '2022-04-22 08:15:38.834', 1, 65, 69, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (331, '2022-04-22 08:15:39.011', '2022-04-22 08:15:39.012', 1, 151, 70, 54500.000000000000000000000000000000, 55000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (332, '2022-04-22 08:15:39.081', '2022-04-22 08:15:39.081', 1, 158, 70, 50500.000000000000000000000000000000, 51000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (333, '2022-04-22 08:15:39.154', '2022-04-22 08:15:39.156', 1, 65, 70, 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (334, '2022-04-22 08:15:39.225', '2022-04-22 08:15:39.226', 1, 66, 70, 22000.000000000000000000000000000000, 22500.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (335, '2022-04-22 08:15:39.378', '2022-04-22 08:15:39.379', 1, 10, 71, 23500.000000000000000000000000000000, 24000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (336, '2022-04-22 08:15:39.441', '2022-04-22 08:15:39.442', 1, 105, 71, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (337, '2022-04-22 08:15:39.506', '2022-04-22 08:15:39.507', 1, 106, 71, 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 6, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (338, '2022-04-22 08:15:39.576', '2022-04-22 08:15:39.577', 1, 111, 71, 7000.000000000000000000000000000000, 7500.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (339, '2022-04-22 08:15:39.643', '2022-04-22 08:15:39.644', 1, 129, 71, 38500.000000000000000000000000000000, 39000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (340, '2022-04-22 08:15:39.713', '2022-04-22 08:15:39.714', 1, 154, 71, 25000.000000000000000000000000000000, 39000.000000000000000000000000000000, 1, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (341, '2022-04-22 08:15:39.875', '2022-04-22 08:15:39.877', 1, 76, 72, 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 2, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (342, '2022-04-22 08:15:39.939', '2022-04-22 08:15:39.94', 1, 172, 72, 2000.000000000000000000000000000000, 2500.000000000000000000000000000000, 12, 0, NULL);
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (343, '2022-04-22 08:43:55.792', '2022-04-22 08:43:55.793', 75, 24, 73, 3500.000000000000000000000000000000, 4000.000000000000000000000000000000, 10, 0, '');
INSERT INTO public."OrderItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", quantity, discount, description) VALUES (344, '2022-04-22 08:44:10.574', '2022-04-22 08:44:10.575', 75, 60, 73, 255000.000000000000000000000000000000, 350000.000000000000000000000000000000, 2, 0, '');


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: cendana_user
--

INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (1, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'aceton heviny 35 ml', 4500.000000000000000000000000000000, 5000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (4, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'body lotion heviny aloevera 600 ml', 15500.000000000000000000000000000000, 16000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (5, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'body lotion heviny bengkuang 600 ml', 15500.000000000000000000000000000000, 16000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (6, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'body lotion heviny green tea 600 ml', 15500.000000000000000000000000000000, 16000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (7, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'body lotion heviny rose 600 ml', 15500.000000000000000000000000000000, 16000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (8, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'body lotion heviny yogurt & goat milky 600 ml', 15500.000000000000000000000000000000, 16000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (11, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'creambath heviny anti ketombe 250 gr', 12500.000000000000000000000000000000, 13000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (12, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'creambath heviny avocado 250 gram', 12500.000000000000000000000000000000, 13000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (13, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'creambath heviny ginseng 250 gram', 12500.000000000000000000000000000000, 13000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (14, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'creambath heviny kemiri 250 gr', 12500.000000000000000000000000000000, 13000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (15, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'creambath heviny lidah buaya 250 gr', 12500.000000000000000000000000000000, 13000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (16, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'creambath heviny spa avocado 250 gram', 12500.000000000000000000000000000000, 13000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (17, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'creambath heviny spa coconut 250 gram', 12500.000000000000000000000000000000, 13000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (18, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'creambath heviny spa emulsion milky 250 gram', 12500.000000000000000000000000000000, 13000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (19, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'creambath heviny spa papaya jasmine 250 gram', 12500.000000000000000000000000000000, 13000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (20, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'creambath heviny strawberry 250 gr', 12500.000000000000000000000000000000, 13000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (21, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'fitting test fukuta', 6500.000000000000000000000000000000, 7000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (27, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'gembok frt 20 mm', 119500.000000000000000000000000000000, 120000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (33, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'gunting kuku honaga 602 b', 65500.000000000000000000000000000000, 66000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (34, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'gunting kuku honaga 612 b', 89500.000000000000000000000000000000, 90000.000000000000000000000000000000, 0, 4, 1, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (37, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'gunting kuku honaga 625 a', 95500.000000000000000000000000000000, 96000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (38, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'gunting kuku honaga 692 a', 95500.000000000000000000000000000000, 96000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (40, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'gunting kuku 777 besar', 101500.000000000000000000000000000000, 102000.000000000000000000000000000000, 0, 1, 0, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (44, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'gunting m2000 sedang hitam', 7000.000000000000000000000000000000, 7500.000000000000000000000000000000, 0, 12, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (45, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'hair mask green tea 500 gr', 30500.000000000000000000000000000000, 31000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (46, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'hair mask heviny coconut 500 gr', 30500.000000000000000000000000000000, 31000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (47, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'hair mask heviny coconut 500 gram', 30500.000000000000000000000000000000, 31000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (48, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'hair mask heviny coklat mint 500 gr', 30500.000000000000000000000000000000, 31000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (49, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'hair mask heviny ginseng 500 gr', 30500.000000000000000000000000000000, 31000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (50, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'hair mask heviny ginseng milky 500 gr', 30500.000000000000000000000000000000, 31000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (51, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'hair mask heviny green tea 500 gr', 30500.000000000000000000000000000000, 31000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (52, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'hair mask heviny papaya jasmine 500 gr', 30500.000000000000000000000000000000, 31000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (53, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'hair mask heviny strawberry 500 gr', 30500.000000000000000000000000000000, 31000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (54, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'hair mask heviny sun flower avocado 500 gr', 28500.000000000000000000000000000000, 29000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (59, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'jinzu pepaya brightening soap 50 gr', 9000.000000000000000000000000000000, 9500.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (65, '2022-04-22 16:15:06.281', '2022-04-22 08:15:39.305', 'kain pel sedang dynamic', 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 0, 39, 162, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (42, '2022-04-22 16:15:06.281', '2022-04-22 08:15:27.373', 'gunting m2000 kecil hitam', 5750.000000000000000000000000000000, 6250.000000000000000000000000000000, 0, 12, 24, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (26, '2022-04-22 16:15:06.281', '2022-04-22 08:15:23.954', 'gembok freeder 15 mm', 113500.000000000000000000000000000000, 114000.000000000000000000000000000000, 0, 0, 2, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (57, '2022-04-22 16:15:06.281', '2022-04-22 08:15:11.015', 'jarum tangan voxy', 47500.000000000000000000000000000000, 48000.000000000000000000000000000000, 0, 4, 2, 0, 0, 'box');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (3, '2022-04-22 16:15:06.281', '2022-04-22 08:15:38.927', 'ballpoint milton s-121', 12000.000000000000000000000000000000, 12500.000000000000000000000000000000, 0, 0, 14, 0, 0, 'box');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (58, '2022-04-22 16:15:06.281', '2022-04-22 08:15:29.076', 'jarum pentul', 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 0, 18, 24, 0, 0, 'roll');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (56, '2022-04-22 16:15:06.281', '2022-04-22 08:15:38.928', 'isolasi hitam kecil', 11500.000000000000000000000000000000, 12000.000000000000000000000000000000, 0, 8, 20, 0, 0, 'roll');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (28, '2022-04-22 16:15:06.281', '2022-04-22 08:15:29.903', 'gembok frt 25 mm', 144500.000000000000000000000000000000, 145000.000000000000000000000000000000, 0, 3, 4, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (43, '2022-04-22 16:15:06.281', '2022-04-22 08:15:37.047', 'gunting m2000 kecil renteng', 71500.000000000000000000000000000000, 72000.000000000000000000000000000000, 0, 0, 6, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (29, '2022-04-22 16:15:06.281', '2022-04-22 08:15:17.275', 'gembok frt 30 mm', 13250.000000000000000000000000000000, 13750.000000000000000000000000000000, 0, 6, 12, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (25, '2022-04-22 16:15:06.281', '2022-04-22 08:15:18.916', 'fitting kombinasi', 5500.000000000000000000000000000000, 6000.000000000000000000000000000000, 0, 12, 12, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (66, '2022-04-22 16:15:06.281', '2022-04-22 08:15:39.306', 'kain pel besar dynamic', 22000.000000000000000000000000000000, 22500.000000000000000000000000000000, 0, 0, 42, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (55, '2022-04-22 16:15:06.281', '2022-04-22 08:15:29.585', 'isolasi bening kecil', 11500.000000000000000000000000000000, 12000.000000000000000000000000000000, 0, 6, 12, 0, 0, 'roll');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (35, '2022-04-22 16:15:06.281', '2022-04-22 08:15:16.646', 'gunting kuku honaga 323 a', 95500.000000000000000000000000000000, 96000.000000000000000000000000000000, 0, 3, 2, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (39, '2022-04-22 16:15:06.281', '2022-04-22 08:15:22.365', 'gunting kuku honaga 360 a', 98500.000000000000000000000000000000, 99000.000000000000000000000000000000, 0, 3, 2, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (36, '2022-04-22 16:15:06.281', '2022-04-22 08:15:16.647', 'gunting kuku honaga 612 a', 89500.000000000000000000000000000000, 90000.000000000000000000000000000000, 0, 2, 4, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (62, '2022-04-22 16:15:06.281', '2022-04-22 08:15:18.917', 'kabel listrik xrcom 2 x 30 meter', 47000.000000000000000000000000000000, 47500.000000000000000000000000000000, 0, 5, 2, 0, 0, 'roll');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (30, '2022-04-22 16:15:06.281', '2022-04-22 08:15:29.904', 'gembok majesty 40 mm', 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 0, 0, 12, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (41, '2022-04-22 16:15:06.281', '2022-04-22 08:15:30.556', 'gunting m2000 besar hitam', 9000.000000000000000000000000000000, 9500.000000000000000000000000000000, 0, 12, 24, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (32, '2022-04-22 16:15:06.281', '2022-04-22 08:15:36.151', 'gunting kuku honaga 611 a', 71500.000000000000000000000000000000, 72000.000000000000000000000000000000, 0, 0, 10, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (2, '2022-04-22 16:15:06.281', '2022-04-22 08:15:25.699', 'aceton heviny 60 ml', 5500.000000000000000000000000000000, 6000.000000000000000000000000000000, 0, 0, 156, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (10, '2022-04-22 16:15:06.281', '2022-04-22 08:15:39.801', 'cottonbuds cici dewasa 045', 23500.000000000000000000000000000000, 24000.000000000000000000000000000000, 0, 1, 18, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (24, '2022-04-22 16:15:06.281', '2022-04-22 08:44:29.43', 'fitting plafon okka', 3500.000000000000000000000000000000, 4000.000000000000000000000000000000, 0, 2, 10, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (9, '2022-04-22 16:15:06.281', '2022-04-22 08:15:31.507', 'cottonbuds cici bayi', 29500.000000000000000000000000000000, 30000.000000000000000000000000000000, 0, 8, 4, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (31, '2022-04-22 16:15:06.281', '2022-04-22 08:15:38.928', 'gosok panci', 26500.000000000000000000000000000000, 27000.000000000000000000000000000000, 0, 12, 24, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (22, '2022-04-22 16:15:06.281', '2022-04-22 08:15:36.152', 'fitting lampu kamar heroic he-4410', 6000.000000000000000000000000000000, 6500.000000000000000000000000000000, 0, 6, 24, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (68, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'kalkulator citizen ct 500', 54500.000000000000000000000000000000, 55000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (69, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'kalkulator citizen ct 660', 98500.000000000000000000000000000000, 99000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (71, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'kalkulator citizen ct 720', 44000.000000000000000000000000000000, 44500.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (72, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'kalkulator citizen ct 9912', 124500.000000000000000000000000000000, 125000.000000000000000000000000000000, 0, 1, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (73, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'kalkulator citizen sdc 612c', 124500.000000000000000000000000000000, 125000.000000000000000000000000000000, 0, 1, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (74, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'kalkulator citizen sdc 868m', 98500.000000000000000000000000000000, 99000.000000000000000000000000000000, 0, 1, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (75, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'kanebo speed-r', 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 0, 12, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (78, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'keran air hendso 3 / 4 dim', 19500.000000000000000000000000000000, 20000.000000000000000000000000000000, 0, 12, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (79, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'keran air onda 3 / 4 dim', 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 0, 12, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (80, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'keran air tovo 3 / 4 dim', 20750.000000000000000000000000000000, 21250.000000000000000000000000000000, 0, 12, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (83, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'lakban cokelat besar', 12000.000000000000000000000000000000, 12500.000000000000000000000000000000, 0, 12, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (86, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'lakban hitam opp', 10500.000000000000000000000000000000, 11000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (88, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'lakban kain 2 millenium', 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (89, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'lampu yazuho 2u 15 watt', 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (90, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'lampu yazuho 2u 18 watt', 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (91, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'lampu yazuho 2u 20 watt', 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (93, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'lampu led emergency flashycom - 12 watt', 74500.000000000000000000000000000000, 75000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (94, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'lampu led stark - 5 watt', 64500.000000000000000000000000000000, 65000.000000000000000000000000000000, 0, 6, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (102, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'lampu zentama spiral 25 watt', 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (103, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'lampu zentama spiral 30 watt', 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (104, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'lampu zentama spiral 35 watt', 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (109, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'lem castol sedang', 68500.000000000000000000000000000000, 69000.000000000000000000000000000000, 0, 6, 0, 0, 0, 'box');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (112, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'lulur heviny brightening 250 gr', 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (113, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'lulur heviny coffe 250 gr', 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (114, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'lulur heviny green tea 250 gr', 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (115, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'lulur heviny madu susu 250 gr', 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (116, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'lulur heviny mutiara 250 gr', 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (117, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'lulur heviny strawberry 250 gr', 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (122, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'peniti swan', 53500.000000000000000000000000000000, 54000.000000000000000000000000000000, 0, 3, 0, 0, 0, 'box');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (125, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'pinset polos stainless', 74500.000000000000000000000000000000, 75000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (126, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'pinset polos mas', 77500.000000000000000000000000000000, 78000.000000000000000000000000000000, 0, 1, 0, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (127, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'pinset jerawat kislene jarum', 74500.000000000000000000000000000000, 75000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (128, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'pinset jerawat kislene bulat', 74500.000000000000000000000000000000, 75000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (70, '2022-04-22 16:15:06.281', '2022-04-22 08:15:34.438', 'kalkulator citizen ct 712', 101000.000000000000000000000000000000, 101500.000000000000000000000000000000, 0, 2, 2, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (123, '2022-04-22 16:15:06.281', '2022-04-22 08:15:15.138', 'pinset motif', 74500.000000000000000000000000000000, 75000.000000000000000000000000000000, 0, 0, 2, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (92, '2022-04-22 16:15:06.281', '2022-04-22 08:15:30.557', 'lampu led emergency flashycom - 5 watt', 64500.000000000000000000000000000000, 65000.000000000000000000000000000000, 0, 1, 4, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (110, '2022-04-22 16:15:06.281', '2022-04-22 08:15:19.782', 'lem castol mini', 59500.000000000000000000000000000000, 60000.000000000000000000000000000000, 0, 5, 2, 0, 0, 'box');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (124, '2022-04-22 16:15:06.281', '2022-04-22 08:15:15.138', 'pinset polos silver', 71500.000000000000000000000000000000, 72000.000000000000000000000000000000, 0, 2, 2, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (76, '2022-04-22 16:15:06.281', '2022-04-22 08:15:40.018', 'kapur ajaib bagus', 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 0, 15, 90, 0, 0, 'box');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (81, '2022-04-22 16:15:06.281', '2022-04-22 08:15:23.956', 'kipas angin tangan hello kitty', 23500.000000000000000000000000000000, 24000.000000000000000000000000000000, 0, 9, 6, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (82, '2022-04-22 16:15:06.281', '2022-04-22 08:15:26.971', 'lakban bening besar', 12000.000000000000000000000000000000, 12500.000000000000000000000000000000, 0, 12, 48, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (105, '2022-04-22 16:15:06.281', '2022-04-22 08:15:39.801', 'lampu ins ekonomis 2u 5 watt', 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 0, 43, 114, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (67, '2022-04-22 16:15:06.281', '2022-04-22 08:15:18.917', 'kalkulator citizen ct 2000', 107000.000000000000000000000000000000, 107500.000000000000000000000000000000, 0, 0, 2, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (106, '2022-04-22 16:15:06.281', '2022-04-22 08:15:39.802', 'lampu ins ekonomis 2u 7 watt', 9500.000000000000000000000000000000, 10000.000000000000000000000000000000, 0, 43, 114, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (111, '2022-04-22 16:15:06.281', '2022-04-22 08:15:39.803', 'lem g', 7000.000000000000000000000000000000, 7500.000000000000000000000000000000, 0, 124, 252, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (119, '2022-04-22 16:15:06.281', '2022-04-22 08:15:23.956', 'obeng test pen - kecil', 5000.000000000000000000000000000000, 5500.000000000000000000000000000000, 0, 6, 24, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (84, '2022-04-22 16:15:06.281', '2022-04-22 08:15:38.929', 'lakban bening opp', 10000.000000000000000000000000000000, 10500.000000000000000000000000000000, 0, 18, 84, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (77, '2022-04-22 16:15:06.281', '2022-04-22 08:15:24.786', 'keran air hendso 1 / 2 dim', 18250.000000000000000000000000000000, 18750.000000000000000000000000000000, 0, 6, 12, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (121, '2022-04-22 16:15:06.281', '2022-04-22 08:15:29.076', 'pensil alis justmiss 311 - cokelat', 74500.000000000000000000000000000000, 75000.000000000000000000000000000000, 0, 0, 2, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (87, '2022-04-22 16:15:06.281', '2022-04-22 08:15:38.929', 'lakban hitam besar tebal', 15000.000000000000000000000000000000, 15500.000000000000000000000000000000, 0, 30, 60, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (135, '2022-04-22 16:15:06.281', '2022-04-22 08:15:37.051', 'sapu panjang motif - dynamic', 24000.000000000000000000000000000000, 24500.000000000000000000000000000000, 0, 0, 102, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (134, '2022-04-22 16:15:06.281', '2022-04-22 08:15:18.923', 'sapu panjang warna hitam - dynamic', 22000.000000000000000000000000000000, 22500.000000000000000000000000000000, 0, 9, 24, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (130, '2022-04-22 16:15:06.281', '2022-04-22 08:15:29.077', 'pisau cutter kecil', 35500.000000000000000000000000000000, 36000.000000000000000000000000000000, 0, 0, 4, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (95, '2022-04-22 16:15:06.281', '2022-04-22 08:15:30.558', 'lampu led stark - 13 watt', 74500.000000000000000000000000000000, 75000.000000000000000000000000000000, 0, 0, 12, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (96, '2022-04-22 16:15:06.281', '2022-04-22 08:15:38.159', 'lampu pancaran 3u 25 watt', 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 0, 18, 36, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (118, '2022-04-22 16:15:06.281', '2022-04-22 08:15:24.791', 'meteran frt transparan 3 meter', 10750.000000000000000000000000000000, 11250.000000000000000000000000000000, 0, 0, 12, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (97, '2022-04-22 16:15:06.281', '2022-04-22 08:15:38.16', 'lampu pancaran 3u 30 watt', 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 0, 24, 36, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (98, '2022-04-22 16:15:06.281', '2022-04-22 08:15:38.161', 'lampu pancaran 3u 35 watt', 14500.000000000000000000000000000000, 15000.000000000000000000000000000000, 0, 24, 36, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (107, '2022-04-22 16:15:06.281', '2022-04-22 08:15:38.161', 'lampu maxxis spiral 25 watt', 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 0, 9, 6, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (108, '2022-04-22 16:15:06.281', '2022-04-22 08:15:38.162', 'lampu maxxis spiral 35 watt', 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 0, 9, 6, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (129, '2022-04-22 16:15:06.281', '2022-04-22 08:15:39.803', 'pisau cutter besar', 38500.000000000000000000000000000000, 39000.000000000000000000000000000000, 0, 5, 10, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (140, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'sikat gigi premier action', 54500.000000000000000000000000000000, 55000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (143, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'sikat gigi premier bobo classic', 41500.000000000000000000000000000000, 42000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (144, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'sikat gigi premier bobo junior', 92500.000000000000000000000000000000, 93000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (146, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'sikat gigi premier classic medium', 47500.000000000000000000000000000000, 48000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (156, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'sikat sepatu', 44500.000000000000000000000000000000, 45000.000000000000000000000000000000, 0, 2, 0, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (163, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'sisir rata 7414', 2500.000000000000000000000000000000, 3000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (165, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'sisir saku 2005', 2000.000000000000000000000000000000, 2500.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (167, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'sisir saku loreng', 29500.000000000000000000000000000000, 30000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (170, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'sisir semir hitam', 3250.000000000000000000000000000000, 3750.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (175, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'stop kontak 981 - kayu', 8500.000000000000000000000000000000, 9000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (176, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'stop kontak 982 - kayu', 8500.000000000000000000000000000000, 9000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (177, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'stop kontak 984 - kayu', 8500.000000000000000000000000000000, 9000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (178, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'stop kontak 991 - kayu', 8500.000000000000000000000000000000, 9000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (180, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'stop kontak 802 - tembok', 7500.000000000000000000000000000000, 8000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (181, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'stop kontak 804 - tembok', 7500.000000000000000000000000000000, 8000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (182, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'stop kontak 891 - tembok', 7500.000000000000000000000000000000, 8000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (183, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'steker over yaichi', 3500.000000000000000000000000000000, 4000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (190, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'terminal polos sunfree 5 lubang 3 meter', 28000.000000000000000000000000000000, 28500.000000000000000000000000000000, 0, 6, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (193, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'terminal polos sunfree 5 lubang 5 meter', 29000.000000000000000000000000000000, 29500.000000000000000000000000000000, 0, 6, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (194, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'terminal polos sunfree 3 lubang 1,5 meter', 20500.000000000000000000000000000000, 21000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (196, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'terminal polos sunfree 5 lubang 1,5 meter', 22500.000000000000000000000000000000, 23000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (198, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'terminal polos 4 lubang tanpa kabel', 18000.000000000000000000000000000000, 18500.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (199, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'terminal polos 5 lubang tanpa kabel', 19000.000000000000000000000000000000, 19500.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (200, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'terminal polos 3 lubang 3 switch', 21500.000000000000000000000000000000, 22000.000000000000000000000000000000, 0, 3, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (201, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'terminal warna 3 lubang 3 meter', 21500.000000000000000000000000000000, 22000.000000000000000000000000000000, 0, 3, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (202, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'terminal warna 4 lubang 3 meter', 22500.000000000000000000000000000000, 23000.000000000000000000000000000000, 0, 3, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (155, '2022-04-22 16:15:06.281', '2022-04-22 08:15:11.017', 'sikat pakaian plastik', 41500.000000000000000000000000000000, 42000.000000000000000000000000000000, 0, 5, 2, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (160, '2022-04-22 16:15:06.281', '2022-04-22 08:15:22.366', 'sisir gagang motif', 65500.000000000000000000000000000000, 66000.000000000000000000000000000000, 0, 2, 2, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (168, '2022-04-22 16:15:06.281', '2022-04-22 08:15:22.367', 'sisir segiempat loreng', 59500.000000000000000000000000000000, 60000.000000000000000000000000000000, 0, 0, 2, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (136, '2022-04-22 16:15:06.281', '2022-04-22 08:15:33.804', 'sapu panjang karet dynamic', 23000.000000000000000000000000000000, 23500.000000000000000000000000000000, 0, 3, 18, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (185, '2022-04-22 16:15:06.281', '2022-04-22 08:15:34.015', 'steker bulat', 5500.000000000000000000000000000000, 6000.000000000000000000000000000000, 0, 42, 36, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (139, '2022-04-22 16:15:06.281', '2022-04-22 08:15:12.686', 'shower cup motif - animal', 7000.000000000000000000000000000000, 7500.000000000000000000000000000000, 0, 24, 12, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (142, '2022-04-22 16:15:06.281', '2022-04-22 08:15:18.922', 'sikat gigi premier basic soft', 47500.000000000000000000000000000000, 48000.000000000000000000000000000000, 0, 1, 8, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (147, '2022-04-22 16:15:06.281', '2022-04-22 08:15:33.433', 'sikat gigi premier classic soft', 47500.000000000000000000000000000000, 48000.000000000000000000000000000000, 0, 0, 8, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (179, '2022-04-22 16:15:06.281', '2022-04-22 08:15:25.701', 'stop kontak 801 - tembok', 7500.000000000000000000000000000000, 8000.000000000000000000000000000000, 0, 0, 12, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (157, '2022-04-22 16:15:06.281', '2022-04-22 08:15:36.15', 'silet goal', 52000.000000000000000000000000000000, 52500.000000000000000000000000000000, 0, 6, 12, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (154, '2022-04-22 16:15:06.281', '2022-04-22 08:15:39.804', 'sikat pakaian kayu', 25000.000000000000000000000000000000, 39000.000000000000000000000000000000, 0, 7, 10, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (159, '2022-04-22 16:15:06.281', '2022-04-22 08:15:26.16', 'sisir gagang loreng', 65500.000000000000000000000000000000, 66000.000000000000000000000000000000, 0, 0, 2, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (169, '2022-04-22 16:15:06.281', '2022-04-22 08:15:22.367', 'sisir segiempat motif', 65500.000000000000000000000000000000, 66000.000000000000000000000000000000, 0, 0, 2, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (172, '2022-04-22 16:15:06.281', '2022-04-22 08:15:40.019', 'spon cuci piring - warna', 2000.000000000000000000000000000000, 2500.000000000000000000000000000000, 0, 18, 132, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (191, '2022-04-22 16:15:06.281', '2022-04-22 08:15:38.165', 'terminal polos sunfree 3 lubang 5 meter', 27000.000000000000000000000000000000, 27500.000000000000000000000000000000, 0, 3, 18, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (158, '2022-04-22 16:15:06.281', '2022-04-22 08:15:39.305', 'sisir kutu motif - cokelat', 50500.000000000000000000000000000000, 51000.000000000000000000000000000000, 0, 0, 10, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (161, '2022-04-22 16:15:06.281', '2022-04-22 08:15:34.437', 'sisir gagang polos', 59500.000000000000000000000000000000, 60000.000000000000000000000000000000, 0, 0, 2, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (145, '2022-04-22 16:15:06.281', '2022-04-22 08:15:23.329', 'sikat gigi premier bobo travel', 98500.000000000000000000000000000000, 99000.000000000000000000000000000000, 0, 3, 4, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (173, '2022-04-22 16:15:06.281', '2022-04-22 08:15:22.368', 'spon bedak bulat', 24500.000000000000000000000000000000, 25000.000000000000000000000000000000, 0, 0, 6, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (174, '2022-04-22 16:15:06.281', '2022-04-22 08:15:22.368', 'spon bedak segi', 24500.000000000000000000000000000000, 25000.000000000000000000000000000000, 0, 0, 6, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (171, '2022-04-22 16:15:06.281', '2022-04-22 08:15:37.05', 'spon cuci piring - segi', 26500.000000000000000000000000000000, 27000.000000000000000000000000000000, 0, 4, 22, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (150, '2022-04-22 16:15:06.281', '2022-04-22 08:15:23.331', 'sikat gigi premier deluxe', 54500.000000000000000000000000000000, 55000.000000000000000000000000000000, 0, 2, 6, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (195, '2022-04-22 16:15:06.281', '2022-04-22 08:15:31.042', 'terminal polos sunfree 4 lubang 1,5 meter', 21500.000000000000000000000000000000, 22000.000000000000000000000000000000, 0, 0, 6, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (162, '2022-04-22 16:15:06.281', '2022-04-22 08:15:26.161', 'sisir sasak 7413', 2500.000000000000000000000000000000, 3000.000000000000000000000000000000, 0, 6, 72, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (197, '2022-04-22 16:15:06.281', '2022-04-22 08:15:30.56', 'terminal polos 3 lubang tanpa kabel', 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 0, 0, 6, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (153, '2022-04-22 16:15:06.281', '2022-04-22 08:15:33.434', 'sikat gigi premier twin plus', 119500.000000000000000000000000000000, 120000.000000000000000000000000000000, 0, 6, 8, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (187, '2022-04-22 16:15:06.281', '2022-04-22 08:15:37.36', 'sumbu kompor kecil', 22000.000000000000000000000000000000, 22500.000000000000000000000000000000, 0, 12, 24, 0, 0, 'roll');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (186, '2022-04-22 16:15:06.281', '2022-04-22 08:15:38.93', 'sumbu kompor besar', 34500.000000000000000000000000000000, 35000.000000000000000000000000000000, 0, 12, 24, 0, 0, 'roll');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (151, '2022-04-22 16:15:06.281', '2022-04-22 08:15:39.304', 'sikat gigi premier superior', 54500.000000000000000000000000000000, 55000.000000000000000000000000000000, 0, 6, 8, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (189, '2022-04-22 16:15:06.281', '2022-04-22 08:15:32.827', 'terminal polos sunfree 4 lubang 3 meter', 27000.000000000000000000000000000000, 27500.000000000000000000000000000000, 0, 6, 6, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (192, '2022-04-22 16:15:06.281', '2022-04-22 08:15:32.827', 'terminal polos sunfree 4 lubang 5 meter', 28000.000000000000000000000000000000, 28500.000000000000000000000000000000, 0, 6, 12, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (188, '2022-04-22 16:15:06.281', '2022-04-22 08:15:38.164', 'terminal polos sunfree 3 lubang 3 meter', 26000.000000000000000000000000000000, 26500.000000000000000000000000000000, 0, 12, 24, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (203, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'terminal warna 5 lubang 3 meter', 23500.000000000000000000000000000000, 24000.000000000000000000000000000000, 0, 3, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (206, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'terminal warna 5 lubang 1,5 meter', 18500.000000000000000000000000000000, 19000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (207, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'terminal warna 6 lubang 1,5 meter', 17500.000000000000000000000000000000, 18000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (208, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'terminal warna 3 lubang 5 meter', 27500.000000000000000000000000000000, 28000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (210, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'terminal warna 5 lubang 5 meter', 30000.000000000000000000000000000000, 30500.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (211, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'terminal warna 3 lubang tanpa kabel', 14000.000000000000000000000000000000, 14500.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (212, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'terminal warna 4 lubang tanpa kabel', 15000.000000000000000000000000000000, 15500.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (213, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'terminal warna 5 lubang tanpa kabel', 16000.000000000000000000000000000000, 16500.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (214, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'terminal warna 6 lubang tanpa kabel', 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (215, '2022-04-22 16:15:06.281', '2022-04-22 16:15:06.281', 'thai pepaya lightening soap 50 gr', 7500.000000000000000000000000000000, 8000.000000000000000000000000000000, 0, 0, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (63, '2022-04-22 16:15:06.281', '2022-04-22 08:15:07.696', 'kabel transparan monster 2 x 50', 30000.000000000000000000000000000000, 62500.000000000000000000000000000000, 0, 6, 0, 0, 0, 'roll');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (64, '2022-04-22 16:15:06.281', '2022-04-22 08:15:07.697', 'kabel transparan monster 2 x 80', 52000.000000000000000000000000000000, 77500.000000000000000000000000000000, 0, 6, 0, 0, 0, 'roll');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (61, '2022-04-22 16:15:06.281', '2022-04-22 08:15:07.697', 'kabel rca 1 - 2', 5000.000000000000000000000000000000, 5500.000000000000000000000000000000, 0, 50, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (137, '2022-04-22 16:15:06.281', '2022-04-22 08:15:07.699', 'senter push on fl1004', 15000.000000000000000000000000000000, 20000.000000000000000000000000000000, 0, 25, 0, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (100, '2022-04-22 16:15:06.281', '2022-04-22 08:15:38.163', 'lampu pancaran spiral 30 watt', 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 0, 24, 36, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (149, '2022-04-22 16:15:06.281', '2022-04-22 08:15:26.972', 'sikat gigi premier comfort soft', 41500.000000000000000000000000000000, 42000.000000000000000000000000000000, 0, 6, 8, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (133, '2022-04-22 16:15:06.281', '2022-04-22 08:15:13.443', 'sapu panjang warna dynamic', 18250.000000000000000000000000000000, 18750.000000000000000000000000000000, 0, 24, 84, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (166, '2022-04-22 16:15:06.281', '2022-04-22 08:15:15.141', 'sisir saku 2006', 2000.000000000000000000000000000000, 2500.000000000000000000000000000000, 0, 60, 24, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (141, '2022-04-22 16:15:06.281', '2022-04-22 08:15:16.648', 'sikat gigi premier basic medium', 47500.000000000000000000000000000000, 48000.000000000000000000000000000000, 0, 0, 4, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (101, '2022-04-22 16:15:06.281', '2022-04-22 08:15:38.164', 'lampu pancaran spiral 35 watt', 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 0, 24, 36, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (120, '2022-04-22 16:15:06.281', '2022-04-22 08:15:28.689', 'paku tindis', 13000.000000000000000000000000000000, 13500.000000000000000000000000000000, 0, 10, 20, 0, 0, 'box');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (85, '2022-04-22 16:15:06.281', '2022-04-22 08:15:38.929', 'lakban cokelat opp', 5500.000000000000000000000000000000, 10500.000000000000000000000000000000, 0, 126, 60, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (164, '2022-04-22 16:15:06.281', '2022-04-22 08:15:16.654', 'sisir rata warna', 2500.000000000000000000000000000000, 3000.000000000000000000000000000000, 0, 36, 72, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (60, '2022-04-22 16:15:06.281', '2022-04-22 08:44:29.431', 'kabel putih nym 2 x 1,5 x 50 kawat', 255000.000000000000000000000000000000, 350000.000000000000000000000000000000, 0, 1, 2, 0, 0, 'roll');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (148, '2022-04-22 16:15:06.281', '2022-04-22 08:15:31.873', 'sikat gigi premier comfort medium', 41500.000000000000000000000000000000, 42000.000000000000000000000000000000, 0, 5, 10, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (204, '2022-04-22 16:15:06.281', '2022-04-22 08:15:32.828', 'terminal warna 3 lubang 1,5 meter', 21000.000000000000000000000000000000, 21500.000000000000000000000000000000, 0, 6, 6, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (205, '2022-04-22 16:15:06.281', '2022-04-22 08:15:32.828', 'terminal warna 4 lubang 1,5 meter', 22000.000000000000000000000000000000, 22500.000000000000000000000000000000, 0, 6, 6, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (209, '2022-04-22 16:15:06.281', '2022-04-22 08:15:32.829', 'terminal warna 4 lubang 5 meter', 29000.000000000000000000000000000000, 29500.000000000000000000000000000000, 0, 0, 6, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (184, '2022-04-22 16:15:06.281', '2022-04-22 08:15:25.701', 'steker gepeng tris', 950.000000000000000000000000000000, 4000.000000000000000000000000000000, 0, 114, 24, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (138, '2022-04-22 16:15:06.281', '2022-04-22 08:15:26.162', 'shower cup jun da - putih', 65500.000000000000000000000000000000, 66000.000000000000000000000000000000, 0, 0, 4, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (132, '2022-04-22 16:15:06.281', '2022-04-22 08:15:33.069', 'raket nyamuk sivicom', 45000.000000000000000000000000000000, 57500.000000000000000000000000000000, 0, 3, 24, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (152, '2022-04-22 16:15:06.281', '2022-04-22 08:15:33.434', 'sikat gigi premier travel pack', 109500.000000000000000000000000000000, 110000.000000000000000000000000000000, 0, 5, 10, 0, 0, 'lusin');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (23, '2022-04-22 16:15:06.281', '2022-04-22 08:15:34.015', 'fitting gantung bulat superity', 2500.000000000000000000000000000000, 4000.000000000000000000000000000000, 0, 144, 36, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (131, '2022-04-22 16:15:06.281', '2022-04-22 08:15:35.29', 'raket nyamuk sentosa', 35000.000000000000000000000000000000, 47500.000000000000000000000000000000, 0, 2, 26, 0, 0, 'pcs');
INSERT INTO public."Product" (id, "createdAt", "updatedAt", name, "buyPrice", "sellPrice", discount, available, sold, defect, returned, unit) VALUES (99, '2022-04-22 16:15:06.281', '2022-04-22 08:15:38.163', 'lampu pancaran spiral 25 watt', 17000.000000000000000000000000000000, 17500.000000000000000000000000000000, 0, 24, 36, 0, 0, 'pcs');


--
-- Data for Name: ProductCategory; Type: TABLE DATA; Schema: public; Owner: cendana_user
--



--
-- Data for Name: RecordEquity; Type: TABLE DATA; Schema: public; Owner: cendana_user
--

INSERT INTO public."RecordEquity" (id, "createdAt", nominal) VALUES (1, '2015-01-15 00:00:00', 43078500.000000000000000000000000000000);
INSERT INTO public."RecordEquity" (id, "createdAt", nominal) VALUES (4, '2021-02-27 16:00:00', 46164000.000000000000000000000000000000);


--
-- Data for Name: RecordProduct; Type: TABLE DATA; Schema: public; Owner: cendana_user
--

INSERT INTO public."RecordProduct" (date, hpp, persediaan) VALUES ('2021-01-01 00:00:00', 43462000.000000000000000000000000000000, 43462000.000000000000000000000000000000);
INSERT INTO public."RecordProduct" (date, hpp, persediaan) VALUES ('2021-01-31 00:00:00', 26473500.000000000000000000000000000000, 26473500.000000000000000000000000000000);


--
-- Data for Name: StockItem; Type: TABLE DATA; Schema: public; Owner: cendana_user
--

INSERT INTO public."StockItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", discount, quantity, available, sold, defect, returned) VALUES (1, '2022-04-22 08:15:06.725', '2022-04-22 08:15:06.725', 1, 23, 1, 2500.000000000000000000000000000000, 4000.000000000000000000000000000000, 0, 144, 144, 0, 0, 0);
INSERT INTO public."StockItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", discount, quantity, available, sold, defect, returned) VALUES (2, '2022-04-22 08:15:06.831', '2022-04-22 08:15:06.832', 1, 60, 1, 255000.000000000000000000000000000000, 350000.000000000000000000000000000000, 0, 3, 3, 0, 0, 0);
INSERT INTO public."StockItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", discount, quantity, available, sold, defect, returned) VALUES (3, '2022-04-22 08:15:06.907', '2022-04-22 08:15:06.908', 1, 63, 1, 30000.000000000000000000000000000000, 62500.000000000000000000000000000000, 0, 6, 6, 0, 0, 0);
INSERT INTO public."StockItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", discount, quantity, available, sold, defect, returned) VALUES (4, '2022-04-22 08:15:06.993', '2022-04-22 08:15:06.993', 1, 64, 1, 52000.000000000000000000000000000000, 77500.000000000000000000000000000000, 0, 6, 6, 0, 0, 0);
INSERT INTO public."StockItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", discount, quantity, available, sold, defect, returned) VALUES (5, '2022-04-22 08:15:07.098', '2022-04-22 08:15:07.099', 1, 61, 1, 5000.000000000000000000000000000000, 5500.000000000000000000000000000000, 0, 50, 50, 0, 0, 0);
INSERT INTO public."StockItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", discount, quantity, available, sold, defect, returned) VALUES (6, '2022-04-22 08:15:07.175', '2022-04-22 08:15:07.176', 1, 85, 1, 5500.000000000000000000000000000000, 10500.000000000000000000000000000000, 0, 144, 144, 0, 0, 0);
INSERT INTO public."StockItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", discount, quantity, available, sold, defect, returned) VALUES (7, '2022-04-22 08:15:07.261', '2022-04-22 08:15:07.262', 1, 131, 1, 35000.000000000000000000000000000000, 47500.000000000000000000000000000000, 0, 15, 15, 0, 0, 0);
INSERT INTO public."StockItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", discount, quantity, available, sold, defect, returned) VALUES (8, '2022-04-22 08:15:07.38', '2022-04-22 08:15:07.38', 1, 132, 1, 45000.000000000000000000000000000000, 57500.000000000000000000000000000000, 0, 15, 15, 0, 0, 0);
INSERT INTO public."StockItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", discount, quantity, available, sold, defect, returned) VALUES (9, '2022-04-22 08:15:07.471', '2022-04-22 08:15:07.472', 1, 137, 1, 15000.000000000000000000000000000000, 20000.000000000000000000000000000000, 0, 25, 25, 0, 0, 0);
INSERT INTO public."StockItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", discount, quantity, available, sold, defect, returned) VALUES (10, '2022-04-22 08:15:07.555', '2022-04-22 08:15:07.556', 1, 184, 1, 950.000000000000000000000000000000, 4000.000000000000000000000000000000, 0, 120, 120, 0, 0, 0);
INSERT INTO public."StockItem" (id, "createdAt", "updatedAt", "authorId", "productId", "orderId", "buyPrice", "sellPrice", discount, quantity, available, sold, defect, returned) VALUES (11, '2022-04-22 08:15:07.799', '2022-04-22 08:15:07.8', 1, 154, 2, 25000.000000000000000000000000000000, 39000.000000000000000000000000000000, 0, 10, 10, 0, 0, 0);


--
-- Data for Name: Tool; Type: TABLE DATA; Schema: public; Owner: cendana_user
--

INSERT INTO public."Tool" (id, "createdAt", "updatedAt", title, description) VALUES (1, '2022-04-22 08:15:06.533', '2022-04-22 08:15:06.533', 'peralatan', '');


--
-- Data for Name: Transaction; Type: TABLE DATA; Schema: public; Owner: cendana_user
--

INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (1, '2015-01-14 00:00:00', '2015-01-14 00:00:00', 1, 'CREDIT', 'SUCCESS', 'ONLINE', 43078500.000000000000000000000000000000, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'Penambahan modal');
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (2, '2021-01-03 16:00:00', '2021-01-03 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (3, '2021-01-04 16:00:00', '2021-01-04 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (4, '2021-01-04 16:00:00', '2021-01-04 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 165000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (5, '2021-01-05 16:00:00', '2021-01-05 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (6, '2021-01-06 16:00:00', '2021-01-06 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (7, '2021-01-07 16:00:00', '2021-01-07 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (8, '2021-01-07 16:00:00', '2021-01-07 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 165000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (9, '2021-01-07 16:00:00', '2021-01-07 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 63000.000000000000000000000000000000, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (10, '2021-01-08 16:00:00', '2021-01-08 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 160000.000000000000000000000000000000, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (11, '2021-01-08 16:00:00', '2021-01-08 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (12, '2021-01-08 16:00:00', '2021-01-08 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 22500.000000000000000000000000000000, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (13, '2021-01-10 16:00:00', '2021-01-10 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (14, '2021-01-11 16:00:00', '2021-01-11 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (15, '2021-01-12 16:00:00', '2021-01-12 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (16, '2021-01-13 16:00:00', '2021-01-13 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 165000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (17, '2021-01-14 16:00:00', '2021-01-14 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (18, '2021-01-15 16:00:00', '2021-01-15 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (19, '2021-01-15 16:00:00', '2021-01-15 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 165000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (20, '2021-01-17 16:00:00', '2021-01-17 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (21, '2021-01-17 16:00:00', '2021-01-17 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 152500.000000000000000000000000000000, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (22, '2021-01-17 16:00:00', '2021-01-17 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 180000.000000000000000000000000000000, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (23, '2021-01-18 16:00:00', '2021-01-18 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (24, '2021-01-18 16:00:00', '2021-01-18 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 165000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (25, '2021-01-19 16:00:00', '2021-01-19 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 412500.000000000000000000000000000000, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (26, '2021-01-19 16:00:00', '2021-01-19 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (27, '2021-01-20 16:00:00', '2021-01-20 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (28, '2021-01-20 16:00:00', '2021-01-20 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 100000.000000000000000000000000000000, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (29, '2021-01-21 16:00:00', '2021-01-21 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (30, '2021-01-21 16:00:00', '2021-01-21 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 165000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (31, '2021-01-21 16:00:00', '2021-01-21 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 200000.000000000000000000000000000000, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (32, '2021-01-22 16:00:00', '2021-01-22 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (33, '2021-01-24 16:00:00', '2021-01-24 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (34, '2021-01-25 16:00:00', '2021-01-25 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (35, '2021-01-25 16:00:00', '2021-01-25 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 165000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (36, '2021-01-26 16:00:00', '2021-01-26 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (37, '2021-01-27 16:00:00', '2021-01-27 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (38, '2021-01-28 16:00:00', '2021-01-28 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 79000.000000000000000000000000000000, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (39, '2021-01-28 16:00:00', '2021-01-28 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (40, '2021-01-29 16:00:00', '2021-01-29 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 10000.000000000000000000000000000000, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (41, '2021-01-29 16:00:00', '2021-01-29 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 1286000.000000000000000000000000000000, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (42, '2021-01-19 16:00:00', '2021-01-19 16:00:00', 1, 'CREDIT', 'SUCCESS', 'OFFLINE', 124000.000000000000000000000000000000, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (43, '2021-01-17 16:00:00', '2022-04-22 08:15:07.7', 1, 'CREDIT', 'SUCCESS', 'CASH', 4348000.000000000000000000000000000000, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (44, '2021-01-28 16:00:00', '2022-04-22 08:15:07.887', 1, 'CREDIT', 'SUCCESS', 'CASH', 250000.000000000000000000000000000000, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (45, '2021-01-04 16:00:00', '2022-04-22 08:15:08.199', 1, 'DEBIT', 'SUCCESS', 'CASH', 39000.000000000000000000000000000000, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (46, '2021-01-04 16:00:00', '2022-04-22 08:15:08.59', 1, 'DEBIT', 'SUCCESS', 'CASH', 184500.000000000000000000000000000000, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (47, '2021-01-04 16:00:00', '2022-04-22 08:15:08.77', 1, 'DEBIT', 'SUCCESS', 'CASH', 90000.000000000000000000000000000000, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (48, '2021-01-04 16:00:00', '2022-04-22 08:15:08.933', 1, 'DEBIT', 'SUCCESS', 'CASH', 60000.000000000000000000000000000000, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (49, '2021-01-04 16:00:00', '2022-04-22 08:15:09.249', 1, 'DEBIT', 'SUCCESS', 'CASH', 379500.000000000000000000000000000000, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (50, '2021-01-04 16:00:00', '2022-04-22 08:15:09.592', 1, 'DEBIT', 'SUCCESS', 'CASH', 379500.000000000000000000000000000000, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (51, '2021-01-04 16:00:00', '2022-04-22 08:15:09.898', 1, 'DEBIT', 'SUCCESS', 'CASH', 120000.000000000000000000000000000000, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (52, '2021-01-04 16:00:00', '2022-04-22 08:15:10.298', 1, 'DEBIT', 'SUCCESS', 'CASH', 255000.000000000000000000000000000000, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (53, '2021-01-04 16:00:00', '2022-04-22 08:15:11.018', 1, 'DEBIT', 'SUCCESS', 'CASH', 446000.000000000000000000000000000000, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (54, '2021-01-04 16:00:00', '2022-04-22 08:15:11.433', 1, 'DEBIT', 'SUCCESS', 'CASH', 774000.000000000000000000000000000000, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (55, '2021-01-06 16:00:00', '2022-04-22 08:15:12.126', 1, 'DEBIT', 'SUCCESS', 'CASH', 289500.000000000000000000000000000000, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (56, '2021-01-06 16:00:00', '2022-04-22 08:15:12.386', 1, 'DEBIT', 'SUCCESS', 'CASH', 38500.000000000000000000000000000000, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (57, '2021-01-06 16:00:00', '2022-04-22 08:15:12.688', 1, 'DEBIT', 'SUCCESS', 'CASH', 142000.000000000000000000000000000000, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (58, '2021-01-06 16:00:00', '2022-04-22 08:15:12.999', 1, 'DEBIT', 'SUCCESS', 'CASH', 76000.000000000000000000000000000000, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (59, '2021-01-06 16:00:00', '2022-04-22 08:15:13.443', 1, 'DEBIT', 'SUCCESS', 'CASH', 627000.000000000000000000000000000000, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (60, '2021-01-07 16:00:00', '2022-04-22 08:15:13.823', 1, 'DEBIT', 'SUCCESS', 'CASH', 276000.000000000000000000000000000000, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (61, '2021-01-07 16:00:00', '2022-04-22 08:15:13.971', 1, 'DEBIT', 'SUCCESS', 'CASH', 159000.000000000000000000000000000000, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (62, '2021-01-07 16:00:00', '2022-04-22 08:15:15.142', 1, 'DEBIT', 'SUCCESS', 'CASH', 966000.000000000000000000000000000000, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (63, '2021-01-07 16:00:00', '2022-04-22 08:15:16.657', 1, 'DEBIT', 'SUCCESS', 'CASH', 1227000.000000000000000000000000000000, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (64, '2021-01-10 16:00:00', '2022-04-22 08:15:16.863', 1, 'DEBIT', 'SUCCESS', 'CASH', 120000.000000000000000000000000000000, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (65, '2021-01-10 16:00:00', '2022-04-22 08:15:17.278', 1, 'DEBIT', 'SUCCESS', 'CASH', 292500.000000000000000000000000000000, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (66, '2021-01-10 16:00:00', '2022-04-22 08:15:17.436', 1, 'DEBIT', 'SUCCESS', 'CASH', 40000.000000000000000000000000000000, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (67, '2021-01-10 16:00:00', '2022-04-22 08:15:17.663', 1, 'DEBIT', 'SUCCESS', 'CASH', 255000.000000000000000000000000000000, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (68, '2021-01-10 16:00:00', '2022-04-22 08:15:17.955', 1, 'DEBIT', 'SUCCESS', 'CASH', 111000.000000000000000000000000000000, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (69, '2021-01-10 16:00:00', '2022-04-22 08:15:18.924', 1, 'DEBIT', 'SUCCESS', 'CASH', 618500.000000000000000000000000000000, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (70, '2021-01-10 16:00:00', '2022-04-22 08:15:19.255', 1, 'DEBIT', 'SUCCESS', 'CASH', 159000.000000000000000000000000000000, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (71, '2021-01-10 16:00:00', '2022-04-22 08:15:19.784', 1, 'DEBIT', 'SUCCESS', 'CASH', 388500.000000000000000000000000000000, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (72, '2021-01-10 16:00:00', '2022-04-22 08:15:20.377', 1, 'DEBIT', 'SUCCESS', 'CASH', 285000.000000000000000000000000000000, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (73, '2021-01-10 16:00:00', '2022-04-22 08:15:21.08', 1, 'DEBIT', 'SUCCESS', 'CASH', 405000.000000000000000000000000000000, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (74, '2021-01-10 16:00:00', '2022-04-22 08:15:21.623', 1, 'DEBIT', 'SUCCESS', 'CASH', 376000.000000000000000000000000000000, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (75, '2021-01-12 16:00:00', '2022-04-22 08:15:22.369', 1, 'DEBIT', 'SUCCESS', 'CASH', 563000.000000000000000000000000000000, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (76, '2021-01-12 16:00:00', '2022-04-22 08:15:22.674', 1, 'DEBIT', 'SUCCESS', 'CASH', 336000.000000000000000000000000000000, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (77, '2021-01-12 16:00:00', '2022-04-22 08:15:23.333', 1, 'DEBIT', 'SUCCESS', 'CASH', 606000.000000000000000000000000000000, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (78, '2021-01-12 16:00:00', '2022-04-22 08:15:23.499', 1, 'DEBIT', 'SUCCESS', 'CASH', 216000.000000000000000000000000000000, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (79, '2021-01-12 16:00:00', '2022-04-22 08:15:23.958', 1, 'DEBIT', 'SUCCESS', 'CASH', 415000.000000000000000000000000000000, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (80, '2021-01-14 16:00:00', '2022-04-22 08:15:24.792', 1, 'DEBIT', 'SUCCESS', 'CASH', 585000.000000000000000000000000000000, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (81, '2021-01-14 16:00:00', '2022-04-22 08:15:25.249', 1, 'DEBIT', 'SUCCESS', 'CASH', 597000.000000000000000000000000000000, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (82, '2021-01-14 16:00:00', '2022-04-22 08:15:25.703', 1, 'DEBIT', 'SUCCESS', 'CASH', 198000.000000000000000000000000000000, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (83, '2021-01-14 16:00:00', '2022-04-22 08:15:26.163', 1, 'DEBIT', 'SUCCESS', 'CASH', 267000.000000000000000000000000000000, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (84, '2021-01-14 16:00:00', '2022-04-22 08:15:26.467', 1, 'DEBIT', 'SUCCESS', 'CASH', 165000.000000000000000000000000000000, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (85, '2021-01-18 16:00:00', '2022-04-22 08:15:26.974', 1, 'DEBIT', 'SUCCESS', 'CASH', 442500.000000000000000000000000000000, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (86, '2021-01-18 16:00:00', '2022-04-22 08:15:27.375', 1, 'DEBIT', 'SUCCESS', 'CASH', 216000.000000000000000000000000000000, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (87, '2021-01-18 16:00:00', '2022-04-22 08:15:27.523', 1, 'DEBIT', 'SUCCESS', 'CASH', 63000.000000000000000000000000000000, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (88, '2021-01-18 16:00:00', '2022-04-22 08:15:27.821', 1, 'DEBIT', 'SUCCESS', 'CASH', 87000.000000000000000000000000000000, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (89, '2021-01-18 16:00:00', '2022-04-22 08:15:28', 1, 'DEBIT', 'SUCCESS', 'CASH', 45000.000000000000000000000000000000, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (90, '2021-01-18 16:00:00', '2022-04-22 08:15:28.691', 1, 'DEBIT', 'SUCCESS', 'CASH', 362500.000000000000000000000000000000, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (91, '2021-01-18 16:00:00', '2022-04-22 08:15:29.079', 1, 'DEBIT', 'SUCCESS', 'CASH', 170000.000000000000000000000000000000, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (92, '2021-01-19 16:00:00', '2022-04-22 08:15:29.589', 1, 'DEBIT', 'SUCCESS', 'CASH', 321000.000000000000000000000000000000, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (93, '2021-01-19 16:00:00', '2022-04-22 08:15:29.905', 1, 'DEBIT', 'SUCCESS', 'CASH', 265000.000000000000000000000000000000, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (94, '2021-01-19 16:00:00', '2022-04-22 08:15:30.562', 1, 'DEBIT', 'SUCCESS', 'CASH', 982500.000000000000000000000000000000, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (95, '2021-01-22 16:00:00', '2022-04-22 08:15:31.045', 1, 'DEBIT', 'SUCCESS', 'CASH', 367500.000000000000000000000000000000, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (96, '2021-01-22 16:00:00', '2022-04-22 08:15:31.275', 1, 'DEBIT', 'SUCCESS', 'CASH', 630000.000000000000000000000000000000, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (97, '2021-01-22 16:00:00', '2022-04-22 08:15:31.508', 1, 'DEBIT', 'SUCCESS', 'CASH', 108000.000000000000000000000000000000, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (98, '2021-01-22 16:00:00', '2022-04-22 08:15:31.875', 1, 'DEBIT', 'SUCCESS', 'CASH', 186000.000000000000000000000000000000, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (99, '2021-01-22 16:00:00', '2022-04-22 08:15:32.104', 1, 'DEBIT', 'SUCCESS', 'CASH', 72000.000000000000000000000000000000, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (100, '2021-01-22 16:00:00', '2022-04-22 08:15:32.83', 1, 'DEBIT', 'SUCCESS', 'CASH', 620500.000000000000000000000000000000, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (101, '2021-01-24 16:00:00', '2022-04-22 08:15:33.069', 1, 'DEBIT', 'SUCCESS', 'CASH', 630000.000000000000000000000000000000, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (102, '2021-01-24 16:00:00', '2022-04-22 08:15:33.435', 1, 'DEBIT', 'SUCCESS', 'CASH', 333000.000000000000000000000000000000, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (103, '2021-01-24 16:00:00', '2022-04-22 08:15:33.804', 1, 'DEBIT', 'SUCCESS', 'CASH', 261000.000000000000000000000000000000, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (104, '2021-01-24 16:00:00', '2022-04-22 08:15:34.016', 1, 'DEBIT', 'SUCCESS', 'CASH', 60000.000000000000000000000000000000, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (105, '2021-01-24 16:00:00', '2022-04-22 08:15:34.44', 1, 'DEBIT', 'SUCCESS', 'CASH', 456500.000000000000000000000000000000, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (106, '2021-01-26 16:00:00', '2022-04-22 08:15:35.293', 1, 'DEBIT', 'SUCCESS', 'CASH', 649000.000000000000000000000000000000, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (107, '2021-01-26 16:00:00', '2022-04-22 08:15:36.154', 1, 'DEBIT', 'SUCCESS', 'CASH', 756500.000000000000000000000000000000, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (108, '2021-01-26 16:00:00', '2022-04-22 08:15:37.052', 1, 'DEBIT', 'SUCCESS', 'CASH', 717000.000000000000000000000000000000, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (109, '2021-01-26 16:00:00', '2022-04-22 08:15:37.362', 1, 'DEBIT', 'SUCCESS', 'CASH', 105000.000000000000000000000000000000, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (110, '2021-01-26 16:00:00', '2022-04-22 08:15:38.166', 1, 'DEBIT', 'SUCCESS', 'CASH', 462000.000000000000000000000000000000, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (111, '2021-01-26 16:00:00', '2022-04-22 08:15:38.931', 1, 'DEBIT', 'SUCCESS', 'CASH', 540000.000000000000000000000000000000, 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (112, '2021-01-28 16:00:00', '2022-04-22 08:15:39.307', 1, 'DEBIT', 'SUCCESS', 'CASH', 361000.000000000000000000000000000000, 70, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (113, '2021-01-28 16:00:00', '2022-04-22 08:15:39.805', 1, 'DEBIT', 'SUCCESS', 'CASH', 312000.000000000000000000000000000000, 71, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (114, '2021-01-28 16:00:00', '2022-04-22 08:15:40.02', 1, 'DEBIT', 'SUCCESS', 'CASH', 60000.000000000000000000000000000000, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Transaction" (id, "createdAt", "updatedAt", "authorId", type, status, "paymentMethod", nominal, "orderId", "delayId", "opexId", "toolId", "equityChangeId", "investmentId", "pengembalianModalFlag", description) VALUES (115, '2021-01-17 16:00:00', '2022-04-22 08:44:29.432', 75, 'DEBIT', 'SUCCESS', 'CASH', 300000.000000000000000000000000000000, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: cendana_user
--

INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (1, 'adminzero', 'adminzero', '$2b$04$IYKRcyTAfl7ri2cPMYbOaubYDjXvea6/zkZlY22tluWTqO1aoz3RK', 'ADMIN', NULL, NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (2, 'Ks.Hasna', NULL, NULL, 'CUSTOMER', 'Jl.Nangka - Oebobo', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (3, 'Ks.Rahmadani', NULL, NULL, 'CUSTOMER', 'Jl.Nangka - Oebobo', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (4, 'Ks.Awal', NULL, NULL, 'CUSTOMER', 'Jl.Bunga Jati - Kelapa Lima', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (5, 'Ks.Naldy', NULL, NULL, 'CUSTOMER', 'Jl.TDM V - TDM V', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (6, 'Ks. Azam Cell', NULL, NULL, 'CUSTOMER', 'Noelbaki', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (7, 'Ks. Adrian Cell', NULL, NULL, 'CUSTOMER', 'Jl.Farmasi - Liliba', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (8, 'Ks.Noval', NULL, NULL, 'CUSTOMER', 'Jl.Timor Raya Km.7 - Oesapa', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (9, 'Ks.Bilkis', NULL, NULL, 'CUSTOMER', 'Jl.Pulau Indah - Kelapa Lima', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (10, 'Ks.Susan', NULL, NULL, 'CUSTOMER', 'Jl.Lubang Jati - Manutapen', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (11, 'Ks.Risky', NULL, NULL, 'CUSTOMER', 'Jurusan Gereja Eden Nisbaki - Manutapen', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (12, 'Ks.Saldi', NULL, NULL, 'CUSTOMER', 'Jl.Sukun 1 - Oepura', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (13, 'Ks. Amin', NULL, NULL, 'CUSTOMER', 'Depan IndoSablon - Belakang Pasar Oebobo', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (14, 'Tk.Tirta Mas', NULL, NULL, 'CUSTOMER', 'Jl.Fetor Funay - BTN', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (15, 'Ks.Bintang', NULL, NULL, 'CUSTOMER', 'Jl.Pemuda - Kuanino', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (16, 'Ks.Tahar Dua', NULL, NULL, 'CUSTOMER', 'Jl.Pemuda - Kuanino', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (17, 'Ks.Putra Tunggal', NULL, NULL, 'CUSTOMER', 'Jl.Bhakti Karang - Oebobo', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (18, 'Ks.Wahyu', NULL, NULL, 'CUSTOMER', 'Jl.El Tari 3 - Penfui', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (19, 'Best Mart', NULL, NULL, 'CUSTOMER', 'Jl.Timor Raya Km.9 - Oesapa', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (20, 'King Mart', NULL, NULL, 'CUSTOMER', 'Jl.Adisucipto - Penfui', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (21, 'Ks.Andi', NULL, NULL, 'CUSTOMER', 'Jl.Timor Raya - Tuapukan', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (22, 'Ks.A''an', NULL, NULL, 'CUSTOMER', 'Jl.Timor Raya - Babau', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (23, 'Ks.Nursyafika', NULL, NULL, 'CUSTOMER', 'Jurusan Wira Aji - Naibonat', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (24, 'Ks.Ridwan', NULL, NULL, 'CUSTOMER', 'Jurusan Kantor Bupati - Naibonat', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (25, 'Ks.Akbar', NULL, NULL, 'CUSTOMER', 'Depan Pertamina - Naibonat', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (26, 'Ks.Kirana', NULL, NULL, 'CUSTOMER', 'Jurusan Pertamina - Naibonat', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (27, 'Ks.Lima Utama', NULL, NULL, 'CUSTOMER', 'Belakang Polresta - Walikota', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (28, 'Ks.Cahaya Ismail', NULL, NULL, 'CUSTOMER', 'Jl.Nusantara - Liliba', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (29, 'Ks.Putra - Putri', NULL, NULL, 'CUSTOMER', 'Jurusan Anugerah Mandiri - Jalur 40', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (30, 'Ks.Putra - Putri Dua', NULL, NULL, 'CUSTOMER', 'Jurusan SMA Negeri 6 - Sikumana', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (31, 'Aquarius Mart', NULL, NULL, 'CUSTOMER', 'Jl.Timor Raya Km.9 - Oesapa', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (32, 'Marina Mart', NULL, NULL, 'CUSTOMER', 'Jl.Piet A.Tallo - Liliba', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (33, '911 Mart', NULL, NULL, 'CUSTOMER', 'Jl.El Tari 3 - Penfui', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (34, 'Top Mart', NULL, NULL, 'CUSTOMER', 'Jl.Jendral Sudirman - Kuanino', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (35, 'Tk. Firmansyah', NULL, NULL, 'CUSTOMER', 'Jl.Piet A.Tallo - Liliba', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (36, 'Ks.Lima - Lima', NULL, NULL, 'CUSTOMER', 'Jl.Taebenu - Liliba', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (37, 'Ks. Gracia', NULL, NULL, 'CUSTOMER', 'Jl. Nasipanaf - Penfui', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (38, 'Bukit Bangunan', NULL, NULL, 'CUSTOMER', 'Jl.H.R Koroh - Sikumana', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (39, 'Ks.Kitinaubina', NULL, NULL, 'CUSTOMER', 'Jl.Nangka - Oebobo', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (40, 'Tk.Alta Indah', NULL, NULL, 'CUSTOMER', 'Jl.Pahlawan - Namosain', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (41, 'Ks.Radit', NULL, NULL, 'CUSTOMER', 'Jl.Alfons Nisnoni - Airnona', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (42, 'Ks.Waru', NULL, NULL, 'CUSTOMER', 'Jl.Timor Raya - Pasir Panjang', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (43, 'Ks.Sifatuo', NULL, NULL, 'CUSTOMER', 'Jl. Hans Kapitan - Kelapa Lima', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (44, 'Ks.Nirma', NULL, NULL, 'CUSTOMER', 'Jl.Hans Kapitan - Kelapa Lima', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (45, 'Tirosa Mart', NULL, NULL, 'CUSTOMER', 'Jl.Biknoi - Naikoten', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (46, 'Ks.Rafqi', NULL, NULL, 'CUSTOMER', 'Jl.Alfons Nisnoni - Batuplat', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (47, 'Ks.Aqila', NULL, NULL, 'CUSTOMER', 'Jl. Jambu - Manulai 2', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (48, 'Ks.Lisda', NULL, NULL, 'CUSTOMER', 'Jurusan SMA Negeri 6 - Sikumana', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (49, 'Ks.Sifatuo', NULL, NULL, 'CUSTOMER', 'Jl.Bhakti Karang - Oebobo', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (50, 'Ks.Kembar', NULL, NULL, 'CUSTOMER', 'Jl.Bundaran PU - Oebufu', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (51, 'Bengkel Paparisa', NULL, NULL, 'CUSTOMER', 'Jl.H.R Koroh - Sikumana', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (52, 'Ks.Three - F', NULL, NULL, 'CUSTOMER', 'Jl.Jendral Sudirman - Kuanino', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (53, 'Tiara Mart', NULL, NULL, 'CUSTOMER', 'Jl.Piet A.Tallo - Liliba', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (54, 'Ks.Amin', NULL, NULL, 'CUSTOMER', 'Depan IndoSablon - Belakang Pasar Oebobo', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (55, 'Ks.Nadine 1', NULL, NULL, 'CUSTOMER', 'Jurusan JP Home Stay - Liliba', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (56, 'Ks.Christin Cell', NULL, NULL, 'CUSTOMER', 'Jl.Kejora - Jurusan RM.Telaga Opa Oepoi', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (57, 'Ks.Irfan Jaya', NULL, NULL, 'CUSTOMER', 'Jurusan Susteran Fioretti - Penfui', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (58, 'UD.Shinta', NULL, NULL, 'CUSTOMER', 'Jl.H.R Koroh - Sikumana', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (59, 'UD.Keagungan', NULL, NULL, 'CUSTOMER', 'Jl.Oematan - Walikota', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (60, 'Ks.Sani Jaya', NULL, NULL, 'CUSTOMER', 'Jurusan Fatukoa - Jalur 40', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (61, 'Ks.Three - F', NULL, NULL, 'CUSTOMER', 'Jl.Jendral Sudirman - Kuanino', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (62, 'Ks.Mira', NULL, NULL, 'CUSTOMER', 'Jl.El Tari 3 - Penfui', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (63, 'Ks.Bilkis', NULL, NULL, 'CUSTOMER', 'Jl.Pulau Indah - Kelapa Lima', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (64, 'Ks.Risky', NULL, NULL, 'CUSTOMER', 'Jurusan Gereja Eden Nisbaki - Manutapen', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (65, 'Ks.Adiyasta', NULL, NULL, 'CUSTOMER', 'Jl.Lubang Jati - Manutapen', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (66, 'Ks.Arni', NULL, NULL, 'CUSTOMER', 'Jl.TDM II - TDM II', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (67, 'Flobamor Mart', NULL, NULL, 'CUSTOMER', 'Jurusan TDM II A - TDM II', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (68, 'Ks.Ridho', NULL, NULL, 'CUSTOMER', 'Jurusan Jembatan Pohon Duri - Oesapa', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (69, 'Ks.Nirwana', NULL, NULL, 'CUSTOMER', 'Jl.Bajawa (SMK N 4) - Oepoi', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (70, 'Ks.Nona', NULL, NULL, 'CUSTOMER', 'Jl.Pemuda - Kuanino', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (71, 'Ks.Gala Mahesa', NULL, NULL, 'CUSTOMER', 'Jl.Oe''ekam - Sikumana', NULL, NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (72, 'PT. Mentari Dynamic Indonesia', NULL, NULL, 'SUPPLIER', 'A', '0124', NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (73, 'Sukses Jaya Abadi', NULL, NULL, 'SUPPLIER', 'A', '0124', NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (74, 'CV. Sinar Laut Timor Kupang', NULL, NULL, 'SUPPLIER', 'B', '0233', NULL);
INSERT INTO public."User" (id, name, username, password, role, address, mobile, email) VALUES (75, 'adminone', 'adminone', '$2b$04$v5HC21SI7bGCLo8XHS3uc.ghzIvwvc8AdRJTiOPBf9muIH7/98efy', 'STAF', NULL, NULL, NULL);


--
-- Data for Name: _ProductToProductCategory; Type: TABLE DATA; Schema: public; Owner: cendana_user
--



--
-- Name: Delay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cendana_user
--

SELECT pg_catalog.setval('public."Delay_id_seq"', 1, true);


--
-- Name: EquityChange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cendana_user
--

SELECT pg_catalog.setval('public."EquityChange_id_seq"', 1, false);


--
-- Name: Investment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cendana_user
--

SELECT pg_catalog.setval('public."Investment_id_seq"', 1, false);


--
-- Name: Opex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cendana_user
--

SELECT pg_catalog.setval('public."Opex_id_seq"', 1, false);


--
-- Name: OrderItem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cendana_user
--

SELECT pg_catalog.setval('public."OrderItem_id_seq"', 344, true);


--
-- Name: Order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cendana_user
--

SELECT pg_catalog.setval('public."Order_id_seq"', 73, true);


--
-- Name: ProductCategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cendana_user
--

SELECT pg_catalog.setval('public."ProductCategory_id_seq"', 1, false);


--
-- Name: Product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cendana_user
--

SELECT pg_catalog.setval('public."Product_id_seq"', 215, true);


--
-- Name: RecordEquity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cendana_user
--

SELECT pg_catalog.setval('public."RecordEquity_id_seq"', 4, true);


--
-- Name: StockItem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cendana_user
--

SELECT pg_catalog.setval('public."StockItem_id_seq"', 11, true);


--
-- Name: Tool_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cendana_user
--

SELECT pg_catalog.setval('public."Tool_id_seq"', 1, false);


--
-- Name: Transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cendana_user
--

SELECT pg_catalog.setval('public."Transaction_id_seq"', 115, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cendana_user
--

SELECT pg_catalog.setval('public."User_id_seq"', 75, true);


--
-- Name: Delay Delay_pkey; Type: CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Delay"
    ADD CONSTRAINT "Delay_pkey" PRIMARY KEY (id);


--
-- Name: EquityChange EquityChange_pkey; Type: CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."EquityChange"
    ADD CONSTRAINT "EquityChange_pkey" PRIMARY KEY (id);


--
-- Name: FinanceReport FinanceReport_pkey; Type: CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."FinanceReport"
    ADD CONSTRAINT "FinanceReport_pkey" PRIMARY KEY (target);


--
-- Name: Investment Investment_pkey; Type: CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Investment"
    ADD CONSTRAINT "Investment_pkey" PRIMARY KEY (id);


--
-- Name: Opex Opex_pkey; Type: CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Opex"
    ADD CONSTRAINT "Opex_pkey" PRIMARY KEY (id);


--
-- Name: OrderItem OrderItem_pkey; Type: CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_pkey" PRIMARY KEY (id);


--
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);


--
-- Name: ProductCategory ProductCategory_pkey; Type: CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."ProductCategory"
    ADD CONSTRAINT "ProductCategory_pkey" PRIMARY KEY (id);


--
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- Name: RecordEquity RecordEquity_pkey; Type: CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."RecordEquity"
    ADD CONSTRAINT "RecordEquity_pkey" PRIMARY KEY (id);


--
-- Name: RecordProduct RecordProduct_pkey; Type: CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."RecordProduct"
    ADD CONSTRAINT "RecordProduct_pkey" PRIMARY KEY (date);


--
-- Name: StockItem StockItem_pkey; Type: CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."StockItem"
    ADD CONSTRAINT "StockItem_pkey" PRIMARY KEY (id);


--
-- Name: Tool Tool_pkey; Type: CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Tool"
    ADD CONSTRAINT "Tool_pkey" PRIMARY KEY (id);


--
-- Name: Transaction Transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: Delay_orderId_key; Type: INDEX; Schema: public; Owner: cendana_user
--

CREATE UNIQUE INDEX "Delay_orderId_key" ON public."Delay" USING btree ("orderId");


--
-- Name: Transaction_equityChangeId_key; Type: INDEX; Schema: public; Owner: cendana_user
--

CREATE UNIQUE INDEX "Transaction_equityChangeId_key" ON public."Transaction" USING btree ("equityChangeId");


--
-- Name: Transaction_orderId_key; Type: INDEX; Schema: public; Owner: cendana_user
--

CREATE UNIQUE INDEX "Transaction_orderId_key" ON public."Transaction" USING btree ("orderId");


--
-- Name: _ProductToProductCategory_AB_unique; Type: INDEX; Schema: public; Owner: cendana_user
--

CREATE UNIQUE INDEX "_ProductToProductCategory_AB_unique" ON public."_ProductToProductCategory" USING btree ("A", "B");


--
-- Name: _ProductToProductCategory_B_index; Type: INDEX; Schema: public; Owner: cendana_user
--

CREATE INDEX "_ProductToProductCategory_B_index" ON public."_ProductToProductCategory" USING btree ("B");


--
-- Name: Delay Delay_authorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Delay"
    ADD CONSTRAINT "Delay_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Delay Delay_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Delay"
    ADD CONSTRAINT "Delay_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: OrderItem OrderItem_authorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: OrderItem OrderItem_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: OrderItem OrderItem_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Order Order_authorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Order Order_targetUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_targetUserId_fkey" FOREIGN KEY ("targetUserId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: StockItem StockItem_authorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."StockItem"
    ADD CONSTRAINT "StockItem_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: StockItem StockItem_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."StockItem"
    ADD CONSTRAINT "StockItem_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: StockItem StockItem_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."StockItem"
    ADD CONSTRAINT "StockItem_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Transaction Transaction_authorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Transaction Transaction_delayId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_delayId_fkey" FOREIGN KEY ("delayId") REFERENCES public."Delay"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Transaction Transaction_equityChangeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_equityChangeId_fkey" FOREIGN KEY ("equityChangeId") REFERENCES public."EquityChange"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Transaction Transaction_investmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_investmentId_fkey" FOREIGN KEY ("investmentId") REFERENCES public."Investment"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Transaction Transaction_opexId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_opexId_fkey" FOREIGN KEY ("opexId") REFERENCES public."Opex"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Transaction Transaction_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Transaction Transaction_toolId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_toolId_fkey" FOREIGN KEY ("toolId") REFERENCES public."Tool"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _ProductToProductCategory _ProductToProductCategory_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."_ProductToProductCategory"
    ADD CONSTRAINT "_ProductToProductCategory_A_fkey" FOREIGN KEY ("A") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _ProductToProductCategory _ProductToProductCategory_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cendana_user
--

ALTER TABLE ONLY public."_ProductToProductCategory"
    ADD CONSTRAINT "_ProductToProductCategory_B_fkey" FOREIGN KEY ("B") REFERENCES public."ProductCategory"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

