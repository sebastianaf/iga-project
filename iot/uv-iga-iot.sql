PGDMP                         z         
   uv-iga-iot    14.4 (Debian 14.4-1.pgdg110+1)    14.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16384 
   uv-iga-iot    DATABASE     `   CREATE DATABASE "uv-iga-iot" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE "uv-iga-iot";
             
   uv-iga-iot    false            �            1255    16452    query() 	   PROCEDURE     �   CREATE PROCEDURE public.query()
    LANGUAGE sql
    AS $$SELECT * FROM public.metrics
WHERE metrics.metric_type_id = 1
ORDER BY id DESC 
LIMIT 1000$$;
    DROP PROCEDURE public.query();
       public       
   uv-iga-iot    false            �            1259    16434    metric_types    TABLE     �   CREATE TABLE public.metric_types (
    id integer NOT NULL,
    value character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
     DROP TABLE public.metric_types;
       public         heap 
   uv-iga-iot    false            �            1259    16433    metric_types_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metric_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.metric_types_id_seq;
       public       
   uv-iga-iot    false    212                       0    0    metric_types_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.metric_types_id_seq OWNED BY public.metric_types.id;
          public       
   uv-iga-iot    false    211            �            1259    16441    metrics    TABLE     �   CREATE TABLE public.metrics (
    id integer NOT NULL,
    value double precision NOT NULL,
    metric_type_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.metrics;
       public         heap 
   uv-iga-iot    false            �            1259    16440    metrics_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.metrics_id_seq;
       public       
   uv-iga-iot    false    214                       0    0    metrics_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.metrics_id_seq OWNED BY public.metrics.id;
          public       
   uv-iga-iot    false    213            �            1259    16421    users    TABLE     +  CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    alias character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    id_user integer NOT NULL,
    created_at timestamp with time zone
);
    DROP TABLE public.users;
       public         heap 
   uv-iga-iot    false            �            1259    16420    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       
   uv-iga-iot    false    210                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public       
   uv-iga-iot    false    209            k           2604    16437    metric_types id    DEFAULT     r   ALTER TABLE ONLY public.metric_types ALTER COLUMN id SET DEFAULT nextval('public.metric_types_id_seq'::regclass);
 >   ALTER TABLE public.metric_types ALTER COLUMN id DROP DEFAULT;
       public       
   uv-iga-iot    false    212    211    212            m           2604    16444 
   metrics id    DEFAULT     h   ALTER TABLE ONLY public.metrics ALTER COLUMN id SET DEFAULT nextval('public.metrics_id_seq'::regclass);
 9   ALTER TABLE public.metrics ALTER COLUMN id DROP DEFAULT;
       public       
   uv-iga-iot    false    213    214    214            j           2604    16424    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       
   uv-iga-iot    false    209    210    210                      0    16434    metric_types 
   TABLE DATA           =   COPY public.metric_types (id, value, created_at) FROM stdin;
    public       
   uv-iga-iot    false    212   �       
          0    16441    metrics 
   TABLE DATA           H   COPY public.metrics (id, value, metric_type_id, created_at) FROM stdin;
    public       
   uv-iga-iot    false    214   4                  0    16421    users 
   TABLE DATA           U   COPY public.users (id, name, alias, password, role, id_user, created_at) FROM stdin;
    public       
   uv-iga-iot    false    210   Q                   0    0    metric_types_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.metric_types_id_seq', 1, false);
          public       
   uv-iga-iot    false    211                       0    0    metrics_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.metrics_id_seq', 3, true);
          public       
   uv-iga-iot    false    213                       0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public       
   uv-iga-iot    false    209            v           2606    16439    metric_types metric_types_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.metric_types
    ADD CONSTRAINT metric_types_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.metric_types DROP CONSTRAINT metric_types_pkey;
       public         
   uv-iga-iot    false    212            x           2606    16446    metrics metrics_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT metrics_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.metrics DROP CONSTRAINT metrics_pkey;
       public         
   uv-iga-iot    false    214            p           2606    16432    users users_alias_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_alias_key UNIQUE (alias);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_alias_key;
       public         
   uv-iga-iot    false    210            r           2606    16430    users users_name_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.users DROP CONSTRAINT users_name_key;
       public         
   uv-iga-iot    false    210            t           2606    16428    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         
   uv-iga-iot    false    210            y           2606    16447 #   metrics metrics_metric_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT metrics_metric_type_id_fkey FOREIGN KEY (metric_type_id) REFERENCES public.metric_types(id) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.metrics DROP CONSTRAINT metrics_metric_type_id_fkey;
       public       
   uv-iga-iot    false    212    3190    214               2   x�3�L.-*J�+�4202�5��50U00�# �ː�<�$��t� 9��      
      x������ � �         q   x�3�tL����L�*F�*�*E%�Y��fF�A%�!9�U~zyIYa�y~aYF>�&��~�~y�9!���P#9���t,tL-�LL����́B�\1z\\\ ��     