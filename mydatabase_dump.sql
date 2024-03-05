--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6 (Ubuntu 15.6-0ubuntu0.23.10.1)
-- Dumped by pg_dump version 15.6 (Ubuntu 15.6-0ubuntu0.23.10.1)

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
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: PAYMENT_COLLECTION_STATUS_ENUM; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."PAYMENT_COLLECTION_STATUS_ENUM" AS ENUM (
    'not_paid',
    'awaiting',
    'authorized',
    'partially_authorized',
    'canceled'
);


ALTER TYPE public."PAYMENT_COLLECTION_STATUS_ENUM" OWNER TO postgres;

--
-- Name: PAYMENT_COLLECTION_TYPE_ENUM; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."PAYMENT_COLLECTION_TYPE_ENUM" AS ENUM (
    'order_edit'
);


ALTER TYPE public."PAYMENT_COLLECTION_TYPE_ENUM" OWNER TO postgres;

--
-- Name: cart_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.cart_type_enum AS ENUM (
    'default',
    'swap',
    'draft_order',
    'payment_link',
    'claim'
);


ALTER TYPE public.cart_type_enum OWNER TO postgres;

--
-- Name: claim_item_reason_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.claim_item_reason_enum AS ENUM (
    'missing_item',
    'wrong_item',
    'production_failure',
    'other'
);


ALTER TYPE public.claim_item_reason_enum OWNER TO postgres;

--
-- Name: claim_order_fulfillment_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.claim_order_fulfillment_status_enum AS ENUM (
    'not_fulfilled',
    'partially_fulfilled',
    'fulfilled',
    'partially_shipped',
    'shipped',
    'partially_returned',
    'returned',
    'canceled',
    'requires_action'
);


ALTER TYPE public.claim_order_fulfillment_status_enum OWNER TO postgres;

--
-- Name: claim_order_payment_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.claim_order_payment_status_enum AS ENUM (
    'na',
    'not_refunded',
    'refunded'
);


ALTER TYPE public.claim_order_payment_status_enum OWNER TO postgres;

--
-- Name: claim_order_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.claim_order_type_enum AS ENUM (
    'refund',
    'replace'
);


ALTER TYPE public.claim_order_type_enum OWNER TO postgres;

--
-- Name: discount_condition_operator_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.discount_condition_operator_enum AS ENUM (
    'in',
    'not_in'
);


ALTER TYPE public.discount_condition_operator_enum OWNER TO postgres;

--
-- Name: discount_condition_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.discount_condition_type_enum AS ENUM (
    'products',
    'product_types',
    'product_collections',
    'product_tags',
    'customer_groups'
);


ALTER TYPE public.discount_condition_type_enum OWNER TO postgres;

--
-- Name: discount_rule_allocation_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.discount_rule_allocation_enum AS ENUM (
    'total',
    'item'
);


ALTER TYPE public.discount_rule_allocation_enum OWNER TO postgres;

--
-- Name: discount_rule_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.discount_rule_type_enum AS ENUM (
    'fixed',
    'percentage',
    'free_shipping'
);


ALTER TYPE public.discount_rule_type_enum OWNER TO postgres;

--
-- Name: draft_order_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.draft_order_status_enum AS ENUM (
    'open',
    'completed'
);


ALTER TYPE public.draft_order_status_enum OWNER TO postgres;

--
-- Name: invite_role_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.invite_role_enum AS ENUM (
    'admin',
    'member',
    'developer'
);


ALTER TYPE public.invite_role_enum OWNER TO postgres;

--
-- Name: order_fulfillment_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_fulfillment_status_enum AS ENUM (
    'not_fulfilled',
    'partially_fulfilled',
    'fulfilled',
    'partially_shipped',
    'shipped',
    'partially_returned',
    'returned',
    'canceled',
    'requires_action'
);


ALTER TYPE public.order_fulfillment_status_enum OWNER TO postgres;

--
-- Name: order_item_change_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_item_change_type_enum AS ENUM (
    'item_add',
    'item_remove',
    'item_update'
);


ALTER TYPE public.order_item_change_type_enum OWNER TO postgres;

--
-- Name: order_payment_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_payment_status_enum AS ENUM (
    'not_paid',
    'awaiting',
    'captured',
    'partially_refunded',
    'refunded',
    'canceled',
    'requires_action'
);


ALTER TYPE public.order_payment_status_enum OWNER TO postgres;

--
-- Name: order_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_status_enum AS ENUM (
    'pending',
    'completed',
    'archived',
    'canceled',
    'requires_action'
);


ALTER TYPE public.order_status_enum OWNER TO postgres;

--
-- Name: payment_session_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payment_session_status_enum AS ENUM (
    'authorized',
    'pending',
    'requires_more',
    'error',
    'canceled'
);


ALTER TYPE public.payment_session_status_enum OWNER TO postgres;

--
-- Name: price_list_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.price_list_status_enum AS ENUM (
    'active',
    'draft'
);


ALTER TYPE public.price_list_status_enum OWNER TO postgres;

--
-- Name: price_list_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.price_list_type_enum AS ENUM (
    'sale',
    'override'
);


ALTER TYPE public.price_list_type_enum OWNER TO postgres;

--
-- Name: product_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.product_status_enum AS ENUM (
    'draft',
    'proposed',
    'published',
    'rejected'
);


ALTER TYPE public.product_status_enum OWNER TO postgres;

--
-- Name: refund_reason_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.refund_reason_enum AS ENUM (
    'discount',
    'return',
    'swap',
    'claim',
    'other'
);


ALTER TYPE public.refund_reason_enum OWNER TO postgres;

--
-- Name: return_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.return_status_enum AS ENUM (
    'requested',
    'received',
    'requires_action',
    'canceled'
);


ALTER TYPE public.return_status_enum OWNER TO postgres;

--
-- Name: shipping_option_price_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.shipping_option_price_type_enum AS ENUM (
    'flat_rate',
    'calculated'
);


ALTER TYPE public.shipping_option_price_type_enum OWNER TO postgres;

--
-- Name: shipping_option_requirement_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.shipping_option_requirement_type_enum AS ENUM (
    'min_subtotal',
    'max_subtotal'
);


ALTER TYPE public.shipping_option_requirement_type_enum OWNER TO postgres;

--
-- Name: shipping_profile_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.shipping_profile_type_enum AS ENUM (
    'default',
    'gift_card',
    'custom'
);


ALTER TYPE public.shipping_profile_type_enum OWNER TO postgres;

--
-- Name: swap_fulfillment_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.swap_fulfillment_status_enum AS ENUM (
    'not_fulfilled',
    'fulfilled',
    'shipped',
    'partially_shipped',
    'canceled',
    'requires_action'
);


ALTER TYPE public.swap_fulfillment_status_enum OWNER TO postgres;

--
-- Name: swap_payment_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.swap_payment_status_enum AS ENUM (
    'not_paid',
    'awaiting',
    'captured',
    'confirmed',
    'canceled',
    'difference_refunded',
    'partially_refunded',
    'refunded',
    'requires_action'
);


ALTER TYPE public.swap_payment_status_enum OWNER TO postgres;

--
-- Name: user_role_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_role_enum AS ENUM (
    'admin',
    'member',
    'developer'
);


ALTER TYPE public.user_role_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id character varying NOT NULL,
    customer_id character varying,
    company character varying,
    first_name character varying,
    last_name character varying,
    address_1 character varying,
    address_2 character varying,
    city character varying,
    country_code character varying,
    province character varying,
    postal_code character varying,
    phone character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: analytics_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.analytics_config (
    id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    user_id character varying NOT NULL,
    opt_out boolean DEFAULT false NOT NULL,
    anonymize boolean DEFAULT false NOT NULL
);


ALTER TABLE public.analytics_config OWNER TO postgres;

--
-- Name: batch_job; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.batch_job (
    id character varying NOT NULL,
    type text NOT NULL,
    created_by character varying,
    context jsonb,
    result jsonb,
    dry_run boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    pre_processed_at timestamp with time zone,
    confirmed_at timestamp with time zone,
    processing_at timestamp with time zone,
    completed_at timestamp with time zone,
    failed_at timestamp with time zone,
    canceled_at timestamp with time zone,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.batch_job OWNER TO postgres;

--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id character varying NOT NULL,
    email character varying,
    billing_address_id character varying,
    shipping_address_id character varying,
    region_id character varying NOT NULL,
    customer_id character varying,
    payment_id character varying,
    type public.cart_type_enum DEFAULT 'default'::public.cart_type_enum NOT NULL,
    completed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    idempotency_key character varying,
    context jsonb,
    payment_authorized_at timestamp with time zone,
    sales_channel_id character varying
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_discounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_discounts (
    cart_id character varying NOT NULL,
    discount_id character varying NOT NULL
);


ALTER TABLE public.cart_discounts OWNER TO postgres;

--
-- Name: cart_gift_cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_gift_cards (
    cart_id character varying NOT NULL,
    gift_card_id character varying NOT NULL
);


ALTER TABLE public.cart_gift_cards OWNER TO postgres;

--
-- Name: claim_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.claim_image (
    id character varying NOT NULL,
    claim_item_id character varying NOT NULL,
    url character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.claim_image OWNER TO postgres;

--
-- Name: claim_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.claim_item (
    id character varying NOT NULL,
    claim_order_id character varying NOT NULL,
    item_id character varying NOT NULL,
    variant_id character varying NOT NULL,
    reason public.claim_item_reason_enum NOT NULL,
    note character varying,
    quantity integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.claim_item OWNER TO postgres;

--
-- Name: claim_item_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.claim_item_tags (
    item_id character varying NOT NULL,
    tag_id character varying NOT NULL
);


ALTER TABLE public.claim_item_tags OWNER TO postgres;

--
-- Name: claim_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.claim_order (
    id character varying NOT NULL,
    payment_status public.claim_order_payment_status_enum DEFAULT 'na'::public.claim_order_payment_status_enum NOT NULL,
    fulfillment_status public.claim_order_fulfillment_status_enum DEFAULT 'not_fulfilled'::public.claim_order_fulfillment_status_enum NOT NULL,
    type public.claim_order_type_enum NOT NULL,
    order_id character varying NOT NULL,
    shipping_address_id character varying,
    refund_amount integer,
    canceled_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    idempotency_key character varying,
    no_notification boolean
);


ALTER TABLE public.claim_order OWNER TO postgres;

--
-- Name: claim_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.claim_tag (
    id character varying NOT NULL,
    value character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.claim_tag OWNER TO postgres;

--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id integer NOT NULL,
    iso_2 character varying NOT NULL,
    iso_3 character varying NOT NULL,
    num_code integer NOT NULL,
    name character varying NOT NULL,
    display_name character varying NOT NULL,
    region_id character varying
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_id_seq OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    code character varying NOT NULL,
    symbol character varying NOT NULL,
    symbol_native character varying NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- Name: custom_shipping_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.custom_shipping_option (
    id character varying NOT NULL,
    price integer NOT NULL,
    shipping_option_id character varying NOT NULL,
    cart_id character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.custom_shipping_option OWNER TO postgres;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id character varying NOT NULL,
    email character varying NOT NULL,
    first_name character varying,
    last_name character varying,
    billing_address_id character varying,
    password_hash character varying,
    phone character varying,
    has_account boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_group (
    id character varying NOT NULL,
    name character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.customer_group OWNER TO postgres;

--
-- Name: customer_group_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_group_customers (
    customer_group_id character varying NOT NULL,
    customer_id character varying NOT NULL
);


ALTER TABLE public.customer_group_customers OWNER TO postgres;

--
-- Name: discount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount (
    id character varying NOT NULL,
    code character varying NOT NULL,
    is_dynamic boolean NOT NULL,
    rule_id character varying,
    is_disabled boolean NOT NULL,
    parent_discount_id character varying,
    starts_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ends_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    usage_limit integer,
    usage_count integer DEFAULT 0 NOT NULL,
    valid_duration character varying
);


ALTER TABLE public.discount OWNER TO postgres;

--
-- Name: discount_condition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount_condition (
    id character varying NOT NULL,
    type public.discount_condition_type_enum NOT NULL,
    operator public.discount_condition_operator_enum NOT NULL,
    discount_rule_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.discount_condition OWNER TO postgres;

--
-- Name: discount_condition_customer_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount_condition_customer_group (
    customer_group_id character varying NOT NULL,
    condition_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.discount_condition_customer_group OWNER TO postgres;

--
-- Name: discount_condition_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount_condition_product (
    product_id character varying NOT NULL,
    condition_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.discount_condition_product OWNER TO postgres;

--
-- Name: discount_condition_product_collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount_condition_product_collection (
    product_collection_id character varying NOT NULL,
    condition_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.discount_condition_product_collection OWNER TO postgres;

--
-- Name: discount_condition_product_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount_condition_product_tag (
    product_tag_id character varying NOT NULL,
    condition_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.discount_condition_product_tag OWNER TO postgres;

--
-- Name: discount_condition_product_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount_condition_product_type (
    product_type_id character varying NOT NULL,
    condition_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.discount_condition_product_type OWNER TO postgres;

--
-- Name: discount_regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount_regions (
    discount_id character varying NOT NULL,
    region_id character varying NOT NULL
);


ALTER TABLE public.discount_regions OWNER TO postgres;

--
-- Name: discount_rule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount_rule (
    id character varying NOT NULL,
    description character varying,
    type public.discount_rule_type_enum NOT NULL,
    value integer NOT NULL,
    allocation public.discount_rule_allocation_enum,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.discount_rule OWNER TO postgres;

--
-- Name: discount_rule_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount_rule_products (
    discount_rule_id character varying NOT NULL,
    product_id character varying NOT NULL
);


ALTER TABLE public.discount_rule_products OWNER TO postgres;

--
-- Name: draft_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.draft_order (
    id character varying NOT NULL,
    status public.draft_order_status_enum DEFAULT 'open'::public.draft_order_status_enum NOT NULL,
    display_id integer NOT NULL,
    cart_id character varying,
    order_id character varying,
    canceled_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    completed_at timestamp with time zone,
    metadata jsonb,
    idempotency_key character varying,
    no_notification_order boolean
);


ALTER TABLE public.draft_order OWNER TO postgres;

--
-- Name: draft_order_display_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.draft_order_display_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.draft_order_display_id_seq OWNER TO postgres;

--
-- Name: draft_order_display_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.draft_order_display_id_seq OWNED BY public.draft_order.display_id;


--
-- Name: fulfillment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fulfillment (
    id character varying NOT NULL,
    swap_id character varying,
    order_id character varying,
    tracking_numbers jsonb DEFAULT '[]'::jsonb NOT NULL,
    data jsonb NOT NULL,
    shipped_at timestamp with time zone,
    canceled_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb,
    idempotency_key character varying,
    provider_id character varying,
    claim_order_id character varying,
    no_notification boolean,
    location_id character varying
);


ALTER TABLE public.fulfillment OWNER TO postgres;

--
-- Name: fulfillment_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fulfillment_item (
    fulfillment_id character varying NOT NULL,
    item_id character varying NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.fulfillment_item OWNER TO postgres;

--
-- Name: fulfillment_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fulfillment_provider (
    id character varying NOT NULL,
    is_installed boolean DEFAULT true NOT NULL
);


ALTER TABLE public.fulfillment_provider OWNER TO postgres;

--
-- Name: gift_card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gift_card (
    id character varying NOT NULL,
    code character varying NOT NULL,
    value integer NOT NULL,
    balance integer NOT NULL,
    region_id character varying NOT NULL,
    order_id character varying,
    is_disabled boolean DEFAULT false NOT NULL,
    ends_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    tax_rate real
);


ALTER TABLE public.gift_card OWNER TO postgres;

--
-- Name: gift_card_transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gift_card_transaction (
    id character varying NOT NULL,
    gift_card_id character varying NOT NULL,
    order_id character varying NOT NULL,
    amount integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    is_taxable boolean,
    tax_rate real
);


ALTER TABLE public.gift_card_transaction OWNER TO postgres;

--
-- Name: idempotency_key; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.idempotency_key (
    id character varying NOT NULL,
    idempotency_key character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    locked_at timestamp with time zone,
    request_method character varying,
    request_params jsonb,
    request_path character varying,
    response_code integer,
    response_body jsonb,
    recovery_point character varying DEFAULT 'started'::character varying NOT NULL
);


ALTER TABLE public.idempotency_key OWNER TO postgres;

--
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id character varying NOT NULL,
    url character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.image OWNER TO postgres;

--
-- Name: invite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invite (
    id character varying NOT NULL,
    user_email character varying NOT NULL,
    role public.invite_role_enum DEFAULT 'member'::public.invite_role_enum,
    accepted boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    token character varying NOT NULL,
    expires_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.invite OWNER TO postgres;

--
-- Name: line_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.line_item (
    id character varying NOT NULL,
    cart_id character varying,
    order_id character varying,
    swap_id character varying,
    title character varying NOT NULL,
    description character varying,
    thumbnail character varying,
    is_giftcard boolean DEFAULT false NOT NULL,
    should_merge boolean DEFAULT true NOT NULL,
    allow_discounts boolean DEFAULT true NOT NULL,
    has_shipping boolean,
    unit_price integer NOT NULL,
    variant_id character varying,
    quantity integer NOT NULL,
    fulfilled_quantity integer,
    returned_quantity integer,
    shipped_quantity integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb,
    claim_order_id character varying,
    is_return boolean DEFAULT false NOT NULL,
    original_item_id character varying,
    order_edit_id character varying,
    CONSTRAINT "CHK_0cd85e15610d11b553d5e8fda6" CHECK ((shipped_quantity <= fulfilled_quantity)),
    CONSTRAINT "CHK_64eef00a5064887634f1680866" CHECK ((quantity > 0)),
    CONSTRAINT "CHK_91f40396d847f6ecfd9f752bf8" CHECK ((returned_quantity <= quantity)),
    CONSTRAINT "CHK_c61716c68f5ad5de2834c827d3" CHECK ((fulfilled_quantity <= quantity))
);


ALTER TABLE public.line_item OWNER TO postgres;

--
-- Name: line_item_adjustment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.line_item_adjustment (
    id character varying NOT NULL,
    item_id character varying NOT NULL,
    description character varying NOT NULL,
    discount_id character varying,
    amount numeric NOT NULL,
    metadata jsonb
);


ALTER TABLE public.line_item_adjustment OWNER TO postgres;

--
-- Name: line_item_tax_line; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.line_item_tax_line (
    id character varying NOT NULL,
    rate real NOT NULL,
    name character varying NOT NULL,
    code character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb,
    item_id character varying NOT NULL
);


ALTER TABLE public.line_item_tax_line OWNER TO postgres;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: money_amount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.money_amount (
    id character varying NOT NULL,
    currency_code character varying NOT NULL,
    amount integer NOT NULL,
    region_id character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    min_quantity integer,
    max_quantity integer,
    price_list_id character varying
);


ALTER TABLE public.money_amount OWNER TO postgres;

--
-- Name: note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.note (
    id character varying NOT NULL,
    value character varying NOT NULL,
    resource_type character varying NOT NULL,
    resource_id character varying NOT NULL,
    author_id character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.note OWNER TO postgres;

--
-- Name: notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification (
    id character varying NOT NULL,
    event_name character varying,
    resource_type character varying NOT NULL,
    resource_id character varying NOT NULL,
    customer_id character varying,
    "to" character varying NOT NULL,
    data jsonb NOT NULL,
    parent_id character varying,
    provider_id character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.notification OWNER TO postgres;

--
-- Name: notification_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification_provider (
    id character varying NOT NULL,
    is_installed boolean DEFAULT true NOT NULL
);


ALTER TABLE public.notification_provider OWNER TO postgres;

--
-- Name: oauth; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth (
    id character varying NOT NULL,
    display_name character varying NOT NULL,
    application_name character varying NOT NULL,
    install_url character varying,
    uninstall_url character varying,
    data jsonb
);


ALTER TABLE public.oauth OWNER TO postgres;

--
-- Name: onboarding_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.onboarding_state (
    id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    current_step character varying,
    is_complete boolean NOT NULL,
    product_id character varying
);


ALTER TABLE public.onboarding_state OWNER TO postgres;

--
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id character varying NOT NULL,
    status public.order_status_enum DEFAULT 'pending'::public.order_status_enum NOT NULL,
    fulfillment_status public.order_fulfillment_status_enum DEFAULT 'not_fulfilled'::public.order_fulfillment_status_enum NOT NULL,
    payment_status public.order_payment_status_enum DEFAULT 'not_paid'::public.order_payment_status_enum NOT NULL,
    display_id integer NOT NULL,
    cart_id character varying,
    customer_id character varying NOT NULL,
    email character varying NOT NULL,
    billing_address_id character varying,
    shipping_address_id character varying,
    region_id character varying NOT NULL,
    currency_code character varying NOT NULL,
    tax_rate real,
    canceled_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb,
    idempotency_key character varying,
    draft_order_id character varying,
    no_notification boolean,
    external_id character varying,
    sales_channel_id character varying
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- Name: order_discounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_discounts (
    order_id character varying NOT NULL,
    discount_id character varying NOT NULL
);


ALTER TABLE public.order_discounts OWNER TO postgres;

--
-- Name: order_display_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_display_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_display_id_seq OWNER TO postgres;

--
-- Name: order_display_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_display_id_seq OWNED BY public."order".display_id;


--
-- Name: order_edit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_edit (
    id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    order_id character varying NOT NULL,
    internal_note character varying,
    created_by character varying NOT NULL,
    requested_by character varying,
    requested_at timestamp with time zone,
    confirmed_by character varying,
    confirmed_at timestamp with time zone,
    declined_by character varying,
    declined_reason character varying,
    declined_at timestamp with time zone,
    canceled_by character varying,
    canceled_at timestamp with time zone,
    payment_collection_id character varying
);


ALTER TABLE public.order_edit OWNER TO postgres;

--
-- Name: order_gift_cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_gift_cards (
    order_id character varying NOT NULL,
    gift_card_id character varying NOT NULL
);


ALTER TABLE public.order_gift_cards OWNER TO postgres;

--
-- Name: order_item_change; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_item_change (
    id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    type public.order_item_change_type_enum NOT NULL,
    order_edit_id character varying NOT NULL,
    original_line_item_id character varying,
    line_item_id character varying
);


ALTER TABLE public.order_item_change OWNER TO postgres;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    id character varying NOT NULL,
    swap_id character varying,
    cart_id character varying,
    order_id character varying,
    amount integer NOT NULL,
    currency_code character varying NOT NULL,
    amount_refunded integer DEFAULT 0 NOT NULL,
    provider_id character varying NOT NULL,
    data jsonb NOT NULL,
    captured_at timestamp with time zone,
    canceled_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb,
    idempotency_key character varying
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_collection (
    id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    type public."PAYMENT_COLLECTION_TYPE_ENUM" NOT NULL,
    status public."PAYMENT_COLLECTION_STATUS_ENUM" NOT NULL,
    description text,
    amount integer NOT NULL,
    authorized_amount integer,
    region_id character varying NOT NULL,
    currency_code character varying NOT NULL,
    metadata jsonb,
    created_by character varying NOT NULL
);


ALTER TABLE public.payment_collection OWNER TO postgres;

--
-- Name: payment_collection_payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_collection_payments (
    payment_collection_id character varying NOT NULL,
    payment_id character varying NOT NULL
);


ALTER TABLE public.payment_collection_payments OWNER TO postgres;

--
-- Name: payment_collection_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_collection_sessions (
    payment_collection_id character varying NOT NULL,
    payment_session_id character varying NOT NULL
);


ALTER TABLE public.payment_collection_sessions OWNER TO postgres;

--
-- Name: payment_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_provider (
    id character varying NOT NULL,
    is_installed boolean DEFAULT true NOT NULL
);


ALTER TABLE public.payment_provider OWNER TO postgres;

--
-- Name: payment_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_session (
    id character varying NOT NULL,
    cart_id character varying,
    provider_id character varying NOT NULL,
    is_selected boolean,
    status public.payment_session_status_enum NOT NULL,
    data jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    idempotency_key character varying,
    payment_authorized_at timestamp with time zone,
    amount integer,
    is_initiated boolean DEFAULT false NOT NULL
);


ALTER TABLE public.payment_session OWNER TO postgres;

--
-- Name: price_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_list (
    id character varying NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    type public.price_list_type_enum DEFAULT 'sale'::public.price_list_type_enum NOT NULL,
    status public.price_list_status_enum DEFAULT 'draft'::public.price_list_status_enum NOT NULL,
    starts_at timestamp with time zone,
    ends_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.price_list OWNER TO postgres;

--
-- Name: price_list_customer_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_list_customer_groups (
    price_list_id character varying NOT NULL,
    customer_group_id character varying NOT NULL
);


ALTER TABLE public.price_list_customer_groups OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id character varying NOT NULL,
    title character varying NOT NULL,
    subtitle character varying,
    description character varying,
    handle character varying,
    is_giftcard boolean DEFAULT false NOT NULL,
    thumbnail character varying,
    weight integer,
    length integer,
    height integer,
    width integer,
    hs_code character varying,
    origin_country character varying,
    mid_code character varying,
    material character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    collection_id character varying,
    type_id character varying,
    discountable boolean DEFAULT true NOT NULL,
    status public.product_status_enum DEFAULT 'draft'::public.product_status_enum NOT NULL,
    external_id character varying
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category (
    id character varying NOT NULL,
    name text NOT NULL,
    handle text NOT NULL,
    parent_category_id character varying,
    mpath text,
    is_active boolean DEFAULT false,
    is_internal boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    rank integer DEFAULT 0 NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    metadata jsonb,
    CONSTRAINT product_category_rank_check CHECK ((rank >= 0))
);


ALTER TABLE public.product_category OWNER TO postgres;

--
-- Name: product_category_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category_product (
    product_category_id character varying NOT NULL,
    product_id character varying NOT NULL
);


ALTER TABLE public.product_category_product OWNER TO postgres;

--
-- Name: product_collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_collection (
    id character varying NOT NULL,
    title character varying NOT NULL,
    handle character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.product_collection OWNER TO postgres;

--
-- Name: product_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_images (
    product_id character varying NOT NULL,
    image_id character varying NOT NULL
);


ALTER TABLE public.product_images OWNER TO postgres;

--
-- Name: product_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_option (
    id character varying NOT NULL,
    title character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    product_id character varying
);


ALTER TABLE public.product_option OWNER TO postgres;

--
-- Name: product_option_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_option_value (
    id character varying NOT NULL,
    value character varying NOT NULL,
    option_id character varying NOT NULL,
    variant_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.product_option_value OWNER TO postgres;

--
-- Name: product_sales_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_sales_channel (
    product_id character varying NOT NULL,
    sales_channel_id character varying NOT NULL
);


ALTER TABLE public.product_sales_channel OWNER TO postgres;

--
-- Name: product_shipping_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_shipping_profile (
    profile_id text NOT NULL,
    product_id text NOT NULL
);


ALTER TABLE public.product_shipping_profile OWNER TO postgres;

--
-- Name: product_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_tag (
    id character varying NOT NULL,
    value character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.product_tag OWNER TO postgres;

--
-- Name: product_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_tags (
    product_id character varying NOT NULL,
    product_tag_id character varying NOT NULL
);


ALTER TABLE public.product_tags OWNER TO postgres;

--
-- Name: product_tax_rate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_tax_rate (
    product_id character varying NOT NULL,
    rate_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.product_tax_rate OWNER TO postgres;

--
-- Name: product_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_type (
    id character varying NOT NULL,
    value character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.product_type OWNER TO postgres;

--
-- Name: product_type_tax_rate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_type_tax_rate (
    product_type_id character varying NOT NULL,
    rate_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.product_type_tax_rate OWNER TO postgres;

--
-- Name: product_variant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variant (
    id character varying NOT NULL,
    title character varying NOT NULL,
    product_id character varying NOT NULL,
    sku character varying,
    barcode character varying,
    ean character varying,
    upc character varying,
    inventory_quantity integer NOT NULL,
    allow_backorder boolean DEFAULT false NOT NULL,
    manage_inventory boolean DEFAULT true NOT NULL,
    hs_code character varying,
    origin_country character varying,
    mid_code character varying,
    material character varying,
    weight integer,
    length integer,
    height integer,
    width integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    variant_rank integer DEFAULT 0
);


ALTER TABLE public.product_variant OWNER TO postgres;

--
-- Name: product_variant_inventory_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variant_inventory_item (
    id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    inventory_item_id text NOT NULL,
    variant_id text NOT NULL,
    required_quantity integer DEFAULT 1 NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.product_variant_inventory_item OWNER TO postgres;

--
-- Name: product_variant_money_amount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variant_money_amount (
    id character varying NOT NULL,
    money_amount_id text NOT NULL,
    variant_id text NOT NULL,
    deleted_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.product_variant_money_amount OWNER TO postgres;

--
-- Name: publishable_api_key; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publishable_api_key (
    id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying,
    revoked_by character varying,
    revoked_at timestamp with time zone,
    title character varying NOT NULL
);


ALTER TABLE public.publishable_api_key OWNER TO postgres;

--
-- Name: publishable_api_key_sales_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publishable_api_key_sales_channel (
    sales_channel_id character varying NOT NULL,
    publishable_key_id character varying NOT NULL,
    id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.publishable_api_key_sales_channel OWNER TO postgres;

--
-- Name: refund; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refund (
    id character varying NOT NULL,
    order_id character varying,
    amount integer NOT NULL,
    note character varying,
    reason public.refund_reason_enum NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb,
    idempotency_key character varying,
    payment_id character varying
);


ALTER TABLE public.refund OWNER TO postgres;

--
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    id character varying NOT NULL,
    name character varying NOT NULL,
    currency_code character varying NOT NULL,
    tax_rate real NOT NULL,
    tax_code character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    gift_cards_taxable boolean DEFAULT true NOT NULL,
    automatic_taxes boolean DEFAULT true NOT NULL,
    tax_provider_id character varying
);


ALTER TABLE public.region OWNER TO postgres;

--
-- Name: region_fulfillment_providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region_fulfillment_providers (
    region_id character varying NOT NULL,
    provider_id character varying NOT NULL
);


ALTER TABLE public.region_fulfillment_providers OWNER TO postgres;

--
-- Name: region_payment_providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region_payment_providers (
    region_id character varying NOT NULL,
    provider_id character varying NOT NULL
);


ALTER TABLE public.region_payment_providers OWNER TO postgres;

--
-- Name: return; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.return (
    id character varying NOT NULL,
    status public.return_status_enum DEFAULT 'requested'::public.return_status_enum NOT NULL,
    swap_id character varying,
    order_id character varying,
    shipping_data jsonb,
    refund_amount integer NOT NULL,
    received_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb,
    idempotency_key character varying,
    claim_order_id character varying,
    no_notification boolean,
    location_id character varying
);


ALTER TABLE public.return OWNER TO postgres;

--
-- Name: return_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.return_item (
    return_id character varying NOT NULL,
    item_id character varying NOT NULL,
    quantity integer NOT NULL,
    is_requested boolean DEFAULT true NOT NULL,
    requested_quantity integer,
    received_quantity integer,
    metadata jsonb,
    reason_id character varying,
    note character varying
);


ALTER TABLE public.return_item OWNER TO postgres;

--
-- Name: return_reason; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.return_reason (
    id character varying NOT NULL,
    value character varying NOT NULL,
    label character varying NOT NULL,
    description character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    parent_return_reason_id character varying
);


ALTER TABLE public.return_reason OWNER TO postgres;

--
-- Name: sales_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_channel (
    id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    name character varying NOT NULL,
    description character varying,
    is_disabled boolean DEFAULT false NOT NULL,
    metadata jsonb
);


ALTER TABLE public.sales_channel OWNER TO postgres;

--
-- Name: sales_channel_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_channel_location (
    id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    sales_channel_id text NOT NULL,
    location_id text NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.sales_channel_location OWNER TO postgres;

--
-- Name: shipping_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_method (
    id character varying NOT NULL,
    shipping_option_id character varying NOT NULL,
    order_id character varying,
    cart_id character varying,
    swap_id character varying,
    return_id character varying,
    price integer NOT NULL,
    data jsonb NOT NULL,
    claim_order_id character varying,
    CONSTRAINT "CHK_64c6812fe7815be30d688df513" CHECK ((price >= 0)),
    CONSTRAINT "CHK_a7020b08665bbd64d84a6641cf" CHECK (((claim_order_id IS NOT NULL) OR (order_id IS NOT NULL) OR (cart_id IS NOT NULL) OR (swap_id IS NOT NULL) OR (return_id IS NOT NULL)))
);


ALTER TABLE public.shipping_method OWNER TO postgres;

--
-- Name: shipping_method_tax_line; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_method_tax_line (
    id character varying NOT NULL,
    rate real NOT NULL,
    name character varying NOT NULL,
    code character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb,
    shipping_method_id character varying NOT NULL
);


ALTER TABLE public.shipping_method_tax_line OWNER TO postgres;

--
-- Name: shipping_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_option (
    id character varying NOT NULL,
    name character varying NOT NULL,
    region_id character varying NOT NULL,
    profile_id character varying NOT NULL,
    provider_id character varying NOT NULL,
    price_type public.shipping_option_price_type_enum NOT NULL,
    amount integer,
    is_return boolean DEFAULT false NOT NULL,
    data jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    admin_only boolean DEFAULT false NOT NULL,
    CONSTRAINT "CHK_7a367f5901ae0a5b0df75aee38" CHECK ((amount >= 0))
);


ALTER TABLE public.shipping_option OWNER TO postgres;

--
-- Name: shipping_option_requirement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_option_requirement (
    id character varying NOT NULL,
    shipping_option_id character varying NOT NULL,
    type public.shipping_option_requirement_type_enum NOT NULL,
    amount integer NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.shipping_option_requirement OWNER TO postgres;

--
-- Name: shipping_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_profile (
    id character varying NOT NULL,
    name character varying NOT NULL,
    type public.shipping_profile_type_enum NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.shipping_profile OWNER TO postgres;

--
-- Name: shipping_tax_rate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_tax_rate (
    shipping_option_id character varying NOT NULL,
    rate_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.shipping_tax_rate OWNER TO postgres;

--
-- Name: staged_job; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staged_job (
    id character varying NOT NULL,
    event_name character varying NOT NULL,
    data jsonb NOT NULL,
    options jsonb DEFAULT '{}'::jsonb NOT NULL
);


ALTER TABLE public.staged_job OWNER TO postgres;

--
-- Name: store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store (
    id character varying NOT NULL,
    name character varying DEFAULT 'Medusa Store'::character varying NOT NULL,
    default_currency_code character varying DEFAULT 'usd'::character varying NOT NULL,
    swap_link_template character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb,
    payment_link_template character varying,
    invite_link_template character varying,
    default_sales_channel_id character varying,
    default_location_id character varying
);


ALTER TABLE public.store OWNER TO postgres;

--
-- Name: store_currencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_currencies (
    store_id character varying NOT NULL,
    currency_code character varying NOT NULL
);


ALTER TABLE public.store_currencies OWNER TO postgres;

--
-- Name: swap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.swap (
    id character varying NOT NULL,
    fulfillment_status public.swap_fulfillment_status_enum NOT NULL,
    payment_status public.swap_payment_status_enum NOT NULL,
    order_id character varying NOT NULL,
    difference_due integer,
    shipping_address_id character varying,
    cart_id character varying,
    confirmed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    idempotency_key character varying,
    no_notification boolean,
    canceled_at timestamp with time zone,
    allow_backorder boolean DEFAULT false NOT NULL
);


ALTER TABLE public.swap OWNER TO postgres;

--
-- Name: tax_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_provider (
    id character varying NOT NULL,
    is_installed boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tax_provider OWNER TO postgres;

--
-- Name: tax_rate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_rate (
    id character varying NOT NULL,
    rate real,
    code character varying,
    name character varying NOT NULL,
    region_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.tax_rate OWNER TO postgres;

--
-- Name: tracking_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracking_link (
    id character varying NOT NULL,
    url character varying,
    tracking_number character varying NOT NULL,
    fulfillment_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    idempotency_key character varying
);


ALTER TABLE public.tracking_link OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id character varying NOT NULL,
    email character varying NOT NULL,
    first_name character varying,
    last_name character varying,
    password_hash character varying,
    api_token character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    role public.user_role_enum DEFAULT 'member'::public.user_role_enum
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- Name: draft_order display_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.draft_order ALTER COLUMN display_id SET DEFAULT nextval('public.draft_order_display_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: order display_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order" ALTER COLUMN display_id SET DEFAULT nextval('public.order_display_id_seq'::regclass);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (id, customer_id, company, first_name, last_name, address_1, address_2, city, country_code, province, postal_code, phone, created_at, updated_at, deleted_at, metadata) FROM stdin;
addr_01HQTDFQRKAJFFC0EJ8Y5P0HN7	cus_01HQTDE4TVG9M3XFWJAQ2CG0TM	zuri health	andrew	gagi	gg	emilia building	nairobi	ca	kenya	333	0728278545	2024-02-29 12:30:04.555905+00	2024-02-29 12:30:04.555905+00	\N	\N
addr_01HQX1Q13CA0W6EF6HY7HYJT2R	\N	zuri health	andrew	gagi	gg		nairobi	ca	kenya	333	0728278545	2024-03-01 13:02:03.838149+00	2024-03-01 13:02:12.710966+00	\N	\N
addr_01HQX1Q9RQF983Y91F7JA9F0VA	\N	zuri health	andrew	gagi	gg		nairobi	ca	kenya	333	0728278545	2024-03-01 13:02:12.710966+00	2024-03-01 13:02:12.710966+00	\N	\N
\.


--
-- Data for Name: analytics_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.analytics_config (id, created_at, updated_at, deleted_at, user_id, opt_out, anonymize) FROM stdin;
acfg_01HQN9AXTNM7E2W5XG68S7A6FN	2024-02-27 12:41:20.468222+00	2024-02-27 12:41:20.468222+00	\N	usr_01HQN83EF46BK291P9VGFCK0CN	f	f
\.


--
-- Data for Name: batch_job; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.batch_job (id, type, created_by, context, result, dry_run, created_at, pre_processed_at, confirmed_at, processing_at, completed_at, failed_at, canceled_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, email, billing_address_id, shipping_address_id, region_id, customer_id, payment_id, type, completed_at, created_at, updated_at, deleted_at, metadata, idempotency_key, context, payment_authorized_at, sales_channel_id) FROM stdin;
cart_01HQN9BK7DZ1KEMT9WV95EF08J	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:41:42.370888+00	2024-02-27 12:41:42.370888+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQN9DBEAX1SG2BHWYYESXM6M	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:42:39.93979+00	2024-02-27 12:42:39.93979+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQN9DFWKAJJQYH7298Z8ASXT	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:42:44.490053+00	2024-02-27 12:42:44.490053+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQN9GG5370YS2E2GB90A28HC	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:44:23.070117+00	2024-02-27 12:44:23.070117+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQN9GP64F9P5BH3HMC6XRZ49	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:44:29.245849+00	2024-02-27 12:44:29.245849+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQN9P69EDSCWKY75AWVV77F0	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:47:29.575239+00	2024-02-27 12:47:29.575239+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQN9PAN76JRHG57JMVQ4FN6H	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:47:34.050034+00	2024-02-27 12:47:34.050034+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQN9PNZNBT5576RTTKWSBXT7	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:47:45.646785+00	2024-02-27 12:47:45.646785+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQN9PSTDXPYET75ZB4VQT6XB	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:47:49.573046+00	2024-02-27 12:47:49.573046+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQN9SH31YACWAH41NJJXNJNV	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:49:18.938352+00	2024-02-27 12:49:18.938352+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQN9SR3GKBEWPVC18WSEP4XW	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:49:26.121443+00	2024-02-27 12:49:26.121443+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQN9WP07HXH62J93F5DCMQ1B	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:51:02.272156+00	2024-02-27 12:51:02.272156+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQN9WSWE709PZMS5M68MBFHN	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:51:06.245055+00	2024-02-27 12:51:06.245055+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQN9YS9FAF6NWP1J4DYYN8TN	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:52:11.177799+00	2024-02-27 12:52:11.177799+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQN9YY0ZHJRQSYG4DC7YDYK7	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:52:16.026702+00	2024-02-27 12:52:16.026702+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQNA0WG91XXZ9QY6ZQHDCRC6	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:53:20.001653+00	2024-02-27 12:53:20.001653+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQNA10JP61DPASE2FWZ9PFYX	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:53:24.177692+00	2024-02-27 12:53:24.177692+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQNA2Y751RY1021A5M6MNW2H	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:54:27.292045+00	2024-02-27 12:54:27.292045+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQNA31RHCA2TRY7SPDTPAS75	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 12:54:30.92297+00	2024-02-27 12:54:30.92297+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQNBZG0HEH1N0NQE0VJA1WVF	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 13:27:31.589021+00	2024-02-27 13:27:31.589021+00	\N	\N	\N	{"ip": "::1", "user_agent": "axios/0.24.0"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQND978CY8PERZRJ8ABHY20Z	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 13:50:18.882802+00	2024-02-27 13:50:18.882802+00	\N	\N	\N	{"ip": "::1", "user_agent": "axios/0.24.0"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQNHDHMS5HG9SSBSNQYWHWPP	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 15:02:34.893807+00	2024-02-27 15:02:34.893807+00	\N	\N	\N	{"ip": "::1", "user_agent": "axios/0.24.0"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQNHV32MRWE4GSDYTFPXM84H	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-27 15:09:58.730544+00	2024-02-27 15:09:58.730544+00	\N	\N	\N	{"ip": "::1", "user_agent": "axios/0.24.0"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQTD5V24H4X80A2MHFPR4V1F	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-29 12:24:40.249464+00	2024-02-29 12:24:40.249464+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQTD62BXYG0VCMN2E78T40CZ	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-29 12:24:47.734663+00	2024-02-29 12:24:47.734663+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQTDGJ26DFKFQHH7QTPM5C7Y	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-29 12:30:31.489757+00	2024-02-29 12:30:31.489757+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQTHSJ46HW4RW3Q2TA4Z9PYB	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-29 13:45:20.766554+00	2024-02-29 13:45:20.766554+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQTHSKZVABPFH3MP03BNGQDP	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-29 13:45:22.67737+00	2024-02-29 13:45:22.67737+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQTHSXA0881M1CXTWER2WPRV	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-29 13:45:32.217924+00	2024-02-29 13:45:32.217924+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQTHZX7YD0NHGDC78PG5SM44	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-29 13:48:48.761081+00	2024-02-29 13:48:48.761081+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQTHZXR681YXFTPCVEDQ9MT0	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-29 13:48:49.277377+00	2024-02-29 13:48:49.277377+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQTJ06HTCKJF43F7SS1HPWR4	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-29 13:48:58.294253+00	2024-02-29 13:48:58.294253+00	\N	\N	\N	{"ip": "::ffff:197.232.74.40", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQTWVBE0BEHGCXG37KNMA6ZA	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-29 16:58:33.78556+00	2024-02-29 16:58:33.78556+00	\N	\N	\N	{"ip": "::ffff:105.162.30.194", "user_agent": "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Mobile Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQTWVKDAR8VFT8ATEBC3Q4T5	\N	\N	\N	reg_01HQMZBJJ440Q50AAN9DGCKD4D	\N	\N	default	\N	2024-02-29 16:58:41.955388+00	2024-02-29 16:58:41.955388+00	\N	\N	\N	{"ip": "::ffff:105.162.30.194", "user_agent": "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Mobile Safari/537.36"}	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
cart_01HQTDG47YT72RAM8TAN51GQ6Q	gagidennis@gmail.com	addr_01HQX1Q9RQF983Y91F7JA9F0VA	addr_01HQX1Q13CA0W6EF6HY7HYJT2R	reg_01HQMZBJJ440Q50AAN9DGCKD4D	cus_01HQTDE4TVG9M3XFWJAQ2CG0TM	pay_01HQX1QPGZMWNQ0N3W85KCRMC2	default	2024-03-01 13:02:25.921+00	2024-02-29 12:30:17.327946+00	2024-03-01 13:02:25.83614+00	\N	\N	\N	{"ip": "::1", "user_agent": "axios/0.24.0"}	2024-03-01 13:02:25.826+00	sc_01HQMZBCGP5QQSTSA504EH8YRK
\.


--
-- Data for Name: cart_discounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_discounts (cart_id, discount_id) FROM stdin;
\.


--
-- Data for Name: cart_gift_cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_gift_cards (cart_id, gift_card_id) FROM stdin;
\.


--
-- Data for Name: claim_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.claim_image (id, claim_item_id, url, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: claim_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.claim_item (id, claim_order_id, item_id, variant_id, reason, note, quantity, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: claim_item_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.claim_item_tags (item_id, tag_id) FROM stdin;
\.


--
-- Data for Name: claim_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.claim_order (id, payment_status, fulfillment_status, type, order_id, shipping_address_id, refund_amount, canceled_at, created_at, updated_at, deleted_at, metadata, idempotency_key, no_notification) FROM stdin;
\.


--
-- Data for Name: claim_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.claim_tag (id, value, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, iso_2, iso_3, num_code, name, display_name, region_id) FROM stdin;
1	af	afg	4	AFGHANISTAN	Afghanistan	\N
2	al	alb	8	ALBANIA	Albania	\N
3	dz	dza	12	ALGERIA	Algeria	\N
4	as	asm	16	AMERICAN SAMOA	American Samoa	\N
5	ad	and	20	ANDORRA	Andorra	\N
6	ao	ago	24	ANGOLA	Angola	\N
7	ai	aia	660	ANGUILLA	Anguilla	\N
8	aq	ata	10	ANTARCTICA	Antarctica	\N
9	ag	atg	28	ANTIGUA AND BARBUDA	Antigua and Barbuda	\N
10	ar	arg	32	ARGENTINA	Argentina	\N
11	am	arm	51	ARMENIA	Armenia	\N
12	aw	abw	533	ARUBA	Aruba	\N
13	au	aus	36	AUSTRALIA	Australia	\N
14	at	aut	40	AUSTRIA	Austria	\N
15	az	aze	31	AZERBAIJAN	Azerbaijan	\N
16	bs	bhs	44	BAHAMAS	Bahamas	\N
17	bh	bhr	48	BAHRAIN	Bahrain	\N
18	bd	bgd	50	BANGLADESH	Bangladesh	\N
19	bb	brb	52	BARBADOS	Barbados	\N
20	by	blr	112	BELARUS	Belarus	\N
21	be	bel	56	BELGIUM	Belgium	\N
22	bz	blz	84	BELIZE	Belize	\N
23	bj	ben	204	BENIN	Benin	\N
24	bm	bmu	60	BERMUDA	Bermuda	\N
25	bt	btn	64	BHUTAN	Bhutan	\N
26	bo	bol	68	BOLIVIA	Bolivia	\N
27	bq	bes	535	BONAIRE, SINT EUSTATIUS AND SABA	Bonaire, Sint Eustatius and Saba	\N
28	ba	bih	70	BOSNIA AND HERZEGOVINA	Bosnia and Herzegovina	\N
29	bw	bwa	72	BOTSWANA	Botswana	\N
30	bv	bvd	74	BOUVET ISLAND	Bouvet Island	\N
31	br	bra	76	BRAZIL	Brazil	\N
32	io	iot	86	BRITISH INDIAN OCEAN TERRITORY	British Indian Ocean Territory	\N
33	bn	brn	96	BRUNEI DARUSSALAM	Brunei Darussalam	\N
34	bg	bgr	100	BULGARIA	Bulgaria	\N
35	bf	bfa	854	BURKINA FASO	Burkina Faso	\N
36	bi	bdi	108	BURUNDI	Burundi	\N
37	kh	khm	116	CAMBODIA	Cambodia	\N
38	cm	cmr	120	CAMEROON	Cameroon	\N
40	cv	cpv	132	CAPE VERDE	Cape Verde	\N
41	ky	cym	136	CAYMAN ISLANDS	Cayman Islands	\N
42	cf	caf	140	CENTRAL AFRICAN REPUBLIC	Central African Republic	\N
43	td	tcd	148	CHAD	Chad	\N
44	cl	chl	152	CHILE	Chile	\N
45	cn	chn	156	CHINA	China	\N
46	cx	cxr	162	CHRISTMAS ISLAND	Christmas Island	\N
47	cc	cck	166	COCOS (KEELING) ISLANDS	Cocos (Keeling) Islands	\N
48	co	col	170	COLOMBIA	Colombia	\N
49	km	com	174	COMOROS	Comoros	\N
50	cg	cog	178	CONGO	Congo	\N
51	cd	cod	180	CONGO, THE DEMOCRATIC REPUBLIC OF THE	Congo, the Democratic Republic of the	\N
52	ck	cok	184	COOK ISLANDS	Cook Islands	\N
53	cr	cri	188	COSTA RICA	Costa Rica	\N
54	ci	civ	384	COTE D'IVOIRE	Cote D'Ivoire	\N
55	hr	hrv	191	CROATIA	Croatia	\N
56	cu	cub	192	CUBA	Cuba	\N
57	cw	cuw	531	CURAÇAO	Curaçao	\N
58	cy	cyp	196	CYPRUS	Cyprus	\N
59	cz	cze	203	CZECH REPUBLIC	Czech Republic	\N
61	dj	dji	262	DJIBOUTI	Djibouti	\N
62	dm	dma	212	DOMINICA	Dominica	\N
63	do	dom	214	DOMINICAN REPUBLIC	Dominican Republic	\N
64	ec	ecu	218	ECUADOR	Ecuador	\N
65	eg	egy	818	EGYPT	Egypt	\N
66	sv	slv	222	EL SALVADOR	El Salvador	\N
67	gq	gnq	226	EQUATORIAL GUINEA	Equatorial Guinea	\N
68	er	eri	232	ERITREA	Eritrea	\N
69	ee	est	233	ESTONIA	Estonia	\N
70	et	eth	231	ETHIOPIA	Ethiopia	\N
71	fk	flk	238	FALKLAND ISLANDS (MALVINAS)	Falkland Islands (Malvinas)	\N
72	fo	fro	234	FAROE ISLANDS	Faroe Islands	\N
73	fj	fji	242	FIJI	Fiji	\N
74	fi	fin	246	FINLAND	Finland	\N
76	gf	guf	254	FRENCH GUIANA	French Guiana	\N
77	pf	pyf	258	FRENCH POLYNESIA	French Polynesia	\N
78	tf	atf	260	FRENCH SOUTHERN TERRITORIES	French Southern Territories	\N
79	ga	gab	266	GABON	Gabon	\N
80	gm	gmb	270	GAMBIA	Gambia	\N
81	ge	geo	268	GEORGIA	Georgia	\N
83	gh	gha	288	GHANA	Ghana	\N
84	gi	gib	292	GIBRALTAR	Gibraltar	\N
85	gr	grc	300	GREECE	Greece	\N
86	gl	grl	304	GREENLAND	Greenland	\N
87	gd	grd	308	GRENADA	Grenada	\N
88	gp	glp	312	GUADELOUPE	Guadeloupe	\N
89	gu	gum	316	GUAM	Guam	\N
90	gt	gtm	320	GUATEMALA	Guatemala	\N
91	gg	ggy	831	GUERNSEY	Guernsey	\N
92	gn	gin	324	GUINEA	Guinea	\N
93	gw	gnb	624	GUINEA-BISSAU	Guinea-Bissau	\N
94	gy	guy	328	GUYANA	Guyana	\N
95	ht	hti	332	HAITI	Haiti	\N
96	hm	hmd	334	HEARD ISLAND AND MCDONALD ISLANDS	Heard Island And Mcdonald Islands	\N
97	va	vat	336	HOLY SEE (VATICAN CITY STATE)	Holy See (Vatican City State)	\N
98	hn	hnd	340	HONDURAS	Honduras	\N
99	hk	hkg	344	HONG KONG	Hong Kong	\N
100	hu	hun	348	HUNGARY	Hungary	\N
101	is	isl	352	ICELAND	Iceland	\N
102	in	ind	356	INDIA	India	\N
103	id	idn	360	INDONESIA	Indonesia	\N
104	ir	irn	364	IRAN, ISLAMIC REPUBLIC OF	Iran, Islamic Republic of	\N
105	iq	irq	368	IRAQ	Iraq	\N
106	ie	irl	372	IRELAND	Ireland	\N
107	im	imn	833	ISLE OF MAN	Isle Of Man	\N
108	il	isr	376	ISRAEL	Israel	\N
110	jm	jam	388	JAMAICA	Jamaica	\N
111	jp	jpn	392	JAPAN	Japan	\N
112	je	jey	832	JERSEY	Jersey	\N
113	jo	jor	400	JORDAN	Jordan	\N
114	kz	kaz	398	KAZAKHSTAN	Kazakhstan	\N
115	ke	ken	404	KENYA	Kenya	\N
116	ki	kir	296	KIRIBATI	Kiribati	\N
117	kp	prk	408	KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF	Korea, Democratic People's Republic of	\N
118	kr	kor	410	KOREA, REPUBLIC OF	Korea, Republic of	\N
119	xk	xkx	900	KOSOVO	Kosovo	\N
120	kw	kwt	414	KUWAIT	Kuwait	\N
121	kg	kgz	417	KYRGYZSTAN	Kyrgyzstan	\N
122	la	lao	418	LAO PEOPLE'S DEMOCRATIC REPUBLIC	Lao People's Democratic Republic	\N
123	lv	lva	428	LATVIA	Latvia	\N
124	lb	lbn	422	LEBANON	Lebanon	\N
125	ls	lso	426	LESOTHO	Lesotho	\N
126	lr	lbr	430	LIBERIA	Liberia	\N
127	ly	lby	434	LIBYA	Libya	\N
128	li	lie	438	LIECHTENSTEIN	Liechtenstein	\N
129	lt	ltu	440	LITHUANIA	Lithuania	\N
130	lu	lux	442	LUXEMBOURG	Luxembourg	\N
131	mo	mac	446	MACAO	Macao	\N
132	mk	mkd	807	MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF	Macedonia, the Former Yugoslav Republic of	\N
133	mg	mdg	450	MADAGASCAR	Madagascar	\N
134	mw	mwi	454	MALAWI	Malawi	\N
135	my	mys	458	MALAYSIA	Malaysia	\N
136	mv	mdv	462	MALDIVES	Maldives	\N
137	ml	mli	466	MALI	Mali	\N
138	mt	mlt	470	MALTA	Malta	\N
139	mh	mhl	584	MARSHALL ISLANDS	Marshall Islands	\N
140	mq	mtq	474	MARTINIQUE	Martinique	\N
141	mr	mrt	478	MAURITANIA	Mauritania	\N
142	mu	mus	480	MAURITIUS	Mauritius	\N
143	yt	myt	175	MAYOTTE	Mayotte	\N
144	mx	mex	484	MEXICO	Mexico	\N
145	fm	fsm	583	MICRONESIA, FEDERATED STATES OF	Micronesia, Federated States of	\N
146	md	mda	498	MOLDOVA, REPUBLIC OF	Moldova, Republic of	\N
147	mc	mco	492	MONACO	Monaco	\N
148	mn	mng	496	MONGOLIA	Mongolia	\N
149	me	mne	499	MONTENEGRO	Montenegro	\N
150	ms	msr	500	MONTSERRAT	Montserrat	\N
151	ma	mar	504	MOROCCO	Morocco	\N
152	mz	moz	508	MOZAMBIQUE	Mozambique	\N
153	mm	mmr	104	MYANMAR	Myanmar	\N
154	na	nam	516	NAMIBIA	Namibia	\N
155	nr	nru	520	NAURU	Nauru	\N
156	np	npl	524	NEPAL	Nepal	\N
157	nl	nld	528	NETHERLANDS	Netherlands	\N
158	nc	ncl	540	NEW CALEDONIA	New Caledonia	\N
159	nz	nzl	554	NEW ZEALAND	New Zealand	\N
160	ni	nic	558	NICARAGUA	Nicaragua	\N
161	ne	ner	562	NIGER	Niger	\N
162	ng	nga	566	NIGERIA	Nigeria	\N
163	nu	niu	570	NIUE	Niue	\N
164	nf	nfk	574	NORFOLK ISLAND	Norfolk Island	\N
165	mp	mnp	580	NORTHERN MARIANA ISLANDS	Northern Mariana Islands	\N
166	no	nor	578	NORWAY	Norway	\N
167	om	omn	512	OMAN	Oman	\N
168	pk	pak	586	PAKISTAN	Pakistan	\N
169	pw	plw	585	PALAU	Palau	\N
170	ps	pse	275	PALESTINIAN TERRITORY, OCCUPIED	Palestinian Territory, Occupied	\N
171	pa	pan	591	PANAMA	Panama	\N
172	pg	png	598	PAPUA NEW GUINEA	Papua New Guinea	\N
173	py	pry	600	PARAGUAY	Paraguay	\N
174	pe	per	604	PERU	Peru	\N
175	ph	phl	608	PHILIPPINES	Philippines	\N
176	pn	pcn	612	PITCAIRN	Pitcairn	\N
177	pl	pol	616	POLAND	Poland	\N
178	pt	prt	620	PORTUGAL	Portugal	\N
179	pr	pri	630	PUERTO RICO	Puerto Rico	\N
180	qa	qat	634	QATAR	Qatar	\N
181	re	reu	638	REUNION	Reunion	\N
182	ro	rom	642	ROMANIA	Romania	\N
183	ru	rus	643	RUSSIAN FEDERATION	Russian Federation	\N
184	rw	rwa	646	RWANDA	Rwanda	\N
185	bl	blm	652	SAINT BARTHÉLEMY	Saint Barthélemy	\N
186	sh	shn	654	SAINT HELENA	Saint Helena	\N
187	kn	kna	659	SAINT KITTS AND NEVIS	Saint Kitts and Nevis	\N
188	lc	lca	662	SAINT LUCIA	Saint Lucia	\N
189	mf	maf	663	SAINT MARTIN (FRENCH PART)	Saint Martin (French part)	\N
190	pm	spm	666	SAINT PIERRE AND MIQUELON	Saint Pierre and Miquelon	\N
191	vc	vct	670	SAINT VINCENT AND THE GRENADINES	Saint Vincent and the Grenadines	\N
192	ws	wsm	882	SAMOA	Samoa	\N
193	sm	smr	674	SAN MARINO	San Marino	\N
194	st	stp	678	SAO TOME AND PRINCIPE	Sao Tome and Principe	\N
195	sa	sau	682	SAUDI ARABIA	Saudi Arabia	\N
196	sn	sen	686	SENEGAL	Senegal	\N
197	rs	srb	688	SERBIA	Serbia	\N
198	sc	syc	690	SEYCHELLES	Seychelles	\N
199	sl	sle	694	SIERRA LEONE	Sierra Leone	\N
200	sg	sgp	702	SINGAPORE	Singapore	\N
201	sx	sxm	534	SINT MAARTEN	Sint Maarten	\N
202	sk	svk	703	SLOVAKIA	Slovakia	\N
203	si	svn	705	SLOVENIA	Slovenia	\N
204	sb	slb	90	SOLOMON ISLANDS	Solomon Islands	\N
205	so	som	706	SOMALIA	Somalia	\N
206	za	zaf	710	SOUTH AFRICA	South Africa	\N
207	gs	sgs	239	SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS	South Georgia and the South Sandwich Islands	\N
208	ss	ssd	728	SOUTH SUDAN	South Sudan	\N
210	lk	lka	144	SRI LANKA	Sri Lanka	\N
211	sd	sdn	729	SUDAN	Sudan	\N
212	sr	sur	740	SURINAME	Suriname	\N
213	sj	sjm	744	SVALBARD AND JAN MAYEN	Svalbard and Jan Mayen	\N
214	sz	swz	748	SWAZILAND	Swaziland	\N
216	ch	che	756	SWITZERLAND	Switzerland	\N
217	sy	syr	760	SYRIAN ARAB REPUBLIC	Syrian Arab Republic	\N
218	tw	twn	158	TAIWAN, PROVINCE OF CHINA	Taiwan, Province of China	\N
219	tj	tjk	762	TAJIKISTAN	Tajikistan	\N
220	tz	tza	834	TANZANIA, UNITED REPUBLIC OF	Tanzania, United Republic of	\N
221	th	tha	764	THAILAND	Thailand	\N
222	tl	tls	626	TIMOR LESTE	Timor Leste	\N
223	tg	tgo	768	TOGO	Togo	\N
224	tk	tkl	772	TOKELAU	Tokelau	\N
225	to	ton	776	TONGA	Tonga	\N
226	tt	tto	780	TRINIDAD AND TOBAGO	Trinidad and Tobago	\N
227	tn	tun	788	TUNISIA	Tunisia	\N
228	tr	tur	792	TURKEY	Turkey	\N
229	tm	tkm	795	TURKMENISTAN	Turkmenistan	\N
230	tc	tca	796	TURKS AND CAICOS ISLANDS	Turks and Caicos Islands	\N
231	tv	tuv	798	TUVALU	Tuvalu	\N
232	ug	uga	800	UGANDA	Uganda	\N
233	ua	ukr	804	UKRAINE	Ukraine	\N
234	ae	are	784	UNITED ARAB EMIRATES	United Arab Emirates	\N
237	um	umi	581	UNITED STATES MINOR OUTLYING ISLANDS	United States Minor Outlying Islands	\N
238	uy	ury	858	URUGUAY	Uruguay	\N
239	uz	uzb	860	UZBEKISTAN	Uzbekistan	\N
240	vu	vut	548	VANUATU	Vanuatu	\N
241	ve	ven	862	VENEZUELA	Venezuela	\N
242	vn	vnm	704	VIET NAM	Viet Nam	\N
243	vg	vgb	92	VIRGIN ISLANDS, BRITISH	Virgin Islands, British	\N
244	vi	vir	850	VIRGIN ISLANDS, U.S.	Virgin Islands, U.S.	\N
245	wf	wlf	876	WALLIS AND FUTUNA	Wallis and Futuna	\N
246	eh	esh	732	WESTERN SAHARA	Western Sahara	\N
247	ye	yem	887	YEMEN	Yemen	\N
248	zm	zmb	894	ZAMBIA	Zambia	\N
249	zw	zwe	716	ZIMBABWE	Zimbabwe	\N
250	ax	ala	248	ÅLAND ISLANDS	Åland Islands	\N
235	gb	gbr	826	UNITED KINGDOM	United Kingdom	reg_01HQMZBJHC78ZNB7H2FX6DHRMZ
82	de	deu	276	GERMANY	Germany	reg_01HQMZBJHC78ZNB7H2FX6DHRMZ
60	dk	dnk	208	DENMARK	Denmark	reg_01HQMZBJHC78ZNB7H2FX6DHRMZ
215	se	swe	752	SWEDEN	Sweden	reg_01HQMZBJHC78ZNB7H2FX6DHRMZ
75	fr	fra	250	FRANCE	France	reg_01HQMZBJHC78ZNB7H2FX6DHRMZ
209	es	esp	724	SPAIN	Spain	reg_01HQMZBJHC78ZNB7H2FX6DHRMZ
109	it	ita	380	ITALY	Italy	reg_01HQMZBJHC78ZNB7H2FX6DHRMZ
236	us	usa	840	UNITED STATES	United States	reg_01HQMZBJJ440Q50AAN9DGCKD4D
39	ca	can	124	CANADA	Canada	reg_01HQMZBJJ440Q50AAN9DGCKD4D
\.


--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currency (code, symbol, symbol_native, name) FROM stdin;
usd	$	$	US Dollar
cad	CA$	$	Canadian Dollar
eur	€	€	Euro
aed	AED	د.إ.‏	United Arab Emirates Dirham
afn	Af	؋	Afghan Afghani
all	ALL	Lek	Albanian Lek
amd	AMD	դր.	Armenian Dram
ars	AR$	$	Argentine Peso
aud	AU$	$	Australian Dollar
azn	man.	ман.	Azerbaijani Manat
bam	KM	KM	Bosnia-Herzegovina Convertible Mark
bdt	Tk	৳	Bangladeshi Taka
bgn	BGN	лв.	Bulgarian Lev
bhd	BD	د.ب.‏	Bahraini Dinar
bif	FBu	FBu	Burundian Franc
bnd	BN$	$	Brunei Dollar
bob	Bs	Bs	Bolivian Boliviano
brl	R$	R$	Brazilian Real
bwp	BWP	P	Botswanan Pula
byn	Br	руб.	Belarusian Ruble
bzd	BZ$	$	Belize Dollar
cdf	CDF	FrCD	Congolese Franc
chf	CHF	CHF	Swiss Franc
clp	CL$	$	Chilean Peso
cny	CN¥	CN¥	Chinese Yuan
cop	CO$	$	Colombian Peso
crc	₡	₡	Costa Rican Colón
cve	CV$	CV$	Cape Verdean Escudo
czk	Kč	Kč	Czech Republic Koruna
djf	Fdj	Fdj	Djiboutian Franc
dkk	Dkr	kr	Danish Krone
dop	RD$	RD$	Dominican Peso
dzd	DA	د.ج.‏	Algerian Dinar
eek	Ekr	kr	Estonian Kroon
egp	EGP	ج.م.‏	Egyptian Pound
ern	Nfk	Nfk	Eritrean Nakfa
etb	Br	Br	Ethiopian Birr
gbp	£	£	British Pound Sterling
gel	GEL	GEL	Georgian Lari
ghs	GH₵	GH₵	Ghanaian Cedi
gnf	FG	FG	Guinean Franc
gtq	GTQ	Q	Guatemalan Quetzal
hkd	HK$	$	Hong Kong Dollar
hnl	HNL	L	Honduran Lempira
hrk	kn	kn	Croatian Kuna
huf	Ft	Ft	Hungarian Forint
idr	Rp	Rp	Indonesian Rupiah
ils	₪	₪	Israeli New Sheqel
inr	Rs	টকা	Indian Rupee
iqd	IQD	د.ع.‏	Iraqi Dinar
irr	IRR	﷼	Iranian Rial
isk	Ikr	kr	Icelandic Króna
jmd	J$	$	Jamaican Dollar
jod	JD	د.أ.‏	Jordanian Dinar
jpy	¥	￥	Japanese Yen
kes	Ksh	Ksh	Kenyan Shilling
khr	KHR	៛	Cambodian Riel
kmf	CF	FC	Comorian Franc
krw	₩	₩	South Korean Won
kwd	KD	د.ك.‏	Kuwaiti Dinar
kzt	KZT	тңг.	Kazakhstani Tenge
lbp	LB£	ل.ل.‏	Lebanese Pound
lkr	SLRs	SL Re	Sri Lankan Rupee
ltl	Lt	Lt	Lithuanian Litas
lvl	Ls	Ls	Latvian Lats
lyd	LD	د.ل.‏	Libyan Dinar
mad	MAD	د.م.‏	Moroccan Dirham
mdl	MDL	MDL	Moldovan Leu
mga	MGA	MGA	Malagasy Ariary
mkd	MKD	MKD	Macedonian Denar
mmk	MMK	K	Myanma Kyat
mnt	MNT	₮	Mongolian Tugrig
mop	MOP$	MOP$	Macanese Pataca
mur	MURs	MURs	Mauritian Rupee
mxn	MX$	$	Mexican Peso
myr	RM	RM	Malaysian Ringgit
mzn	MTn	MTn	Mozambican Metical
nad	N$	N$	Namibian Dollar
ngn	₦	₦	Nigerian Naira
nio	C$	C$	Nicaraguan Córdoba
nok	Nkr	kr	Norwegian Krone
npr	NPRs	नेरू	Nepalese Rupee
nzd	NZ$	$	New Zealand Dollar
omr	OMR	ر.ع.‏	Omani Rial
pab	B/.	B/.	Panamanian Balboa
pen	S/.	S/.	Peruvian Nuevo Sol
php	₱	₱	Philippine Peso
pkr	PKRs	₨	Pakistani Rupee
pln	zł	zł	Polish Zloty
pyg	₲	₲	Paraguayan Guarani
qar	QR	ر.ق.‏	Qatari Rial
ron	RON	RON	Romanian Leu
rsd	din.	дин.	Serbian Dinar
rub	RUB	₽.	Russian Ruble
rwf	RWF	FR	Rwandan Franc
sar	SR	ر.س.‏	Saudi Riyal
sdg	SDG	SDG	Sudanese Pound
sek	Skr	kr	Swedish Krona
sgd	S$	$	Singapore Dollar
sos	Ssh	Ssh	Somali Shilling
syp	SY£	ل.س.‏	Syrian Pound
thb	฿	฿	Thai Baht
tnd	DT	د.ت.‏	Tunisian Dinar
top	T$	T$	Tongan Paʻanga
try	TL	TL	Turkish Lira
ttd	TT$	$	Trinidad and Tobago Dollar
twd	NT$	NT$	New Taiwan Dollar
tzs	TSh	TSh	Tanzanian Shilling
uah	₴	₴	Ukrainian Hryvnia
ugx	USh	USh	Ugandan Shilling
uyu	$U	$	Uruguayan Peso
uzs	UZS	UZS	Uzbekistan Som
vef	Bs.F.	Bs.F.	Venezuelan Bolívar
vnd	₫	₫	Vietnamese Dong
xaf	FCFA	FCFA	CFA Franc BEAC
xof	CFA	CFA	CFA Franc BCEAO
yer	YR	ر.ي.‏	Yemeni Rial
zar	R	R	South African Rand
zmk	ZK	ZK	Zambian Kwacha
zwl	ZWL$	ZWL$	Zimbabwean Dollar
\.


--
-- Data for Name: custom_shipping_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custom_shipping_option (id, price, shipping_option_id, cart_id, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (id, email, first_name, last_name, billing_address_id, password_hash, phone, has_account, created_at, updated_at, deleted_at, metadata) FROM stdin;
cus_01HQTDE4TVG9M3XFWJAQ2CG0TM	gagidennis@gmail.com	andrew	gagi	\N	c2NyeXB0AAEAAAABAAAAAbVday/uYHoajunmlqxIiDXzP5ut5Bdwys0A3YFRTrzNcF2MoyenPO8uV9lQjKlrTvKfeBfDfF4qEaAlByFQOUKLG7I41uf2+fXbjompm9q3	0728278545	t	2024-02-29 12:29:12.403776+00	2024-02-29 12:29:12.403776+00	\N	\N
\.


--
-- Data for Name: customer_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_group (id, name, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: customer_group_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_group_customers (customer_group_id, customer_id) FROM stdin;
\.


--
-- Data for Name: discount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discount (id, code, is_dynamic, rule_id, is_disabled, parent_discount_id, starts_at, ends_at, created_at, updated_at, deleted_at, metadata, usage_limit, usage_count, valid_duration) FROM stdin;
\.


--
-- Data for Name: discount_condition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discount_condition (id, type, operator, discount_rule_id, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: discount_condition_customer_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discount_condition_customer_group (customer_group_id, condition_id, created_at, updated_at, metadata) FROM stdin;
\.


--
-- Data for Name: discount_condition_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discount_condition_product (product_id, condition_id, created_at, updated_at, metadata) FROM stdin;
\.


--
-- Data for Name: discount_condition_product_collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discount_condition_product_collection (product_collection_id, condition_id, created_at, updated_at, metadata) FROM stdin;
\.


--
-- Data for Name: discount_condition_product_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discount_condition_product_tag (product_tag_id, condition_id, created_at, updated_at, metadata) FROM stdin;
\.


--
-- Data for Name: discount_condition_product_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discount_condition_product_type (product_type_id, condition_id, created_at, updated_at, metadata) FROM stdin;
\.


--
-- Data for Name: discount_regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discount_regions (discount_id, region_id) FROM stdin;
\.


--
-- Data for Name: discount_rule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discount_rule (id, description, type, value, allocation, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: discount_rule_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discount_rule_products (discount_rule_id, product_id) FROM stdin;
\.


--
-- Data for Name: draft_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.draft_order (id, status, display_id, cart_id, order_id, canceled_at, created_at, updated_at, completed_at, metadata, idempotency_key, no_notification_order) FROM stdin;
\.


--
-- Data for Name: fulfillment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fulfillment (id, swap_id, order_id, tracking_numbers, data, shipped_at, canceled_at, created_at, updated_at, metadata, idempotency_key, provider_id, claim_order_id, no_notification, location_id) FROM stdin;
\.


--
-- Data for Name: fulfillment_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fulfillment_item (fulfillment_id, item_id, quantity) FROM stdin;
\.


--
-- Data for Name: fulfillment_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fulfillment_provider (id, is_installed) FROM stdin;
manual	t
\.


--
-- Data for Name: gift_card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gift_card (id, code, value, balance, region_id, order_id, is_disabled, ends_at, created_at, updated_at, deleted_at, metadata, tax_rate) FROM stdin;
\.


--
-- Data for Name: gift_card_transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gift_card_transaction (id, gift_card_id, order_id, amount, created_at, is_taxable, tax_rate) FROM stdin;
\.


--
-- Data for Name: idempotency_key; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.idempotency_key (id, idempotency_key, created_at, locked_at, request_method, request_params, request_path, response_code, response_body, recovery_point) FROM stdin;
ikey_01HQX1PSF3SCZDJWX6AWCDTJBQ	cac717bb-e842-4c91-92e3-a8c96a35488a	2024-03-01 13:01:56.063502+00	\N	POST	{"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q"}	/cart_01HQTDG47YT72RAM8TAN51GQ6Q/payment-sessions	200	{"cart": {"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "type": "default", "email": "gagidennis@gmail.com", "items": [{"id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ", "title": "tuesday shawarma", "total": 4150, "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "swap_id": null, "variant": {"id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "ean": null, "sku": null, "upc": null, "title": "S", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "title": "tuesday shawarma", "width": null, "handle": "tuesday-shawarma", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "tuesday shawarma", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": null, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:45:44.080Z", "description": "Reimagine the feeling of a classictuesday shawarma. With our tuesday shawarma, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "product_id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "updated_at": "2024-02-27T12:41:31.892Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 4150, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-29T12:30:17.412Z", "unit_price": 4150, "updated_at": "2024-02-29T12:30:17.412Z", "variant_id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "adjustments": [], "description": "S", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 4150, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 4150, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": {"id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "email": "gagidennis@gmail.com", "phone": "0728278545", "metadata": null, "last_name": "gagi", "created_at": "2024-02-29T12:29:12.403Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-02-29T12:29:12.403Z", "has_account": true, "billing_address_id": null}, "metadata": null, "subtotal": 4150, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-29T12:30:17.327Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-03-01T13:01:55.808Z", "customer_id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01HQTDG9W6YZGBYH7C9J78A7V6", "data": {"status": "pending"}, "amount": 4150, "status": "pending", "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "created_at": "2024-02-29T12:30:23.106Z", "updated_at": "2024-02-29T12:30:23.106Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01HQTDG9W6YZGBYH7C9J78A7V6", "data": {"status": "pending"}, "amount": 4150, "status": "pending", "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "created_at": "2024-02-29T12:30:23.106Z", "updated_at": "2024-02-29T12:30:23.106Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": null, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": null, "payment_authorized_at": null}}	finished
ikey_01HQNBZG2AGHZ1FMRNW5Y79H0E	27c24772-8098-40a3-8b9b-04a8105ede8f	2024-02-27 13:27:31.658381+00	\N	POST	{"id": "cart_01HQNBZG0HEH1N0NQE0VJA1WVF"}	/cart_01HQNBZG0HEH1N0NQE0VJA1WVF/line-items	200	{"cart": {"id": "cart_01HQNBZG0HEH1N0NQE0VJA1WVF", "type": "default", "email": null, "items": [{"id": "item_01HQNBZG3DAFKT783EA78T21FX", "title": "chicken-tikka", "total": 4150, "cart_id": "cart_01HQNBZG0HEH1N0NQE0VJA1WVF", "swap_id": null, "variant": {"id": "variant_01HQN9B90SF0HNC808ZAET08AP", "ean": null, "sku": null, "upc": null, "title": "M", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B8Y882R3TGZXFATCJ95D", "title": "chicken-tikka", "width": null, "handle": "chicken-tikka", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "chicken-tikka", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": null, "thumbnail": "http://localhost:9000/uploads/1709038177790-Grilled.jpeg", "created_at": "2024-02-27T12:41:31.781Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:50:47.911Z", "description": "Reimagine the feeling of a classic chicken-tikka With our chicken-tikka, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:31.781Z", "deleted_at": null, "product_id": "prod_01HQN9B8Y882R3TGZXFATCJ95D", "updated_at": "2024-02-27T12:41:31.781Z", "variant_rank": 1, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 4150, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQNBZG3DAFKT783EA78T21FX"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709038177790-Grilled.jpeg", "created_at": "2024-02-27T13:27:31.678Z", "unit_price": 4150, "updated_at": "2024-02-27T13:27:31.678Z", "variant_id": "variant_01HQN9B90SF0HNC808ZAET08AP", "adjustments": [], "description": "M", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 4150, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 4150, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": null, "metadata": null, "subtotal": 4150, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-27T13:27:31.589Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-02-27T13:27:31.589Z", "customer_id": null, "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_sessions": [], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": null, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": null, "payment_authorized_at": null}}	finished
ikey_01HQNC01YT9KXKK0MYZ35X6QG5	4ff29bca-c5d3-4cce-9982-9c2bc0b0ae7f	2024-02-27 13:27:49.976223+00	\N	POST	{"id": "cart_01HQNBZG0HEH1N0NQE0VJA1WVF"}	/cart_01HQNBZG0HEH1N0NQE0VJA1WVF/payment-sessions	200	{"cart": {"id": "cart_01HQNBZG0HEH1N0NQE0VJA1WVF", "type": "default", "email": null, "items": [{"id": "item_01HQNBZG3DAFKT783EA78T21FX", "title": "chicken-tikka", "total": 4150, "cart_id": "cart_01HQNBZG0HEH1N0NQE0VJA1WVF", "swap_id": null, "variant": {"id": "variant_01HQN9B90SF0HNC808ZAET08AP", "ean": null, "sku": null, "upc": null, "title": "M", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B8Y882R3TGZXFATCJ95D", "title": "chicken-tikka", "width": null, "handle": "chicken-tikka", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "chicken-tikka", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": null, "thumbnail": "http://localhost:9000/uploads/1709038177790-Grilled.jpeg", "created_at": "2024-02-27T12:41:31.781Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:50:47.911Z", "description": "Reimagine the feeling of a classic chicken-tikka With our chicken-tikka, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:31.781Z", "deleted_at": null, "product_id": "prod_01HQN9B8Y882R3TGZXFATCJ95D", "updated_at": "2024-02-27T12:41:31.781Z", "variant_rank": 1, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 4150, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQNBZG3DAFKT783EA78T21FX"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709038177790-Grilled.jpeg", "created_at": "2024-02-27T13:27:31.678Z", "unit_price": 4150, "updated_at": "2024-02-27T13:27:31.678Z", "variant_id": "variant_01HQN9B90SF0HNC808ZAET08AP", "adjustments": [], "description": "M", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 4150, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 4150, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": null, "metadata": null, "subtotal": 4150, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-27T13:27:31.589Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-02-27T13:27:31.589Z", "customer_id": null, "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01HQNC01ZT2QYMTAF0HKWM5310", "data": {"status": "pending"}, "amount": 4150, "status": "pending", "cart_id": "cart_01HQNBZG0HEH1N0NQE0VJA1WVF", "created_at": "2024-02-27T13:27:50.005Z", "updated_at": "2024-02-27T13:27:50.005Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01HQNC01ZT2QYMTAF0HKWM5310", "data": {"status": "pending"}, "amount": 4150, "status": "pending", "cart_id": "cart_01HQNBZG0HEH1N0NQE0VJA1WVF", "created_at": "2024-02-27T13:27:50.005Z", "updated_at": "2024-02-27T13:27:50.005Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": null, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": null, "payment_authorized_at": null}}	finished
ikey_01HQND97A6YNN1S9P30RB1EAAF	adf360c9-ba1e-4dbb-ae45-2b4d40f7a723	2024-02-27 13:50:18.949832+00	\N	POST	{"id": "cart_01HQND978CY8PERZRJ8ABHY20Z"}	/cart_01HQND978CY8PERZRJ8ABHY20Z/line-items	200	{"cart": {"id": "cart_01HQND978CY8PERZRJ8ABHY20Z", "type": "default", "email": null, "items": [{"id": "item_01HQND97BGGR3X2SGC83YXSEDW", "title": "classic burger", "total": 1200, "cart_id": "cart_01HQND978CY8PERZRJ8ABHY20Z", "swap_id": null, "variant": {"id": "variant_01HQN9B9ABYMQF4MBX9DR25MYS", "ean": null, "sku": null, "upc": null, "title": "One Size", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B99J8TX1YRTHZSG1EWSY", "title": "classic burger", "width": null, "handle": "classic-burger", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "100% sweetness", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": "very sweet", "thumbnail": "http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg", "created_at": "2024-02-27T12:41:32.199Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:44:16.931Z", "description": "Every programmer's best friend.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:32.199Z", "deleted_at": null, "product_id": "prod_01HQN9B99J8TX1YRTHZSG1EWSY", "updated_at": "2024-02-27T12:41:32.199Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 1200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQND97BGGR3X2SGC83YXSEDW"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg", "created_at": "2024-02-27T13:50:18.976Z", "unit_price": 1200, "updated_at": "2024-02-27T13:50:18.976Z", "variant_id": "variant_01HQN9B9ABYMQF4MBX9DR25MYS", "adjustments": [], "description": "One Size", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 1200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 1200, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": null, "metadata": null, "subtotal": 1200, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-27T13:50:18.882Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-02-27T13:50:18.882Z", "customer_id": null, "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_sessions": [], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": null, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": null, "payment_authorized_at": null}}	finished
ikey_01HQND9JNPKEM7MHW36KXMXXKZ	413c7e6b-8d7a-4d10-8b86-ef78d93decdb	2024-02-27 13:50:30.580365+00	\N	POST	{"id": "cart_01HQND978CY8PERZRJ8ABHY20Z"}	/cart_01HQND978CY8PERZRJ8ABHY20Z/payment-sessions	200	{"cart": {"id": "cart_01HQND978CY8PERZRJ8ABHY20Z", "type": "default", "email": null, "items": [{"id": "item_01HQND97BGGR3X2SGC83YXSEDW", "title": "classic burger", "total": 1200, "cart_id": "cart_01HQND978CY8PERZRJ8ABHY20Z", "swap_id": null, "variant": {"id": "variant_01HQN9B9ABYMQF4MBX9DR25MYS", "ean": null, "sku": null, "upc": null, "title": "One Size", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B99J8TX1YRTHZSG1EWSY", "title": "classic burger", "width": null, "handle": "classic-burger", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "100% sweetness", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": "very sweet", "thumbnail": "http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg", "created_at": "2024-02-27T12:41:32.199Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:44:16.931Z", "description": "Every programmer's best friend.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:32.199Z", "deleted_at": null, "product_id": "prod_01HQN9B99J8TX1YRTHZSG1EWSY", "updated_at": "2024-02-27T12:41:32.199Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 1200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQND97BGGR3X2SGC83YXSEDW"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg", "created_at": "2024-02-27T13:50:18.976Z", "unit_price": 1200, "updated_at": "2024-02-27T13:50:18.976Z", "variant_id": "variant_01HQN9B9ABYMQF4MBX9DR25MYS", "adjustments": [], "description": "One Size", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 1200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 1200, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": null, "metadata": null, "subtotal": 1200, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-27T13:50:18.882Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-02-27T13:50:18.882Z", "customer_id": null, "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01HQND9JPDNC9P8X7SFMECRKNH", "data": {"status": "pending"}, "amount": 1200, "status": "pending", "cart_id": "cart_01HQND978CY8PERZRJ8ABHY20Z", "created_at": "2024-02-27T13:50:30.601Z", "updated_at": "2024-02-27T13:50:30.601Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01HQND9JPDNC9P8X7SFMECRKNH", "data": {"status": "pending"}, "amount": 1200, "status": "pending", "cart_id": "cart_01HQND978CY8PERZRJ8ABHY20Z", "created_at": "2024-02-27T13:50:30.601Z", "updated_at": "2024-02-27T13:50:30.601Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": null, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": null, "payment_authorized_at": null}}	finished
ikey_01HQX1Q1AVNX85R169VNMAYTN4	2da8a41b-a4d9-49ca-800b-d4b3e94d8ea9	2024-03-01 13:02:04.121021+00	\N	POST	{"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q"}	/cart_01HQTDG47YT72RAM8TAN51GQ6Q/payment-sessions	200	{"cart": {"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "type": "default", "email": "gagidennis@gmail.com", "items": [{"id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ", "title": "tuesday shawarma", "total": 4150, "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "swap_id": null, "variant": {"id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "ean": null, "sku": null, "upc": null, "title": "S", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "title": "tuesday shawarma", "width": null, "handle": "tuesday-shawarma", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "tuesday shawarma", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": null, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:45:44.080Z", "description": "Reimagine the feeling of a classictuesday shawarma. With our tuesday shawarma, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "product_id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "updated_at": "2024-02-27T12:41:31.892Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 4150, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-29T12:30:17.412Z", "unit_price": 4150, "updated_at": "2024-02-29T12:30:17.412Z", "variant_id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "adjustments": [], "description": "S", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 4150, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 4150, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": {"id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "email": "gagidennis@gmail.com", "phone": "0728278545", "metadata": null, "last_name": "gagi", "created_at": "2024-02-29T12:29:12.403Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-02-29T12:29:12.403Z", "has_account": true, "billing_address_id": null}, "metadata": null, "subtotal": 4150, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-29T12:30:17.327Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-03-01T13:02:03.982Z", "customer_id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01HQTDG9W6YZGBYH7C9J78A7V6", "data": {"status": "pending"}, "amount": 4150, "status": "pending", "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "created_at": "2024-02-29T12:30:23.106Z", "updated_at": "2024-02-29T12:30:23.106Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01HQTDG9W6YZGBYH7C9J78A7V6", "data": {"status": "pending"}, "amount": 4150, "status": "pending", "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "created_at": "2024-02-29T12:30:23.106Z", "updated_at": "2024-02-29T12:30:23.106Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": {"id": "addr_01HQX1Q13CA0W6EF6HY7HYJT2R", "city": "nairobi", "phone": "0728278545", "company": "zuri health", "metadata": null, "province": "kenya", "address_1": "gg", "address_2": "emilia building", "last_name": "gagi", "created_at": "2024-03-01T13:02:03.838Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-03-01T13:02:03.838Z", "customer_id": null, "postal_code": "333", "country_code": "ca"}, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01HQX1Q13CA0W6EF6HY7HYJT2R", "payment_authorized_at": null}}	finished
ikey_01HQNHDHPGJ404FK84WWQ241KK	fcc2eac8-6df5-4134-871b-561ea88ad82a	2024-02-27 15:02:34.959957+00	\N	POST	{"id": "cart_01HQNHDHMS5HG9SSBSNQYWHWPP"}	/cart_01HQNHDHMS5HG9SSBSNQYWHWPP/line-items	200	{"cart": {"id": "cart_01HQNHDHMS5HG9SSBSNQYWHWPP", "type": "default", "email": null, "items": [{"id": "item_01HQNHDHQWFZSDJTVS6R77B27Z", "title": "classic burger", "total": 1200, "cart_id": "cart_01HQNHDHMS5HG9SSBSNQYWHWPP", "swap_id": null, "variant": {"id": "variant_01HQN9B9ABYMQF4MBX9DR25MYS", "ean": null, "sku": null, "upc": null, "title": "One Size", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B99J8TX1YRTHZSG1EWSY", "title": "classic burger", "width": null, "handle": "classic-burger", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "100% sweetness", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": "very sweet", "thumbnail": "http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg", "created_at": "2024-02-27T12:41:32.199Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:44:16.931Z", "description": "Every programmer's best friend.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:32.199Z", "deleted_at": null, "product_id": "prod_01HQN9B99J8TX1YRTHZSG1EWSY", "updated_at": "2024-02-27T12:41:32.199Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 1200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQNHDHQWFZSDJTVS6R77B27Z"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg", "created_at": "2024-02-27T15:02:34.984Z", "unit_price": 1200, "updated_at": "2024-02-27T15:02:34.984Z", "variant_id": "variant_01HQN9B9ABYMQF4MBX9DR25MYS", "adjustments": [], "description": "One Size", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 1200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 1200, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": null, "metadata": null, "subtotal": 1200, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-27T15:02:34.893Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-02-27T15:02:34.893Z", "customer_id": null, "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_sessions": [], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": null, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": null, "payment_authorized_at": null}}	finished
ikey_01HQNHV3530KSHRSZKT0G4W2XR	6f6841dc-18c8-4bdc-a262-c62ad737ceed	2024-02-27 15:09:58.819224+00	\N	POST	{"id": "cart_01HQNHV32MRWE4GSDYTFPXM84H"}	/cart_01HQNHV32MRWE4GSDYTFPXM84H/line-items	200	{"cart": {"id": "cart_01HQNHV32MRWE4GSDYTFPXM84H", "type": "default", "email": null, "items": [{"id": "item_01HQNHV36KY937PB5XK5XFT9PB", "title": "classic burger", "total": 1200, "cart_id": "cart_01HQNHV32MRWE4GSDYTFPXM84H", "swap_id": null, "variant": {"id": "variant_01HQN9B9ABYMQF4MBX9DR25MYS", "ean": null, "sku": null, "upc": null, "title": "One Size", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B99J8TX1YRTHZSG1EWSY", "title": "classic burger", "width": null, "handle": "classic-burger", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "100% sweetness", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": "very sweet", "thumbnail": "http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg", "created_at": "2024-02-27T12:41:32.199Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:44:16.931Z", "description": "Every programmer's best friend.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:32.199Z", "deleted_at": null, "product_id": "prod_01HQN9B99J8TX1YRTHZSG1EWSY", "updated_at": "2024-02-27T12:41:32.199Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 1200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQNHV36KY937PB5XK5XFT9PB"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg", "created_at": "2024-02-27T15:09:58.847Z", "unit_price": 1200, "updated_at": "2024-02-27T15:09:58.847Z", "variant_id": "variant_01HQN9B9ABYMQF4MBX9DR25MYS", "adjustments": [], "description": "One Size", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 1200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 1200, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": null, "metadata": null, "subtotal": 1200, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-27T15:09:58.730Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-02-27T15:09:58.730Z", "customer_id": null, "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_sessions": [], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": null, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": null, "payment_authorized_at": null}}	finished
ikey_01HQNHVNX425QFP304914RT20B	54e64d41-ffb0-40fc-b25c-ae09f154b590	2024-02-27 15:10:18.017825+00	\N	POST	{"id": "cart_01HQNHV32MRWE4GSDYTFPXM84H"}	/cart_01HQNHV32MRWE4GSDYTFPXM84H/payment-sessions	200	{"cart": {"id": "cart_01HQNHV32MRWE4GSDYTFPXM84H", "type": "default", "email": null, "items": [{"id": "item_01HQNHV36KY937PB5XK5XFT9PB", "title": "classic burger", "total": 1200, "cart_id": "cart_01HQNHV32MRWE4GSDYTFPXM84H", "swap_id": null, "variant": {"id": "variant_01HQN9B9ABYMQF4MBX9DR25MYS", "ean": null, "sku": null, "upc": null, "title": "One Size", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B99J8TX1YRTHZSG1EWSY", "title": "classic burger", "width": null, "handle": "classic-burger", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "100% sweetness", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": "very sweet", "thumbnail": "http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg", "created_at": "2024-02-27T12:41:32.199Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:44:16.931Z", "description": "Every programmer's best friend.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:32.199Z", "deleted_at": null, "product_id": "prod_01HQN9B99J8TX1YRTHZSG1EWSY", "updated_at": "2024-02-27T12:41:32.199Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 1200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQNHV36KY937PB5XK5XFT9PB"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg", "created_at": "2024-02-27T15:09:58.847Z", "unit_price": 1200, "updated_at": "2024-02-27T15:09:58.847Z", "variant_id": "variant_01HQN9B9ABYMQF4MBX9DR25MYS", "adjustments": [], "description": "One Size", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 1200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 1200, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": null, "metadata": null, "subtotal": 1200, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-27T15:09:58.730Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-02-27T15:09:58.730Z", "customer_id": null, "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01HQNHVNXZGDZXEMHN8X15C47H", "data": {"status": "pending"}, "amount": 1200, "status": "pending", "cart_id": "cart_01HQNHV32MRWE4GSDYTFPXM84H", "created_at": "2024-02-27T15:10:18.042Z", "updated_at": "2024-02-27T15:10:18.042Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01HQNHVNXZGDZXEMHN8X15C47H", "data": {"status": "pending"}, "amount": 1200, "status": "pending", "cart_id": "cart_01HQNHV32MRWE4GSDYTFPXM84H", "created_at": "2024-02-27T15:10:18.042Z", "updated_at": "2024-02-27T15:10:18.042Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": null, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": null, "payment_authorized_at": null}}	finished
ikey_01HQNHYMND4JJH2K3D5WKPTHT4	cb5399ae-a776-4195-96b9-733f351e816a	2024-02-27 15:11:55.051548+00	\N	POST	{"id": "cart_01HQNHDHMS5HG9SSBSNQYWHWPP"}	/cart_01HQNHDHMS5HG9SSBSNQYWHWPP/payment-sessions	200	{"cart": {"id": "cart_01HQNHDHMS5HG9SSBSNQYWHWPP", "type": "default", "email": null, "items": [{"id": "item_01HQNHDHQWFZSDJTVS6R77B27Z", "title": "classic burger", "total": 1200, "cart_id": "cart_01HQNHDHMS5HG9SSBSNQYWHWPP", "swap_id": null, "variant": {"id": "variant_01HQN9B9ABYMQF4MBX9DR25MYS", "ean": null, "sku": null, "upc": null, "title": "One Size", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B99J8TX1YRTHZSG1EWSY", "title": "classic burger", "width": null, "handle": "classic-burger", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "100% sweetness", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": "very sweet", "thumbnail": "http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg", "created_at": "2024-02-27T12:41:32.199Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:44:16.931Z", "description": "Every programmer's best friend.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:32.199Z", "deleted_at": null, "product_id": "prod_01HQN9B99J8TX1YRTHZSG1EWSY", "updated_at": "2024-02-27T12:41:32.199Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 1200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQNHDHQWFZSDJTVS6R77B27Z"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg", "created_at": "2024-02-27T15:02:34.984Z", "unit_price": 1200, "updated_at": "2024-02-27T15:02:34.984Z", "variant_id": "variant_01HQN9B9ABYMQF4MBX9DR25MYS", "adjustments": [], "description": "One Size", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 1200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 1200, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": null, "metadata": null, "subtotal": 1200, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-27T15:02:34.893Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-02-27T15:02:34.893Z", "customer_id": null, "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01HQNHYMP78R9P1DRR8A60VV5S", "data": {"status": "pending"}, "amount": 1200, "status": "pending", "cart_id": "cart_01HQNHDHMS5HG9SSBSNQYWHWPP", "created_at": "2024-02-27T15:11:55.077Z", "updated_at": "2024-02-27T15:11:55.077Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01HQNHYMP78R9P1DRR8A60VV5S", "data": {"status": "pending"}, "amount": 1200, "status": "pending", "cart_id": "cart_01HQNHDHMS5HG9SSBSNQYWHWPP", "created_at": "2024-02-27T15:11:55.077Z", "updated_at": "2024-02-27T15:11:55.077Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": null, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": null, "payment_authorized_at": null}}	finished
ikey_01HQNJS3V9XZH28CEW9ZZ5DEEV	45f3b7ab-a135-439f-ba0a-e09633baf112	2024-02-27 15:26:22.566552+00	\N	POST	{"id": "cart_01HQNHV32MRWE4GSDYTFPXM84H"}	/cart_01HQNHV32MRWE4GSDYTFPXM84H/payment-sessions	200	{"cart": {"id": "cart_01HQNHV32MRWE4GSDYTFPXM84H", "type": "default", "email": null, "items": [{"id": "item_01HQNHV36KY937PB5XK5XFT9PB", "title": "classic burger", "total": 1200, "cart_id": "cart_01HQNHV32MRWE4GSDYTFPXM84H", "swap_id": null, "variant": {"id": "variant_01HQN9B9ABYMQF4MBX9DR25MYS", "ean": null, "sku": null, "upc": null, "title": "One Size", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B99J8TX1YRTHZSG1EWSY", "title": "classic burger", "width": null, "handle": "classic-burger", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "100% sweetness", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": "very sweet", "thumbnail": "http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg", "created_at": "2024-02-27T12:41:32.199Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:44:16.931Z", "description": "Every programmer's best friend.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:32.199Z", "deleted_at": null, "product_id": "prod_01HQN9B99J8TX1YRTHZSG1EWSY", "updated_at": "2024-02-27T12:41:32.199Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 1200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQNHV36KY937PB5XK5XFT9PB"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg", "created_at": "2024-02-27T15:09:58.847Z", "unit_price": 1200, "updated_at": "2024-02-27T15:09:58.847Z", "variant_id": "variant_01HQN9B9ABYMQF4MBX9DR25MYS", "adjustments": [], "description": "One Size", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 1200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 1200, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": null, "metadata": null, "subtotal": 1200, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-27T15:09:58.730Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-02-27T15:09:58.730Z", "customer_id": null, "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01HQNHVNXZGDZXEMHN8X15C47H", "data": {"status": "pending"}, "amount": 1200, "status": "pending", "cart_id": "cart_01HQNHV32MRWE4GSDYTFPXM84H", "created_at": "2024-02-27T15:10:18.042Z", "updated_at": "2024-02-27T15:10:18.042Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01HQNHVNXZGDZXEMHN8X15C47H", "data": {"status": "pending"}, "amount": 1200, "status": "pending", "cart_id": "cart_01HQNHV32MRWE4GSDYTFPXM84H", "created_at": "2024-02-27T15:10:18.042Z", "updated_at": "2024-02-27T15:10:18.042Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": null, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": null, "payment_authorized_at": null}}	finished
ikey_01HQNJS5Y6K04H4235WP224BTS	943a554b-0902-4105-86f0-41be8c09e297	2024-02-27 15:26:24.70854+00	\N	POST	{"id": "cart_01HQNHV32MRWE4GSDYTFPXM84H"}	/cart_01HQNHV32MRWE4GSDYTFPXM84H/payment-sessions	200	{"cart": {"id": "cart_01HQNHV32MRWE4GSDYTFPXM84H", "type": "default", "email": null, "items": [{"id": "item_01HQNHV36KY937PB5XK5XFT9PB", "title": "classic burger", "total": 1200, "cart_id": "cart_01HQNHV32MRWE4GSDYTFPXM84H", "swap_id": null, "variant": {"id": "variant_01HQN9B9ABYMQF4MBX9DR25MYS", "ean": null, "sku": null, "upc": null, "title": "One Size", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B99J8TX1YRTHZSG1EWSY", "title": "classic burger", "width": null, "handle": "classic-burger", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "100% sweetness", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": "very sweet", "thumbnail": "http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg", "created_at": "2024-02-27T12:41:32.199Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:44:16.931Z", "description": "Every programmer's best friend.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:32.199Z", "deleted_at": null, "product_id": "prod_01HQN9B99J8TX1YRTHZSG1EWSY", "updated_at": "2024-02-27T12:41:32.199Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 1200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQNHV36KY937PB5XK5XFT9PB"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg", "created_at": "2024-02-27T15:09:58.847Z", "unit_price": 1200, "updated_at": "2024-02-27T15:09:58.847Z", "variant_id": "variant_01HQN9B9ABYMQF4MBX9DR25MYS", "adjustments": [], "description": "One Size", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 1200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 1200, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": null, "metadata": null, "subtotal": 1200, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-27T15:09:58.730Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-02-27T15:09:58.730Z", "customer_id": null, "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01HQNHVNXZGDZXEMHN8X15C47H", "data": {"status": "pending"}, "amount": 1200, "status": "pending", "cart_id": "cart_01HQNHV32MRWE4GSDYTFPXM84H", "created_at": "2024-02-27T15:10:18.042Z", "updated_at": "2024-02-27T15:10:18.042Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01HQNHVNXZGDZXEMHN8X15C47H", "data": {"status": "pending"}, "amount": 1200, "status": "pending", "cart_id": "cart_01HQNHV32MRWE4GSDYTFPXM84H", "created_at": "2024-02-27T15:10:18.042Z", "updated_at": "2024-02-27T15:10:18.042Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": null, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": null, "payment_authorized_at": null}}	finished
ikey_01HQNJS85V3WQ3HGSFXZ7EF9SE	ff1aba01-5182-4aaa-9ef6-37de5b7adb10	2024-02-27 15:26:27.001307+00	\N	POST	{"id": "cart_01HQNHV32MRWE4GSDYTFPXM84H"}	/cart_01HQNHV32MRWE4GSDYTFPXM84H/payment-sessions	200	{"cart": {"id": "cart_01HQNHV32MRWE4GSDYTFPXM84H", "type": "default", "email": null, "items": [{"id": "item_01HQNHV36KY937PB5XK5XFT9PB", "title": "classic burger", "total": 1200, "cart_id": "cart_01HQNHV32MRWE4GSDYTFPXM84H", "swap_id": null, "variant": {"id": "variant_01HQN9B9ABYMQF4MBX9DR25MYS", "ean": null, "sku": null, "upc": null, "title": "One Size", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B99J8TX1YRTHZSG1EWSY", "title": "classic burger", "width": null, "handle": "classic-burger", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "100% sweetness", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": "very sweet", "thumbnail": "http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg", "created_at": "2024-02-27T12:41:32.199Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:44:16.931Z", "description": "Every programmer's best friend.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:32.199Z", "deleted_at": null, "product_id": "prod_01HQN9B99J8TX1YRTHZSG1EWSY", "updated_at": "2024-02-27T12:41:32.199Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 1200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQNHV36KY937PB5XK5XFT9PB"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg", "created_at": "2024-02-27T15:09:58.847Z", "unit_price": 1200, "updated_at": "2024-02-27T15:09:58.847Z", "variant_id": "variant_01HQN9B9ABYMQF4MBX9DR25MYS", "adjustments": [], "description": "One Size", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 1200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 1200, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": null, "metadata": null, "subtotal": 1200, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-27T15:09:58.730Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-02-27T15:09:58.730Z", "customer_id": null, "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01HQNHVNXZGDZXEMHN8X15C47H", "data": {"status": "pending"}, "amount": 1200, "status": "pending", "cart_id": "cart_01HQNHV32MRWE4GSDYTFPXM84H", "created_at": "2024-02-27T15:10:18.042Z", "updated_at": "2024-02-27T15:10:18.042Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01HQNHVNXZGDZXEMHN8X15C47H", "data": {"status": "pending"}, "amount": 1200, "status": "pending", "cart_id": "cart_01HQNHV32MRWE4GSDYTFPXM84H", "created_at": "2024-02-27T15:10:18.042Z", "updated_at": "2024-02-27T15:10:18.042Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": null, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": null, "payment_authorized_at": null}}	finished
ikey_01HQX1Q9ZS8MYXTPMECR2Y1FY4	54e613af-8f72-48de-9151-39692dabead0	2024-03-01 13:02:12.976757+00	\N	POST	{"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q"}	/cart_01HQTDG47YT72RAM8TAN51GQ6Q/payment-sessions	200	{"cart": {"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "type": "default", "email": "gagidennis@gmail.com", "items": [{"id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ", "title": "tuesday shawarma", "total": 4150, "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "swap_id": null, "variant": {"id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "ean": null, "sku": null, "upc": null, "title": "S", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "title": "tuesday shawarma", "width": null, "handle": "tuesday-shawarma", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "tuesday shawarma", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": null, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:45:44.080Z", "description": "Reimagine the feeling of a classictuesday shawarma. With our tuesday shawarma, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "product_id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "updated_at": "2024-02-27T12:41:31.892Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 4150, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-29T12:30:17.412Z", "unit_price": 4150, "updated_at": "2024-02-29T12:30:17.412Z", "variant_id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "adjustments": [], "description": "S", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 4150, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 4150, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": {"id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "email": "gagidennis@gmail.com", "phone": "0728278545", "metadata": null, "last_name": "gagi", "created_at": "2024-02-29T12:29:12.403Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-02-29T12:29:12.403Z", "has_account": true, "billing_address_id": null}, "metadata": null, "subtotal": 4150, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-29T12:30:17.327Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-03-01T13:02:12.710Z", "customer_id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": {"id": "addr_01HQX1Q9RQF983Y91F7JA9F0VA", "city": "nairobi", "phone": "0728278545", "company": "zuri health", "metadata": null, "province": "kenya", "address_1": "gg", "address_2": "", "last_name": "gagi", "created_at": "2024-03-01T13:02:12.710Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-03-01T13:02:12.710Z", "customer_id": null, "postal_code": "333", "country_code": "ca"}, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01HQTDG9W6YZGBYH7C9J78A7V6", "data": {"status": "pending"}, "amount": 4150, "status": "pending", "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "created_at": "2024-02-29T12:30:23.106Z", "updated_at": "2024-02-29T12:30:23.106Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01HQTDG9W6YZGBYH7C9J78A7V6", "data": {"status": "pending"}, "amount": 4150, "status": "pending", "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "created_at": "2024-02-29T12:30:23.106Z", "updated_at": "2024-02-29T12:30:23.106Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": {"id": "addr_01HQX1Q13CA0W6EF6HY7HYJT2R", "city": "nairobi", "phone": "0728278545", "company": "zuri health", "metadata": null, "province": "kenya", "address_1": "gg", "address_2": "", "last_name": "gagi", "created_at": "2024-03-01T13:02:03.838Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-03-01T13:02:12.710Z", "customer_id": null, "postal_code": "333", "country_code": "ca"}, "shipping_methods": [], "billing_address_id": "addr_01HQX1Q9RQF983Y91F7JA9F0VA", "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01HQX1Q13CA0W6EF6HY7HYJT2R", "payment_authorized_at": null}}	finished
ikey_01HQTDG49HQ41ZSW62Y1ANH20X	c77d1419-a4c1-4335-be09-7d44962d711a	2024-02-29 12:30:17.393559+00	\N	POST	{"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q"}	/cart_01HQTDG47YT72RAM8TAN51GQ6Q/line-items	200	{"cart": {"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "type": "default", "email": "gagidennis@gmail.com", "items": [{"id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ", "title": "tuesday shawarma", "total": 4150, "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "swap_id": null, "variant": {"id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "ean": null, "sku": null, "upc": null, "title": "S", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "title": "tuesday shawarma", "width": null, "handle": "tuesday-shawarma", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "tuesday shawarma", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": null, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:45:44.080Z", "description": "Reimagine the feeling of a classictuesday shawarma. With our tuesday shawarma, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "product_id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "updated_at": "2024-02-27T12:41:31.892Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 4150, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-29T12:30:17.412Z", "unit_price": 4150, "updated_at": "2024-02-29T12:30:17.412Z", "variant_id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "adjustments": [], "description": "S", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 4150, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 4150, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": {"id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "email": "gagidennis@gmail.com", "phone": "0728278545", "metadata": null, "last_name": "gagi", "created_at": "2024-02-29T12:29:12.403Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-02-29T12:29:12.403Z", "has_account": true, "billing_address_id": null}, "metadata": null, "subtotal": 4150, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-29T12:30:17.327Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-02-29T12:30:17.327Z", "customer_id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_sessions": [], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": null, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": null, "payment_authorized_at": null}}	finished
ikey_01HQTDG9VEP50ZKJ2PVFTA5B2Z	0beff467-9d2e-4d2e-ad6f-fff044906642	2024-02-29 12:30:23.084169+00	\N	POST	{"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q"}	/cart_01HQTDG47YT72RAM8TAN51GQ6Q/payment-sessions	200	{"cart": {"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "type": "default", "email": "gagidennis@gmail.com", "items": [{"id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ", "title": "tuesday shawarma", "total": 4150, "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "swap_id": null, "variant": {"id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "ean": null, "sku": null, "upc": null, "title": "S", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "title": "tuesday shawarma", "width": null, "handle": "tuesday-shawarma", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "tuesday shawarma", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": null, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:45:44.080Z", "description": "Reimagine the feeling of a classictuesday shawarma. With our tuesday shawarma, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "product_id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "updated_at": "2024-02-27T12:41:31.892Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 4150, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-29T12:30:17.412Z", "unit_price": 4150, "updated_at": "2024-02-29T12:30:17.412Z", "variant_id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "adjustments": [], "description": "S", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 4150, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 4150, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": {"id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "email": "gagidennis@gmail.com", "phone": "0728278545", "metadata": null, "last_name": "gagi", "created_at": "2024-02-29T12:29:12.403Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-02-29T12:29:12.403Z", "has_account": true, "billing_address_id": null}, "metadata": null, "subtotal": 4150, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-29T12:30:17.327Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-02-29T12:30:22.991Z", "customer_id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01HQTDG9W6YZGBYH7C9J78A7V6", "data": {"status": "pending"}, "amount": 4150, "status": "pending", "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "created_at": "2024-02-29T12:30:23.106Z", "updated_at": "2024-02-29T12:30:23.106Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01HQTDG9W6YZGBYH7C9J78A7V6", "data": {"status": "pending"}, "amount": 4150, "status": "pending", "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "created_at": "2024-02-29T12:30:23.106Z", "updated_at": "2024-02-29T12:30:23.106Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": null, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": null, "payment_authorized_at": null}}	finished
ikey_01HQX1QA28ZWJAXZ3SHCTDRQFK	e110b096-3959-41db-863a-9a746c06a267	2024-03-01 13:02:13.063018+00	\N	POST	{"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q"}	/cart_01HQTDG47YT72RAM8TAN51GQ6Q/payment-sessions	200	{"cart": {"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "type": "default", "email": "gagidennis@gmail.com", "items": [{"id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ", "title": "tuesday shawarma", "total": 4150, "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "swap_id": null, "variant": {"id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "ean": null, "sku": null, "upc": null, "title": "S", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "title": "tuesday shawarma", "width": null, "handle": "tuesday-shawarma", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "tuesday shawarma", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": null, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:45:44.080Z", "description": "Reimagine the feeling of a classictuesday shawarma. With our tuesday shawarma, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "product_id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "updated_at": "2024-02-27T12:41:31.892Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 4150, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-29T12:30:17.412Z", "unit_price": 4150, "updated_at": "2024-02-29T12:30:17.412Z", "variant_id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "adjustments": [], "description": "S", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 4150, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 4150, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": {"id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "email": "gagidennis@gmail.com", "phone": "0728278545", "metadata": null, "last_name": "gagi", "created_at": "2024-02-29T12:29:12.403Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-02-29T12:29:12.403Z", "has_account": true, "billing_address_id": null}, "metadata": null, "subtotal": 4150, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-29T12:30:17.327Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-03-01T13:02:12.710Z", "customer_id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": {"id": "addr_01HQX1Q9RQF983Y91F7JA9F0VA", "city": "nairobi", "phone": "0728278545", "company": "zuri health", "metadata": null, "province": "kenya", "address_1": "gg", "address_2": "", "last_name": "gagi", "created_at": "2024-03-01T13:02:12.710Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-03-01T13:02:12.710Z", "customer_id": null, "postal_code": "333", "country_code": "ca"}, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01HQTDG9W6YZGBYH7C9J78A7V6", "data": {"status": "pending"}, "amount": 4150, "status": "pending", "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "created_at": "2024-02-29T12:30:23.106Z", "updated_at": "2024-02-29T12:30:23.106Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01HQTDG9W6YZGBYH7C9J78A7V6", "data": {"status": "pending"}, "amount": 4150, "status": "pending", "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "created_at": "2024-02-29T12:30:23.106Z", "updated_at": "2024-02-29T12:30:23.106Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": {"id": "addr_01HQX1Q13CA0W6EF6HY7HYJT2R", "city": "nairobi", "phone": "0728278545", "company": "zuri health", "metadata": null, "province": "kenya", "address_1": "gg", "address_2": "", "last_name": "gagi", "created_at": "2024-03-01T13:02:03.838Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-03-01T13:02:12.710Z", "customer_id": null, "postal_code": "333", "country_code": "ca"}, "shipping_methods": [], "billing_address_id": "addr_01HQX1Q9RQF983Y91F7JA9F0VA", "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01HQX1Q13CA0W6EF6HY7HYJT2R", "payment_authorized_at": null}}	finished
ikey_01HQX1QFMGJ1K27F23ESNSHG2Q	a26dae74-a3e5-4b60-9279-3bcfc8d4b3f1	2024-03-01 13:02:18.765485+00	\N	POST	{"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q"}	/cart_01HQTDG47YT72RAM8TAN51GQ6Q/payment-sessions	200	{"cart": {"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "type": "default", "email": "gagidennis@gmail.com", "items": [{"id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ", "title": "tuesday shawarma", "total": 4150, "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "swap_id": null, "variant": {"id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "ean": null, "sku": null, "upc": null, "title": "S", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "title": "tuesday shawarma", "width": null, "handle": "tuesday-shawarma", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "tuesday shawarma", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": null, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:45:44.080Z", "description": "Reimagine the feeling of a classictuesday shawarma. With our tuesday shawarma, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "product_id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "updated_at": "2024-02-27T12:41:31.892Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 4150, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-29T12:30:17.412Z", "unit_price": 4150, "updated_at": "2024-03-01T13:02:18.615Z", "variant_id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "adjustments": [], "description": "S", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 4150, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 4950, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": {"id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "email": "gagidennis@gmail.com", "phone": "0728278545", "metadata": null, "last_name": "gagi", "created_at": "2024-02-29T12:29:12.403Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-02-29T12:29:12.403Z", "has_account": true, "billing_address_id": null}, "metadata": null, "subtotal": 4150, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-29T12:30:17.327Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-03-01T13:02:12.710Z", "customer_id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 800, "billing_address": {"id": "addr_01HQX1Q9RQF983Y91F7JA9F0VA", "city": "nairobi", "phone": "0728278545", "company": "zuri health", "metadata": null, "province": "kenya", "address_1": "gg", "address_2": "", "last_name": "gagi", "created_at": "2024-03-01T13:02:12.710Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-03-01T13:02:12.710Z", "customer_id": null, "postal_code": "333", "country_code": "ca"}, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01HQTDG9W6YZGBYH7C9J78A7V6", "data": {"status": "pending"}, "amount": 4950, "status": "pending", "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "created_at": "2024-02-29T12:30:23.106Z", "updated_at": "2024-03-01T13:02:18.492Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01HQTDG9W6YZGBYH7C9J78A7V6", "data": {"status": "pending"}, "amount": 4950, "status": "pending", "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "created_at": "2024-02-29T12:30:23.106Z", "updated_at": "2024-03-01T13:02:18.492Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": {"id": "addr_01HQX1Q13CA0W6EF6HY7HYJT2R", "city": "nairobi", "phone": "0728278545", "company": "zuri health", "metadata": null, "province": "kenya", "address_1": "gg", "address_2": "", "last_name": "gagi", "created_at": "2024-03-01T13:02:03.838Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-03-01T13:02:12.710Z", "customer_id": null, "postal_code": "333", "country_code": "ca"}, "shipping_methods": [{"id": "sm_01HQX1QFCTP7PGDN9YSV8YR660", "data": {}, "price": 800, "total": 800, "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "swap_id": null, "order_id": null, "subtotal": 800, "return_id": null, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "shipping_method_id": "sm_01HQX1QFCTP7PGDN9YSV8YR660"}], "tax_total": 0, "claim_order_id": null, "original_total": 800, "shipping_option": {"id": "so_01HQMZBJKD5AW5BMRB2QQEQ4GE", "data": {"id": "manual-fulfillment"}, "name": "FakeEx Standard", "amount": 800, "metadata": null, "is_return": false, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "admin_only": false, "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "price_type": "flat_rate", "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T09:46:55.818Z", "provider_id": "manual"}, "original_tax_total": 0, "shipping_option_id": "so_01HQMZBJKD5AW5BMRB2QQEQ4GE"}], "billing_address_id": "addr_01HQX1Q9RQF983Y91F7JA9F0VA", "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01HQX1Q13CA0W6EF6HY7HYJT2R", "payment_authorized_at": null}}	finished
ikey_01HQX1QH88CM6XGB1X9REBBB2S	88fda8de-5f2c-444f-8255-f10cb2a1d765	2024-03-01 13:02:20.421701+00	\N	POST	{"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q"}	/cart_01HQTDG47YT72RAM8TAN51GQ6Q/payment-sessions	200	{"cart": {"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "type": "default", "email": "gagidennis@gmail.com", "items": [{"id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ", "title": "tuesday shawarma", "total": 4150, "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "swap_id": null, "variant": {"id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "ean": null, "sku": null, "upc": null, "title": "S", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "title": "tuesday shawarma", "width": null, "handle": "tuesday-shawarma", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "tuesday shawarma", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": null, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:45:44.080Z", "description": "Reimagine the feeling of a classictuesday shawarma. With our tuesday shawarma, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "product_id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "updated_at": "2024-02-27T12:41:31.892Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 4150, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-29T12:30:17.412Z", "unit_price": 4150, "updated_at": "2024-03-01T13:02:18.615Z", "variant_id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "adjustments": [], "description": "S", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 4150, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 4950, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": {"id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "email": "gagidennis@gmail.com", "phone": "0728278545", "metadata": null, "last_name": "gagi", "created_at": "2024-02-29T12:29:12.403Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-02-29T12:29:12.403Z", "has_account": true, "billing_address_id": null}, "metadata": null, "subtotal": 4150, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-29T12:30:17.327Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-03-01T13:02:12.710Z", "customer_id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 800, "billing_address": {"id": "addr_01HQX1Q9RQF983Y91F7JA9F0VA", "city": "nairobi", "phone": "0728278545", "company": "zuri health", "metadata": null, "province": "kenya", "address_1": "gg", "address_2": "", "last_name": "gagi", "created_at": "2024-03-01T13:02:12.710Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-03-01T13:02:12.710Z", "customer_id": null, "postal_code": "333", "country_code": "ca"}, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01HQTDG9W6YZGBYH7C9J78A7V6", "data": {"status": "pending"}, "amount": 4950, "status": "pending", "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "created_at": "2024-02-29T12:30:23.106Z", "updated_at": "2024-03-01T13:02:18.492Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01HQTDG9W6YZGBYH7C9J78A7V6", "data": {"status": "pending"}, "amount": 4950, "status": "pending", "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "created_at": "2024-02-29T12:30:23.106Z", "updated_at": "2024-03-01T13:02:18.492Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": {"id": "addr_01HQX1Q13CA0W6EF6HY7HYJT2R", "city": "nairobi", "phone": "0728278545", "company": "zuri health", "metadata": null, "province": "kenya", "address_1": "gg", "address_2": "", "last_name": "gagi", "created_at": "2024-03-01T13:02:03.838Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-03-01T13:02:12.710Z", "customer_id": null, "postal_code": "333", "country_code": "ca"}, "shipping_methods": [{"id": "sm_01HQX1QFCTP7PGDN9YSV8YR660", "data": {}, "price": 800, "total": 800, "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "swap_id": null, "order_id": null, "subtotal": 800, "return_id": null, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "shipping_method_id": "sm_01HQX1QFCTP7PGDN9YSV8YR660"}], "tax_total": 0, "claim_order_id": null, "original_total": 800, "shipping_option": {"id": "so_01HQMZBJKD5AW5BMRB2QQEQ4GE", "data": {"id": "manual-fulfillment"}, "name": "FakeEx Standard", "amount": 800, "metadata": null, "is_return": false, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "admin_only": false, "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "price_type": "flat_rate", "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T09:46:55.818Z", "provider_id": "manual"}, "original_tax_total": 0, "shipping_option_id": "so_01HQMZBJKD5AW5BMRB2QQEQ4GE"}], "billing_address_id": "addr_01HQX1Q9RQF983Y91F7JA9F0VA", "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01HQX1Q13CA0W6EF6HY7HYJT2R", "payment_authorized_at": null}}	finished
ikey_01HQX1QKG3A5QD02RE2XZ80F8D	d29cf43c-f2ec-422a-839f-4223560acb92	2024-03-01 13:02:22.722139+00	\N	POST	{"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q"}	/cart_01HQTDG47YT72RAM8TAN51GQ6Q/payment-sessions	200	{"cart": {"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "type": "default", "email": "gagidennis@gmail.com", "items": [{"id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ", "title": "tuesday shawarma", "total": 4150, "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "swap_id": null, "variant": {"id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "ean": null, "sku": null, "upc": null, "title": "S", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "title": "tuesday shawarma", "width": null, "handle": "tuesday-shawarma", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}, "type_id": null, "material": "tuesday shawarma", "metadata": {}, "mid_code": null, "profiles": [{"id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z"}], "subtitle": null, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T12:45:44.080Z", "description": "Reimagine the feeling of a classictuesday shawarma. With our tuesday shawarma, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01HQN9B7A568JF2F8R2ZMPNDH0", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "product_id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "updated_at": "2024-02-27T12:41:31.892Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 4150, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-29T12:30:17.412Z", "unit_price": 4150, "updated_at": "2024-03-01T13:02:18.615Z", "variant_id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "adjustments": [], "description": "S", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 4150, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 4950, "object": "cart", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": {"id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "email": "gagidennis@gmail.com", "phone": "0728278545", "metadata": null, "last_name": "gagi", "created_at": "2024-02-29T12:29:12.403Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-02-29T12:29:12.403Z", "has_account": true, "billing_address_id": null}, "metadata": null, "subtotal": 4150, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-02-29T12:30:17.327Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-03-01T13:02:12.710Z", "customer_id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "completed_at": null, "sales_channel": {"id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-02-27T09:46:49.662Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:49.662Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 800, "billing_address": {"id": "addr_01HQX1Q9RQF983Y91F7JA9F0VA", "city": "nairobi", "phone": "0728278545", "company": "zuri health", "metadata": null, "province": "kenya", "address_1": "gg", "address_2": "", "last_name": "gagi", "created_at": "2024-03-01T13:02:12.710Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-03-01T13:02:12.710Z", "customer_id": null, "postal_code": "333", "country_code": "ca"}, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01HQTDG9W6YZGBYH7C9J78A7V6", "data": {"status": "pending"}, "amount": 4950, "status": "pending", "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "created_at": "2024-02-29T12:30:23.106Z", "updated_at": "2024-03-01T13:02:18.492Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01HQTDG9W6YZGBYH7C9J78A7V6", "data": {"status": "pending"}, "amount": 4950, "status": "pending", "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "created_at": "2024-02-29T12:30:23.106Z", "updated_at": "2024-03-01T13:02:18.492Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": {"id": "addr_01HQX1Q13CA0W6EF6HY7HYJT2R", "city": "nairobi", "phone": "0728278545", "company": "zuri health", "metadata": null, "province": "kenya", "address_1": "gg", "address_2": "", "last_name": "gagi", "created_at": "2024-03-01T13:02:03.838Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-03-01T13:02:12.710Z", "customer_id": null, "postal_code": "333", "country_code": "ca"}, "shipping_methods": [{"id": "sm_01HQX1QFCTP7PGDN9YSV8YR660", "data": {}, "price": 800, "total": 800, "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "swap_id": null, "order_id": null, "subtotal": 800, "return_id": null, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "shipping_method_id": "sm_01HQX1QFCTP7PGDN9YSV8YR660"}], "tax_total": 0, "claim_order_id": null, "original_total": 800, "shipping_option": {"id": "so_01HQMZBJKD5AW5BMRB2QQEQ4GE", "data": {"id": "manual-fulfillment"}, "name": "FakeEx Standard", "amount": 800, "metadata": null, "is_return": false, "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "admin_only": false, "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "price_type": "flat_rate", "profile_id": "sp_01HQMZBCG5EEZ7BP5GSN9YQMCY", "updated_at": "2024-02-27T09:46:55.818Z", "provider_id": "manual"}, "original_tax_total": 0, "shipping_option_id": "so_01HQMZBJKD5AW5BMRB2QQEQ4GE"}], "billing_address_id": "addr_01HQX1Q9RQF983Y91F7JA9F0VA", "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01HQX1Q13CA0W6EF6HY7HYJT2R", "payment_authorized_at": null}}	finished
ikey_01HQX1QPEXZ3Z0FBNRQP9PJ1Y2	262c4c38-0a26-4252-89b0-38a6bcad572c	2024-03-01 13:02:25.753578+00	\N	POST	{"id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q"}	/cart_01HQTDG47YT72RAM8TAN51GQ6Q/complete	200	{"data": {"id": "order_01HQX1QPKA077BCA23QT8PXTNT", "email": "gagidennis@gmail.com", "items": [{"id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ", "title": "tuesday shawarma", "total": 4150, "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "swap_id": null, "variant": {"id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "ean": null, "sku": null, "upc": null, "title": "S", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-02-27T12:41:31.892Z", "deleted_at": null, "product_id": "prod_01HQN9B92WJP0331GNHJ9FKY5F", "updated_at": "2024-03-01T13:02:25.836Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 99}, "metadata": {}, "order_id": "order_01HQX1QPKA077BCA23QT8PXTNT", "quantity": 1, "subtotal": 4150, "is_return": false, "tax_lines": [{"id": "litl_01HQX1QPFG8KVAVP4FYHJ10E0P", "code": "default", "name": "default", "rate": 0, "item_id": "item_01HQTDG4AHFRTNCWXKXBW0YQTZ", "metadata": null, "created_at": "2024-03-01T13:02:25.761Z", "updated_at": "2024-03-01T13:02:25.836Z"}], "tax_total": 0, "thumbnail": "http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg", "created_at": "2024-02-29T12:30:17.412Z", "refundable": 4150, "unit_price": 4150, "updated_at": "2024-03-01T13:02:25.836Z", "variant_id": "variant_01HQN9B93M4PX8DMJPEVV06QG6", "adjustments": [], "description": "S", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 4150, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "swaps": [], "total": 4950, "claims": [], "object": "order", "region": {"id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "created_at": "2024-02-27T09:46:55.818Z", "deleted_at": null, "updated_at": "2024-02-27T09:46:55.818Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "gift_cards_taxable": true}, "status": "pending", "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "refunds": [], "metadata": {}, "payments": [{"id": "pay_01HQX1QPGZMWNQ0N3W85KCRMC2", "data": {"status": "authorized"}, "amount": 4950, "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "swap_id": null, "metadata": null, "order_id": "order_01HQX1QPKA077BCA23QT8PXTNT", "created_at": "2024-03-01T13:02:25.784Z", "updated_at": "2024-03-01T13:02:25.836Z", "canceled_at": null, "captured_at": null, "provider_id": "manual", "currency_code": "usd", "amount_refunded": 0, "idempotency_key": null}], "subtotal": 4150, "tax_rate": null, "discounts": [], "region_id": "reg_01HQMZBJJ440Q50AAN9DGCKD4D", "tax_total": 0, "created_at": "2024-03-01T13:02:25.836Z", "display_id": 1, "gift_cards": [], "paid_total": 4950, "updated_at": "2024-03-01T13:02:25.836Z", "canceled_at": null, "customer_id": "cus_01HQTDE4TVG9M3XFWJAQ2CG0TM", "external_id": null, "currency_code": "usd", "discount_total": 0, "draft_order_id": null, "item_tax_total": 0, "payment_status": "awaiting", "refunded_total": 0, "shipping_total": 800, "gift_card_total": 0, "idempotency_key": null, "no_notification": null, "sales_channel_id": "sc_01HQMZBCGP5QQSTSA504EH8YRK", "shipping_address": {"id": "addr_01HQX1Q13CA0W6EF6HY7HYJT2R", "city": "nairobi", "phone": "0728278545", "company": "zuri health", "metadata": null, "province": "kenya", "address_1": "gg", "address_2": "", "last_name": "gagi", "created_at": "2024-03-01T13:02:03.838Z", "deleted_at": null, "first_name": "andrew", "updated_at": "2024-03-01T13:02:12.710Z", "customer_id": null, "postal_code": "333", "country_code": "ca"}, "shipping_methods": [{"id": "sm_01HQX1QFCTP7PGDN9YSV8YR660", "data": {}, "price": 800, "total": 800, "cart_id": "cart_01HQTDG47YT72RAM8TAN51GQ6Q", "swap_id": null, "order_id": "order_01HQX1QPKA077BCA23QT8PXTNT", "subtotal": 800, "return_id": null, "tax_lines": [{"id": "smtl_01HQX1QPFG5B14EXV1909N4HP5", "code": "default", "name": "default", "rate": 0, "metadata": null, "created_at": "2024-03-01T13:02:25.761Z", "updated_at": "2024-03-01T13:02:25.836Z", "shipping_method_id": "sm_01HQX1QFCTP7PGDN9YSV8YR660"}], "tax_total": 0, "claim_order_id": null, "original_total": 800, "original_tax_total": 0, "shipping_option_id": "so_01HQMZBJKD5AW5BMRB2QQEQ4GE"}], "refundable_amount": 4950, "billing_address_id": "addr_01HQX1Q9RQF983Y91F7JA9F0VA", "fulfillment_status": "not_fulfilled", "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01HQX1Q13CA0W6EF6HY7HYJT2R", "gift_card_transactions": []}, "type": "order"}	finished
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.image (id, url, created_at, updated_at, deleted_at, metadata) FROM stdin;
img_01HQN9B8PKSHY6BH0TSWFMV6CH	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
img_01HQN9B8PKCVWVFFWZ2QXFK4KT	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-back.png	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
img_01HQN9B8PK9PH78Z7T1P0CTBBG	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-white-front.png	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
img_01HQN9B8PKE15DY4QVAHCX8VNX	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-white-back.png	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
img_01HQN9B8PREPDK3QE4S5SQF70E	https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatshirt-vintage-front.png	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N
img_01HQN9B8PR9NJ6Z07Y3AFVFP7T	https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatshirt-vintage-back.png	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N
img_01HQN9B8SAV6B482JGGKZ8JCX7	https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-front.png	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N
img_01HQN9B8SAPJC9ATE9MT20Y8F5	https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-back.png	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N
img_01HQN9B8SVTR9ERD56TRVFY79M	https://medusa-public-images.s3.eu-west-1.amazonaws.com/shorts-vintage-front.png	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N
img_01HQN9B8SV5PKDAXN3NV9HZ8ZX	https://medusa-public-images.s3.eu-west-1.amazonaws.com/shorts-vintage-back.png	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N
img_01HQN9B8XJY8QJH44FA4H12S52	https://medusa-public-images.s3.eu-west-1.amazonaws.com/black_hoodie_front.png	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N
img_01HQN9B8XJ8N7AKASKXRP9QD07	https://medusa-public-images.s3.eu-west-1.amazonaws.com/black_hoodie_back.png	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N
img_01HQN9B9138D3BGRT6GV02GENR	https://medusa-public-images.s3.eu-west-1.amazonaws.com/ls-black-front.png	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00	\N	\N
img_01HQN9B914GJ2T3357MVXR9KXA	https://medusa-public-images.s3.eu-west-1.amazonaws.com/ls-black-back.png	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00	\N	\N
img_01HQN9B99DBMVJCQ7NM4V05NKG	https://medusa-public-images.s3.eu-west-1.amazonaws.com/coffee-mug.png	2024-02-27 12:41:32.199539+00	2024-02-27 12:41:32.199539+00	\N	\N
img_01HQN9EB59AV56D4XTYTK698J2	http://localhost:9000/uploads/1709037792079-classic-burger-lemonade.jpeg	2024-02-27 12:43:12.413228+00	2024-02-27 12:43:12.413228+00	\N	\N
img_01HQN9HHK9YW7XYZVB4XME6FZY	http://localhost:9000/uploads/1709037896971-falMezza-Bar-20230112-5-2-scaled.jpeg	2024-02-27 12:44:57.315427+00	2024-02-27 12:44:57.315427+00	\N	\N
img_01HQN9THPS5NR59957P9X4GP58	http://localhost:9000/uploads/1709038191990-Grilled.jpeg	2024-02-27 12:49:52.334185+00	2024-02-27 12:49:52.334185+00	\N	\N
img_01HQN9XM5YARH826YM71DXHH93	http://localhost:9000/uploads/1709038292834-mezza-kilimanii-20220803-103.jpeg	2024-02-27 12:51:33.172627+00	2024-02-27 12:51:33.172627+00	\N	\N
img_01HQN9ZZ73YYQ14PYWMX5ZYB16	http://localhost:9000/uploads/1709038369669-Offer-2.jpeg	2024-02-27 12:52:50.012143+00	2024-02-27 12:52:50.012143+00	\N	\N
img_01HQNA1ZDGX4AGH698009B0JEB	http://localhost:9000/uploads/1709038435400-Offer-3.jpeg	2024-02-27 12:53:55.750271+00	2024-02-27 12:53:55.750271+00	\N	\N
img_01HQNA3YFNWF9484P1JFSTNDKB	http://localhost:9000/uploads/1709038500000-Offer-4.jpeg	2024-02-27 12:55:00.33264+00	2024-02-27 12:55:00.33264+00	\N	\N
\.


--
-- Data for Name: invite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invite (id, user_email, role, accepted, created_at, updated_at, deleted_at, metadata, token, expires_at) FROM stdin;
invite_01HQMZBCJQJQTJAM2NP2H7GW9V	gagidennis@gmail.com	admin	f	2024-02-27 09:46:49.794921+00	2024-02-27 12:48:44.413583+00	\N	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpbnZpdGVfaWQiOiJpbnZpdGVfMDFIUU1aQkNKUUpRVEpBTTJOUDJIN0dXOVYiLCJyb2xlIjoiYWRtaW4iLCJ1c2VyX2VtYWlsIjoiZ2FnaWRlbm5pc0BnbWFpbC5jb20iLCJpYXQiOjE3MDkwMzgxMjR9.JeXPPVxTfeshBSHQFioZ4Zd_NCNd11MzidItsmcJ-EY	2024-03-05 12:48:44.419+00
invite_01HQTDTCS56RQYHA4GRV1PN4YW	andrewgagi96@gmail.com	member	f	2024-02-29 12:35:53.762904+00	2024-02-29 12:35:53.762904+00	\N	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpbnZpdGVfaWQiOiJpbnZpdGVfMDFIUVREVENTNTZSUVlIQTRHUlYxUE40WVciLCJyb2xlIjoibWVtYmVyIiwidXNlcl9lbWFpbCI6ImFuZHJld2dhZ2k5NkBnbWFpbC5jb20iLCJpYXQiOjE3MDkyMTAxNTN9.R5X0L-VbuM_6_zBFgPqC6WRvTV8W0qtY8gsVFZZBCPc	2024-03-07 12:35:53.768+00
\.


--
-- Data for Name: line_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.line_item (id, cart_id, order_id, swap_id, title, description, thumbnail, is_giftcard, should_merge, allow_discounts, has_shipping, unit_price, variant_id, quantity, fulfilled_quantity, returned_quantity, shipped_quantity, created_at, updated_at, metadata, claim_order_id, is_return, original_item_id, order_edit_id) FROM stdin;
item_01HQN9BK8STHGRWYF6KYZNSEF7	cart_01HQN9BK7DZ1KEMT9WV95EF08J	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:41:42.370888+00	2024-02-27 12:41:42.370888+00	{}	\N	f	\N	\N
item_01HQN9DBF53JPJQAPSNMC8T3SS	cart_01HQN9DBEAX1SG2BHWYYESXM6M	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:42:39.93979+00	2024-02-27 12:42:39.93979+00	{}	\N	f	\N	\N
item_01HQN9DFXJMSR05KK1RQ6N098J	cart_01HQN9DFWKAJJQYH7298Z8ASXT	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:42:44.490053+00	2024-02-27 12:42:44.490053+00	{}	\N	f	\N	\N
item_01HQN9GG6CMEDK7QTMJQ1CM7SS	cart_01HQN9GG5370YS2E2GB90A28HC	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:44:23.070117+00	2024-02-27 12:44:23.070117+00	{}	\N	f	\N	\N
item_01HQN9GP6XMNWXAFWEEY9H1T6B	cart_01HQN9GP64F9P5BH3HMC6XRZ49	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:44:29.245849+00	2024-02-27 12:44:29.245849+00	{}	\N	f	\N	\N
item_01HQN9P6AK3QWKYNEPYTK1AMZX	cart_01HQN9P69EDSCWKY75AWVV77F0	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:47:29.575239+00	2024-02-27 12:47:29.575239+00	{}	\N	f	\N	\N
item_01HQN9PANX7YJ7TKH0QF0SAA61	cart_01HQN9PAN76JRHG57JMVQ4FN6H	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:47:34.050034+00	2024-02-27 12:47:34.050034+00	{}	\N	f	\N	\N
item_01HQN9PP0YZGEZA62BVZJ5M3XA	cart_01HQN9PNZNBT5576RTTKWSBXT7	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:47:45.646785+00	2024-02-27 12:47:45.646785+00	{}	\N	f	\N	\N
item_01HQN9PSV4AP23EEDPG6J5N1WH	cart_01HQN9PSTDXPYET75ZB4VQT6XB	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:47:49.573046+00	2024-02-27 12:47:49.573046+00	{}	\N	f	\N	\N
item_01HQN9SH44DV3YQ4CV2146R224	cart_01HQN9SH31YACWAH41NJJXNJNV	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:49:18.938352+00	2024-02-27 12:49:18.938352+00	{}	\N	f	\N	\N
item_01HQN9SR453X7EK8WED5VTHT58	cart_01HQN9SR3GKBEWPVC18WSEP4XW	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:49:26.121443+00	2024-02-27 12:49:26.121443+00	{}	\N	f	\N	\N
item_01HQN9WP1FSXTBMZD4Y65M2TSX	cart_01HQN9WP07HXH62J93F5DCMQ1B	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:51:02.272156+00	2024-02-27 12:51:02.272156+00	{}	\N	f	\N	\N
item_01HQN9WSX9CSJE69P4MWD36DEB	cart_01HQN9WSWE709PZMS5M68MBFHN	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:51:06.245055+00	2024-02-27 12:51:06.245055+00	{}	\N	f	\N	\N
item_01HQN9YSAD8FZWNMC4CY4TRTX5	cart_01HQN9YS9FAF6NWP1J4DYYN8TN	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:52:11.177799+00	2024-02-27 12:52:11.177799+00	{}	\N	f	\N	\N
item_01HQN9YY1JD25R6JAXKRWH1164	cart_01HQN9YY0ZHJRQSYG4DC7YDYK7	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:52:16.026702+00	2024-02-27 12:52:16.026702+00	{}	\N	f	\N	\N
item_01HQNA0WH6M2Z0VEBTEB56EWW0	cart_01HQNA0WG91XXZ9QY6ZQHDCRC6	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:53:20.001653+00	2024-02-27 12:53:20.001653+00	{}	\N	f	\N	\N
item_01HQNA10KAKYD5FYYYTA1H8PPA	cart_01HQNA10JP61DPASE2FWZ9PFYX	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:53:24.177692+00	2024-02-27 12:53:24.177692+00	{}	\N	f	\N	\N
item_01HQNA2Y8AYGV76KJGGMK5E7JJ	cart_01HQNA2Y751RY1021A5M6MNW2H	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:54:27.292045+00	2024-02-27 12:54:27.292045+00	{}	\N	f	\N	\N
item_01HQNA31SAPHGVKMD0CM98JQPM	cart_01HQNA31RHCA2TRY7SPDTPAS75	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-27 12:54:30.92297+00	2024-02-27 12:54:30.92297+00	{}	\N	f	\N	\N
item_01HQNBZG3DAFKT783EA78T21FX	cart_01HQNBZG0HEH1N0NQE0VJA1WVF	\N	\N	chicken-tikka	M	http://localhost:9000/uploads/1709038177790-Grilled.jpeg	f	t	t	f	4150	variant_01HQN9B90SF0HNC808ZAET08AP	1	\N	\N	\N	2024-02-27 13:27:31.678463+00	2024-02-27 13:27:31.678463+00	{}	\N	f	\N	\N
item_01HQND97BGGR3X2SGC83YXSEDW	cart_01HQND978CY8PERZRJ8ABHY20Z	\N	\N	classic burger	One Size	http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg	f	t	t	f	1200	variant_01HQN9B9ABYMQF4MBX9DR25MYS	1	\N	\N	\N	2024-02-27 13:50:18.976536+00	2024-02-27 13:50:18.976536+00	{}	\N	f	\N	\N
item_01HQNHDHQWFZSDJTVS6R77B27Z	cart_01HQNHDHMS5HG9SSBSNQYWHWPP	\N	\N	classic burger	One Size	http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg	f	t	t	f	1200	variant_01HQN9B9ABYMQF4MBX9DR25MYS	1	\N	\N	\N	2024-02-27 15:02:34.984251+00	2024-02-27 15:02:34.984251+00	{}	\N	f	\N	\N
item_01HQNHV36KY937PB5XK5XFT9PB	cart_01HQNHV32MRWE4GSDYTFPXM84H	\N	\N	classic burger	One Size	http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg	f	t	t	f	1200	variant_01HQN9B9ABYMQF4MBX9DR25MYS	1	\N	\N	\N	2024-02-27 15:09:58.84793+00	2024-02-27 15:09:58.84793+00	{}	\N	f	\N	\N
item_01HQTD5V3S01R30MTD838CSYAY	cart_01HQTD5V24H4X80A2MHFPR4V1F	\N	\N	saturday-cocktails	S / Black	http://localhost:9000/uploads/1709038481277-Offer-4.jpeg	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-29 12:24:40.249464+00	2024-02-29 12:24:40.249464+00	{}	\N	f	\N	\N
item_01HQTD62CP6F4B3235GA2D0C4H	cart_01HQTD62BXYG0VCMN2E78T40CZ	\N	\N	saturday-cocktails	S / Black	http://localhost:9000/uploads/1709038481277-Offer-4.jpeg	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-29 12:24:47.734663+00	2024-02-29 12:24:47.734663+00	{}	\N	f	\N	\N
item_01HQTDGJ2W3XHEMFGQ9BD698MM	cart_01HQTDGJ26DFKFQHH7QTPM5C7Y	\N	\N	saturday-cocktails	S / Black	http://localhost:9000/uploads/1709038481277-Offer-4.jpeg	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-29 12:30:31.489757+00	2024-02-29 12:30:31.489757+00	{}	\N	f	\N	\N
item_01HQTHSJ5JAP6YNKVNSPRJS1VV	cart_01HQTHSJ46HW4RW3Q2TA4Z9PYB	\N	\N	saturday-cocktails	S / Black	http://localhost:9000/uploads/1709038481277-Offer-4.jpeg	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-29 13:45:20.766554+00	2024-02-29 13:45:20.766554+00	{}	\N	f	\N	\N
item_01HQTHSM0KNS38D4D9QJKZQXMZ	cart_01HQTHSKZVABPFH3MP03BNGQDP	\N	\N	saturday-cocktails	S / Black	http://localhost:9000/uploads/1709038481277-Offer-4.jpeg	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-29 13:45:22.67737+00	2024-02-29 13:45:22.67737+00	{}	\N	f	\N	\N
item_01HQTHSXAQNHZ57JQHEDHMS0D0	cart_01HQTHSXA0881M1CXTWER2WPRV	\N	\N	saturday-cocktails	S / Black	http://localhost:9000/uploads/1709038481277-Offer-4.jpeg	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-29 13:45:32.217924+00	2024-02-29 13:45:32.217924+00	{}	\N	f	\N	\N
item_01HQTHZX8MJ8DSRHT69G7PQZ0S	cart_01HQTHZX7YD0NHGDC78PG5SM44	\N	\N	saturday-cocktails	S / Black	http://localhost:9000/uploads/1709038481277-Offer-4.jpeg	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-29 13:48:48.761081+00	2024-02-29 13:48:48.761081+00	{}	\N	f	\N	\N
item_01HQTHZXS07ARQJMSEJ1NEZBDS	cart_01HQTHZXR681YXFTPCVEDQ9MT0	\N	\N	saturday-cocktails	S / Black	http://localhost:9000/uploads/1709038481277-Offer-4.jpeg	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-29 13:48:49.277377+00	2024-02-29 13:48:49.277377+00	{}	\N	f	\N	\N
item_01HQTJ06JBXDDM35Y9YDXYG7NX	cart_01HQTJ06HTCKJF43F7SS1HPWR4	\N	\N	saturday-cocktails	S / Black	http://localhost:9000/uploads/1709038481277-Offer-4.jpeg	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-29 13:48:58.294253+00	2024-02-29 13:48:58.294253+00	{}	\N	f	\N	\N
item_01HQTWVBFFPH3AEVG606Y230QS	cart_01HQTWVBE0BEHGCXG37KNMA6ZA	\N	\N	saturday-cocktails	S / Black	http://localhost:9000/uploads/1709038481277-Offer-4.jpeg	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-29 16:58:33.78556+00	2024-02-29 16:58:33.78556+00	{}	\N	f	\N	\N
item_01HQTWVKE3VFYN4YKMHRG35WH5	cart_01HQTWVKDAR8VFT8ATEBC3Q4T5	\N	\N	saturday-cocktails	S / Black	http://localhost:9000/uploads/1709038481277-Offer-4.jpeg	f	t	t	f	2200	variant_01HQN9B8RPHSJNSXQCCJCG398M	1	\N	\N	\N	2024-02-29 16:58:41.955388+00	2024-02-29 16:58:41.955388+00	{}	\N	f	\N	\N
item_01HQTDG4AHFRTNCWXKXBW0YQTZ	cart_01HQTDG47YT72RAM8TAN51GQ6Q	order_01HQX1QPKA077BCA23QT8PXTNT	\N	tuesday shawarma	S	http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg	f	t	t	f	4150	variant_01HQN9B93M4PX8DMJPEVV06QG6	1	\N	\N	\N	2024-02-29 12:30:17.412202+00	2024-03-01 13:02:25.83614+00	{}	\N	f	\N	\N
\.


--
-- Data for Name: line_item_adjustment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.line_item_adjustment (id, item_id, description, discount_id, amount, metadata) FROM stdin;
\.


--
-- Data for Name: line_item_tax_line; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.line_item_tax_line (id, rate, name, code, created_at, updated_at, metadata, item_id) FROM stdin;
litl_01HQX1QPFG8KVAVP4FYHJ10E0P	0	default	default	2024-03-01 13:02:25.76106+00	2024-03-01 13:02:25.83614+00	\N	item_01HQTDG4AHFRTNCWXKXBW0YQTZ
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
1	1611063162649	initialSchema1611063162649
2	1611063174563	countriesCurrencies1611063174563
3	1612284947120	claims1612284947120
4	1612353094577	indexes1612353094577
5	1613146953072	notifications1613146953072
6	1613146953073	productTypeCategoryTags1613146953073
7	1613384784316	draftOrders1613384784316
8	1613656135167	trackingLinks1613656135167
9	1614684597235	cartContext1614684597235
10	1615891636559	returnReason1615891636559
11	1615970124120	discountUsageCount1615970124120
12	1617002207608	discountUsage1617002207608
13	1619108646647	nullablePassword1619108646647
14	1623231564533	noNotification1623231564533
15	1624287602631	gcRemoveUniqueOrder1624287602631
16	1624610325746	softDeletingUniqueConstraints1624610325746
17	1625560513367	ensureCancellationFieldsExist1625560513367
18	1627995307200	addDiscountableToProduct1627995307200
19	1630505790603	allowBackorderSwaps1630505790603
20	1631104895519	RankColumnWithDefaultValue1631104895519
21	1631261634964	enforceUniqueness1631261634964
22	1631696624528	validDurationForDiscount1631696624528
23	1631800727788	nestedReturnReasons1631800727788
24	1631864388026	statusOnProduct1631864388026
25	1632220294687	addNotes1632220294687
26	1632828114899	deleteDateOnShippingOptionRequirements1632828114899
27	1633512755401	extendedUserApi1633512755401
28	1633614437919	addCustomShippingOptions1633614437919
29	1638543550000	orderTaxRateToRealType1638543550000
30	1638952072999	externalIdOrder1638952072999
31	1641636508055	newTaxSystem1641636508055
32	1644943746861	customerGroups1644943746861
33	1646324713514	discountConditions1646324713514
34	1646915480108	updateMoneyAmountAddPriceList1646915480108
35	1648600574750	addLineItemAdjustments1648600574750
36	1648641130007	taxLineConstraints1648641130007
37	1649775522087	addBatchJobModel1649775522087
38	1656949291839	salesChannel1656949291839
39	1657098186554	taxedGiftCardTransactions1657098186554
40	1657267320181	extendedBatchJob1657267320181
41	1660040729000	paymentSessionUniqCartIdProviderId1660040729000
42	1661345741249	multiPaymentCart1661345741249
43	1661863940645	swapFulfillmentStatusRequiresAction1661863940645
44	1663059812399	orderEditing1663059812399
45	1663059812400	lineItemOriginalItemRelation1663059812400
46	1664880666982	paymentCollection1664880666982
47	1666173221888	addAnalyticsConfig1666173221888
48	1667815005070	publishableApiKey1667815005070
49	1669032280562	updateCustomerEmailConstraint_1669032280562
50	1670855241304	addTaxRateToGiftCards1670855241304
51	1671711415179	multiLocation1671711415179
52	1672906846559	productCategory1672906846559
53	1672906846560	paymentSessionIsInitiated1672906846560
54	1673003729870	stagedJobOptions1673003729870
55	1673550502785	uniquePaySessCartId1673550502785
56	1674455083104	productCategoryProduct1674455083104
57	1675689306130	multiLocationSoftDelete1675689306130
58	1677234878504	productCategoryRank1677234878504
59	1678093365811	ensureRequiredQuantity1678093365811
60	1678093365812	lineItemAdjustmentsAmount1678093365812
61	1679950221063	categoryRemoveSoftDelete1679950221063
62	1679950645253	categoryCreateIndexes1679950645253
63	1679950645254	productDomainImprovedIndexes1679950645254
64	1679950645254	productSearchGinIndexes1679950645254
65	1680714052628	addSalesChannelMetadata1680714052628
66	1680857773272	addDescriptionToProductCategory1680857773272
67	1680857773272	lineItemTaxAdjustmentOnCascadeDelete1680857773272
68	1680857773273	addTableProductShippingProfile1680857773273
69	1680857773273	dropProductIdFkSalesChannels1680857773273
70	1680857773273	dropVariantIdFkMoneyAmount1680857773273
71	1685715079776	CreateOnboarding1685715079776
72	1686062614694	AddOnboardingProduct1686062614694
73	1690996567455	CorrectOnboardingFields1690996567455
74	1692870898423	UpdateReturnReasonIndex1692870898423
75	1692953518123	dropMoneyAmountConstraintsForPricingModule1692953518123
76	1699564794649	AddMetadataToProductCategory1699564794649
77	1701894188811	PublishableKeySalesChannelLink1701894188811
\.


--
-- Data for Name: money_amount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.money_amount (id, currency_code, amount, region_id, created_at, updated_at, deleted_at, min_quantity, max_quantity, price_list_id) FROM stdin;
ma_01HQN9B8TDWA8K2EPHQ0VB98TE	usd	3350	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N	\N	\N
ma_01HQN9B8TD4XJWPRJZNDWFM6CH	eur	3350	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N	\N	\N
ma_01HQN9B8TD97QNH7TMT0E546Z5	usd	3350	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N	\N	\N
ma_01HQN9B8TDG9J4JZ8SE7WYC6XQ	eur	3350	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N	\N	\N
ma_01HQN9B8TE5CRZ4HDQH5YQP8P3	usd	3350	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N	\N	\N
ma_01HQN9B8TEDPTFM089RGG253HC	eur	3350	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N	\N	\N
ma_01HQN9B8TE2YTZDBNAC439SQKJ	usd	3350	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N	\N	\N
ma_01HQN9B8TEBWNED3PP0VQHTZKV	eur	3350	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N	\N	\N
ma_01HQN9B8WKWFFZVX42NR17BCQY	usd	2200	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	\N	\N
ma_01HQN9B8WKBW82NTYD8BTMT0EV	eur	2200	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	\N	\N
ma_01HQN9B8WK1T9P8XN7X52JA9Y9	usd	2200	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	\N	\N
ma_01HQN9B8WK6Z4SXQE540KKFD9S	eur	2200	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	\N	\N
ma_01HQN9B8WKSN8FCX6QG8DZKYNQ	usd	2200	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	\N	\N
ma_01HQN9B8WKS9YCHH14TD8F4XVF	eur	2200	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	\N	\N
ma_01HQN9B8WK35VF62V04968MJKJ	usd	2200	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	\N	\N
ma_01HQN9B8WK2PE06RDQV374ZKC5	eur	2200	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	\N	\N
ma_01HQN9B8WKRE3CPZC5W4W7NJ8Z	usd	2200	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	\N	\N
ma_01HQN9B8WKMJ4ENN48QCWDWQH3	eur	2200	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	\N	\N
ma_01HQN9B8WKJGBF1GDB94353XWJ	usd	2200	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	\N	\N
ma_01HQN9B8WM1RKVVJ867BC75SQR	eur	2200	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	\N	\N
ma_01HQN9B8WM9GQ21M42NWJYJM1A	usd	2200	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	\N	\N
ma_01HQN9B8WMPH43VBFCXV743MSF	eur	2200	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	\N	\N
ma_01HQN9B8WM50EN5VH7T8BRFNPB	usd	2200	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	\N	\N
ma_01HQN9B8WMWP17EDY3VYYC65ZS	eur	2200	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	\N	\N
ma_01HQN9B8Z66KY8XSWKJ224H17W	usd	3350	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N	\N	\N
ma_01HQN9B8Z6Z4HH80YKF4EYZAFK	eur	3350	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N	\N	\N
ma_01HQN9B8Z6PRH694BKAZN4X6YQ	usd	3350	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N	\N	\N
ma_01HQN9B8Z66FB09NJD203W7FWX	eur	3350	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N	\N	\N
ma_01HQN9B8Z62VFCAZP0NH6NHDF7	usd	3350	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N	\N	\N
ma_01HQN9B8Z6EVPRHXZMT1MPA454	eur	3350	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N	\N	\N
ma_01HQN9B8Z6MR2RE9XWMJ75SMPW	usd	3350	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N	\N	\N
ma_01HQN9B8Z7FMFRJZP416H0YE4V	eur	3350	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N	\N	\N
ma_01HQN9B8ZVE1SV9HJ3F2S4CQ4J	usd	2850	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N	\N	\N
ma_01HQN9B8ZV63P7J6HT6PEWXXZZ	eur	2850	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N	\N	\N
ma_01HQN9B8ZVV09FR0YMXH9PEX24	usd	2850	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N	\N	\N
ma_01HQN9B8ZVK9BCRA9DHV0BBZTQ	eur	2850	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N	\N	\N
ma_01HQN9B8ZVR6WE5RN0ZNXHVGHZ	usd	2850	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N	\N	\N
ma_01HQN9B8ZVWHY5DMPT5KN7TCVM	eur	2850	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N	\N	\N
ma_01HQN9B8ZVGNPVZ7JZNRBTSWY7	usd	2850	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N	\N	\N
ma_01HQN9B8ZV8RVNMHQW4AR2YGQ5	eur	2850	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N	\N	\N
ma_01HQN9B93E0TB8PM8SZD0DHVAW	usd	4150	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N	\N	\N
ma_01HQN9B93FCVHXD9TDGEYZYEEM	eur	4150	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N	\N	\N
ma_01HQN9B93FBAXF7C0ZAF9XDABE	usd	4150	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N	\N	\N
ma_01HQN9B93F1NS0C1YK9TF0AD4R	eur	4150	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N	\N	\N
ma_01HQN9B93FW3Z1Q54NSZKZH3YS	usd	4150	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N	\N	\N
ma_01HQN9B93FARZZSGP2GHNXXCXN	eur	4150	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N	\N	\N
ma_01HQN9B93F8W4MASW8KGA4H8JK	usd	4150	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N	\N	\N
ma_01HQN9B93F0MZ1W944EN4HCJAV	eur	4150	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N	\N	\N
ma_01HQN9B94KF65A1VHYY80JCVQK	usd	4150	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00	\N	\N	\N	\N
ma_01HQN9B94KGFMDDX62ERAN37YJ	eur	4150	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00	\N	\N	\N	\N
ma_01HQN9B94KTSKM6KSPR835QNSC	usd	4150	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00	\N	\N	\N	\N
ma_01HQN9B94KRV4WFEMSC2NQFYD3	eur	4150	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00	\N	\N	\N	\N
ma_01HQN9B94K3M8RTR6YF7C1QYPD	usd	4150	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00	\N	\N	\N	\N
ma_01HQN9B94KXQ4J56YCMPYS0R74	eur	4150	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00	\N	\N	\N	\N
ma_01HQN9B94MZEXY81QGAMSXYAS2	usd	4150	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00	\N	\N	\N	\N
ma_01HQN9B94M3Q5P6S3PNBTA3ZH0	eur	4150	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00	\N	\N	\N	\N
ma_01HQN9B9AMXG07GZNQYDFKD5PP	usd	1200	\N	2024-02-27 12:41:32.199539+00	2024-02-27 12:41:32.199539+00	\N	\N	\N	\N
ma_01HQN9B9AMQKC604SVZCYB879T	eur	1200	\N	2024-02-27 12:41:32.199539+00	2024-02-27 12:41:32.199539+00	\N	\N	\N	\N
\.


--
-- Data for Name: note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.note (id, value, resource_type, resource_id, author_id, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification (id, event_name, resource_type, resource_id, customer_id, "to", data, parent_id, provider_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: notification_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification_provider (id, is_installed) FROM stdin;
\.


--
-- Data for Name: oauth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth (id, display_name, application_name, install_url, uninstall_url, data) FROM stdin;
\.


--
-- Data for Name: onboarding_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.onboarding_state (id, created_at, updated_at, current_step, is_complete, product_id) FROM stdin;
onboarding_01HQMZB6KQYFC3RCQFPTAPY35C	2024-02-27 09:46:41.322285+00	2024-02-27 12:41:40.625052+00	create_order_nextjs	f	prod_01HQN9B8PY03B13868WVDPMTHQ
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" (id, status, fulfillment_status, payment_status, display_id, cart_id, customer_id, email, billing_address_id, shipping_address_id, region_id, currency_code, tax_rate, canceled_at, created_at, updated_at, metadata, idempotency_key, draft_order_id, no_notification, external_id, sales_channel_id) FROM stdin;
order_01HQX1QPKA077BCA23QT8PXTNT	pending	not_fulfilled	awaiting	1	cart_01HQTDG47YT72RAM8TAN51GQ6Q	cus_01HQTDE4TVG9M3XFWJAQ2CG0TM	gagidennis@gmail.com	addr_01HQX1Q9RQF983Y91F7JA9F0VA	addr_01HQX1Q13CA0W6EF6HY7HYJT2R	reg_01HQMZBJJ440Q50AAN9DGCKD4D	usd	\N	\N	2024-03-01 13:02:25.83614+00	2024-03-01 13:02:25.83614+00	{}	\N	\N	\N	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK
\.


--
-- Data for Name: order_discounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_discounts (order_id, discount_id) FROM stdin;
\.


--
-- Data for Name: order_edit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_edit (id, created_at, updated_at, order_id, internal_note, created_by, requested_by, requested_at, confirmed_by, confirmed_at, declined_by, declined_reason, declined_at, canceled_by, canceled_at, payment_collection_id) FROM stdin;
\.


--
-- Data for Name: order_gift_cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_gift_cards (order_id, gift_card_id) FROM stdin;
\.


--
-- Data for Name: order_item_change; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_item_change (id, created_at, updated_at, deleted_at, type, order_edit_id, original_line_item_id, line_item_id) FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (id, swap_id, cart_id, order_id, amount, currency_code, amount_refunded, provider_id, data, captured_at, canceled_at, created_at, updated_at, metadata, idempotency_key) FROM stdin;
pay_01HQX1QPGZMWNQ0N3W85KCRMC2	\N	cart_01HQTDG47YT72RAM8TAN51GQ6Q	order_01HQX1QPKA077BCA23QT8PXTNT	4950	usd	0	manual	{"status": "authorized"}	\N	\N	2024-03-01 13:02:25.784296+00	2024-03-01 13:02:25.83614+00	\N	\N
\.


--
-- Data for Name: payment_collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_collection (id, created_at, updated_at, deleted_at, type, status, description, amount, authorized_amount, region_id, currency_code, metadata, created_by) FROM stdin;
\.


--
-- Data for Name: payment_collection_payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_collection_payments (payment_collection_id, payment_id) FROM stdin;
\.


--
-- Data for Name: payment_collection_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_collection_sessions (payment_collection_id, payment_session_id) FROM stdin;
\.


--
-- Data for Name: payment_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_provider (id, is_installed) FROM stdin;
manual	t
\.


--
-- Data for Name: payment_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_session (id, cart_id, provider_id, is_selected, status, data, created_at, updated_at, idempotency_key, payment_authorized_at, amount, is_initiated) FROM stdin;
ps_01HQNC01ZT2QYMTAF0HKWM5310	cart_01HQNBZG0HEH1N0NQE0VJA1WVF	manual	t	pending	{"status": "pending"}	2024-02-27 13:27:50.005409+00	2024-02-27 13:27:50.005409+00	\N	\N	4150	t
ps_01HQND9JPDNC9P8X7SFMECRKNH	cart_01HQND978CY8PERZRJ8ABHY20Z	manual	t	pending	{"status": "pending"}	2024-02-27 13:50:30.601709+00	2024-02-27 13:50:30.601709+00	\N	\N	1200	t
ps_01HQNHVNXZGDZXEMHN8X15C47H	cart_01HQNHV32MRWE4GSDYTFPXM84H	manual	t	pending	{"status": "pending"}	2024-02-27 15:10:18.042573+00	2024-02-27 15:10:18.042573+00	\N	\N	1200	t
ps_01HQNHYMP78R9P1DRR8A60VV5S	cart_01HQNHDHMS5HG9SSBSNQYWHWPP	manual	t	pending	{"status": "pending"}	2024-02-27 15:11:55.077696+00	2024-02-27 15:11:55.077696+00	\N	\N	1200	t
ps_01HQTDG9W6YZGBYH7C9J78A7V6	cart_01HQTDG47YT72RAM8TAN51GQ6Q	manual	t	authorized	{"status": "authorized"}	2024-02-29 12:30:23.106484+00	2024-03-01 13:02:25.784296+00	\N	2024-03-01 13:02:25.817+00	4950	t
\.


--
-- Data for Name: price_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_list (id, name, description, type, status, starts_at, ends_at, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: price_list_customer_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_list_customer_groups (price_list_id, customer_group_id) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, title, subtitle, description, handle, is_giftcard, thumbnail, weight, length, height, width, hs_code, origin_country, mid_code, material, created_at, updated_at, deleted_at, metadata, collection_id, type_id, discountable, status, external_id) FROM stdin;
prod_01HQN9B99J8TX1YRTHZSG1EWSY	classic burger	very sweet	Every programmer's best friend.	classic-burger	f	http://localhost:9000/uploads/1709037781402-classic-burger-lemonade.jpeg	400	\N	\N	\N	\N	\N	\N	100% sweetness	2024-02-27 12:41:32.199539+00	2024-02-27 12:44:16.931588+00	\N	{}	pcol_01HQN9B7A568JF2F8R2ZMPNDH0	\N	t	published	\N
prod_01HQN9B92WJP0331GNHJ9FKY5F	tuesday shawarma	\N	Reimagine the feeling of a classictuesday shawarma. With our tuesday shawarma, everyday essentials no longer have to be ordinary.	tuesday-shawarma	f	http://localhost:9000/uploads/1709037881122-falMezza-Bar-20230112-5-2-scaled.jpeg	400	\N	\N	\N	\N	\N	\N	tuesday shawarma	2024-02-27 12:41:31.892699+00	2024-02-27 12:45:44.080183+00	\N	{}	pcol_01HQN9B7A568JF2F8R2ZMPNDH0	\N	t	published	\N
prod_01HQN9B8Y882R3TGZXFATCJ95D	chicken-tikka	\N	Reimagine the feeling of a classic chicken-tikka With our chicken-tikka, everyday essentials no longer have to be ordinary.	chicken-tikka	f	http://localhost:9000/uploads/1709038177790-Grilled.jpeg	400	\N	\N	\N	\N	\N	\N	chicken-tikka	2024-02-27 12:41:31.781218+00	2024-02-27 12:50:47.911846+00	\N	{}	pcol_01HQN9B7A568JF2F8R2ZMPNDH0	\N	t	published	\N
prod_01HQN9B8TJASMQS1SG1T7SQB1D	cocktail-thursday	\N	Reimagine the feeling of classic cocktail-thursday. With our cocktail-thursday, everyday essentials no longer have to be ordinary.	cocktail-thursday	f	http://localhost:9000/uploads/1709038277156-mezza-kilimanii-20220803-103.jpeg	400	\N	\N	\N	\N	\N	\N	cocktail-thursday	2024-02-27 12:41:31.688523+00	2024-02-27 12:52:06.699822+00	\N	{}	pcol_01HQN9B7A568JF2F8R2ZMPNDH0	\N	t	published	\N
prod_01HQN9B8SZTESNCC6SQ8ANEVAA	monday-fantastic	monday-fantastic	Reimagine the feeling of classic monday-fantastic. With ourmonday-fantastic, everyday essentials no longer have to be ordinary.	monday-fantastic	f	http://localhost:9000/uploads/1709038354477-Offer-2.jpeg	400	\N	\N	\N	\N	\N	\N	monday-fantastic	2024-02-27 12:41:31.647594+00	2024-02-27 12:53:16.065325+00	\N	{}	pcol_01HQN9B7A568JF2F8R2ZMPNDH0	\N	t	published	\N
prod_01HQN9B8Q1KRVZ8807VFRNDF7E	friday-shawarma	friday-shawarma	Reimagine the feeling of a classic friday-shawarma. With our friday-shawarma, everyday essentials no longer have to be ordinary.	friday-shawarma	f	http://localhost:9000/uploads/1709038420564-Offer-3.jpeg	400	\N	\N	\N	\N	\N	\N	friday-shawarma	2024-02-27 12:41:31.596807+00	2024-02-27 12:54:23.180428+00	\N	{}	pcol_01HQN9B7A568JF2F8R2ZMPNDH0	\N	t	published	\N
prod_01HQN9B8PY03B13868WVDPMTHQ	saturday-cocktails	saturday-cocktails	Reimagine the feeling of a classic saturday-cocktails. With our saturday-cocktails, everyday essentials no longer have to be ordinary.	saturday-cocktails	f	http://localhost:9000/uploads/1709038481277-Offer-4.jpeg	400	\N	\N	\N	\N	\N	\N	saturday-cocktails	2024-02-27 12:41:31.590441+00	2024-02-27 12:55:41.546545+00	\N	{}	pcol_01HQN9B7A568JF2F8R2ZMPNDH0	\N	t	published	\N
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_category (id, name, handle, parent_category_id, mpath, is_active, is_internal, created_at, updated_at, rank, description, metadata) FROM stdin;
\.


--
-- Data for Name: product_category_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_category_product (product_category_id, product_id) FROM stdin;
\.


--
-- Data for Name: product_collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_collection (id, title, handle, created_at, updated_at, deleted_at, metadata) FROM stdin;
pcol_01HQN9B7A568JF2F8R2ZMPNDH0	Merch	merch	2024-02-27 12:41:30.18005+00	2024-02-27 12:41:30.18005+00	\N	\N
\.


--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_images (product_id, image_id) FROM stdin;
prod_01HQN9B99J8TX1YRTHZSG1EWSY	img_01HQN9B99DBMVJCQ7NM4V05NKG
prod_01HQN9B99J8TX1YRTHZSG1EWSY	img_01HQN9EB59AV56D4XTYTK698J2
prod_01HQN9B92WJP0331GNHJ9FKY5F	img_01HQN9HHK9YW7XYZVB4XME6FZY
prod_01HQN9B8Y882R3TGZXFATCJ95D	img_01HQN9THPS5NR59957P9X4GP58
prod_01HQN9B8TJASMQS1SG1T7SQB1D	img_01HQN9XM5YARH826YM71DXHH93
prod_01HQN9B8SZTESNCC6SQ8ANEVAA	img_01HQN9ZZ73YYQ14PYWMX5ZYB16
prod_01HQN9B8Q1KRVZ8807VFRNDF7E	img_01HQNA1ZDGX4AGH698009B0JEB
prod_01HQN9B8PY03B13868WVDPMTHQ	img_01HQNA3YFNWF9484P1JFSTNDKB
\.


--
-- Data for Name: product_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_option (id, title, created_at, updated_at, deleted_at, metadata, product_id) FROM stdin;
opt_01HQN9B8QAQ9PZSGYAMFP698WP	Size	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	prod_01HQN9B8PY03B13868WVDPMTHQ
opt_01HQN9B8QD8TA97VBRAE8TJS43	Size	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N	prod_01HQN9B8Q1KRVZ8807VFRNDF7E
opt_01HQN9B8QB1QZ948J4B8TNK5V8	Color	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	prod_01HQN9B8PY03B13868WVDPMTHQ
opt_01HQN9B8TPT66H28G1Z81E3KRK	Size	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N	prod_01HQN9B8SZTESNCC6SQ8ANEVAA
opt_01HQN9B8W0D81H7APYHRCZFGZE	Size	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N	prod_01HQN9B8TJASMQS1SG1T7SQB1D
opt_01HQN9B8Z38VFYM97F7EV1XV29	Size	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N	prod_01HQN9B8Y882R3TGZXFATCJ95D
opt_01HQN9B933BTY4AREA5603EJAA	Size	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00	\N	\N	prod_01HQN9B92WJP0331GNHJ9FKY5F
opt_01HQN9B99R02MQQ63JH8MVMN3N	Size	2024-02-27 12:41:32.199539+00	2024-02-27 12:41:32.199539+00	\N	\N	prod_01HQN9B99J8TX1YRTHZSG1EWSY
\.


--
-- Data for Name: product_option_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_option_value (id, value, option_id, variant_id, created_at, updated_at, deleted_at, metadata) FROM stdin;
optval_01HQN9B8RHVQ77ACADKH10KFX3	S	opt_01HQN9B8QD8TA97VBRAE8TJS43	variant_01HQN9B8RG1PZ3912NM29HC66N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N
optval_01HQN9B8RJTHHRJWQVEBZHCN1N	M	opt_01HQN9B8QD8TA97VBRAE8TJS43	variant_01HQN9B8RHYTQSM22R1S9EJHXA	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N
optval_01HQN9B8RKH4C7H0B4MJ1GVHY4	L	opt_01HQN9B8QD8TA97VBRAE8TJS43	variant_01HQN9B8RKKKKP48JG4DJ5M073	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N
optval_01HQN9B8RK7GY0PP2M3FB0M0M0	XL	opt_01HQN9B8QD8TA97VBRAE8TJS43	variant_01HQN9B8RKRJ15M7XK9PSVX3MT	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N
optval_01HQN9B8RPAR8K6TK9CV8TGX6Z	S	opt_01HQN9B8QAQ9PZSGYAMFP698WP	variant_01HQN9B8RPHSJNSXQCCJCG398M	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
optval_01HQN9B8RPKS49YDQX9BQ7CZX2	Black	opt_01HQN9B8QB1QZ948J4B8TNK5V8	variant_01HQN9B8RPHSJNSXQCCJCG398M	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
optval_01HQN9B8RQS42SFKZQB5Q7G85H	S	opt_01HQN9B8QAQ9PZSGYAMFP698WP	variant_01HQN9B8RQ0P308QN27385QR3G	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
optval_01HQN9B8RR1WKRNCFC5BBG1ZS3	White	opt_01HQN9B8QB1QZ948J4B8TNK5V8	variant_01HQN9B8RQ0P308QN27385QR3G	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
optval_01HQN9B8RRW6HKV56JMKX589P1	M	opt_01HQN9B8QAQ9PZSGYAMFP698WP	variant_01HQN9B8RR3E0VHHQPF37FJE3M	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
optval_01HQN9B8RRRHNG54KQXFEZZVB8	Black	opt_01HQN9B8QB1QZ948J4B8TNK5V8	variant_01HQN9B8RR3E0VHHQPF37FJE3M	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
optval_01HQN9B8RSAGZZD7VQTK192120	M	opt_01HQN9B8QAQ9PZSGYAMFP698WP	variant_01HQN9B8RSR6G0A1DEX0G5KAYN	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
optval_01HQN9B8RSARPCRRE4BBSTE676	White	opt_01HQN9B8QB1QZ948J4B8TNK5V8	variant_01HQN9B8RSR6G0A1DEX0G5KAYN	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
optval_01HQN9B8RTYQHGF860FT118JMS	L	opt_01HQN9B8QAQ9PZSGYAMFP698WP	variant_01HQN9B8RTXVC88TC1MX1G0J7S	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
optval_01HQN9B8RTSW77498YJAEQ0YEH	Black	opt_01HQN9B8QB1QZ948J4B8TNK5V8	variant_01HQN9B8RTXVC88TC1MX1G0J7S	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
optval_01HQN9B8RVV9PCWEH4QEFKK383	L	opt_01HQN9B8QAQ9PZSGYAMFP698WP	variant_01HQN9B8RTVYC1XQH3J0AR97F8	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
optval_01HQN9B8RV03M2Q4006ERNA2JJ	White	opt_01HQN9B8QB1QZ948J4B8TNK5V8	variant_01HQN9B8RTVYC1XQH3J0AR97F8	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
optval_01HQN9B8RXR19M6H066CW6QW9W	XL	opt_01HQN9B8QAQ9PZSGYAMFP698WP	variant_01HQN9B8RXV642P7QCAAMPMBJV	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
optval_01HQN9B8RX2S0FHDRC95VKTN6X	Black	opt_01HQN9B8QB1QZ948J4B8TNK5V8	variant_01HQN9B8RXV642P7QCAAMPMBJV	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
optval_01HQN9B8RY1RRDZ67TYJ7V6RXB	XL	opt_01HQN9B8QAQ9PZSGYAMFP698WP	variant_01HQN9B8RY1NAR9NR3TSTW2AKV	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
optval_01HQN9B8RYJK9QDQ3GD9WRZ9VV	White	opt_01HQN9B8QB1QZ948J4B8TNK5V8	variant_01HQN9B8RY1NAR9NR3TSTW2AKV	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N
optval_01HQN9B8WX19HHQWETB2SD5W12	S	opt_01HQN9B8TPT66H28G1Z81E3KRK	variant_01HQN9B8WXJFP5GHR06K502XKH	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N
optval_01HQN9B8WXDXA2YBT97BKJQNCX	M	opt_01HQN9B8TPT66H28G1Z81E3KRK	variant_01HQN9B8WXKQPYBZZHNVJ7S3EG	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N
optval_01HQN9B8WY6XP4TWGY790QRHXS	L	opt_01HQN9B8TPT66H28G1Z81E3KRK	variant_01HQN9B8WY6A1NENPFMP9HFEDC	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N
optval_01HQN9B8WYRC8AQFYCTY9ZFSDY	XL	opt_01HQN9B8TPT66H28G1Z81E3KRK	variant_01HQN9B8WYVS12YEXYDNAPGHX6	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N
optval_01HQN9B8XT537CMFAJ78FEAWKS	S	opt_01HQN9B8W0D81H7APYHRCZFGZE	variant_01HQN9B8XSMGBMAHHNW2VTDDWF	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N
optval_01HQN9B8XTG839T3FZ1DRKV0JV	M	opt_01HQN9B8W0D81H7APYHRCZFGZE	variant_01HQN9B8XTC5Y86CQAHNQ4YRFV	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N
optval_01HQN9B8XV38KEN4SBM0XSVWFW	L	opt_01HQN9B8W0D81H7APYHRCZFGZE	variant_01HQN9B8XVD3ADTF04YT9TVGDW	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N
optval_01HQN9B8XVV7V7J814564T5QAQ	XL	opt_01HQN9B8W0D81H7APYHRCZFGZE	variant_01HQN9B8XVV0787CT9D5W87GE0	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N
optval_01HQN9B90SPM933PJY423CNYA2	S	opt_01HQN9B8Z38VFYM97F7EV1XV29	variant_01HQN9B90R0N64864TSVJZW68R	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N
optval_01HQN9B90SEJXNA4E2HFX1R42T	M	opt_01HQN9B8Z38VFYM97F7EV1XV29	variant_01HQN9B90SF0HNC808ZAET08AP	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N
optval_01HQN9B90T1JX8HPKM883QQJF5	L	opt_01HQN9B8Z38VFYM97F7EV1XV29	variant_01HQN9B90TQYJ2GC9XV3XYZFKH	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N
optval_01HQN9B90TQF1F4Z0JN8KGABKG	XL	opt_01HQN9B8Z38VFYM97F7EV1XV29	variant_01HQN9B90TXDQPH4ABJ005HRF9	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N
optval_01HQN9B93M763B461HMQBDH94S	S	opt_01HQN9B933BTY4AREA5603EJAA	variant_01HQN9B93M4PX8DMJPEVV06QG6	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00	\N	\N
optval_01HQN9B93NDBQ02NRRQ9A9N96N	M	opt_01HQN9B933BTY4AREA5603EJAA	variant_01HQN9B93N9J5SMVY8BD0BVZYR	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00	\N	\N
optval_01HQN9B93NTEHZX5ZTV34ZCW4S	L	opt_01HQN9B933BTY4AREA5603EJAA	variant_01HQN9B93NT58P7CQ0R3DMEGVY	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00	\N	\N
optval_01HQN9B93PME8VY6664XHNJM9Y	XL	opt_01HQN9B933BTY4AREA5603EJAA	variant_01HQN9B93PQBZ1W1TPA0S874AV	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00	\N	\N
optval_01HQN9B9AB8HTJ0CGSMVSBKMSF	One Size	opt_01HQN9B99R02MQQ63JH8MVMN3N	variant_01HQN9B9ABYMQF4MBX9DR25MYS	2024-02-27 12:41:32.199539+00	2024-02-27 12:41:32.199539+00	\N	\N
\.


--
-- Data for Name: product_sales_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_sales_channel (product_id, sales_channel_id) FROM stdin;
prod_01HQN9B8PY03B13868WVDPMTHQ	sc_01HQMZBCGP5QQSTSA504EH8YRK
prod_01HQN9B8Q1KRVZ8807VFRNDF7E	sc_01HQMZBCGP5QQSTSA504EH8YRK
prod_01HQN9B8SZTESNCC6SQ8ANEVAA	sc_01HQMZBCGP5QQSTSA504EH8YRK
prod_01HQN9B8TJASMQS1SG1T7SQB1D	sc_01HQMZBCGP5QQSTSA504EH8YRK
prod_01HQN9B8Y882R3TGZXFATCJ95D	sc_01HQMZBCGP5QQSTSA504EH8YRK
prod_01HQN9B92WJP0331GNHJ9FKY5F	sc_01HQMZBCGP5QQSTSA504EH8YRK
prod_01HQN9B99J8TX1YRTHZSG1EWSY	sc_01HQMZBCGP5QQSTSA504EH8YRK
\.


--
-- Data for Name: product_shipping_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_shipping_profile (profile_id, product_id) FROM stdin;
sp_01HQMZBCG5EEZ7BP5GSN9YQMCY	prod_01HQN9B8PY03B13868WVDPMTHQ
sp_01HQMZBCG5EEZ7BP5GSN9YQMCY	prod_01HQN9B8Q1KRVZ8807VFRNDF7E
sp_01HQMZBCG5EEZ7BP5GSN9YQMCY	prod_01HQN9B8SZTESNCC6SQ8ANEVAA
sp_01HQMZBCG5EEZ7BP5GSN9YQMCY	prod_01HQN9B8TJASMQS1SG1T7SQB1D
sp_01HQMZBCG5EEZ7BP5GSN9YQMCY	prod_01HQN9B8Y882R3TGZXFATCJ95D
sp_01HQMZBCG5EEZ7BP5GSN9YQMCY	prod_01HQN9B92WJP0331GNHJ9FKY5F
sp_01HQMZBCG5EEZ7BP5GSN9YQMCY	prod_01HQN9B99J8TX1YRTHZSG1EWSY
\.


--
-- Data for Name: product_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_tag (id, value, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: product_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_tags (product_id, product_tag_id) FROM stdin;
\.


--
-- Data for Name: product_tax_rate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_tax_rate (product_id, rate_id, created_at, updated_at, metadata) FROM stdin;
\.


--
-- Data for Name: product_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_type (id, value, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: product_type_tax_rate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_type_tax_rate (product_type_id, rate_id, created_at, updated_at, metadata) FROM stdin;
\.


--
-- Data for Name: product_variant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variant (id, title, product_id, sku, barcode, ean, upc, inventory_quantity, allow_backorder, manage_inventory, hs_code, origin_country, mid_code, material, weight, length, height, width, created_at, updated_at, deleted_at, metadata, variant_rank) FROM stdin;
variant_01HQN9B8RG1PZ3912NM29HC66N	S	prod_01HQN9B8Q1KRVZ8807VFRNDF7E	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N	0
variant_01HQN9B8RPHSJNSXQCCJCG398M	S / Black	prod_01HQN9B8PY03B13868WVDPMTHQ	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	0
variant_01HQN9B8RHYTQSM22R1S9EJHXA	M	prod_01HQN9B8Q1KRVZ8807VFRNDF7E	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N	1
variant_01HQN9B8RQ0P308QN27385QR3G	S / White	prod_01HQN9B8PY03B13868WVDPMTHQ	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	1
variant_01HQN9B8RKKKKP48JG4DJ5M073	L	prod_01HQN9B8Q1KRVZ8807VFRNDF7E	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N	2
variant_01HQN9B8RR3E0VHHQPF37FJE3M	M / Black	prod_01HQN9B8PY03B13868WVDPMTHQ	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	2
variant_01HQN9B8RKRJ15M7XK9PSVX3MT	XL	prod_01HQN9B8Q1KRVZ8807VFRNDF7E	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00	\N	\N	3
variant_01HQN9B8RSR6G0A1DEX0G5KAYN	M / White	prod_01HQN9B8PY03B13868WVDPMTHQ	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	3
variant_01HQN9B8RTXVC88TC1MX1G0J7S	L / Black	prod_01HQN9B8PY03B13868WVDPMTHQ	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	4
variant_01HQN9B8RTVYC1XQH3J0AR97F8	L / White	prod_01HQN9B8PY03B13868WVDPMTHQ	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	5
variant_01HQN9B8RXV642P7QCAAMPMBJV	XL / Black	prod_01HQN9B8PY03B13868WVDPMTHQ	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	6
variant_01HQN9B8RY1NAR9NR3TSTW2AKV	XL / White	prod_01HQN9B8PY03B13868WVDPMTHQ	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00	\N	\N	7
variant_01HQN9B8WXJFP5GHR06K502XKH	S	prod_01HQN9B8SZTESNCC6SQ8ANEVAA	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N	0
variant_01HQN9B8WXKQPYBZZHNVJ7S3EG	M	prod_01HQN9B8SZTESNCC6SQ8ANEVAA	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N	1
variant_01HQN9B8WY6A1NENPFMP9HFEDC	L	prod_01HQN9B8SZTESNCC6SQ8ANEVAA	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N	2
variant_01HQN9B8WYVS12YEXYDNAPGHX6	XL	prod_01HQN9B8SZTESNCC6SQ8ANEVAA	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00	\N	\N	3
variant_01HQN9B8XSMGBMAHHNW2VTDDWF	S	prod_01HQN9B8TJASMQS1SG1T7SQB1D	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N	0
variant_01HQN9B8XTC5Y86CQAHNQ4YRFV	M	prod_01HQN9B8TJASMQS1SG1T7SQB1D	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N	1
variant_01HQN9B8XVD3ADTF04YT9TVGDW	L	prod_01HQN9B8TJASMQS1SG1T7SQB1D	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N	2
variant_01HQN9B8XVV0787CT9D5W87GE0	XL	prod_01HQN9B8TJASMQS1SG1T7SQB1D	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00	\N	\N	3
variant_01HQN9B90R0N64864TSVJZW68R	S	prod_01HQN9B8Y882R3TGZXFATCJ95D	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N	0
variant_01HQN9B90SF0HNC808ZAET08AP	M	prod_01HQN9B8Y882R3TGZXFATCJ95D	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N	1
variant_01HQN9B90TQYJ2GC9XV3XYZFKH	L	prod_01HQN9B8Y882R3TGZXFATCJ95D	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N	2
variant_01HQN9B90TXDQPH4ABJ005HRF9	XL	prod_01HQN9B8Y882R3TGZXFATCJ95D	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00	\N	\N	3
variant_01HQN9B93N9J5SMVY8BD0BVZYR	M	prod_01HQN9B92WJP0331GNHJ9FKY5F	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00	\N	\N	1
variant_01HQN9B93NT58P7CQ0R3DMEGVY	L	prod_01HQN9B92WJP0331GNHJ9FKY5F	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00	\N	\N	2
variant_01HQN9B93PQBZ1W1TPA0S874AV	XL	prod_01HQN9B92WJP0331GNHJ9FKY5F	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00	\N	\N	3
variant_01HQN9B9ABYMQF4MBX9DR25MYS	One Size	prod_01HQN9B99J8TX1YRTHZSG1EWSY	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:32.199539+00	2024-02-27 12:41:32.199539+00	\N	\N	0
variant_01HQN9B93M4PX8DMJPEVV06QG6	S	prod_01HQN9B92WJP0331GNHJ9FKY5F	\N	\N	\N	\N	99	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-02-27 12:41:31.892699+00	2024-03-01 13:02:25.83614+00	\N	\N	0
\.


--
-- Data for Name: product_variant_inventory_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variant_inventory_item (id, created_at, updated_at, inventory_item_id, variant_id, required_quantity, deleted_at) FROM stdin;
\.


--
-- Data for Name: product_variant_money_amount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variant_money_amount (id, money_amount_id, variant_id, deleted_at, created_at, updated_at) FROM stdin;
pvma__01HQN9B8TMWJ54KAH63SD7YK8J	ma_01HQN9B8TDWA8K2EPHQ0VB98TE	variant_01HQN9B8RG1PZ3912NM29HC66N	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00
pvma__01HQN9B8TMTQN81E7HQ3BRA7KH	ma_01HQN9B8TD4XJWPRJZNDWFM6CH	variant_01HQN9B8RG1PZ3912NM29HC66N	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00
pvma__01HQN9B8TMRR6FV5097Q6K0B4Y	ma_01HQN9B8TD97QNH7TMT0E546Z5	variant_01HQN9B8RHYTQSM22R1S9EJHXA	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00
pvma__01HQN9B8TMW9WS5F8Y4XDYQQY9	ma_01HQN9B8TDG9J4JZ8SE7WYC6XQ	variant_01HQN9B8RHYTQSM22R1S9EJHXA	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00
pvma__01HQN9B8TMM2HRZXMFHPXZNWX9	ma_01HQN9B8TE5CRZ4HDQH5YQP8P3	variant_01HQN9B8RKKKKP48JG4DJ5M073	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00
pvma__01HQN9B8TM1F03HQQ5RVGGANGQ	ma_01HQN9B8TEDPTFM089RGG253HC	variant_01HQN9B8RKKKKP48JG4DJ5M073	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00
pvma__01HQN9B8TMN6VGKQ94YMHNCYQM	ma_01HQN9B8TE2YTZDBNAC439SQKJ	variant_01HQN9B8RKRJ15M7XK9PSVX3MT	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00
pvma__01HQN9B8TMG3Y1P016SB0B361A	ma_01HQN9B8TEBWNED3PP0VQHTZKV	variant_01HQN9B8RKRJ15M7XK9PSVX3MT	\N	2024-02-27 12:41:31.596807+00	2024-02-27 12:41:31.596807+00
pvma__01HQN9B8WR91CX454TD8NDEEPE	ma_01HQN9B8WKWFFZVX42NR17BCQY	variant_01HQN9B8RPHSJNSXQCCJCG398M	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00
pvma__01HQN9B8WR8VRJYEPY5844GK7K	ma_01HQN9B8WKBW82NTYD8BTMT0EV	variant_01HQN9B8RPHSJNSXQCCJCG398M	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00
pvma__01HQN9B8WRD89BFCQRY6X0R5CS	ma_01HQN9B8WK1T9P8XN7X52JA9Y9	variant_01HQN9B8RQ0P308QN27385QR3G	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00
pvma__01HQN9B8WSFYXHV1N1EE9X0P6W	ma_01HQN9B8WK6Z4SXQE540KKFD9S	variant_01HQN9B8RQ0P308QN27385QR3G	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00
pvma__01HQN9B8WS9HND1SNPWEEFEFF2	ma_01HQN9B8WKSN8FCX6QG8DZKYNQ	variant_01HQN9B8RR3E0VHHQPF37FJE3M	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00
pvma__01HQN9B8WSTTJ0QVNFG43Q7JY0	ma_01HQN9B8WKS9YCHH14TD8F4XVF	variant_01HQN9B8RR3E0VHHQPF37FJE3M	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00
pvma__01HQN9B8WSDW1X01V8098TYFYZ	ma_01HQN9B8WK35VF62V04968MJKJ	variant_01HQN9B8RSR6G0A1DEX0G5KAYN	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00
pvma__01HQN9B8WSFB6X7RV646WMQJY8	ma_01HQN9B8WK2PE06RDQV374ZKC5	variant_01HQN9B8RSR6G0A1DEX0G5KAYN	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00
pvma__01HQN9B8WSRQ95YFVQH4HTH4JJ	ma_01HQN9B8WKRE3CPZC5W4W7NJ8Z	variant_01HQN9B8RTXVC88TC1MX1G0J7S	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00
pvma__01HQN9B8WSJ9MDBXY3DSVAMAAB	ma_01HQN9B8WKMJ4ENN48QCWDWQH3	variant_01HQN9B8RTXVC88TC1MX1G0J7S	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00
pvma__01HQN9B8WSE17PKAYVY2RHHKQQ	ma_01HQN9B8WKJGBF1GDB94353XWJ	variant_01HQN9B8RTVYC1XQH3J0AR97F8	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00
pvma__01HQN9B8WSKJ32M0ZNAQ0FJSGW	ma_01HQN9B8WM1RKVVJ867BC75SQR	variant_01HQN9B8RTVYC1XQH3J0AR97F8	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00
pvma__01HQN9B8WSP7VMS1AZK3YN0BK9	ma_01HQN9B8WM9GQ21M42NWJYJM1A	variant_01HQN9B8RXV642P7QCAAMPMBJV	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00
pvma__01HQN9B8WSPMW05XNKWX83CVTH	ma_01HQN9B8WMPH43VBFCXV743MSF	variant_01HQN9B8RXV642P7QCAAMPMBJV	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00
pvma__01HQN9B8WSRYE41XVQ7VPNDZK0	ma_01HQN9B8WM50EN5VH7T8BRFNPB	variant_01HQN9B8RY1NAR9NR3TSTW2AKV	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00
pvma__01HQN9B8WTKV4MXFFV48VT6FR6	ma_01HQN9B8WMWP17EDY3VYYC65ZS	variant_01HQN9B8RY1NAR9NR3TSTW2AKV	\N	2024-02-27 12:41:31.590441+00	2024-02-27 12:41:31.590441+00
pvma__01HQN9B8ZCBM8FW3286QC8G5HP	ma_01HQN9B8Z66KY8XSWKJ224H17W	variant_01HQN9B8WXJFP5GHR06K502XKH	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00
pvma__01HQN9B8ZC9KB0R0FB5VT1K31J	ma_01HQN9B8Z6Z4HH80YKF4EYZAFK	variant_01HQN9B8WXJFP5GHR06K502XKH	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00
pvma__01HQN9B8ZCT8ABSJ5M3MQ1M6BF	ma_01HQN9B8Z6PRH694BKAZN4X6YQ	variant_01HQN9B8WXKQPYBZZHNVJ7S3EG	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00
pvma__01HQN9B8ZCQ5Y4WJ5SBH4DAEH0	ma_01HQN9B8Z66FB09NJD203W7FWX	variant_01HQN9B8WXKQPYBZZHNVJ7S3EG	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00
pvma__01HQN9B8ZCRFN3D5PVDSS57Y87	ma_01HQN9B8Z62VFCAZP0NH6NHDF7	variant_01HQN9B8WY6A1NENPFMP9HFEDC	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00
pvma__01HQN9B8ZCGE33M4PQ00RP7YA8	ma_01HQN9B8Z6EVPRHXZMT1MPA454	variant_01HQN9B8WY6A1NENPFMP9HFEDC	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00
pvma__01HQN9B8ZCKMMJVAMRWKWSVXQR	ma_01HQN9B8Z6MR2RE9XWMJ75SMPW	variant_01HQN9B8WYVS12YEXYDNAPGHX6	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00
pvma__01HQN9B8ZCQQTE9AA5V4T9N1A3	ma_01HQN9B8Z7FMFRJZP416H0YE4V	variant_01HQN9B8WYVS12YEXYDNAPGHX6	\N	2024-02-27 12:41:31.647594+00	2024-02-27 12:41:31.647594+00
pvma__01HQN9B903FC3T5GCCVDQ8PD57	ma_01HQN9B8ZVE1SV9HJ3F2S4CQ4J	variant_01HQN9B8XSMGBMAHHNW2VTDDWF	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00
pvma__01HQN9B90350YTHFMXZE54NWQB	ma_01HQN9B8ZV63P7J6HT6PEWXXZZ	variant_01HQN9B8XSMGBMAHHNW2VTDDWF	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00
pvma__01HQN9B9030HAF9TVW7Q4X0BJD	ma_01HQN9B8ZVV09FR0YMXH9PEX24	variant_01HQN9B8XTC5Y86CQAHNQ4YRFV	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00
pvma__01HQN9B903T1G8MQZPYGGNCMFV	ma_01HQN9B8ZVK9BCRA9DHV0BBZTQ	variant_01HQN9B8XTC5Y86CQAHNQ4YRFV	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00
pvma__01HQN9B9035A23CFW6061HSRC6	ma_01HQN9B8ZVR6WE5RN0ZNXHVGHZ	variant_01HQN9B8XVD3ADTF04YT9TVGDW	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00
pvma__01HQN9B9036M42KVMMNQKDQRDY	ma_01HQN9B8ZVWHY5DMPT5KN7TCVM	variant_01HQN9B8XVD3ADTF04YT9TVGDW	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00
pvma__01HQN9B903QSPKKSD7CYX75RSX	ma_01HQN9B8ZVGNPVZ7JZNRBTSWY7	variant_01HQN9B8XVV0787CT9D5W87GE0	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00
pvma__01HQN9B9032BH2AN20RNZWASF9	ma_01HQN9B8ZV8RVNMHQW4AR2YGQ5	variant_01HQN9B8XVV0787CT9D5W87GE0	\N	2024-02-27 12:41:31.688523+00	2024-02-27 12:41:31.688523+00
pvma__01HQN9B93J5SXX70M4686PXXTN	ma_01HQN9B93E0TB8PM8SZD0DHVAW	variant_01HQN9B90R0N64864TSVJZW68R	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00
pvma__01HQN9B93JC2CNBGY4MKSF7015	ma_01HQN9B93FCVHXD9TDGEYZYEEM	variant_01HQN9B90R0N64864TSVJZW68R	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00
pvma__01HQN9B93JJPNPXMY38XY9HSV7	ma_01HQN9B93FBAXF7C0ZAF9XDABE	variant_01HQN9B90SF0HNC808ZAET08AP	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00
pvma__01HQN9B93J0RP180A720V4QYK5	ma_01HQN9B93F1NS0C1YK9TF0AD4R	variant_01HQN9B90SF0HNC808ZAET08AP	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00
pvma__01HQN9B93JF1Z1D75NERQ6ZB9X	ma_01HQN9B93FW3Z1Q54NSZKZH3YS	variant_01HQN9B90TQYJ2GC9XV3XYZFKH	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00
pvma__01HQN9B93J0F9Y7VRWRHJF166D	ma_01HQN9B93FARZZSGP2GHNXXCXN	variant_01HQN9B90TQYJ2GC9XV3XYZFKH	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00
pvma__01HQN9B93J36D6KQ5XP2W9F5VD	ma_01HQN9B93F8W4MASW8KGA4H8JK	variant_01HQN9B90TXDQPH4ABJ005HRF9	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00
pvma__01HQN9B93JC5KCP4DDS5AG6TTY	ma_01HQN9B93F0MZ1W944EN4HCJAV	variant_01HQN9B90TXDQPH4ABJ005HRF9	\N	2024-02-27 12:41:31.781218+00	2024-02-27 12:41:31.781218+00
pvma__01HQN9B94QK62CT9QEW9N4FHJM	ma_01HQN9B94KF65A1VHYY80JCVQK	variant_01HQN9B93M4PX8DMJPEVV06QG6	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00
pvma__01HQN9B94QX14T66ZBCR68SVN5	ma_01HQN9B94KGFMDDX62ERAN37YJ	variant_01HQN9B93M4PX8DMJPEVV06QG6	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00
pvma__01HQN9B94QGH5B1D4R3KMWKAW6	ma_01HQN9B94KTSKM6KSPR835QNSC	variant_01HQN9B93N9J5SMVY8BD0BVZYR	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00
pvma__01HQN9B94QMHDK9AQ66865TRYV	ma_01HQN9B94KRV4WFEMSC2NQFYD3	variant_01HQN9B93N9J5SMVY8BD0BVZYR	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00
pvma__01HQN9B94Q3707X0KWZVM8FWCC	ma_01HQN9B94K3M8RTR6YF7C1QYPD	variant_01HQN9B93NT58P7CQ0R3DMEGVY	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00
pvma__01HQN9B94QXVE61HV6FKJSMN78	ma_01HQN9B94KXQ4J56YCMPYS0R74	variant_01HQN9B93NT58P7CQ0R3DMEGVY	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00
pvma__01HQN9B94QRVP3J70SZ4QA2DQX	ma_01HQN9B94MZEXY81QGAMSXYAS2	variant_01HQN9B93PQBZ1W1TPA0S874AV	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00
pvma__01HQN9B94QPMF9N8MTJNW9DZ63	ma_01HQN9B94M3Q5P6S3PNBTA3ZH0	variant_01HQN9B93PQBZ1W1TPA0S874AV	\N	2024-02-27 12:41:31.892699+00	2024-02-27 12:41:31.892699+00
pvma__01HQN9B9APSQDQ0CTJ2B4WQTN3	ma_01HQN9B9AMXG07GZNQYDFKD5PP	variant_01HQN9B9ABYMQF4MBX9DR25MYS	\N	2024-02-27 12:41:32.199539+00	2024-02-27 12:41:32.199539+00
pvma__01HQN9B9AQR8HCH5WKT5ZRXT5B	ma_01HQN9B9AMQKC604SVZCYB879T	variant_01HQN9B9ABYMQF4MBX9DR25MYS	\N	2024-02-27 12:41:32.199539+00	2024-02-27 12:41:32.199539+00
\.


--
-- Data for Name: publishable_api_key; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publishable_api_key (id, created_at, updated_at, created_by, revoked_by, revoked_at, title) FROM stdin;
pk_01HQMZBJM1QJ7JPKFCKBEBK0HG	2024-02-27 09:46:55.818019+00	2024-02-27 09:46:55.818019+00		\N	\N	Development
\.


--
-- Data for Name: publishable_api_key_sales_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publishable_api_key_sales_channel (sales_channel_id, publishable_key_id, id, created_at, updated_at, deleted_at) FROM stdin;
sc_01HQMZBCGP5QQSTSA504EH8YRK	pk_01HQMZBJM1QJ7JPKFCKBEBK0HG	pksc_01HQMZBJM4M3VAMFC2R4WEBYNA	2024-02-27 09:46:56.003394+00	2024-02-27 09:46:56.003394+00	\N
\.


--
-- Data for Name: refund; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refund (id, order_id, amount, note, reason, created_at, updated_at, metadata, idempotency_key, payment_id) FROM stdin;
\.


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region (id, name, currency_code, tax_rate, tax_code, created_at, updated_at, deleted_at, metadata, gift_cards_taxable, automatic_taxes, tax_provider_id) FROM stdin;
reg_01HQMZBJHC78ZNB7H2FX6DHRMZ	EU	eur	0	\N	2024-02-27 09:46:55.818019+00	2024-02-27 09:46:55.818019+00	\N	\N	t	t	\N
reg_01HQMZBJJ440Q50AAN9DGCKD4D	NA	usd	0	\N	2024-02-27 09:46:55.818019+00	2024-02-27 09:46:55.818019+00	\N	\N	t	t	\N
\.


--
-- Data for Name: region_fulfillment_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region_fulfillment_providers (region_id, provider_id) FROM stdin;
reg_01HQMZBJHC78ZNB7H2FX6DHRMZ	manual
reg_01HQMZBJJ440Q50AAN9DGCKD4D	manual
\.


--
-- Data for Name: region_payment_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region_payment_providers (region_id, provider_id) FROM stdin;
reg_01HQMZBJHC78ZNB7H2FX6DHRMZ	manual
reg_01HQMZBJJ440Q50AAN9DGCKD4D	manual
\.


--
-- Data for Name: return; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.return (id, status, swap_id, order_id, shipping_data, refund_amount, received_at, created_at, updated_at, metadata, idempotency_key, claim_order_id, no_notification, location_id) FROM stdin;
\.


--
-- Data for Name: return_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.return_item (return_id, item_id, quantity, is_requested, requested_quantity, received_quantity, metadata, reason_id, note) FROM stdin;
\.


--
-- Data for Name: return_reason; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.return_reason (id, value, label, description, created_at, updated_at, deleted_at, metadata, parent_return_reason_id) FROM stdin;
\.


--
-- Data for Name: sales_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_channel (id, created_at, updated_at, deleted_at, name, description, is_disabled, metadata) FROM stdin;
sc_01HQMZBCGP5QQSTSA504EH8YRK	2024-02-27 09:46:49.662808+00	2024-02-27 09:46:49.662808+00	\N	Default Sales Channel	Created by Medusa	f	\N
sc_01HQTDQPH9Q76CATEWP307NV6Z	2024-02-29 12:34:25.447391+00	2024-02-29 12:34:25.447391+00	\N	Gagi team	great team	f	\N
\.


--
-- Data for Name: sales_channel_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_channel_location (id, created_at, updated_at, sales_channel_id, location_id, deleted_at) FROM stdin;
\.


--
-- Data for Name: shipping_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_method (id, shipping_option_id, order_id, cart_id, swap_id, return_id, price, data, claim_order_id) FROM stdin;
sm_01HQX1QFCTP7PGDN9YSV8YR660	so_01HQMZBJKD5AW5BMRB2QQEQ4GE	order_01HQX1QPKA077BCA23QT8PXTNT	cart_01HQTDG47YT72RAM8TAN51GQ6Q	\N	\N	800	{}	\N
\.


--
-- Data for Name: shipping_method_tax_line; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_method_tax_line (id, rate, name, code, created_at, updated_at, metadata, shipping_method_id) FROM stdin;
smtl_01HQX1QPFG5B14EXV1909N4HP5	0	default	default	2024-03-01 13:02:25.76106+00	2024-03-01 13:02:25.83614+00	\N	sm_01HQX1QFCTP7PGDN9YSV8YR660
\.


--
-- Data for Name: shipping_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_option (id, name, region_id, profile_id, provider_id, price_type, amount, is_return, data, created_at, updated_at, deleted_at, metadata, admin_only) FROM stdin;
so_01HQMZBJJQNFF64QNQ5AQTNJYR	PostFake Standard	reg_01HQMZBJHC78ZNB7H2FX6DHRMZ	sp_01HQMZBCG5EEZ7BP5GSN9YQMCY	manual	flat_rate	1000	f	{"id": "manual-fulfillment"}	2024-02-27 09:46:55.818019+00	2024-02-27 09:46:55.818019+00	\N	\N	f
so_01HQMZBJJX6GXK6K3MFQ09C1X3	PostFake Express	reg_01HQMZBJHC78ZNB7H2FX6DHRMZ	sp_01HQMZBCG5EEZ7BP5GSN9YQMCY	manual	flat_rate	1500	f	{"id": "manual-fulfillment"}	2024-02-27 09:46:55.818019+00	2024-02-27 09:46:55.818019+00	\N	\N	f
so_01HQMZBJK3AVHMCTYVVDZM2GNC	PostFake Return	reg_01HQMZBJHC78ZNB7H2FX6DHRMZ	sp_01HQMZBCG5EEZ7BP5GSN9YQMCY	manual	flat_rate	1000	t	{"id": "manual-fulfillment"}	2024-02-27 09:46:55.818019+00	2024-02-27 09:46:55.818019+00	\N	\N	f
so_01HQMZBJK8A05T8DYWDKGC3S63	I want to return it myself	reg_01HQMZBJHC78ZNB7H2FX6DHRMZ	sp_01HQMZBCG5EEZ7BP5GSN9YQMCY	manual	flat_rate	0	t	{"id": "manual-fulfillment"}	2024-02-27 09:46:55.818019+00	2024-02-27 09:46:55.818019+00	\N	\N	f
so_01HQMZBJKD5AW5BMRB2QQEQ4GE	FakeEx Standard	reg_01HQMZBJJ440Q50AAN9DGCKD4D	sp_01HQMZBCG5EEZ7BP5GSN9YQMCY	manual	flat_rate	800	f	{"id": "manual-fulfillment"}	2024-02-27 09:46:55.818019+00	2024-02-27 09:46:55.818019+00	\N	\N	f
so_01HQMZBJKJT8EAY6HATX8P91A2	FakeEx Express	reg_01HQMZBJJ440Q50AAN9DGCKD4D	sp_01HQMZBCG5EEZ7BP5GSN9YQMCY	manual	flat_rate	1200	f	{"id": "manual-fulfillment"}	2024-02-27 09:46:55.818019+00	2024-02-27 09:46:55.818019+00	\N	\N	f
so_01HQMZBJKQ2BTY2FSAA0WNYCQH	FakeEx Return	reg_01HQMZBJJ440Q50AAN9DGCKD4D	sp_01HQMZBCG5EEZ7BP5GSN9YQMCY	manual	flat_rate	800	t	{"id": "manual-fulfillment"}	2024-02-27 09:46:55.818019+00	2024-02-27 09:46:55.818019+00	\N	\N	f
so_01HQMZBJKWF4N2X9V5JVR0RVZ9	I want to return it myself	reg_01HQMZBJJ440Q50AAN9DGCKD4D	sp_01HQMZBCG5EEZ7BP5GSN9YQMCY	manual	flat_rate	0	t	{"id": "manual-fulfillment"}	2024-02-27 09:46:55.818019+00	2024-02-27 09:46:55.818019+00	\N	\N	f
\.


--
-- Data for Name: shipping_option_requirement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_option_requirement (id, shipping_option_id, type, amount, deleted_at) FROM stdin;
\.


--
-- Data for Name: shipping_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_profile (id, name, type, created_at, updated_at, deleted_at, metadata) FROM stdin;
sp_01HQMZBCG5EEZ7BP5GSN9YQMCY	Default Shipping Profile	default	2024-02-27 09:46:49.662808+00	2024-02-27 09:46:49.662808+00	\N	\N
sp_01HQMZBCG8ZHB3R4ACQBZS6PWB	Gift Card Profile	gift_card	2024-02-27 09:46:49.662808+00	2024-02-27 09:46:49.662808+00	\N	\N
\.


--
-- Data for Name: shipping_tax_rate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_tax_rate (shipping_option_id, rate_id, created_at, updated_at, metadata) FROM stdin;
\.


--
-- Data for Name: staged_job; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staged_job (id, event_name, data, options) FROM stdin;
\.


--
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store (id, name, default_currency_code, swap_link_template, created_at, updated_at, metadata, payment_link_template, invite_link_template, default_sales_channel_id, default_location_id) FROM stdin;
store_01HQMZBCER5GCSZJG5Z5SX3HC4	Food Store	kes	\N	2024-02-27 09:46:49.662808+00	2024-02-29 12:32:38.229224+00	\N	\N	\N	sc_01HQMZBCGP5QQSTSA504EH8YRK	\N
\.


--
-- Data for Name: store_currencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_currencies (store_id, currency_code) FROM stdin;
store_01HQMZBCER5GCSZJG5Z5SX3HC4	usd
store_01HQMZBCER5GCSZJG5Z5SX3HC4	eur
store_01HQMZBCER5GCSZJG5Z5SX3HC4	kes
\.


--
-- Data for Name: swap; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.swap (id, fulfillment_status, payment_status, order_id, difference_due, shipping_address_id, cart_id, confirmed_at, created_at, updated_at, deleted_at, metadata, idempotency_key, no_notification, canceled_at, allow_backorder) FROM stdin;
\.


--
-- Data for Name: tax_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_provider (id, is_installed) FROM stdin;
\.


--
-- Data for Name: tax_rate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_rate (id, rate, code, name, region_id, created_at, updated_at, metadata) FROM stdin;
\.


--
-- Data for Name: tracking_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracking_link (id, url, tracking_number, fulfillment_id, created_at, updated_at, deleted_at, metadata, idempotency_key) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, email, first_name, last_name, password_hash, api_token, created_at, updated_at, deleted_at, metadata, role) FROM stdin;
usr_01HQ5X18HBWWVPY9GS7JNQ2PJ	gagidennis@gmail.com	\N	\N	c2NyeXB0AAEAAAABAAAAASlUFJNG0gcdiJqKEnE0zWlnuKUpnI9BBsCTCVYfEGH/w9jIJGHqO2Fff79KiRyX+yZ4UtCuQXVqSa0b6A2cJtaaMQoWHw/ZCVbojQIpGNL6	\N	2024-02-27 10:06:04.564154+00	2024-02-27 10:06:04.564154+00	\N	\N	member
usr_01HQN83EF46BK291P9VGFCK0CN	gagidennis1@gmail.com	\N	\N	c2NyeXB0AAEAAAABAAAAAcHkQdE2V4lUjXaGQt0WkwsTRVdSQPqiMjT7DSGjjBMtK9KNYFaU5OVnDbQRe5wJ0GJXKY1SyaFcqWhaQTsBpLLcAfI+725LoYQS8h9IK1c9	\N	2024-02-27 12:19:46.769594+00	2024-02-27 12:19:46.769594+00	\N	\N	member
\.


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 250, true);


--
-- Name: draft_order_display_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.draft_order_display_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 77, true);


--
-- Name: order_display_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_display_id_seq', 1, true);


--
-- Name: payment_session OneSelected; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_session
    ADD CONSTRAINT "OneSelected" UNIQUE (cart_id, is_selected);


--
-- Name: money_amount PK_022e49a7e21a8dfb820f788778a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.money_amount
    ADD CONSTRAINT "PK_022e49a7e21a8dfb820f788778a" PRIMARY KEY (id);


--
-- Name: notification_provider PK_0425c2423e2ce9fdfd5c23761d9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_provider
    ADD CONSTRAINT "PK_0425c2423e2ce9fdfd5c23761d9" PRIMARY KEY (id);


--
-- Name: store_currencies PK_0f2bff3bccc785c320a4df836de; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_currencies
    ADD CONSTRAINT "PK_0f2bff3bccc785c320a4df836de" PRIMARY KEY (store_id, currency_code);


--
-- Name: order PK_1031171c13130102495201e3e20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "PK_1031171c13130102495201e3e20" PRIMARY KEY (id);


--
-- Name: cart_discounts PK_10bd412c9071ccc0cf555afd9bb; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_discounts
    ADD CONSTRAINT "PK_10bd412c9071ccc0cf555afd9bb" PRIMARY KEY (cart_id, discount_id);


--
-- Name: product_images PK_10de97980da2e939c4c0e8423f2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT "PK_10de97980da2e939c4c0e8423f2" PRIMARY KEY (product_id, image_id);


--
-- Name: product_tag PK_1439455c6528caa94fcc8564fda; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tag
    ADD CONSTRAINT "PK_1439455c6528caa94fcc8564fda" PRIMARY KEY (id);


--
-- Name: discount_regions PK_15974566a8b6e04a7c754e85b75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_regions
    ADD CONSTRAINT "PK_15974566a8b6e04a7c754e85b75" PRIMARY KEY (discount_id, region_id);


--
-- Name: product_variant PK_1ab69c9935c61f7c70791ae0a9f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "PK_1ab69c9935c61f7c70791ae0a9f" PRIMARY KEY (id);


--
-- Name: price_list_customer_groups PK_1afcbe15cc8782dc80c05707df9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_list_customer_groups
    ADD CONSTRAINT "PK_1afcbe15cc8782dc80c05707df9" PRIMARY KEY (price_list_id, customer_group_id);


--
-- Name: product_tags PK_1cf5c9537e7198df494b71b993f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT "PK_1cf5c9537e7198df494b71b993f" PRIMARY KEY (product_id, product_tag_id);


--
-- Name: idempotency_key PK_213f125e14469be304f9ff1d452; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idempotency_key
    ADD CONSTRAINT "PK_213f125e14469be304f9ff1d452" PRIMARY KEY (id);


--
-- Name: cart_gift_cards PK_2389be82bf0ef3635e2014c9ef1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_gift_cards
    ADD CONSTRAINT "PK_2389be82bf0ef3635e2014c9ef1" PRIMARY KEY (cart_id, gift_card_id);


--
-- Name: tax_rate PK_23b71b53f650c0b39e99ccef4fd; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "PK_23b71b53f650c0b39e99ccef4fd" PRIMARY KEY (id);


--
-- Name: product_option_value PK_2ab71ed3b21be5800905c621535; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_value
    ADD CONSTRAINT "PK_2ab71ed3b21be5800905c621535" PRIMARY KEY (id);


--
-- Name: line_item_adjustment PK_2b1360103753df2dc8257c2c8c3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_item_adjustment
    ADD CONSTRAINT "PK_2b1360103753df2dc8257c2c8c3" PRIMARY KEY (id);


--
-- Name: shipping_option PK_2e56fddaa65f3a26d402e5d786e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT "PK_2e56fddaa65f3a26d402e5d786e" PRIMARY KEY (id);


--
-- Name: product_tax_rate PK_326257ce468df46cd5c8c5922e9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tax_rate
    ADD CONSTRAINT "PK_326257ce468df46cd5c8c5922e9" PRIMARY KEY (product_id, rate_id);


--
-- Name: discount_rule_products PK_351c8c92f5d27283c445cd022ee; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_rule_products
    ADD CONSTRAINT "PK_351c8c92f5d27283c445cd022ee" PRIMARY KEY (discount_rule_id, product_id);


--
-- Name: discount_condition_product_type PK_35d538a5a24399d0df978df12ed; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_condition_product_type
    ADD CONSTRAINT "PK_35d538a5a24399d0df978df12ed" PRIMARY KEY (product_type_id, condition_id);


--
-- Name: return_item PK_46409dc1dd5f38509b9000c3069; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_item
    ADD CONSTRAINT "PK_46409dc1dd5f38509b9000c3069" PRIMARY KEY (return_id, item_id);


--
-- Name: order_gift_cards PK_49a8ec66a6625d7c2e3526e05b4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_gift_cards
    ADD CONSTRAINT "PK_49a8ec66a6625d7c2e3526e05b4" PRIMARY KEY (order_id, gift_card_id);


--
-- Name: product_collection PK_49d419fc77d3aed46c835c558ac; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_collection
    ADD CONSTRAINT "PK_49d419fc77d3aed46c835c558ac" PRIMARY KEY (id);


--
-- Name: line_item_tax_line PK_4a0f4322fcd5ce4af85727f89a8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_item_tax_line
    ADD CONSTRAINT "PK_4a0f4322fcd5ce4af85727f89a8" PRIMARY KEY (id);


--
-- Name: swap PK_4a10d0f359339acef77e7f986d9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.swap
    ADD CONSTRAINT "PK_4a10d0f359339acef77e7f986d9" PRIMARY KEY (id);


--
-- Name: product_option PK_4cf3c467e9bc764bdd32c4cd938; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT "PK_4cf3c467e9bc764bdd32c4cd938" PRIMARY KEY (id);


--
-- Name: fulfillment PK_50c102da132afffae660585981f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT "PK_50c102da132afffae660585981f" PRIMARY KEY (id);


--
-- Name: price_list PK_52ea7826468b1c889cb2c28df03; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_list
    ADD CONSTRAINT "PK_52ea7826468b1c889cb2c28df03" PRIMARY KEY (id);


--
-- Name: claim_item_tags PK_54ab8ce0f7e99167068188fbd81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_item_tags
    ADD CONSTRAINT "PK_54ab8ce0f7e99167068188fbd81" PRIMARY KEY (item_id, tag_id);


--
-- Name: shipping_method_tax_line PK_54c94f5908aacbd51cf0a73edb1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method_tax_line
    ADD CONSTRAINT "PK_54c94f5908aacbd51cf0a73edb1" PRIMARY KEY (id);


--
-- Name: claim_item PK_5679662039bc4c7c6bc7fa1be2d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_item
    ADD CONSTRAINT "PK_5679662039bc4c7c6bc7fa1be2d" PRIMARY KEY (id);


--
-- Name: order_edit PK_58ab6acf2e84b4e827f5f846f7a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_edit
    ADD CONSTRAINT "PK_58ab6acf2e84b4e827f5f846f7a" PRIMARY KEY (id);


--
-- Name: region_fulfillment_providers PK_5b7d928a1fb50d6803868cfab3a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region_fulfillment_providers
    ADD CONSTRAINT "PK_5b7d928a1fb50d6803868cfab3a" PRIMARY KEY (region_id, provider_id);


--
-- Name: region PK_5f48ffc3af96bc486f5f3f3a6da; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT "PK_5f48ffc3af96bc486f5f3f3a6da" PRIMARY KEY (id);


--
-- Name: publishable_api_key_sales_channel PK_68eaeb14bdac8954460054c567c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publishable_api_key_sales_channel
    ADD CONSTRAINT "PK_68eaeb14bdac8954460054c567c" PRIMARY KEY (sales_channel_id, publishable_key_id);


--
-- Name: notification PK_705b6c7cdf9b2c2ff7ac7872cb7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "PK_705b6c7cdf9b2c2ff7ac7872cb7" PRIMARY KEY (id);


--
-- Name: currency PK_723472e41cae44beb0763f4039c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT "PK_723472e41cae44beb0763f4039c" PRIMARY KEY (code);


--
-- Name: claim_tag PK_7761180541142a5926501018d34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_tag
    ADD CONSTRAINT "PK_7761180541142a5926501018d34" PRIMARY KEY (id);


--
-- Name: claim_image PK_7c49e44bfe8840ca7d917890101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_image
    ADD CONSTRAINT "PK_7c49e44bfe8840ca7d917890101" PRIMARY KEY (id);


--
-- Name: customer_group PK_88e7da3ff7262d9e0a35aa3664e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_group
    ADD CONSTRAINT "PK_88e7da3ff7262d9e0a35aa3664e" PRIMARY KEY (id);


--
-- Name: onboarding_state PK_891b72628471aada55d7b8c9410; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.onboarding_state
    ADD CONSTRAINT "PK_891b72628471aada55d7b8c9410" PRIMARY KEY (id);


--
-- Name: claim_order PK_8981f5595a4424021466aa4c7a4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_order
    ADD CONSTRAINT "PK_8981f5595a4424021466aa4c7a4" PRIMARY KEY (id);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: custom_shipping_option PK_8dfcb5c1172c29eec4a728420cc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_shipping_option
    ADD CONSTRAINT "PK_8dfcb5c1172c29eec4a728420cc" PRIMARY KEY (id);


--
-- Name: analytics_config PK_93505647c5d7cb479becb810b0f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analytics_config
    ADD CONSTRAINT "PK_93505647c5d7cb479becb810b0f" PRIMARY KEY (id);


--
-- Name: return_reason PK_95fd1172973165790903e65660a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_reason
    ADD CONSTRAINT "PK_95fd1172973165790903e65660a" PRIMARY KEY (id);


--
-- Name: note PK_96d0c172a4fba276b1bbed43058; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT "PK_96d0c172a4fba276b1bbed43058" PRIMARY KEY (id);


--
-- Name: discount_condition_product PK_994eb4529fdbf14450d64ec17e8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_condition_product
    ADD CONSTRAINT "PK_994eb4529fdbf14450d64ec17e8" PRIMARY KEY (product_id, condition_id);


--
-- Name: product_variant_inventory_item PK_9a1188b8d36f4d198303b4f7efa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_inventory_item
    ADD CONSTRAINT "PK_9a1188b8d36f4d198303b4f7efa" PRIMARY KEY (id);


--
-- Name: staged_job PK_9a28fb48c46c5509faf43ac8c8d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staged_job
    ADD CONSTRAINT "PK_9a28fb48c46c5509faf43ac8c8d" PRIMARY KEY (id);


--
-- Name: publishable_api_key PK_9e613278673a87de92c606b4494; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publishable_api_key
    ADD CONSTRAINT "PK_9e613278673a87de92c606b4494" PRIMARY KEY (id);


--
-- Name: region_payment_providers PK_9fa1e69914d3dd752de6b1da407; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region_payment_providers
    ADD CONSTRAINT "PK_9fa1e69914d3dd752de6b1da407" PRIMARY KEY (region_id, provider_id);


--
-- Name: shipping_option_requirement PK_a0ff15442606d9f783602cb23a7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option_requirement
    ADD CONSTRAINT "PK_a0ff15442606d9f783602cb23a7" PRIMARY KEY (id);


--
-- Name: payment_session PK_a1a91b20f7f3b1e5afb5485cbcd; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_session
    ADD CONSTRAINT "PK_a1a91b20f7f3b1e5afb5485cbcd" PRIMARY KEY (id);


--
-- Name: order_discounts PK_a7418714ffceebc125bf6d8fcfe; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_discounts
    ADD CONSTRAINT "PK_a7418714ffceebc125bf6d8fcfe" PRIMARY KEY (order_id, discount_id);


--
-- Name: customer PK_a7a13f4cacb744524e44dfdad32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "PK_a7a13f4cacb744524e44dfdad32" PRIMARY KEY (id);


--
-- Name: discount_condition_product_tag PK_a95382c1e62205b121aa058682b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_condition_product_tag
    ADD CONSTRAINT "PK_a95382c1e62205b121aa058682b" PRIMARY KEY (product_tag_id, condition_id);


--
-- Name: oauth PK_a957b894e50eb16b969c0640a8d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth
    ADD CONSTRAINT "PK_a957b894e50eb16b969c0640a8d" PRIMARY KEY (id);


--
-- Name: discount_rule PK_ac2c280de3701b2d66f6817f760; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_rule
    ADD CONSTRAINT "PK_ac2c280de3701b2d66f6817f760" PRIMARY KEY (id);


--
-- Name: gift_card PK_af4e338d2d41035042843ad641f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gift_card
    ADD CONSTRAINT "PK_af4e338d2d41035042843ad641f" PRIMARY KEY (id);


--
-- Name: sales_channel_location PK_afd2c2c52634bc8280a9c9ee533; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_channel_location
    ADD CONSTRAINT "PK_afd2c2c52634bc8280a9c9ee533" PRIMARY KEY (id);


--
-- Name: tax_provider PK_b198bf82ba6a317c11763d99b99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_provider
    ADD CONSTRAINT "PK_b198bf82ba6a317c11763d99b99" PRIMARY KEY (id);


--
-- Name: discount_condition_product_collection PK_b3508fc787aa4a38705866cbb6d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_condition_product_collection
    ADD CONSTRAINT "PK_b3508fc787aa4a38705866cbb6d" PRIMARY KEY (product_collection_id, condition_id);


--
-- Name: shipping_method PK_b9b0adfad3c6b99229c1e7d4865; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "PK_b9b0adfad3c6b99229c1e7d4865" PRIMARY KEY (id);


--
-- Name: fulfillment_item PK_bc3e8a388de75db146a249922e0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment_item
    ADD CONSTRAINT "PK_bc3e8a388de75db146a249922e0" PRIMARY KEY (fulfillment_id, item_id);


--
-- Name: shipping_tax_rate PK_bcd93b14d7e2695365d383f5eae; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_tax_rate
    ADD CONSTRAINT "PK_bcd93b14d7e2695365d383f5eae" PRIMARY KEY (shipping_option_id, rate_id);


--
-- Name: fulfillment_provider PK_beb35a6de60a6c4f91d5ae57e44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment_provider
    ADD CONSTRAINT "PK_beb35a6de60a6c4f91d5ae57e44" PRIMARY KEY (id);


--
-- Name: product PK_bebc9158e480b949565b4dc7a82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PK_bebc9158e480b949565b4dc7a82" PRIMARY KEY (id);


--
-- Name: country PK_bf6e37c231c4f4ea56dcd887269; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT "PK_bf6e37c231c4f4ea56dcd887269" PRIMARY KEY (id);


--
-- Name: cart PK_c524ec48751b9b5bcfbf6e59be7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "PK_c524ec48751b9b5bcfbf6e59be7" PRIMARY KEY (id);


--
-- Name: shipping_profile PK_c8120e4543a5a3a121f2968a1ec; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_profile
    ADD CONSTRAINT "PK_c8120e4543a5a3a121f2968a1ec" PRIMARY KEY (id);


--
-- Name: return PK_c8ad68d13e76d75d803b5aeebc4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return
    ADD CONSTRAINT "PK_c8ad68d13e76d75d803b5aeebc4" PRIMARY KEY (id);


--
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- Name: line_item PK_cce6b13e67fa506d1d9618ac68b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT "PK_cce6b13e67fa506d1d9618ac68b" PRIMARY KEY (id);


--
-- Name: discount_condition_customer_group PK_cdc8b2277169a16b8b7d4c73e0e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_condition_customer_group
    ADD CONSTRAINT "PK_cdc8b2277169a16b8b7d4c73e0e" PRIMARY KEY (customer_group_id, condition_id);


--
-- Name: gift_card_transaction PK_cfb5b4ba5447a507aef87d73fe7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gift_card_transaction
    ADD CONSTRAINT "PK_cfb5b4ba5447a507aef87d73fe7" PRIMARY KEY (id);


--
-- Name: discount PK_d05d8712e429673e459e7f1cddb; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT "PK_d05d8712e429673e459e7f1cddb" PRIMARY KEY (id);


--
-- Name: sales_channel PK_d1eb0b923ea5a0eb1e0916191f1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_channel
    ADD CONSTRAINT "PK_d1eb0b923ea5a0eb1e0916191f1" PRIMARY KEY (id);


--
-- Name: image PK_d6db1ab4ee9ad9dbe86c64e4cc3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT "PK_d6db1ab4ee9ad9dbe86c64e4cc3" PRIMARY KEY (id);


--
-- Name: order_item_change PK_d6eb138f77ffdee83567b85af0c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item_change
    ADD CONSTRAINT "PK_d6eb138f77ffdee83567b85af0c" PRIMARY KEY (id);


--
-- Name: address PK_d92de1f82754668b5f5f5dd4fd5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "PK_d92de1f82754668b5f5f5dd4fd5" PRIMARY KEY (id);


--
-- Name: product_type_tax_rate PK_ddc9242de1d99bc7674969289f0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type_tax_rate
    ADD CONSTRAINT "PK_ddc9242de1d99bc7674969289f0" PRIMARY KEY (product_type_id, rate_id);


--
-- Name: product_type PK_e0843930fbb8854fe36ca39dae1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type
    ADD CONSTRAINT "PK_e0843930fbb8854fe36ca39dae1" PRIMARY KEY (id);


--
-- Name: customer_group_customers PK_e28a55e34ad1e2d3df9a0ac86d3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_group_customers
    ADD CONSTRAINT "PK_e28a55e34ad1e2d3df9a0ac86d3" PRIMARY KEY (customer_group_id, customer_id);


--
-- Name: batch_job PK_e57f84d485145d5be96bc6d871e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.batch_job
    ADD CONSTRAINT "PK_e57f84d485145d5be96bc6d871e" PRIMARY KEY (id);


--
-- Name: discount_condition PK_e6b81d83133ddc21a2baf2e2204; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_condition
    ADD CONSTRAINT "PK_e6b81d83133ddc21a2baf2e2204" PRIMARY KEY (id);


--
-- Name: payment_provider PK_ea94f42b6c88e9191c3649d7522; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_provider
    ADD CONSTRAINT "PK_ea94f42b6c88e9191c3649d7522" PRIMARY KEY (id);


--
-- Name: refund PK_f1cefa2e60d99b206c46c1116e5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT "PK_f1cefa2e60d99b206c46c1116e5" PRIMARY KEY (id);


--
-- Name: store PK_f3172007d4de5ae8e7692759d79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT "PK_f3172007d4de5ae8e7692759d79" PRIMARY KEY (id);


--
-- Name: draft_order PK_f478946c183d98f8d88a94cfcd7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.draft_order
    ADD CONSTRAINT "PK_f478946c183d98f8d88a94cfcd7" PRIMARY KEY (id);


--
-- Name: invite PK_fc9fa190e5a3c5d80604a4f63e1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invite
    ADD CONSTRAINT "PK_fc9fa190e5a3c5d80604a4f63e1" PRIMARY KEY (id);


--
-- Name: payment PK_fcaec7df5adf9cac408c686b2ab; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT "PK_fcaec7df5adf9cac408c686b2ab" PRIMARY KEY (id);


--
-- Name: tracking_link PK_fcfd77feb9012ec2126d7c0bfb6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracking_link
    ADD CONSTRAINT "PK_fcfd77feb9012ec2126d7c0bfb6" PRIMARY KEY (id);


--
-- Name: product_sales_channel PK_fd29b6a8bd641052628dee19583; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_sales_channel
    ADD CONSTRAINT "PK_fd29b6a8bd641052628dee19583" PRIMARY KEY (product_id, sales_channel_id);


--
-- Name: payment_collection PK_payment_collection_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_collection
    ADD CONSTRAINT "PK_payment_collection_id" PRIMARY KEY (id);


--
-- Name: payment_collection_payments PK_payment_collection_payments; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_collection_payments
    ADD CONSTRAINT "PK_payment_collection_payments" PRIMARY KEY (payment_collection_id, payment_id);


--
-- Name: payment_collection_sessions PK_payment_collection_sessions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_collection_sessions
    ADD CONSTRAINT "PK_payment_collection_sessions" PRIMARY KEY (payment_collection_id, payment_session_id);


--
-- Name: product_variant_money_amount PK_product_variant_money_amount; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_money_amount
    ADD CONSTRAINT "PK_product_variant_money_amount" PRIMARY KEY (id);


--
-- Name: product_category PK_qgguwbn1cwstxk93efl0px9oqwt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT "PK_qgguwbn1cwstxk93efl0px9oqwt" PRIMARY KEY (id);


--
-- Name: shipping_method REL_1d9ad62038998c3a85c77a53cf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "REL_1d9ad62038998c3a85c77a53cf" UNIQUE (return_id);


--
-- Name: swap REL_402e8182bc553e082f6380020b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.swap
    ADD CONSTRAINT "REL_402e8182bc553e082f6380020b" UNIQUE (cart_id);


--
-- Name: draft_order REL_5bd11d0e2a9628128e2c26fd0a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.draft_order
    ADD CONSTRAINT "REL_5bd11d0e2a9628128e2c26fd0a" UNIQUE (cart_id);


--
-- Name: order_item_change REL_5f9688929761f7df108b630e64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item_change
    ADD CONSTRAINT "REL_5f9688929761f7df108b630e64" UNIQUE (line_item_id);


--
-- Name: customer REL_8abe81b9aac151ae60bf507ad1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "REL_8abe81b9aac151ae60bf507ad1" UNIQUE (billing_address_id);


--
-- Name: draft_order REL_8f6dd6c49202f1466ebf21e77d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.draft_order
    ADD CONSTRAINT "REL_8f6dd6c49202f1466ebf21e77d" UNIQUE (order_id);


--
-- Name: cart REL_9d1a161434c610aae7c3df2dc7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "REL_9d1a161434c610aae7c3df2dc7" UNIQUE (payment_id);


--
-- Name: return REL_bad82d7bff2b08b87094bfac3d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return
    ADD CONSTRAINT "REL_bad82d7bff2b08b87094bfac3d" UNIQUE (swap_id);


--
-- Name: payment REL_c17aff091441b7c25ec3d68d36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT "REL_c17aff091441b7c25ec3d68d36" UNIQUE (swap_id);


--
-- Name: order REL_c99a206eb11ad45f6b7f04f2dc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "REL_c99a206eb11ad45f6b7f04f2dc" UNIQUE (cart_id);


--
-- Name: custom_shipping_option UQ_0f838b122a9a01d921aa1cdb669; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_shipping_option
    ADD CONSTRAINT "UQ_0f838b122a9a01d921aa1cdb669" UNIQUE (shipping_option_id, cart_id);


--
-- Name: line_item_tax_line UQ_3c2af51043ed7243e7d9775a2ad; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_item_tax_line
    ADD CONSTRAINT "UQ_3c2af51043ed7243e7d9775a2ad" UNIQUE (item_id, code);


--
-- Name: order_item_change UQ_5b7a99181e4db2ea821be0b6196; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item_change
    ADD CONSTRAINT "UQ_5b7a99181e4db2ea821be0b6196" UNIQUE (order_edit_id, original_line_item_id);


--
-- Name: store UQ_61b0f48cccbb5f41c750bac7286; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT "UQ_61b0f48cccbb5f41c750bac7286" UNIQUE (default_sales_channel_id);


--
-- Name: return UQ_71773d56eb2bacb922bc3283398; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return
    ADD CONSTRAINT "UQ_71773d56eb2bacb922bc3283398" UNIQUE (claim_order_id);


--
-- Name: order UQ_727b872f86c7378474a8fa46147; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "UQ_727b872f86c7378474a8fa46147" UNIQUE (draft_order_id);


--
-- Name: product_variant_inventory_item UQ_c9be7c1b11a1a729eb51d1b6bca; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant_inventory_item
    ADD CONSTRAINT "UQ_c9be7c1b11a1a729eb51d1b6bca" UNIQUE (variant_id, inventory_item_id);


--
-- Name: shipping_method_tax_line UQ_cd147fca71e50bc954139fa3104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method_tax_line
    ADD CONSTRAINT "UQ_cd147fca71e50bc954139fa3104" UNIQUE (shipping_method_id, code);


--
-- Name: order_item_change UQ_da93cee3ca0dd50a5246268c2e9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item_change
    ADD CONSTRAINT "UQ_da93cee3ca0dd50a5246268c2e9" UNIQUE (order_edit_id, line_item_id);


--
-- Name: customer UQ_unique_email_for_guests_and_customer_accounts; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "UQ_unique_email_for_guests_and_customer_accounts" UNIQUE (email, has_account);


--
-- Name: discount_condition dctypeuniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_condition
    ADD CONSTRAINT dctypeuniq UNIQUE (type, operator, discount_rule_id);


--
-- Name: gift_card_transaction gcuniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gift_card_transaction
    ADD CONSTRAINT gcuniq UNIQUE (gift_card_id, order_id);


--
-- Name: IDX_012a62ba743e427b5ebe9dee18; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_012a62ba743e427b5ebe9dee18" ON public.shipping_option_requirement USING btree (shipping_option_id);


--
-- Name: IDX_01486cc9dc6b36bf658685535f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_01486cc9dc6b36bf658685535f" ON public.discount_condition_product_tag USING btree (product_tag_id);


--
-- Name: IDX_017d58bf8260c6e1a2588d258e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_017d58bf8260c6e1a2588d258e" ON public.claim_order USING btree (shipping_address_id);


--
-- Name: IDX_045d4a149c09f4704e0bc08dd4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_045d4a149c09f4704e0bc08dd4" ON public.product_variant USING btree (barcode) WHERE (deleted_at IS NULL);


--
-- Name: IDX_0fb38b6d167793192bc126d835; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_0fb38b6d167793192bc126d835" ON public.cart_gift_cards USING btree (gift_card_id);


--
-- Name: IDX_0fc1ec4e3db9001ad60c19daf1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_0fc1ec4e3db9001ad60c19daf1" ON public.order_discounts USING btree (discount_id);


--
-- Name: IDX_118e3c48f09a7728f41023c94e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_118e3c48f09a7728f41023c94e" ON public.line_item USING btree (claim_order_id);


--
-- Name: IDX_19b0c6293443d1b464f604c331; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_19b0c6293443d1b464f604c331" ON public."order" USING btree (shipping_address_id);


--
-- Name: IDX_1d04aebeabb6a89f87e536a124; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_1d04aebeabb6a89f87e536a124" ON public.product_tax_rate USING btree (product_id);


--
-- Name: IDX_1d9ad62038998c3a85c77a53cf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_1d9ad62038998c3a85c77a53cf" ON public.shipping_method USING btree (return_id);


--
-- Name: IDX_21683a063fe82dafdf681ecc9c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_21683a063fe82dafdf681ecc9c" ON public.product_tags USING btree (product_tag_id);


--
-- Name: IDX_21cbfedd83d736d86f4c6f4ce5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_21cbfedd83d736d86f4c6f4ce5" ON public.claim_image USING btree (claim_item_id);


--
-- Name: IDX_2212515ba306c79f42c46a99db; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_2212515ba306c79f42c46a99db" ON public.product_images USING btree (image_id);


--
-- Name: IDX_242205c81c1152fab1b6e84847; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_242205c81c1152fab1b6e84847" ON public.cart USING btree (customer_id);


--
-- Name: IDX_2484cf14c437a04586b07e7ddd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_2484cf14c437a04586b07e7ddd" ON public.product_tax_rate USING btree (rate_id);


--
-- Name: IDX_25a3138bb236f63d9bb6c8ff11; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_25a3138bb236f63d9bb6c8ff11" ON public.product_type_tax_rate USING btree (product_type_id);


--
-- Name: IDX_27283ee631862266d0f1c68064; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_27283ee631862266d0f1c68064" ON public.line_item USING btree (cart_id);


--
-- Name: IDX_2ca8cfbdafb998ecfd6d340389; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_2ca8cfbdafb998ecfd6d340389" ON public.product_variant USING btree (sku) WHERE (deleted_at IS NULL);


--
-- Name: IDX_2f41b20a71f30e60471d7e3769; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_2f41b20a71f30e60471d7e3769" ON public.line_item_adjustment USING btree (discount_id);


--
-- Name: IDX_3287f98befad26c3a7dab088cf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_3287f98befad26c3a7dab088cf" ON public.note USING btree (resource_id);


--
-- Name: IDX_346e0016cf045b998074774764; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_346e0016cf045b998074774764" ON public.shipping_tax_rate USING btree (rate_id);


--
-- Name: IDX_37341bad297fe5cca91f921032; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_37341bad297fe5cca91f921032" ON public.product_sales_channel USING btree (sales_channel_id);


--
-- Name: IDX_379ca70338ce9991f3affdeedf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_379ca70338ce9991f3affdeedf" ON public.analytics_config USING btree (id, user_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_37f361c38a18d12a3fa3158d0c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_37f361c38a18d12a3fa3158d0c" ON public.region_fulfillment_providers USING btree (provider_id);


--
-- Name: IDX_3a6947180aeec283cd92c59ebb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_3a6947180aeec283cd92c59ebb" ON public.region_payment_providers USING btree (provider_id);


--
-- Name: IDX_3c6412d076292f439269abe1a2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_3c6412d076292f439269abe1a2" ON public.customer_group_customers USING btree (customer_id);


--
-- Name: IDX_3fa354d8d1233ff81097b2fcb6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_3fa354d8d1233ff81097b2fcb6" ON public.line_item USING btree (swap_id);


--
-- Name: IDX_43a2b24495fe1d9fc2a9c835bc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_43a2b24495fe1d9fc2a9c835bc" ON public.line_item USING btree (order_id);


--
-- Name: IDX_44090cb11b06174cbcc667e91c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_44090cb11b06174cbcc667e91c" ON public.custom_shipping_option USING btree (shipping_option_id);


--
-- Name: IDX_4665f17abc1e81dd58330e5854; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_4665f17abc1e81dd58330e5854" ON public.payment USING btree (cart_id);


--
-- Name: IDX_484c329f4783be4e18e5e2ff09; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_484c329f4783be4e18e5e2ff09" ON public.cart USING btree (region_id);


--
-- Name: IDX_4d5f98645a67545d8dea42e2eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_4d5f98645a67545d8dea42e2eb" ON public.discount_condition_customer_group USING btree (customer_group_id);


--
-- Name: IDX_4e0739e5f0244c08d41174ca08; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_4e0739e5f0244c08d41174ca08" ON public.discount_rule_products USING btree (discount_rule_id);


--
-- Name: IDX_4f166bb8c2bfcef2498d97b406; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_4f166bb8c2bfcef2498d97b406" ON public.product_images USING btree (product_id);


--
-- Name: IDX_5077fa54b0d037e984385dfe8a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_5077fa54b0d037e984385dfe8a" ON public.line_item_tax_line USING btree (item_id);


--
-- Name: IDX_5267705a43d547e232535b656c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_5267705a43d547e232535b656c" ON public.shipping_method USING btree (order_id);


--
-- Name: IDX_52875734e9dd69064f0041f4d9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_52875734e9dd69064f0041f4d9" ON public.price_list_customer_groups USING btree (price_list_id);


--
-- Name: IDX_52dd74e8c989aa5665ad2852b8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_52dd74e8c989aa5665ad2852b8" ON public.swap USING btree (order_id);


--
-- Name: IDX_5371cbaa3be5200f373d24e3d5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_5371cbaa3be5200f373d24e3d5" ON public.line_item USING btree (variant_id);


--
-- Name: IDX_53cb5605fa42e82b4d47b47bda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_53cb5605fa42e82b4d47b47bda" ON public.gift_card USING btree (code);


--
-- Name: IDX_5568d3b9ce9f7abeeb37511ecf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_5568d3b9ce9f7abeeb37511ecf" ON public."order" USING btree (billing_address_id);


--
-- Name: IDX_579e01fb94f4f58db480857e05; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_579e01fb94f4f58db480857e05" ON public."order" USING btree (display_id);


--
-- Name: IDX_5a4d5e1e60f97633547821ec8d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_5a4d5e1e60f97633547821ec8d" ON public.product_sales_channel USING btree (product_id);


--
-- Name: IDX_5b0c6fc53c574299ecc7f9ee22; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_5b0c6fc53c574299ecc7f9ee22" ON public.product_tags USING btree (product_id);


--
-- Name: IDX_5bd11d0e2a9628128e2c26fd0a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_5bd11d0e2a9628128e2c26fd0a" ON public.draft_order USING btree (cart_id);


--
-- Name: IDX_5c58105f1752fca0f4ce69f466; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_5c58105f1752fca0f4ce69f466" ON public.shipping_option USING btree (region_id);


--
-- Name: IDX_620330964db8d2999e67b0dbe3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_620330964db8d2999e67b0dbe3" ON public.customer_group_customers USING btree (customer_group_id);


--
-- Name: IDX_64980511ca32c8e92b417644af; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_64980511ca32c8e92b417644af" ON public.claim_item USING btree (variant_id);


--
-- Name: IDX_6680319ebe1f46d18f106191d5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_6680319ebe1f46d18f106191d5" ON public.cart_discounts USING btree (cart_id);


--
-- Name: IDX_6b0ce4b4bcfd24491510bf19d1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_6b0ce4b4bcfd24491510bf19d1" ON public.invite USING btree (user_email);


--
-- Name: IDX_6b9c66b5e36f7c827dfaa092f9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_6b9c66b5e36f7c827dfaa092f9" ON public.cart USING btree (billing_address_id);


--
-- Name: IDX_6e0cad0daef76bb642675910b9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_6e0cad0daef76bb642675910b9" ON public.claim_item USING btree (item_id);


--
-- Name: IDX_6ef23ce0b1d9cf9b5b833e52b9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_6ef23ce0b1d9cf9b5b833e52b9" ON public.discount_condition_product_type USING btree (condition_id);


--
-- Name: IDX_6f234f058bbbea810dce1d04d0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_6f234f058bbbea810dce1d04d0" ON public.product_collection USING btree (handle) WHERE (deleted_at IS NULL);


--
-- Name: IDX_71773d56eb2bacb922bc328339; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_71773d56eb2bacb922bc328339" ON public.return USING btree (claim_order_id);


--
-- Name: IDX_82a6bbb0b527c20a0002ddcbd6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_82a6bbb0b527c20a0002ddcbd6" ON public.store_currencies USING btree (currency_code);


--
-- Name: IDX_8486ee16e69013c645d0b8716b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_8486ee16e69013c645d0b8716b" ON public.discount_condition_customer_group USING btree (condition_id);


--
-- Name: IDX_8aaa78ba90d3802edac317df86; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_8aaa78ba90d3802edac317df86" ON public.region_payment_providers USING btree (region_id);


--
-- Name: IDX_8abe81b9aac151ae60bf507ad1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_8abe81b9aac151ae60bf507ad1" ON public.customer USING btree (billing_address_id);


--
-- Name: IDX_8df75ef4f35f217768dc113545; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_8df75ef4f35f217768dc113545" ON public.cart_discounts USING btree (discount_id);


--
-- Name: IDX_8f6dd6c49202f1466ebf21e77d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_8f6dd6c49202f1466ebf21e77d" ON public.draft_order USING btree (order_id);


--
-- Name: IDX_900a9c3834257304396b2b0fe7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_900a9c3834257304396b2b0fe7" ON public.claim_item USING btree (claim_order_id);


--
-- Name: IDX_926ca9f29014af8091722dede0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_926ca9f29014af8091722dede0" ON public.shipping_method_tax_line USING btree (shipping_method_id);


--
-- Name: IDX_93caeb1bb70d37c1d36d6701a7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_93caeb1bb70d37c1d36d6701a7" ON public.custom_shipping_option USING btree (cart_id);


--
-- Name: IDX_9c9614b2f9d01665800ea8dbff; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_9c9614b2f9d01665800ea8dbff" ON public.address USING btree (customer_id);


--
-- Name: IDX_9d1a161434c610aae7c3df2dc7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_9d1a161434c610aae7c3df2dc7" ON public.cart USING btree (payment_id);


--
-- Name: IDX_a0b05dc4257abe639cb75f8eae; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_a0b05dc4257abe639cb75f8eae" ON public.discount_condition_product_collection USING btree (product_collection_id);


--
-- Name: IDX_a0e206bfaed3cb63c186091734; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_a0e206bfaed3cb63c186091734" ON public.shipping_option USING btree (provider_id);


--
-- Name: IDX_a1c4f9cfb599ad1f0db39cadd5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_a1c4f9cfb599ad1f0db39cadd5" ON public.discount_condition_product_collection USING btree (condition_id);


--
-- Name: IDX_a21a7ffbe420d492eb46c305fe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_a21a7ffbe420d492eb46c305fe" ON public.discount_regions USING btree (region_id);


--
-- Name: IDX_a421bf4588d0004a9b0c0fe84f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_a421bf4588d0004a9b0c0fe84f" ON public.idempotency_key USING btree (idempotency_key);


--
-- Name: IDX_a52e234f729db789cf473297a5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_a52e234f729db789cf473297a5" ON public.fulfillment USING btree (swap_id);


--
-- Name: IDX_aa16f61348be02dd07ce3fc54e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_aa16f61348be02dd07ce3fc54e" ON public.product_variant USING btree (upc) WHERE (deleted_at IS NULL);


--
-- Name: IDX_aac4855eadda71aa1e4b6d7684; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_aac4855eadda71aa1e4b6d7684" ON public.payment USING btree (cart_id) WHERE (canceled_at IS NOT NULL);


--
-- Name: IDX_ac2c280de3701b2d66f6817f76; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_ac2c280de3701b2d66f6817f76" ON public.discount USING btree (rule_id);


--
-- Name: IDX_b1aac8314662fa6b25569a575b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_b1aac8314662fa6b25569a575b" ON public.country USING btree (region_id);


--
-- Name: IDX_b4f4b63d1736689b7008980394; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_b4f4b63d1736689b7008980394" ON public.store_currencies USING btree (store_id);


--
-- Name: IDX_b5b6225539ee8501082fbc0714; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_b5b6225539ee8501082fbc0714" ON public.product_variant USING btree (ean) WHERE (deleted_at IS NULL);


--
-- Name: IDX_b5df0f53a74b9d0c0a2b652c88; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_b5df0f53a74b9d0c0a2b652c88" ON public.notification USING btree (customer_id);


--
-- Name: IDX_b6bcf8c3903097b84e85154eed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_b6bcf8c3903097b84e85154eed" ON public.gift_card USING btree (region_id);


--
-- Name: IDX_ba8de19442d86957a3aa3b5006; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_ba8de19442d86957a3aa3b5006" ON public."user" USING btree (email) WHERE (deleted_at IS NULL);


--
-- Name: IDX_bad82d7bff2b08b87094bfac3d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_bad82d7bff2b08b87094bfac3d" ON public.return USING btree (swap_id);


--
-- Name: IDX_be66106a673b88a81c603abe7e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_be66106a673b88a81c603abe7e" ON public.discount_rule_products USING btree (product_id);


--
-- Name: IDX_be9aea2ccf3567007b6227da4d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_be9aea2ccf3567007b6227da4d" ON public.line_item_adjustment USING btree (item_id);


--
-- Name: IDX_beb35a6de60a6c4f91d5ae57e4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_beb35a6de60a6c4f91d5ae57e4" ON public.fulfillment USING btree (provider_id);


--
-- Name: IDX_bf701b88d2041392a288785ada; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_bf701b88d2041392a288785ada" ON public.line_item_adjustment USING btree (discount_id, item_id) WHERE (discount_id IS NOT NULL);


--
-- Name: IDX_c17aff091441b7c25ec3d68d36; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_c17aff091441b7c25ec3d68d36" ON public.payment USING btree (swap_id);


--
-- Name: IDX_c2c0f3edf39515bd15432afe6e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_c2c0f3edf39515bd15432afe6e" ON public.claim_item_tags USING btree (item_id);


--
-- Name: IDX_c49c061b1a686843c5d673506f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_c49c061b1a686843c5d673506f" ON public.oauth USING btree (application_name);


--
-- Name: IDX_c4c3a5225a7a1f0af782c40abc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_c4c3a5225a7a1f0af782c40abc" ON public.customer_group USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: IDX_c5516f550433c9b1c2630d787a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_c5516f550433c9b1c2630d787a" ON public.price_list_customer_groups USING btree (customer_group_id);


--
-- Name: IDX_c556e14eff4d6f03db593df955; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_c556e14eff4d6f03db593df955" ON public.region_fulfillment_providers USING btree (region_id);


--
-- Name: IDX_c759f53b2e48e8cfb50638fe4e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_c759f53b2e48e8cfb50638fe4e" ON public.discount_condition_product USING btree (product_id);


--
-- Name: IDX_c951439af4c98bf2bd7fb8726c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_c951439af4c98bf2bd7fb8726c" ON public.shipping_option USING btree (profile_id);


--
-- Name: IDX_c99a206eb11ad45f6b7f04f2dc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_c99a206eb11ad45f6b7f04f2dc" ON public."order" USING btree (cart_id);


--
-- Name: IDX_ca67dd080aac5ecf99609960cd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_ca67dd080aac5ecf99609960cd" ON public.product_variant USING btree (product_id);


--
-- Name: IDX_cd7812c96209c5bdd48a6b858b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_cd7812c96209c5bdd48a6b858b" ON public."order" USING btree (customer_id);


--
-- Name: IDX_ced15a9a695d2b5db9dabce763; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_ced15a9a695d2b5db9dabce763" ON public.cart USING btree (shipping_address_id);


--
-- Name: IDX_cf9cc6c3f2e6414b992223fff1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_cf9cc6c3f2e6414b992223fff1" ON public.product USING btree (handle) WHERE (deleted_at IS NULL);


--
-- Name: IDX_d18ad72f2fb7c87f075825b6f8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_d18ad72f2fb7c87f075825b6f8" ON public.payment_session USING btree (provider_id);


--
-- Name: IDX_d25ba0787e1510ddc5d442ebcf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_d25ba0787e1510ddc5d442ebcf" ON public.payment_session USING btree (cart_id);


--
-- Name: IDX_d38047a90f3d42f0be7909e8ae; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_d38047a90f3d42f0be7909e8ae" ON public.cart_gift_cards USING btree (cart_id);


--
-- Name: IDX_d4bd17f918fc6c332b74a368c3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_d4bd17f918fc6c332b74a368c3" ON public.return USING btree (order_id);


--
-- Name: IDX_d73e55964e0ff2db8f03807d52; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_d73e55964e0ff2db8f03807d52" ON public.fulfillment USING btree (claim_order_id);


--
-- Name: IDX_d783a66d1c91c0858752c933e6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_d783a66d1c91c0858752c933e6" ON public.shipping_method USING btree (claim_order_id);


--
-- Name: IDX_d7d441b81012f87d4265fa57d2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_d7d441b81012f87d4265fa57d2" ON public.gift_card_transaction USING btree (order_id);


--
-- Name: IDX_d92993a7d554d84571f4eea1d1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_d92993a7d554d84571f4eea1d1" ON public.shipping_method USING btree (cart_id);


--
-- Name: IDX_dc9bbf9fcb9ba458d25d512811; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_dc9bbf9fcb9ba458d25d512811" ON public.claim_item_tags USING btree (tag_id);


--
-- Name: IDX_df1494d263740fcfb1d09a98fc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_df1494d263740fcfb1d09a98fc" ON public.notification USING btree (resource_type);


--
-- Name: IDX_dfc1f02bb0552e79076aa58dbb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_dfc1f02bb0552e79076aa58dbb" ON public.gift_card USING btree (order_id);


--
-- Name: IDX_e1fcce2b18dbcdbe0a5ba9a68b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_e1fcce2b18dbcdbe0a5ba9a68b" ON public."order" USING btree (region_id);


--
-- Name: IDX_e62ff11e4730bb3adfead979ee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_e62ff11e4730bb3adfead979ee" ON public.order_gift_cards USING btree (order_id);


--
-- Name: IDX_e706deb68f52ab2756119b9e70; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_e706deb68f52ab2756119b9e70" ON public.discount_condition_product_type USING btree (product_type_id);


--
-- Name: IDX_e78901b1131eaf8203d9b1cb5f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_e78901b1131eaf8203d9b1cb5f" ON public.country USING btree (iso_2);


--
-- Name: IDX_e7b488cebe333f449398769b2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_e7b488cebe333f449398769b2c" ON public.order_discounts USING btree (order_id);


--
-- Name: IDX_e87cc617a22ef4edce5601edab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_e87cc617a22ef4edce5601edab" ON public.draft_order USING btree (display_id);


--
-- Name: IDX_ea6a358d9ce41c16499aae55f9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_ea6a358d9ce41c16499aae55f9" ON public.notification USING btree (resource_id);


--
-- Name: IDX_ea94f42b6c88e9191c3649d752; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_ea94f42b6c88e9191c3649d752" ON public.payment USING btree (provider_id);


--
-- Name: IDX_ec10c54769877840c132260e4a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_ec10c54769877840c132260e4a" ON public.claim_tag USING btree (value);


--
-- Name: IDX_ece65a774192b34253abc4cd67; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_ece65a774192b34253abc4cd67" ON public.product_type_tax_rate USING btree (rate_id);


--
-- Name: IDX_eec9d9af4ca098e19ea6b499ea; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_eec9d9af4ca098e19ea6b499ea" ON public.refund USING btree (order_id);


--
-- Name: IDX_efff700651718e452ca9580a62; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_efff700651718e452ca9580a62" ON public.discount_condition USING btree (discount_rule_id);


--
-- Name: IDX_f05132301e95bdab4ba1cf29a2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_f05132301e95bdab4ba1cf29a2" ON public.discount_condition_product USING btree (condition_id);


--
-- Name: IDX_f129acc85e346a10eed12b86fc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_f129acc85e346a10eed12b86fc" ON public.fulfillment USING btree (order_id);


--
-- Name: IDX_f2bb9f71e95b315eb24b2b84cb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_f2bb9f71e95b315eb24b2b84cb" ON public.order_gift_cards USING btree (gift_card_id);


--
-- Name: IDX_f4194aa81073f3fab8aa86906f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_f4194aa81073f3fab8aa86906f" ON public.discount_regions USING btree (discount_id);


--
-- Name: IDX_f49e3974465d3c3a33d449d3f3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_f49e3974465d3c3a33d449d3f3" ON public.claim_order USING btree (order_id);


--
-- Name: IDX_f5221735ace059250daac9d980; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_f5221735ace059250daac9d980" ON public.payment USING btree (order_id);


--
-- Name: IDX_f65bf52e2239ace276ece2b2f4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_f65bf52e2239ace276ece2b2f4" ON public.discount USING btree (code) WHERE (deleted_at IS NULL);


--
-- Name: IDX_f672727ab020df6c50fb64c1a7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_f672727ab020df6c50fb64c1a7" ON public.shipping_tax_rate USING btree (shipping_option_id);


--
-- Name: IDX_f74980b411cf94af523a72af7d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_f74980b411cf94af523a72af7d" ON public.note USING btree (resource_type);


--
-- Name: IDX_fb94fa8d5ca940daa2a58139f8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fb94fa8d5ca940daa2a58139f8" ON public.shipping_method USING btree (swap_id);


--
-- Name: IDX_fbb2499551ed074526f3ee3624; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fbb2499551ed074526f3ee3624" ON public.discount_condition_product_tag USING btree (condition_id);


--
-- Name: IDX_fc963e94854bff2714ca84cd19; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fc963e94854bff2714ca84cd19" ON public.shipping_method USING btree (shipping_option_id);


--
-- Name: IDX_id_publishable_api_key_sales_channel; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_id_publishable_api_key_sales_channel" ON public.publishable_api_key_sales_channel USING btree (id);


--
-- Name: IDX_money_amount_currency_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_money_amount_currency_code" ON public.money_amount USING btree (currency_code);


--
-- Name: IDX_order_currency_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_currency_code" ON public."order" USING btree (currency_code);


--
-- Name: IDX_order_edit_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_edit_order_id" ON public.order_edit USING btree (order_id);


--
-- Name: IDX_order_edit_payment_collection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_order_edit_payment_collection_id" ON public.order_edit USING btree (payment_collection_id);


--
-- Name: IDX_payment_collection_currency_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_payment_collection_currency_code" ON public.payment_collection USING btree (currency_code) WHERE (deleted_at IS NULL);


--
-- Name: IDX_payment_collection_payments_payment_collection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_payment_collection_payments_payment_collection_id" ON public.payment_collection_payments USING btree (payment_collection_id);


--
-- Name: IDX_payment_collection_payments_payment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_payment_collection_payments_payment_id" ON public.payment_collection_payments USING btree (payment_id);


--
-- Name: IDX_payment_collection_region_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_payment_collection_region_id" ON public.payment_collection USING btree (region_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_payment_collection_sessions_payment_collection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_payment_collection_sessions_payment_collection_id" ON public.payment_collection_sessions USING btree (payment_collection_id);


--
-- Name: IDX_payment_collection_sessions_payment_session_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_payment_collection_sessions_payment_session_id" ON public.payment_collection_sessions USING btree (payment_session_id);


--
-- Name: IDX_payment_currency_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_payment_currency_code" ON public.payment USING btree (currency_code);


--
-- Name: IDX_pcp_product_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_pcp_product_category_id" ON public.product_category_product USING btree (product_category_id);


--
-- Name: IDX_pcp_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_pcp_product_id" ON public.product_category_product USING btree (product_id);


--
-- Name: IDX_product_category_active_public; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_category_active_public" ON public.product_category USING btree (parent_category_id, is_active, is_internal) WHERE ((is_active IS TRUE) AND (is_internal IS FALSE));


--
-- Name: IDX_product_category_handle; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_product_category_handle" ON public.product_category USING btree (handle);


--
-- Name: IDX_product_category_path; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_category_path" ON public.product_category USING btree (mpath);


--
-- Name: IDX_product_variant_inventory_item_inventory_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_variant_inventory_item_inventory_item_id" ON public.product_variant_inventory_item USING btree (inventory_item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_inventory_item_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_product_variant_inventory_item_variant_id" ON public.product_variant_inventory_item USING btree (variant_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_refund_payment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_refund_payment_id" ON public.refund USING btree (payment_id);


--
-- Name: IDX_region_currency_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_region_currency_code" ON public.region USING btree (currency_code);


--
-- Name: IDX_return_reason_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_return_reason_value" ON public.return_reason USING btree (value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_sales_channel_location_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_sales_channel_location_location_id" ON public.sales_channel_location USING btree (location_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_sales_channel_location_sales_channel_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_sales_channel_location_sales_channel_id" ON public.sales_channel_location USING btree (sales_channel_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_upcp_product_id_product_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_upcp_product_id_product_category_id" ON public.product_category_product USING btree (product_category_id, product_id);


--
-- Name: UniqPaymentSessionCartIdProviderId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UniqPaymentSessionCartIdProviderId" ON public.payment_session USING btree (cart_id, provider_id) WHERE (cart_id IS NOT NULL);


--
-- Name: UniqProductCategoryParentIdRank; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UniqProductCategoryParentIdRank" ON public.product_category USING btree (parent_category_id, rank);


--
-- Name: UniquePaymentActive; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UniquePaymentActive" ON public.payment USING btree (cart_id) WHERE (canceled_at IS NULL);


--
-- Name: idx_gin_product_collection; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_gin_product_collection ON public.product_collection USING gin (title public.gin_trgm_ops) WHERE (deleted_at IS NULL);


--
-- Name: idx_gin_product_description; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_gin_product_description ON public.product USING gin (description public.gin_trgm_ops) WHERE (deleted_at IS NULL);


--
-- Name: idx_gin_product_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_gin_product_title ON public.product USING gin (title public.gin_trgm_ops) WHERE (deleted_at IS NULL);


--
-- Name: idx_gin_product_variant_sku; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_gin_product_variant_sku ON public.product_variant USING gin (sku public.gin_trgm_ops) WHERE (deleted_at IS NULL);


--
-- Name: idx_gin_product_variant_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_gin_product_variant_title ON public.product_variant USING gin (title public.gin_trgm_ops) WHERE (deleted_at IS NULL);


--
-- Name: idx_money_amount_region_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_money_amount_region_id ON public.money_amount USING btree (region_id);


--
-- Name: idx_product_option_value_option_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_option_value_option_id ON public.product_option_value USING btree (option_id);


--
-- Name: idx_product_option_value_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_option_value_variant_id ON public.product_option_value USING btree (variant_id);


--
-- Name: idx_product_shipping_profile_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_shipping_profile_product_id ON public.product_shipping_profile USING btree (product_id);


--
-- Name: idx_product_shipping_profile_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_shipping_profile_profile_id ON public.product_shipping_profile USING btree (profile_id);


--
-- Name: idx_product_shipping_profile_profile_id_product_id_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_product_shipping_profile_profile_id_product_id_unique ON public.product_shipping_profile USING btree (profile_id, product_id);


--
-- Name: idx_product_variant_money_amount_money_amount_id_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_product_variant_money_amount_money_amount_id_unique ON public.product_variant_money_amount USING btree (money_amount_id);


--
-- Name: idx_product_variant_money_amount_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_variant_money_amount_variant_id ON public.product_variant_money_amount USING btree (variant_id);


--
-- Name: unique_li_original_item_id_order_edit_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_li_original_item_id_order_edit_id ON public.line_item USING btree (order_edit_id, original_item_id) WHERE ((original_item_id IS NOT NULL) AND (order_edit_id IS NOT NULL));


--
-- Name: shipping_option_requirement FK_012a62ba743e427b5ebe9dee18e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option_requirement
    ADD CONSTRAINT "FK_012a62ba743e427b5ebe9dee18e" FOREIGN KEY (shipping_option_id) REFERENCES public.shipping_option(id);


--
-- Name: discount_condition_product_tag FK_01486cc9dc6b36bf658685535f6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_condition_product_tag
    ADD CONSTRAINT "FK_01486cc9dc6b36bf658685535f6" FOREIGN KEY (product_tag_id) REFERENCES public.product_tag(id) ON DELETE CASCADE;


--
-- Name: claim_order FK_017d58bf8260c6e1a2588d258e2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_order
    ADD CONSTRAINT "FK_017d58bf8260c6e1a2588d258e2" FOREIGN KEY (shipping_address_id) REFERENCES public.address(id);


--
-- Name: notification FK_0425c2423e2ce9fdfd5c23761d9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "FK_0425c2423e2ce9fdfd5c23761d9" FOREIGN KEY (provider_id) REFERENCES public.notification_provider(id);


--
-- Name: cart_gift_cards FK_0fb38b6d167793192bc126d835e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_gift_cards
    ADD CONSTRAINT "FK_0fb38b6d167793192bc126d835e" FOREIGN KEY (gift_card_id) REFERENCES public.gift_card(id) ON DELETE CASCADE;


--
-- Name: order_discounts FK_0fc1ec4e3db9001ad60c19daf16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_discounts
    ADD CONSTRAINT "FK_0fc1ec4e3db9001ad60c19daf16" FOREIGN KEY (discount_id) REFERENCES public.discount(id) ON DELETE CASCADE;


--
-- Name: line_item FK_118e3c48f09a7728f41023c94ef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT "FK_118e3c48f09a7728f41023c94ef" FOREIGN KEY (claim_order_id) REFERENCES public.claim_order(id);


--
-- Name: order FK_19b0c6293443d1b464f604c3316; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_19b0c6293443d1b464f604c3316" FOREIGN KEY (shipping_address_id) REFERENCES public.address(id);


--
-- Name: product_tax_rate FK_1d04aebeabb6a89f87e536a124d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tax_rate
    ADD CONSTRAINT "FK_1d04aebeabb6a89f87e536a124d" FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: shipping_method FK_1d9ad62038998c3a85c77a53cfb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "FK_1d9ad62038998c3a85c77a53cfb" FOREIGN KEY (return_id) REFERENCES public.return(id);


--
-- Name: order_edit FK_1f3a251488a91510f57e1bf93cd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_edit
    ADD CONSTRAINT "FK_1f3a251488a91510f57e1bf93cd" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: product_tags FK_21683a063fe82dafdf681ecc9c4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT "FK_21683a063fe82dafdf681ecc9c4" FOREIGN KEY (product_tag_id) REFERENCES public.product_tag(id) ON DELETE CASCADE;


--
-- Name: claim_image FK_21cbfedd83d736d86f4c6f4ce56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_image
    ADD CONSTRAINT "FK_21cbfedd83d736d86f4c6f4ce56" FOREIGN KEY (claim_item_id) REFERENCES public.claim_item(id);


--
-- Name: product_images FK_2212515ba306c79f42c46a99db7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT "FK_2212515ba306c79f42c46a99db7" FOREIGN KEY (image_id) REFERENCES public.image(id) ON DELETE CASCADE;


--
-- Name: return_reason FK_2250c5d9e975987ab212f61a657; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_reason
    ADD CONSTRAINT "FK_2250c5d9e975987ab212f61a657" FOREIGN KEY (parent_return_reason_id) REFERENCES public.return_reason(id);


--
-- Name: discount FK_2250c5d9e975987ab212f61a663; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT "FK_2250c5d9e975987ab212f61a663" FOREIGN KEY (parent_discount_id) REFERENCES public.discount(id);


--
-- Name: cart FK_242205c81c1152fab1b6e848470; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_242205c81c1152fab1b6e848470" FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- Name: product_tax_rate FK_2484cf14c437a04586b07e7dddb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tax_rate
    ADD CONSTRAINT "FK_2484cf14c437a04586b07e7dddb" FOREIGN KEY (rate_id) REFERENCES public.tax_rate(id) ON DELETE CASCADE;


--
-- Name: product_type_tax_rate FK_25a3138bb236f63d9bb6c8ff111; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type_tax_rate
    ADD CONSTRAINT "FK_25a3138bb236f63d9bb6c8ff111" FOREIGN KEY (product_type_id) REFERENCES public.product_type(id) ON DELETE CASCADE;


--
-- Name: line_item FK_27283ee631862266d0f1c680646; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT "FK_27283ee631862266d0f1c680646" FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- Name: line_item_adjustment FK_2f41b20a71f30e60471d7e3769c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_item_adjustment
    ADD CONSTRAINT "FK_2f41b20a71f30e60471d7e3769c" FOREIGN KEY (discount_id) REFERENCES public.discount(id);


--
-- Name: shipping_tax_rate FK_346e0016cf045b9980747747645; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_tax_rate
    ADD CONSTRAINT "FK_346e0016cf045b9980747747645" FOREIGN KEY (rate_id) REFERENCES public.tax_rate(id) ON DELETE CASCADE;


--
-- Name: notification FK_371db513192c083f48ba63c33be; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "FK_371db513192c083f48ba63c33be" FOREIGN KEY (parent_id) REFERENCES public.notification(id);


--
-- Name: product_sales_channel FK_37341bad297fe5cca91f921032b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_sales_channel
    ADD CONSTRAINT "FK_37341bad297fe5cca91f921032b" FOREIGN KEY (sales_channel_id) REFERENCES public.sales_channel(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: region_fulfillment_providers FK_37f361c38a18d12a3fa3158d0cf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region_fulfillment_providers
    ADD CONSTRAINT "FK_37f361c38a18d12a3fa3158d0cf" FOREIGN KEY (provider_id) REFERENCES public.fulfillment_provider(id) ON DELETE CASCADE;


--
-- Name: region_payment_providers FK_3a6947180aeec283cd92c59ebb0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region_payment_providers
    ADD CONSTRAINT "FK_3a6947180aeec283cd92c59ebb0" FOREIGN KEY (provider_id) REFERENCES public.payment_provider(id) ON DELETE CASCADE;


--
-- Name: region FK_3bdd5896ec93be2f1c62a3309a5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT "FK_3bdd5896ec93be2f1c62a3309a5" FOREIGN KEY (currency_code) REFERENCES public.currency(code);


--
-- Name: customer_group_customers FK_3c6412d076292f439269abe1a23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_group_customers
    ADD CONSTRAINT "FK_3c6412d076292f439269abe1a23" FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON DELETE CASCADE;


--
-- Name: line_item FK_3fa354d8d1233ff81097b2fcb6b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT "FK_3fa354d8d1233ff81097b2fcb6b" FOREIGN KEY (swap_id) REFERENCES public.swap(id);


--
-- Name: gift_card_transaction FK_3ff5597f1d7e02bba41541846f4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gift_card_transaction
    ADD CONSTRAINT "FK_3ff5597f1d7e02bba41541846f4" FOREIGN KEY (gift_card_id) REFERENCES public.gift_card(id);


--
-- Name: swap FK_402e8182bc553e082f6380020b4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.swap
    ADD CONSTRAINT "FK_402e8182bc553e082f6380020b4" FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- Name: line_item FK_43a2b24495fe1d9fc2a9c835bc7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT "FK_43a2b24495fe1d9fc2a9c835bc7" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: custom_shipping_option FK_44090cb11b06174cbcc667e91ca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_shipping_option
    ADD CONSTRAINT "FK_44090cb11b06174cbcc667e91ca" FOREIGN KEY (shipping_option_id) REFERENCES public.shipping_option(id);


--
-- Name: order_item_change FK_44feeebb258bf4cfa4cc4202281; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item_change
    ADD CONSTRAINT "FK_44feeebb258bf4cfa4cc4202281" FOREIGN KEY (order_edit_id) REFERENCES public.order_edit(id);


--
-- Name: payment FK_4665f17abc1e81dd58330e58542; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT "FK_4665f17abc1e81dd58330e58542" FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- Name: tracking_link FK_471e9e4c96e02ba209a307db32b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracking_link
    ADD CONSTRAINT "FK_471e9e4c96e02ba209a307db32b" FOREIGN KEY (fulfillment_id) REFERENCES public.fulfillment(id);


--
-- Name: cart FK_484c329f4783be4e18e5e2ff090; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_484c329f4783be4e18e5e2ff090" FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: product FK_49d419fc77d3aed46c835c558ac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "FK_49d419fc77d3aed46c835c558ac" FOREIGN KEY (collection_id) REFERENCES public.product_collection(id);


--
-- Name: discount_condition_customer_group FK_4d5f98645a67545d8dea42e2eb8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_condition_customer_group
    ADD CONSTRAINT "FK_4d5f98645a67545d8dea42e2eb8" FOREIGN KEY (customer_group_id) REFERENCES public.customer_group(id) ON DELETE CASCADE;


--
-- Name: discount_rule_products FK_4e0739e5f0244c08d41174ca08a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_rule_products
    ADD CONSTRAINT "FK_4e0739e5f0244c08d41174ca08a" FOREIGN KEY (discount_rule_id) REFERENCES public.discount_rule(id) ON DELETE CASCADE;


--
-- Name: product_images FK_4f166bb8c2bfcef2498d97b4068; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT "FK_4f166bb8c2bfcef2498d97b4068" FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: line_item_tax_line FK_5077fa54b0d037e984385dfe8ad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_item_tax_line
    ADD CONSTRAINT "FK_5077fa54b0d037e984385dfe8ad" FOREIGN KEY (item_id) REFERENCES public.line_item(id) ON DELETE CASCADE;


--
-- Name: shipping_method FK_5267705a43d547e232535b656c2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "FK_5267705a43d547e232535b656c2" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: price_list_customer_groups FK_52875734e9dd69064f0041f4d92; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_list_customer_groups
    ADD CONSTRAINT "FK_52875734e9dd69064f0041f4d92" FOREIGN KEY (price_list_id) REFERENCES public.price_list(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: swap FK_52dd74e8c989aa5665ad2852b8b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.swap
    ADD CONSTRAINT "FK_52dd74e8c989aa5665ad2852b8b" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: line_item FK_5371cbaa3be5200f373d24e3d5b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT "FK_5371cbaa3be5200f373d24e3d5b" FOREIGN KEY (variant_id) REFERENCES public.product_variant(id);


--
-- Name: order FK_5568d3b9ce9f7abeeb37511ecf2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_5568d3b9ce9f7abeeb37511ecf2" FOREIGN KEY (billing_address_id) REFERENCES public.address(id);


--
-- Name: store FK_55beebaa09e947cccca554af222; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT "FK_55beebaa09e947cccca554af222" FOREIGN KEY (default_currency_code) REFERENCES public.currency(code);


--
-- Name: product_tags FK_5b0c6fc53c574299ecc7f9ee22e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT "FK_5b0c6fc53c574299ecc7f9ee22e" FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: draft_order FK_5bd11d0e2a9628128e2c26fd0a6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.draft_order
    ADD CONSTRAINT "FK_5bd11d0e2a9628128e2c26fd0a6" FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- Name: shipping_option FK_5c58105f1752fca0f4ce69f4663; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT "FK_5c58105f1752fca0f4ce69f4663" FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: order_item_change FK_5f9688929761f7df108b630e64a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item_change
    ADD CONSTRAINT "FK_5f9688929761f7df108b630e64a" FOREIGN KEY (line_item_id) REFERENCES public.line_item(id);


--
-- Name: store FK_61b0f48cccbb5f41c750bac7286; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT "FK_61b0f48cccbb5f41c750bac7286" FOREIGN KEY (default_sales_channel_id) REFERENCES public.sales_channel(id);


--
-- Name: customer_group_customers FK_620330964db8d2999e67b0dbe3e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_group_customers
    ADD CONSTRAINT "FK_620330964db8d2999e67b0dbe3e" FOREIGN KEY (customer_group_id) REFERENCES public.customer_group(id) ON DELETE CASCADE;


--
-- Name: claim_item FK_64980511ca32c8e92b417644afa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_item
    ADD CONSTRAINT "FK_64980511ca32c8e92b417644afa" FOREIGN KEY (variant_id) REFERENCES public.product_variant(id);


--
-- Name: cart_discounts FK_6680319ebe1f46d18f106191d59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_discounts
    ADD CONSTRAINT "FK_6680319ebe1f46d18f106191d59" FOREIGN KEY (cart_id) REFERENCES public.cart(id) ON DELETE CASCADE;


--
-- Name: cart FK_6b9c66b5e36f7c827dfaa092f94; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_6b9c66b5e36f7c827dfaa092f94" FOREIGN KEY (billing_address_id) REFERENCES public.address(id);


--
-- Name: address FK_6df8c6bf969a51d24c1980c4ff4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "FK_6df8c6bf969a51d24c1980c4ff4" FOREIGN KEY (country_code) REFERENCES public.country(iso_2);


--
-- Name: claim_item FK_6e0cad0daef76bb642675910b9d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_item
    ADD CONSTRAINT "FK_6e0cad0daef76bb642675910b9d" FOREIGN KEY (item_id) REFERENCES public.line_item(id);


--
-- Name: discount_condition_product_type FK_6ef23ce0b1d9cf9b5b833e52b9d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_condition_product_type
    ADD CONSTRAINT "FK_6ef23ce0b1d9cf9b5b833e52b9d" FOREIGN KEY (condition_id) REFERENCES public.discount_condition(id) ON DELETE CASCADE;


--
-- Name: order FK_6ff7e874f01b478c115fdd462eb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_6ff7e874f01b478c115fdd462eb" FOREIGN KEY (sales_channel_id) REFERENCES public.sales_channel(id);


--
-- Name: return FK_71773d56eb2bacb922bc3283398; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return
    ADD CONSTRAINT "FK_71773d56eb2bacb922bc3283398" FOREIGN KEY (claim_order_id) REFERENCES public.claim_order(id);


--
-- Name: order FK_717a141f96b76d794d409f38129; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_717a141f96b76d794d409f38129" FOREIGN KEY (currency_code) REFERENCES public.currency(code);


--
-- Name: product_option_value FK_7234ed737ff4eb1b6ae6e6d7b01; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_value
    ADD CONSTRAINT "FK_7234ed737ff4eb1b6ae6e6d7b01" FOREIGN KEY (variant_id) REFERENCES public.product_variant(id) ON DELETE CASCADE;


--
-- Name: order FK_727b872f86c7378474a8fa46147; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_727b872f86c7378474a8fa46147" FOREIGN KEY (draft_order_id) REFERENCES public.draft_order(id);


--
-- Name: return_item FK_7edab75b4fc88ea6d4f2574f087; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_item
    ADD CONSTRAINT "FK_7edab75b4fc88ea6d4f2574f087" FOREIGN KEY (return_id) REFERENCES public.return(id);


--
-- Name: store_currencies FK_82a6bbb0b527c20a0002ddcbd60; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_currencies
    ADD CONSTRAINT "FK_82a6bbb0b527c20a0002ddcbd60" FOREIGN KEY (currency_code) REFERENCES public.currency(code) ON DELETE CASCADE;


--
-- Name: discount_condition_customer_group FK_8486ee16e69013c645d0b8716b6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_condition_customer_group
    ADD CONSTRAINT "FK_8486ee16e69013c645d0b8716b6" FOREIGN KEY (condition_id) REFERENCES public.discount_condition(id) ON DELETE CASCADE;


--
-- Name: return_item FK_87774591f44564effd8039d7162; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_item
    ADD CONSTRAINT "FK_87774591f44564effd8039d7162" FOREIGN KEY (item_id) REFERENCES public.line_item(id);


--
-- Name: region_payment_providers FK_8aaa78ba90d3802edac317df869; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region_payment_providers
    ADD CONSTRAINT "FK_8aaa78ba90d3802edac317df869" FOREIGN KEY (region_id) REFERENCES public.region(id) ON DELETE CASCADE;


--
-- Name: customer FK_8abe81b9aac151ae60bf507ad15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "FK_8abe81b9aac151ae60bf507ad15" FOREIGN KEY (billing_address_id) REFERENCES public.address(id);


--
-- Name: cart_discounts FK_8df75ef4f35f217768dc1135458; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_discounts
    ADD CONSTRAINT "FK_8df75ef4f35f217768dc1135458" FOREIGN KEY (discount_id) REFERENCES public.discount(id) ON DELETE CASCADE;


--
-- Name: draft_order FK_8f6dd6c49202f1466ebf21e77da; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.draft_order
    ADD CONSTRAINT "FK_8f6dd6c49202f1466ebf21e77da" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: claim_item FK_900a9c3834257304396b2b0fe7c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_item
    ADD CONSTRAINT "FK_900a9c3834257304396b2b0fe7c" FOREIGN KEY (claim_order_id) REFERENCES public.claim_order(id);


--
-- Name: region FK_91f88052197680f9790272aaf5b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT "FK_91f88052197680f9790272aaf5b" FOREIGN KEY (tax_provider_id) REFERENCES public.tax_provider(id);


--
-- Name: shipping_method_tax_line FK_926ca9f29014af8091722dede08; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method_tax_line
    ADD CONSTRAINT "FK_926ca9f29014af8091722dede08" FOREIGN KEY (shipping_method_id) REFERENCES public.shipping_method(id);


--
-- Name: custom_shipping_option FK_93caeb1bb70d37c1d36d6701a7a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_shipping_option
    ADD CONSTRAINT "FK_93caeb1bb70d37c1d36d6701a7a" FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- Name: address FK_9c9614b2f9d01665800ea8dbff7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "FK_9c9614b2f9d01665800ea8dbff7" FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- Name: cart FK_9d1a161434c610aae7c3df2dc7e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_9d1a161434c610aae7c3df2dc7e" FOREIGN KEY (payment_id) REFERENCES public.payment(id);


--
-- Name: fulfillment_item FK_a033f83cc6bd7701a5687ab4b38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment_item
    ADD CONSTRAINT "FK_a033f83cc6bd7701a5687ab4b38" FOREIGN KEY (fulfillment_id) REFERENCES public.fulfillment(id);


--
-- Name: discount_condition_product_collection FK_a0b05dc4257abe639cb75f8eae2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_condition_product_collection
    ADD CONSTRAINT "FK_a0b05dc4257abe639cb75f8eae2" FOREIGN KEY (product_collection_id) REFERENCES public.product_collection(id) ON DELETE CASCADE;


--
-- Name: shipping_option FK_a0e206bfaed3cb63c1860917347; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT "FK_a0e206bfaed3cb63c1860917347" FOREIGN KEY (provider_id) REFERENCES public.fulfillment_provider(id);


--
-- Name: discount_condition_product_collection FK_a1c4f9cfb599ad1f0db39cadd5f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_condition_product_collection
    ADD CONSTRAINT "FK_a1c4f9cfb599ad1f0db39cadd5f" FOREIGN KEY (condition_id) REFERENCES public.discount_condition(id) ON DELETE CASCADE;


--
-- Name: discount_regions FK_a21a7ffbe420d492eb46c305fec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_regions
    ADD CONSTRAINT "FK_a21a7ffbe420d492eb46c305fec" FOREIGN KEY (region_id) REFERENCES public.region(id) ON DELETE CASCADE;


--
-- Name: cart FK_a2bd3c26f42e754b9249ba78fd6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_a2bd3c26f42e754b9249ba78fd6" FOREIGN KEY (sales_channel_id) REFERENCES public.sales_channel(id);


--
-- Name: fulfillment FK_a52e234f729db789cf473297a5c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT "FK_a52e234f729db789cf473297a5c" FOREIGN KEY (swap_id) REFERENCES public.swap(id);


--
-- Name: discount FK_ac2c280de3701b2d66f6817f760; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT "FK_ac2c280de3701b2d66f6817f760" FOREIGN KEY (rule_id) REFERENCES public.discount_rule(id);


--
-- Name: country FK_b1aac8314662fa6b25569a575bb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT "FK_b1aac8314662fa6b25569a575bb" FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: money_amount FK_b433e27b7a83e6d12ab26b15b03; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.money_amount
    ADD CONSTRAINT "FK_b433e27b7a83e6d12ab26b15b03" FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: order_item_change FK_b4d53b8d03c9f5e7d4317e818d9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item_change
    ADD CONSTRAINT "FK_b4d53b8d03c9f5e7d4317e818d9" FOREIGN KEY (original_line_item_id) REFERENCES public.line_item(id);


--
-- Name: store_currencies FK_b4f4b63d1736689b7008980394c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_currencies
    ADD CONSTRAINT "FK_b4f4b63d1736689b7008980394c" FOREIGN KEY (store_id) REFERENCES public.store(id) ON DELETE CASCADE;


--
-- Name: notification FK_b5df0f53a74b9d0c0a2b652c88d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "FK_b5df0f53a74b9d0c0a2b652c88d" FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- Name: gift_card FK_b6bcf8c3903097b84e85154eed3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gift_card
    ADD CONSTRAINT "FK_b6bcf8c3903097b84e85154eed3" FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: tax_rate FK_b95a1e03b051993d208366cb960; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "FK_b95a1e03b051993d208366cb960" FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: return FK_bad82d7bff2b08b87094bfac3d6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return
    ADD CONSTRAINT "FK_bad82d7bff2b08b87094bfac3d6" FOREIGN KEY (swap_id) REFERENCES public.swap(id);


--
-- Name: discount_rule_products FK_be66106a673b88a81c603abe7eb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_rule_products
    ADD CONSTRAINT "FK_be66106a673b88a81c603abe7eb" FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: line_item_adjustment FK_be9aea2ccf3567007b6227da4d2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_item_adjustment
    ADD CONSTRAINT "FK_be9aea2ccf3567007b6227da4d2" FOREIGN KEY (item_id) REFERENCES public.line_item(id) ON DELETE CASCADE;


--
-- Name: fulfillment FK_beb35a6de60a6c4f91d5ae57e44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT "FK_beb35a6de60a6c4f91d5ae57e44" FOREIGN KEY (provider_id) REFERENCES public.fulfillment_provider(id);


--
-- Name: payment FK_c17aff091441b7c25ec3d68d36c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT "FK_c17aff091441b7c25ec3d68d36c" FOREIGN KEY (swap_id) REFERENCES public.swap(id);


--
-- Name: claim_item_tags FK_c2c0f3edf39515bd15432afe6e5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_item_tags
    ADD CONSTRAINT "FK_c2c0f3edf39515bd15432afe6e5" FOREIGN KEY (item_id) REFERENCES public.claim_item(id) ON DELETE CASCADE;


--
-- Name: price_list_customer_groups FK_c5516f550433c9b1c2630d787a7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_list_customer_groups
    ADD CONSTRAINT "FK_c5516f550433c9b1c2630d787a7" FOREIGN KEY (customer_group_id) REFERENCES public.customer_group(id) ON DELETE CASCADE;


--
-- Name: region_fulfillment_providers FK_c556e14eff4d6f03db593df955e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region_fulfillment_providers
    ADD CONSTRAINT "FK_c556e14eff4d6f03db593df955e" FOREIGN KEY (region_id) REFERENCES public.region(id) ON DELETE CASCADE;


--
-- Name: discount_condition_product FK_c759f53b2e48e8cfb50638fe4e0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_condition_product
    ADD CONSTRAINT "FK_c759f53b2e48e8cfb50638fe4e0" FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: shipping_option FK_c951439af4c98bf2bd7fb8726cd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT "FK_c951439af4c98bf2bd7fb8726cd" FOREIGN KEY (profile_id) REFERENCES public.shipping_profile(id);


--
-- Name: order FK_c99a206eb11ad45f6b7f04f2dcc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_c99a206eb11ad45f6b7f04f2dcc" FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- Name: product_variant FK_ca67dd080aac5ecf99609960cd2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "FK_ca67dd080aac5ecf99609960cd2" FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: order FK_cd7812c96209c5bdd48a6b858b0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_cd7812c96209c5bdd48a6b858b0" FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- Name: product_option_value FK_cdf4388f294b30a25c627d69fe9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_value
    ADD CONSTRAINT "FK_cdf4388f294b30a25c627d69fe9" FOREIGN KEY (option_id) REFERENCES public.product_option(id);


--
-- Name: cart FK_ced15a9a695d2b5db9dabce763d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_ced15a9a695d2b5db9dabce763d" FOREIGN KEY (shipping_address_id) REFERENCES public.address(id);


--
-- Name: payment_session FK_d25ba0787e1510ddc5d442ebcfa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_session
    ADD CONSTRAINT "FK_d25ba0787e1510ddc5d442ebcfa" FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- Name: cart_gift_cards FK_d38047a90f3d42f0be7909e8aea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_gift_cards
    ADD CONSTRAINT "FK_d38047a90f3d42f0be7909e8aea" FOREIGN KEY (cart_id) REFERENCES public.cart(id) ON DELETE CASCADE;


--
-- Name: return FK_d4bd17f918fc6c332b74a368c36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return
    ADD CONSTRAINT "FK_d4bd17f918fc6c332b74a368c36" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: fulfillment FK_d73e55964e0ff2db8f03807d52e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT "FK_d73e55964e0ff2db8f03807d52e" FOREIGN KEY (claim_order_id) REFERENCES public.claim_order(id);


--
-- Name: return_item FK_d742532378a65022e7ceb328828; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_item
    ADD CONSTRAINT "FK_d742532378a65022e7ceb328828" FOREIGN KEY (reason_id) REFERENCES public.return_reason(id);


--
-- Name: shipping_method FK_d783a66d1c91c0858752c933e68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "FK_d783a66d1c91c0858752c933e68" FOREIGN KEY (claim_order_id) REFERENCES public.claim_order(id);


--
-- Name: gift_card_transaction FK_d7d441b81012f87d4265fa57d24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gift_card_transaction
    ADD CONSTRAINT "FK_d7d441b81012f87d4265fa57d24" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: shipping_method FK_d92993a7d554d84571f4eea1d13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "FK_d92993a7d554d84571f4eea1d13" FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- Name: claim_item_tags FK_dc9bbf9fcb9ba458d25d512811b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_item_tags
    ADD CONSTRAINT "FK_dc9bbf9fcb9ba458d25d512811b" FOREIGN KEY (tag_id) REFERENCES public.claim_tag(id) ON DELETE CASCADE;


--
-- Name: gift_card FK_dfc1f02bb0552e79076aa58dbb0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gift_card
    ADD CONSTRAINT "FK_dfc1f02bb0552e79076aa58dbb0" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: product FK_e0843930fbb8854fe36ca39dae1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "FK_e0843930fbb8854fe36ca39dae1" FOREIGN KEY (type_id) REFERENCES public.product_type(id);


--
-- Name: fulfillment_item FK_e13ff60e74206b747a1896212d1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment_item
    ADD CONSTRAINT "FK_e13ff60e74206b747a1896212d1" FOREIGN KEY (item_id) REFERENCES public.line_item(id);


--
-- Name: money_amount FK_e15811f81339e4bd8c440aebe1c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.money_amount
    ADD CONSTRAINT "FK_e15811f81339e4bd8c440aebe1c" FOREIGN KEY (currency_code) REFERENCES public.currency(code);


--
-- Name: order FK_e1fcce2b18dbcdbe0a5ba9a68b8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_e1fcce2b18dbcdbe0a5ba9a68b8" FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: order_gift_cards FK_e62ff11e4730bb3adfead979ee2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_gift_cards
    ADD CONSTRAINT "FK_e62ff11e4730bb3adfead979ee2" FOREIGN KEY (order_id) REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- Name: product_option FK_e634fca34f6b594b87fdbee95f6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT "FK_e634fca34f6b594b87fdbee95f6" FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: discount_condition_product_type FK_e706deb68f52ab2756119b9e704; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_condition_product_type
    ADD CONSTRAINT "FK_e706deb68f52ab2756119b9e704" FOREIGN KEY (product_type_id) REFERENCES public.product_type(id) ON DELETE CASCADE;


--
-- Name: order_discounts FK_e7b488cebe333f449398769b2cc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_discounts
    ADD CONSTRAINT "FK_e7b488cebe333f449398769b2cc" FOREIGN KEY (order_id) REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- Name: product_type_tax_rate FK_ece65a774192b34253abc4cd672; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type_tax_rate
    ADD CONSTRAINT "FK_ece65a774192b34253abc4cd672" FOREIGN KEY (rate_id) REFERENCES public.tax_rate(id) ON DELETE CASCADE;


--
-- Name: refund FK_eec9d9af4ca098e19ea6b499eaa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT "FK_eec9d9af4ca098e19ea6b499eaa" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: discount_condition FK_efff700651718e452ca9580a624; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_condition
    ADD CONSTRAINT "FK_efff700651718e452ca9580a624" FOREIGN KEY (discount_rule_id) REFERENCES public.discount_rule(id);


--
-- Name: discount_condition_product FK_f05132301e95bdab4ba1cf29a24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_condition_product
    ADD CONSTRAINT "FK_f05132301e95bdab4ba1cf29a24" FOREIGN KEY (condition_id) REFERENCES public.discount_condition(id) ON DELETE CASCADE;


--
-- Name: fulfillment FK_f129acc85e346a10eed12b86fca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT "FK_f129acc85e346a10eed12b86fca" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: money_amount FK_f249976b079375499662eb80c40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.money_amount
    ADD CONSTRAINT "FK_f249976b079375499662eb80c40" FOREIGN KEY (price_list_id) REFERENCES public.price_list(id) ON DELETE CASCADE;


--
-- Name: order_gift_cards FK_f2bb9f71e95b315eb24b2b84cb3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_gift_cards
    ADD CONSTRAINT "FK_f2bb9f71e95b315eb24b2b84cb3" FOREIGN KEY (gift_card_id) REFERENCES public.gift_card(id) ON DELETE CASCADE;


--
-- Name: payment FK_f41553459a4b1491c9893ebc921; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT "FK_f41553459a4b1491c9893ebc921" FOREIGN KEY (currency_code) REFERENCES public.currency(code);


--
-- Name: discount_regions FK_f4194aa81073f3fab8aa86906ff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_regions
    ADD CONSTRAINT "FK_f4194aa81073f3fab8aa86906ff" FOREIGN KEY (discount_id) REFERENCES public.discount(id) ON DELETE CASCADE;


--
-- Name: claim_order FK_f49e3974465d3c3a33d449d3f31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claim_order
    ADD CONSTRAINT "FK_f49e3974465d3c3a33d449d3f31" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: swap FK_f5189d38b3d3bd496618bf54c57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.swap
    ADD CONSTRAINT "FK_f5189d38b3d3bd496618bf54c57" FOREIGN KEY (shipping_address_id) REFERENCES public.address(id);


--
-- Name: payment FK_f5221735ace059250daac9d9803; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT "FK_f5221735ace059250daac9d9803" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: shipping_tax_rate FK_f672727ab020df6c50fb64c1a70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_tax_rate
    ADD CONSTRAINT "FK_f672727ab020df6c50fb64c1a70" FOREIGN KEY (shipping_option_id) REFERENCES public.shipping_option(id) ON DELETE CASCADE;


--
-- Name: batch_job FK_fa53ca4f5fd90605b532802a626; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.batch_job
    ADD CONSTRAINT "FK_fa53ca4f5fd90605b532802a626" FOREIGN KEY (created_by) REFERENCES public."user"(id);


--
-- Name: shipping_method FK_fb94fa8d5ca940daa2a58139f86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "FK_fb94fa8d5ca940daa2a58139f86" FOREIGN KEY (swap_id) REFERENCES public.swap(id);


--
-- Name: discount_condition_product_tag FK_fbb2499551ed074526f3ee36241; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_condition_product_tag
    ADD CONSTRAINT "FK_fbb2499551ed074526f3ee36241" FOREIGN KEY (condition_id) REFERENCES public.discount_condition(id) ON DELETE CASCADE;


--
-- Name: shipping_method FK_fc963e94854bff2714ca84cd193; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "FK_fc963e94854bff2714ca84cd193" FOREIGN KEY (shipping_option_id) REFERENCES public.shipping_option(id);


--
-- Name: order_edit FK_order_edit_payment_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_edit
    ADD CONSTRAINT "FK_order_edit_payment_collection_id" FOREIGN KEY (payment_collection_id) REFERENCES public.payment_collection(id);


--
-- Name: payment_collection_payments FK_payment_collection_payments_payment_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_collection_payments
    ADD CONSTRAINT "FK_payment_collection_payments_payment_collection_id" FOREIGN KEY (payment_collection_id) REFERENCES public.payment_collection(id) ON DELETE CASCADE;


--
-- Name: payment_collection_payments FK_payment_collection_payments_payment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_collection_payments
    ADD CONSTRAINT "FK_payment_collection_payments_payment_id" FOREIGN KEY (payment_id) REFERENCES public.payment(id) ON DELETE CASCADE;


--
-- Name: payment_collection FK_payment_collection_region_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_collection
    ADD CONSTRAINT "FK_payment_collection_region_id" FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: payment_collection_sessions FK_payment_collection_sessions_payment_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_collection_sessions
    ADD CONSTRAINT "FK_payment_collection_sessions_payment_collection_id" FOREIGN KEY (payment_collection_id) REFERENCES public.payment_collection(id) ON DELETE CASCADE;


--
-- Name: payment_collection_sessions FK_payment_collection_sessions_payment_session_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_collection_sessions
    ADD CONSTRAINT "FK_payment_collection_sessions_payment_session_id" FOREIGN KEY (payment_session_id) REFERENCES public.payment_session(id) ON DELETE CASCADE;


--
-- Name: product_category_product FK_product_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category_product
    ADD CONSTRAINT "FK_product_category_id" FOREIGN KEY (product_category_id) REFERENCES public.product_category(id) ON DELETE CASCADE;


--
-- Name: product_category_product FK_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category_product
    ADD CONSTRAINT "FK_product_id" FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: refund FK_refund_payment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT "FK_refund_payment_id" FOREIGN KEY (payment_id) REFERENCES public.payment(id);


--
-- Name: line_item line_item_order_edit_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT line_item_order_edit_fk FOREIGN KEY (order_edit_id) REFERENCES public.order_edit(id);


--
-- Name: line_item line_item_original_item_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT line_item_original_item_fk FOREIGN KEY (original_item_id) REFERENCES public.line_item(id);


--
-- PostgreSQL database dump complete
--

