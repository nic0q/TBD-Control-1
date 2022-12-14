PGDMP     3                    z        
   DeliveryDB    14.5    14.5 V    T           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            U           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            V           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            W           1262    25692 
   DeliveryDB    DATABASE     h   CREATE DATABASE "DeliveryDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Chile.1252';
    DROP DATABASE "DeliveryDB";
                postgres    false            ?            1259    25749    Cliente    TABLE     ?   CREATE TABLE public."Cliente" (
    id_cliente integer NOT NULL,
    rut character varying(10) NOT NULL,
    nombre character varying(45),
    id_direccion integer
);
    DROP TABLE public."Cliente";
       public         heap    postgres    false            ?            1259    25748    Cliente_id_cliente_seq    SEQUENCE     ?   CREATE SEQUENCE public."Cliente_id_cliente_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Cliente_id_cliente_seq";
       public          postgres    false    220            X           0    0    Cliente_id_cliente_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Cliente_id_cliente_seq" OWNED BY public."Cliente".id_cliente;
          public          postgres    false    219            ?            1259    25778    Compania    TABLE        CREATE TABLE public."Compania" (
    id_compania integer NOT NULL,
    nombre character varying(100),
    id_comuna integer
);
    DROP TABLE public."Compania";
       public         heap    postgres    false            ?            1259    25777    Compania_id_compania_seq    SEQUENCE     ?   CREATE SEQUENCE public."Compania_id_compania_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Compania_id_compania_seq";
       public          postgres    false    224            Y           0    0    Compania_id_compania_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Compania_id_compania_seq" OWNED BY public."Compania".id_compania;
          public          postgres    false    223            ?            1259    25708    Comuna    TABLE     ?   CREATE TABLE public."Comuna" (
    id_comuna integer NOT NULL,
    nombre character varying(45),
    id_region integer NOT NULL
);
    DROP TABLE public."Comuna";
       public         heap    postgres    false            ?            1259    25707    Comuna_id_comuna_seq    SEQUENCE     ?   CREATE SEQUENCE public."Comuna_id_comuna_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Comuna_id_comuna_seq";
       public          postgres    false    214            Z           0    0    Comuna_id_comuna_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Comuna_id_comuna_seq" OWNED BY public."Comuna".id_comuna;
          public          postgres    false    213            ?            1259    25737 	   Direccion    TABLE     ?   CREATE TABLE public."Direccion" (
    id_direccion integer NOT NULL,
    calle character varying(100) NOT NULL,
    numero integer NOT NULL,
    id_comuna integer
);
    DROP TABLE public."Direccion";
       public         heap    postgres    false            ?            1259    25736    Direccion_id_direccion_seq    SEQUENCE     ?   CREATE SEQUENCE public."Direccion_id_direccion_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."Direccion_id_direccion_seq";
       public          postgres    false    218            [           0    0    Direccion_id_direccion_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Direccion_id_direccion_seq" OWNED BY public."Direccion".id_direccion;
          public          postgres    false    217            ?            1259    25694    Medio_transporte    TABLE     ?   CREATE TABLE public."Medio_transporte" (
    id_medio_transporte integer NOT NULL,
    patente character(6) NOT NULL,
    nombre character varying(45) NOT NULL
);
 &   DROP TABLE public."Medio_transporte";
       public         heap    postgres    false            ?            1259    25693 (   Medio_transporte_id_medio_transporte_seq    SEQUENCE     ?   CREATE SEQUENCE public."Medio_transporte_id_medio_transporte_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public."Medio_transporte_id_medio_transporte_seq";
       public          postgres    false    210            \           0    0 (   Medio_transporte_id_medio_transporte_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public."Medio_transporte_id_medio_transporte_seq" OWNED BY public."Medio_transporte".id_medio_transporte;
          public          postgres    false    209            ?            1259    25761    Pedido    TABLE     }   CREATE TABLE public."Pedido" (
    id_pedido integer NOT NULL,
    id_cliente integer NOT NULL,
    id_repartidor integer
);
    DROP TABLE public."Pedido";
       public         heap    postgres    false            ?            1259    25760    Pedido_id_pedido_seq    SEQUENCE     ?   CREATE SEQUENCE public."Pedido_id_pedido_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Pedido_id_pedido_seq";
       public          postgres    false    222            ]           0    0    Pedido_id_pedido_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Pedido_id_pedido_seq" OWNED BY public."Pedido".id_pedido;
          public          postgres    false    221            ?            1259    25790    Producto    TABLE     ?   CREATE TABLE public."Producto" (
    id_producto integer NOT NULL,
    nombre character varying(100),
    valor double precision,
    id_compania integer
);
    DROP TABLE public."Producto";
       public         heap    postgres    false            ?            1259    25789    Producto_id_producto_seq    SEQUENCE     ?   CREATE SEQUENCE public."Producto_id_producto_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Producto_id_producto_seq";
       public          postgres    false    226            ^           0    0    Producto_id_producto_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Producto_id_producto_seq" OWNED BY public."Producto".id_producto;
          public          postgres    false    225            ?            1259    25701    Region    TABLE     c   CREATE TABLE public."Region" (
    id_region integer NOT NULL,
    nombre character varying(45)
);
    DROP TABLE public."Region";
       public         heap    postgres    false            ?            1259    25700    Region_id_region_seq    SEQUENCE     ?   CREATE SEQUENCE public."Region_id_region_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Region_id_region_seq";
       public          postgres    false    212            _           0    0    Region_id_region_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Region_id_region_seq" OWNED BY public."Region".id_region;
          public          postgres    false    211            ?            1259    25720 
   Repartidor    TABLE     ?   CREATE TABLE public."Repartidor" (
    id_repartidor integer NOT NULL,
    nombre character varying(45),
    id_transporte integer NOT NULL,
    id_comuna integer NOT NULL
);
     DROP TABLE public."Repartidor";
       public         heap    postgres    false            ?            1259    25719    Repartidor_id_repartidor_seq    SEQUENCE     ?   CREATE SEQUENCE public."Repartidor_id_repartidor_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public."Repartidor_id_repartidor_seq";
       public          postgres    false    216            `           0    0    Repartidor_id_repartidor_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public."Repartidor_id_repartidor_seq" OWNED BY public."Repartidor".id_repartidor;
          public          postgres    false    215            ?            1259    25802    Venta_Detalle    TABLE     ?   CREATE TABLE public."Venta_Detalle" (
    id_venta_detalle integer NOT NULL,
    precio_total integer,
    fecha date,
    id_cliente integer NOT NULL,
    id_pedido integer NOT NULL,
    id_producto integer NOT NULL
);
 #   DROP TABLE public."Venta_Detalle";
       public         heap    postgres    false            ?            1259    25801 "   Venta_Detalle_id_venta_detalle_seq    SEQUENCE     ?   CREATE SEQUENCE public."Venta_Detalle_id_venta_detalle_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public."Venta_Detalle_id_venta_detalle_seq";
       public          postgres    false    228            a           0    0 "   Venta_Detalle_id_venta_detalle_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."Venta_Detalle_id_venta_detalle_seq" OWNED BY public."Venta_Detalle".id_venta_detalle;
          public          postgres    false    227            ?           2604    25752    Cliente id_cliente    DEFAULT     |   ALTER TABLE ONLY public."Cliente" ALTER COLUMN id_cliente SET DEFAULT nextval('public."Cliente_id_cliente_seq"'::regclass);
 C   ALTER TABLE public."Cliente" ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    220    219    220            ?           2604    25781    Compania id_compania    DEFAULT     ?   ALTER TABLE ONLY public."Compania" ALTER COLUMN id_compania SET DEFAULT nextval('public."Compania_id_compania_seq"'::regclass);
 E   ALTER TABLE public."Compania" ALTER COLUMN id_compania DROP DEFAULT;
       public          postgres    false    223    224    224            ?           2604    25711    Comuna id_comuna    DEFAULT     x   ALTER TABLE ONLY public."Comuna" ALTER COLUMN id_comuna SET DEFAULT nextval('public."Comuna_id_comuna_seq"'::regclass);
 A   ALTER TABLE public."Comuna" ALTER COLUMN id_comuna DROP DEFAULT;
       public          postgres    false    213    214    214            ?           2604    25740    Direccion id_direccion    DEFAULT     ?   ALTER TABLE ONLY public."Direccion" ALTER COLUMN id_direccion SET DEFAULT nextval('public."Direccion_id_direccion_seq"'::regclass);
 G   ALTER TABLE public."Direccion" ALTER COLUMN id_direccion DROP DEFAULT;
       public          postgres    false    218    217    218            ?           2604    25697 $   Medio_transporte id_medio_transporte    DEFAULT     ?   ALTER TABLE ONLY public."Medio_transporte" ALTER COLUMN id_medio_transporte SET DEFAULT nextval('public."Medio_transporte_id_medio_transporte_seq"'::regclass);
 U   ALTER TABLE public."Medio_transporte" ALTER COLUMN id_medio_transporte DROP DEFAULT;
       public          postgres    false    209    210    210            ?           2604    25764    Pedido id_pedido    DEFAULT     x   ALTER TABLE ONLY public."Pedido" ALTER COLUMN id_pedido SET DEFAULT nextval('public."Pedido_id_pedido_seq"'::regclass);
 A   ALTER TABLE public."Pedido" ALTER COLUMN id_pedido DROP DEFAULT;
       public          postgres    false    222    221    222            ?           2604    25793    Producto id_producto    DEFAULT     ?   ALTER TABLE ONLY public."Producto" ALTER COLUMN id_producto SET DEFAULT nextval('public."Producto_id_producto_seq"'::regclass);
 E   ALTER TABLE public."Producto" ALTER COLUMN id_producto DROP DEFAULT;
       public          postgres    false    225    226    226            ?           2604    25704    Region id_region    DEFAULT     x   ALTER TABLE ONLY public."Region" ALTER COLUMN id_region SET DEFAULT nextval('public."Region_id_region_seq"'::regclass);
 A   ALTER TABLE public."Region" ALTER COLUMN id_region DROP DEFAULT;
       public          postgres    false    212    211    212            ?           2604    25723    Repartidor id_repartidor    DEFAULT     ?   ALTER TABLE ONLY public."Repartidor" ALTER COLUMN id_repartidor SET DEFAULT nextval('public."Repartidor_id_repartidor_seq"'::regclass);
 I   ALTER TABLE public."Repartidor" ALTER COLUMN id_repartidor DROP DEFAULT;
       public          postgres    false    216    215    216            ?           2604    25805    Venta_Detalle id_venta_detalle    DEFAULT     ?   ALTER TABLE ONLY public."Venta_Detalle" ALTER COLUMN id_venta_detalle SET DEFAULT nextval('public."Venta_Detalle_id_venta_detalle_seq"'::regclass);
 O   ALTER TABLE public."Venta_Detalle" ALTER COLUMN id_venta_detalle DROP DEFAULT;
       public          postgres    false    227    228    228            I          0    25749    Cliente 
   TABLE DATA           J   COPY public."Cliente" (id_cliente, rut, nombre, id_direccion) FROM stdin;
    public          postgres    false    220   kg       M          0    25778    Compania 
   TABLE DATA           D   COPY public."Compania" (id_compania, nombre, id_comuna) FROM stdin;
    public          postgres    false    224   sh       C          0    25708    Comuna 
   TABLE DATA           @   COPY public."Comuna" (id_comuna, nombre, id_region) FROM stdin;
    public          postgres    false    214   i       G          0    25737 	   Direccion 
   TABLE DATA           M   COPY public."Direccion" (id_direccion, calle, numero, id_comuna) FROM stdin;
    public          postgres    false    218   ?i       ?          0    25694    Medio_transporte 
   TABLE DATA           R   COPY public."Medio_transporte" (id_medio_transporte, patente, nombre) FROM stdin;
    public          postgres    false    210   ?j       K          0    25761    Pedido 
   TABLE DATA           H   COPY public."Pedido" (id_pedido, id_cliente, id_repartidor) FROM stdin;
    public          postgres    false    222   uk       O          0    25790    Producto 
   TABLE DATA           M   COPY public."Producto" (id_producto, nombre, valor, id_compania) FROM stdin;
    public          postgres    false    226   ?k       A          0    25701    Region 
   TABLE DATA           5   COPY public."Region" (id_region, nombre) FROM stdin;
    public          postgres    false    212   ?l       E          0    25720 
   Repartidor 
   TABLE DATA           W   COPY public."Repartidor" (id_repartidor, nombre, id_transporte, id_comuna) FROM stdin;
    public          postgres    false    216   .m       Q          0    25802    Venta_Detalle 
   TABLE DATA           t   COPY public."Venta_Detalle" (id_venta_detalle, precio_total, fecha, id_cliente, id_pedido, id_producto) FROM stdin;
    public          postgres    false    228   ?m       b           0    0    Cliente_id_cliente_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Cliente_id_cliente_seq"', 11, true);
          public          postgres    false    219            c           0    0    Compania_id_compania_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Compania_id_compania_seq"', 11, true);
          public          postgres    false    223            d           0    0    Comuna_id_comuna_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Comuna_id_comuna_seq"', 11, true);
          public          postgres    false    213            e           0    0    Direccion_id_direccion_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."Direccion_id_direccion_seq"', 11, true);
          public          postgres    false    217            f           0    0 (   Medio_transporte_id_medio_transporte_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public."Medio_transporte_id_medio_transporte_seq"', 11, true);
          public          postgres    false    209            g           0    0    Pedido_id_pedido_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Pedido_id_pedido_seq"', 20, true);
          public          postgres    false    221            h           0    0    Producto_id_producto_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Producto_id_producto_seq"', 14, true);
          public          postgres    false    225            i           0    0    Region_id_region_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Region_id_region_seq"', 11, true);
          public          postgres    false    211            j           0    0    Repartidor_id_repartidor_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public."Repartidor_id_repartidor_seq"', 11, true);
          public          postgres    false    215            k           0    0 "   Venta_Detalle_id_venta_detalle_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public."Venta_Detalle_id_venta_detalle_seq"', 30, true);
          public          postgres    false    227            ?           2606    25754    Cliente Cliente_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Cliente"
    ADD CONSTRAINT "Cliente_pkey" PRIMARY KEY (id_cliente);
 B   ALTER TABLE ONLY public."Cliente" DROP CONSTRAINT "Cliente_pkey";
       public            postgres    false    220            ?           2606    25783    Compania Compania_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Compania"
    ADD CONSTRAINT "Compania_pkey" PRIMARY KEY (id_compania);
 D   ALTER TABLE ONLY public."Compania" DROP CONSTRAINT "Compania_pkey";
       public            postgres    false    224            ?           2606    25713    Comuna Comuna_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Comuna"
    ADD CONSTRAINT "Comuna_pkey" PRIMARY KEY (id_comuna);
 @   ALTER TABLE ONLY public."Comuna" DROP CONSTRAINT "Comuna_pkey";
       public            postgres    false    214            ?           2606    25742    Direccion Direccion_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Direccion"
    ADD CONSTRAINT "Direccion_pkey" PRIMARY KEY (id_direccion);
 F   ALTER TABLE ONLY public."Direccion" DROP CONSTRAINT "Direccion_pkey";
       public            postgres    false    218            ?           2606    25699 &   Medio_transporte Medio_transporte_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public."Medio_transporte"
    ADD CONSTRAINT "Medio_transporte_pkey" PRIMARY KEY (id_medio_transporte);
 T   ALTER TABLE ONLY public."Medio_transporte" DROP CONSTRAINT "Medio_transporte_pkey";
       public            postgres    false    210            ?           2606    25766    Pedido Pedido_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Pedido"
    ADD CONSTRAINT "Pedido_pkey" PRIMARY KEY (id_pedido);
 @   ALTER TABLE ONLY public."Pedido" DROP CONSTRAINT "Pedido_pkey";
       public            postgres    false    222            ?           2606    25795    Producto Producto_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Producto"
    ADD CONSTRAINT "Producto_pkey" PRIMARY KEY (id_producto);
 D   ALTER TABLE ONLY public."Producto" DROP CONSTRAINT "Producto_pkey";
       public            postgres    false    226            ?           2606    25706    Region Region_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Region"
    ADD CONSTRAINT "Region_pkey" PRIMARY KEY (id_region);
 @   ALTER TABLE ONLY public."Region" DROP CONSTRAINT "Region_pkey";
       public            postgres    false    212            ?           2606    25725    Repartidor Repartidor_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Repartidor"
    ADD CONSTRAINT "Repartidor_pkey" PRIMARY KEY (id_repartidor);
 H   ALTER TABLE ONLY public."Repartidor" DROP CONSTRAINT "Repartidor_pkey";
       public            postgres    false    216            ?           2606    25807     Venta_Detalle Venta_Detalle_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."Venta_Detalle"
    ADD CONSTRAINT "Venta_Detalle_pkey" PRIMARY KEY (id_venta_detalle);
 N   ALTER TABLE ONLY public."Venta_Detalle" DROP CONSTRAINT "Venta_Detalle_pkey";
       public            postgres    false    228            ?           2606    25755    Cliente cliente_direccion    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Cliente"
    ADD CONSTRAINT cliente_direccion FOREIGN KEY (id_direccion) REFERENCES public."Direccion"(id_direccion);
 E   ALTER TABLE ONLY public."Cliente" DROP CONSTRAINT cliente_direccion;
       public          postgres    false    3228    218    220            ?           2606    25784    Compania compania_comuna    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Compania"
    ADD CONSTRAINT compania_comuna FOREIGN KEY (id_comuna) REFERENCES public."Comuna"(id_comuna);
 D   ALTER TABLE ONLY public."Compania" DROP CONSTRAINT compania_comuna;
       public          postgres    false    3224    224    214            ?           2606    25743    Direccion direccion_comuna    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Direccion"
    ADD CONSTRAINT direccion_comuna FOREIGN KEY (id_comuna) REFERENCES public."Comuna"(id_comuna);
 F   ALTER TABLE ONLY public."Direccion" DROP CONSTRAINT direccion_comuna;
       public          postgres    false    3224    218    214            ?           2606    25714    Comuna fk_Comuna_Region1    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Comuna"
    ADD CONSTRAINT "fk_Comuna_Region1" FOREIGN KEY (id_region) REFERENCES public."Region"(id_region);
 F   ALTER TABLE ONLY public."Comuna" DROP CONSTRAINT "fk_Comuna_Region1";
       public          postgres    false    214    3222    212            ?           2606    25731     Repartidor fk_Repartidor_Comuna1    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Repartidor"
    ADD CONSTRAINT "fk_Repartidor_Comuna1" FOREIGN KEY (id_comuna) REFERENCES public."Comuna"(id_comuna);
 N   ALTER TABLE ONLY public."Repartidor" DROP CONSTRAINT "fk_Repartidor_Comuna1";
       public          postgres    false    3224    214    216            ?           2606    25726 *   Repartidor fk_Repartidor_Medio_transporte1    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Repartidor"
    ADD CONSTRAINT "fk_Repartidor_Medio_transporte1" FOREIGN KEY (id_transporte) REFERENCES public."Medio_transporte"(id_medio_transporte);
 X   ALTER TABLE ONLY public."Repartidor" DROP CONSTRAINT "fk_Repartidor_Medio_transporte1";
       public          postgres    false    216    210    3220            ?           2606    25808 '   Venta_Detalle fk_Venta_Detalle_Cliente1    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Venta_Detalle"
    ADD CONSTRAINT "fk_Venta_Detalle_Cliente1" FOREIGN KEY (id_cliente) REFERENCES public."Cliente"(id_cliente);
 U   ALTER TABLE ONLY public."Venta_Detalle" DROP CONSTRAINT "fk_Venta_Detalle_Cliente1";
       public          postgres    false    220    228    3230            ?           2606    25813 &   Venta_Detalle fk_Venta_Detalle_Pedido1    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Venta_Detalle"
    ADD CONSTRAINT "fk_Venta_Detalle_Pedido1" FOREIGN KEY (id_pedido) REFERENCES public."Pedido"(id_pedido);
 T   ALTER TABLE ONLY public."Venta_Detalle" DROP CONSTRAINT "fk_Venta_Detalle_Pedido1";
       public          postgres    false    3232    228    222            ?           2606    25818 )   Venta_Detalle fk_Venta_Producto_Producto1    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Venta_Detalle"
    ADD CONSTRAINT "fk_Venta_Producto_Producto1" FOREIGN KEY (id_producto) REFERENCES public."Producto"(id_producto);
 W   ALTER TABLE ONLY public."Venta_Detalle" DROP CONSTRAINT "fk_Venta_Producto_Producto1";
       public          postgres    false    226    3236    228            ?           2606    25767    Pedido pedido_cliente    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Pedido"
    ADD CONSTRAINT pedido_cliente FOREIGN KEY (id_cliente) REFERENCES public."Cliente"(id_cliente);
 A   ALTER TABLE ONLY public."Pedido" DROP CONSTRAINT pedido_cliente;
       public          postgres    false    3230    220    222            ?           2606    25772    Pedido pedido_repartidor    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Pedido"
    ADD CONSTRAINT pedido_repartidor FOREIGN KEY (id_repartidor) REFERENCES public."Repartidor"(id_repartidor);
 D   ALTER TABLE ONLY public."Pedido" DROP CONSTRAINT pedido_repartidor;
       public          postgres    false    216    222    3226            ?           2606    25796    Producto producto_compania    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Producto"
    ADD CONSTRAINT producto_compania FOREIGN KEY (id_compania) REFERENCES public."Compania"(id_compania);
 F   ALTER TABLE ONLY public."Producto" DROP CONSTRAINT producto_compania;
       public          postgres    false    226    3234    224            I   ?   x???j?0ϻO?p??g%??Lr(?^??i?r?ⷯ?????uత?:?_?+j 6̑?/S*jH?E?4Б?ec:??m???[?Һ?A??'m:???TeS??^??k.cI?????W)??ʔ?2?????>?$u????ؐ????K??zZj??]??kn?A?5?!KF???q???s???Q????
?ۻhb?W?S?5?Ϲ?m???y???S?????\?O	      M   ?   x?Ȼ
?@F?????	???LB0ҦY?*?:????GN?q?J?Z{?`:???i???oF4 ??ة?	?)??l??֬?(?k??nΔ?1rZ??H?@???Jt?"
?Ы_'#(?cԛ???cbF???????fz???no-?      C   ?   x?%?;?0뷧?	PL???(RhiV?+Y6rb.???h?<?Fc??-??F????_?A?_b?[???[?Ta`ur!?Ĩ?Ƙ?ɪ?[jjV|????$qbRd???8/l???1;t?C??cG??T??[??9? ??j?9?/1?C4?7D?u3N      G     x?M?MN?0???)|?Q?L?4]",ٰe?I?ɐ؜?!4?H~~?m??2???N?}??[??v3u?T*??56?_B??QF??pV#0?$߼?x?M?r1?k???4è?;?b?&5??{>tVk???w?	?f??Ҹ????YV- ??"?I|??|??????>?d??E9 ?~??.m????'?I?R2X?łS+\$6?.I???????=:?v?UO??;????ި???V??Ka?!m????qkO?uPJ? ??w!      ?   ?   x?M?=?0E??S|y???4؀)S?B?"B????????=?s	?Q???m???3???ň>???[?ez??K?,?L|@?+mdinq??g??d?z?C*??? \|gl?3!%ڿ?p?Vrq?'!???,?      K   W   x????0?R1??$??,|V???(jn?;???S?\짷??h??[???t?(NG%1?S???Ƨ???>??l??l?      O   ?   x?%??j?@D??t?+??T???e?K?v?6ȏB_?R?a?0???`QV??`W??? ?b???L?,
??ϫ????Ͳ?l?D??Smwp?u?T0?r?:?? ?c??
???Ѐm]^u??T?w?\??s?1s<????b9?Ăc??#,?)??C????J???b????Jo`??"z??4B      A   z   x??=!E???U?
??oI??cesCpB?<?c
w/??W'K?M???Y????+?)??K?WZ'N?p?g?-?"3'߸?D\?̙%n??2?M?????%???X?Qx? ?@?(?      E   ?   x?-ͽnA?z?~??[)???I?q???x?/?ӳH)?ifp??Y????h?P?9z?_~??T???م?b???R???)???Z??a?Ͳ???o5t??ǮN?	?Z???i??|????P?????Vs??ʈ?&?I????0QXc??"?MI?)?%k?9Vr?3?X?(?;?      Q   ?   x?u?Kr? еt??_?%??G?5?@?+?@R?57'?ϨG?W?^$?.??Gn??5?9????U1?3?2j?	׍??4?:?R?H????I5?-????V????z?E	J2ƚ3	??h???P??+p???`1? ]???<P?\??=??'|ۣ?XP$b????)???^??+
븢??}'??I1?m??:???'?HK???<??I?Dm??????Ǡ&!??Ǥ?0R۠????}*~?ſ????H??     