--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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
-- Name: packages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.packages (
    bez text NOT NULL,
    discount smallint,
    valid_from date NOT NULL,
    valid_to date NOT NULL,
    CONSTRAINT packages_discount_check CHECK ((discount > 0))
);


ALTER TABLE public.packages OWNER TO postgres;

--
-- Name: packages_sights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.packages_sights (
    id integer NOT NULL,
    bez text NOT NULL
);


ALTER TABLE public.packages_sights OWNER TO postgres;

--
-- Name: sights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sights (
    id integer NOT NULL,
    letter character(1),
    title text NOT NULL,
    image text NOT NULL,
    admission numeric(5,2),
    description text NOT NULL,
    CONSTRAINT sights_letter_check CHECK ((letter ~ '[A-Z]'::text)),
    CONSTRAINT sights_title_check CHECK ((length(title) > 5))
);


ALTER TABLE public.sights OWNER TO postgres;

--
-- Name: sights_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sights_id_seq OWNER TO postgres;

--
-- Name: sights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sights_id_seq OWNED BY public.sights.id;


--
-- Name: sights id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sights ALTER COLUMN id SET DEFAULT nextval('public.sights_id_seq'::regclass);


--
-- Data for Name: packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.packages (bez, discount, valid_from, valid_to) FROM stdin;
Spring in Vienna	15	2022-03-28	2022-06-10
Tourist Package	13	2022-01-01	2022-12-31
Young and Free	25	2022-03-01	2022-08-31
Only the Best, not the Rest	10	2022-01-01	2022-12-31
\.


--
-- Data for Name: packages_sights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.packages_sights (id, bez) FROM stdin;
38	Spring in Vienna
25	Spring in Vienna
32	Spring in Vienna
29	Spring in Vienna
30	Spring in Vienna
17	Only the Best, not the Rest
12	Only the Best, not the Rest
4	Only the Best, not the Rest
28	Only the Best, not the Rest
29	Only the Best, not the Rest
40	Only the Best, not the Rest
12	Young and Free
13	Young and Free
14	Young and Free
22	Young and Free
21	Tourist Package
22	Tourist Package
26	Tourist Package
34	Tourist Package
33	Tourist Package
29	Tourist Package
31	Tourist Package
\.


--
-- Data for Name: sights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sights (id, letter, title, image, admission, description) FROM stdin;
7	A	Augustinerkirche	/images/a/augustinerkirche-neu-2014.jpg	26.00	In der Hofpfarrkirche St. Augustin fanden zahlreiche Trauungen des Kaiserhauses statt. Hier, am Josefsplatz, heiratete Maria Theresia Franz Stefan von Lothringen, Kaiser Franz Joseph seine Sisi, Kronprinz Rudolf Prinzessin Stephanie und der Kaiser der Franzosen, Napoleon, seine Marie Louise.
6	A	Architekturzentrum Wien	/images/a/aussenansicht-architekturzentrum-wien-az-w.jpg	24.00	Das Architekturzentrum Wien (Az W) ist das einzige Architekturmuseum ??sterreichs. Es ist ein Ort der Wissensvermittlung, hier wird aber auch wissenschaftlich geforscht. Die zentrale Frage des Az W lautet: Was kann Architektur?
19	F	Sigmund Freud Museum	/images/f/sigmund-freud-museum-2020.jpg	42.00	Wiens ber??hmteste Adresse hat 2020 nach 18 Monaten Sanierungs- und Umbauphase wieder ge??ffnet. Sigmund Freuds Lebens- und Schaffensr??ume werden im frisch renovierten Museum zum Ausstellungsobjekt ernannt.
18	F	Feuerwehrmuseum	/images/f/feuerwehrmuseum.jpg	10.00	Die Zentrale der Wiener Berufsfeuerwehr am Hof beherbergt auch das spannende Feuerwehrmuseum.
11	B	Bestattungsmuseum	/images/b/bestattungsmuseum-zentralfriedhof.jpg	41.00	Das Bestattungsmuseum am Wiener Zentralfriedhof gibt Einblicke in die Bestattungs- und Friedhofskultur der vergangenen Jahrhunderte. Interessant, morbid und herrlich skurril. Nicht vers??umen: die vor schwarzem Humor triefenden Merchandising-Artikel im Museumsshop.
17	F	Ernst Fuchs-Museum	/images/f/50274-ernst-fuchs-museum.jpg	37.00	Otto Wagner hat die aufwendig gestaltete wei??e Villa im Gr??nen f??r sich und seine "G??ttergattin" Louise 1886 bis 1888 gebaut. Der 2015 verstorbene Maler Ernst Fuchs, Hauptvertreter des Wiener Phantastischen Realismus, hat die Villa etwas ver??ndert und Besuchern zug??nglich gemacht.
21	F	Friedhof St. Marx	/images/f/friedhof-st-marx-grab.jpg	1.00	1791 wurde Wolfgang Amadeus Mozart hier in einem nicht gekennzeichneten Grab beigesetzt; das Grabdenkmal stammt aus sp??terer Zeit.
20	F	Viktor Frankl Museum	/images/f/wien-karte-viktor-frankl-museum.jpg	46.00	Dem weltweit bekannten Begr??nder der Logotherapie und Existenzanalyse Viktor E. Frankl ist ein Museum im 9. Bezirk gewidmet.
22	F	??sterreichisches Filmmuseum	/images/f/oesterreichisches-filmmuseum-foyer.jpg	46.00	Das ??sterreichische Filmmuseum in der Albertina, an der S??dspitze der Hofburg, zeigt in seinem Kino Retrospektiven und Einzelpr??sentationen auf der Kinoleinwand. Heimische und internationale Filmemacher, Vortr??ge und eine Bibliothek lassen die Herzen von Filmliebhabern h??her schlagen.
3	A	Ankeruhr	/images/a/50160-ankeruhr-jugendstil.jpg	32.00	Die Ankeruhr ist eigentlich eine Br??cke und verbindet die zwei Geb??udeteile des Anker-Hofes. Der Jugendstilmaler Franz Matsch hat die Uhr entworfen.Sie wurde 1911 - 1914 errichtet. Im Lauf von zw??lf Stunden laufen zw??lf Figuren bzw. Figurenpaare aus der Geschichte Wiens ??ber die Br??cke. Um 12 Uhr mittags paradieren bei Musikbegleitung alle Figuren. Im Advent erklingen t??glich Weihnachtslieder um 17 und 18 Uhr.
40	W	Wagner Stadtbahn-Pavillons	/images/w/50239-otto-wagner-stadtbahn-pavillon.jpg	41.00	Vor 100 Jahren wurde die Wiener Stadtbahn er??ffnet. Architektur und Design stammen von Otto Wagner, dem wichtigsten ??sterreichischen Architekten der Jahrhundertwende.
36	R	Wiener Rathaus	/images/r/40618-rathaus.jpg	15.00	Das von 1872 bis 1883 von Friedrich von Schmidt, vorher Dombaumeister in K??ln, erbaute Wiener Rathaus ist der bedeutendste nichtkirchliche Bau Wiens im neugotischen Stil.
35	N	Naturhistorisches Museum Wien	/images/n/50836-naturhistorisches-museum-wien-nhm-dinosaurier.jpg	10.00	Das Naturhistorische Museum Wien z??hlt mit seinen 30 Millionen Sammlungsobjekten zu den besten der Welt: Highlights wie die Venus von Willendorf, die riesige Meteoritensammlung, Pr??parate von ausgestorbenen Tieren, Modelle furchteinfl????ender Dinosaurier und ein digitales Planetarium locken j??hrlich die Besucher ins Haus am Ring.
39	R	R??mermuseum am Hohen Markt	/images/r/roemermuseum-innenaufnahme-1-.jpg	16.00	Ein Zeitreise, zur??ck ins Wien der Antike, bietet das R??mermuseum am Hohen Markt. Neueste Technologien geben hier einen umfassenden Einblick in den Alltag des ehemaligen r??mischen Legionslagers sowie der Lagervor- und der Zivilstadt "Vindobona".
37	R	Die Wiener Ringstra??e	/images/r/40645-blick-auf-die-ringstrasse-strassenbahn-universitaet.jpg	30.00	Die Wiener Ringstra??e ist 5,3 Kilometer lang. Lang genug, um zahlreichen monumentalen Geb??uden Platz zu geben, die w??hrend des Historismus in den 1860er bis 1890er Jahren erbaut wurden. Die dort errichteten Bauten ??? von Staatsoper bis zum Kunsthistorischen Museum ??? geh??ren heute zu den wichtigsten Sehensw??rdigkeiten Wiens.
42	W	Ein Museum im Waschsalon	/images/w/50719-gemeindebau-karl-marx-hof-aussenansicht-innenhof-park-baeume.jpg	5.00	"Das Rote Wien im Waschsalon" besch??ftigt sich mit der von der Sozialdemokratie gepr??gten Geschichte der Stadt Wien.
41	W	Werkbundsiedlung	/images/w/50715-sozialer-wohnbau-werkbundsiedlung-jagicgasse.jpg	17.00	Die Werkbundsiedlung vereint die gro??en Architekten der Pionierzeit der Moderne wie kein anderer Ort in Wien. Adolf Loos hat f??r die Musterhaussiedlung Pl??ne entworfen, aber auch Richard Neutra, Josef Frank, Clemens Holzmeister und Margarete Sch??tte-Lihotzky.
38	R	Wiener Riesenrad	/images/r/40882-riesenrad-prater-fruehling.jpg	13.00	Das Riesenrad im Wiener Prater ist eines der Wahrzeichen der Stadt. Aus fast 65 Metern H??he hat man einen atemberaubenden Blick ??ber die Donaumetropole.
5	A	Albertina modern	/images/a/kuenstlerhaus-albertina-modern-frontansicht.jpg	5.00	Wien hat seit 2020 ein neues Museum f??r moderne und zeitgen??ssische Kunst. Und was f??r eines: Die Albertina modern bespielt als Dependance der weltber??hmten Albertina rund 2.500 m?? im rundumerneuerten K??nstlerhaus. Die wichtigste Sammlung ??sterreichischer Kunst nach 1945, die Sammlung Essl sowie die Sammlung Jablonka bilden das Fundament des neuen Kunst-Hot-Spots. Es wartet ein Kunstmuseum der Superlative.
2	A	Albertina	/images/a/50731-albertina-aussenansicht.jpg	26.00	Die Gem??ldegalerie im von Theophil Hansen errichteten Geb??ude am Wiener Schillerplatz umfasst herausragende Werke alter Meister aus mehreren Jahrhunderten Kunstgeschichte.
10	B	Beethoven in Wien	/images/b/beethoven-denkmal-beethovenplatz.jpg	43.00	35 Jahre lang war Wien Lebensmittelpunkt von Ludwig van Beethoven. Die Spuren des Komponisten sind vielf??ltig: ein gro??es Beethoven Museum, Wohn- und Gedenkst??tten, Orte seiner Triumphe und Verzweiflung, Denkm??ler und Klimts Beethovenfries - bis hin zum Beethoven-Heurigen.
9	B	Belvedere - Schloss und Museum	/images/b/50696-oberes-belvedere-belvedere-schlosspark.jpg	45.00	Das Belvedere ist nicht nur ein prachtvolles Barockschloss, sondern beherbergt auch eine der wertvollsten Kunstsammlungen ??sterreichs ??? mit Hauptwerken von Gustav Klimt, Egon Schiele und Oskar Kokoschka.
8	B	Burgtheater	/images/b/40760-panorama-burgtheater-stephansdom.jpg	33.00	Das Burgtheater ist die wichtigste Schauspielb??hne ??sterreichs und das gr????te Sprechtheater Europas, das Tradition, Vielfalt und Fortgang verbindet. Es war eine Institution von Rang, lange bevor es das repr??sentative Geb??ude am Ring bezog. Vor rund 250 Jahren hatte man einen an die Hofburg angrenzenden Ballsall als Theater umfunktioniert.
14	D	Donauturm	/images/d/donauturm-2018-aussenaufnahme.jpg	46.00	Der 360-Grad-Rundumblick ??ber Wien ist atemberaubend. Frisch saniert pr??sentiert sich der Donauturm in neuem Glanz. Besser gesagt in altem Glanz. Das sich um die eigene Achse drehende Turmrestaurant und das Turmcaf?? in 170 Metern H??he wurden in den Stil der 1960er-Jahre zur??ckversetzt. ??? Modern interpretiert nat??rlich und technisch auf den neuesten Stand gebracht. 1964 wurde der Donauturm anl??sslich der Wiener Gartenschau errichtet.
15	E	Ephesos Museum	/images/e/ephesos-museum-neu-2014.jpg	2.00	Gr????e und Glanz des antiken Ephesos (T??rkei) werden inmitten des j??ngsten Teils der Hofburg offenbar ??? bei einer Zeitreise voller Kontraste.
12	D	Dritte Mann Museum	/images/d/50987-dritte-mann-museum.jpg	8.00	Das Dritte Mann Museum ist Anlaufstelle f??r Filminteressierte und T??r??ffner zur Wiener Nachkriegs-Geschichte. Neben der umfangreichen Sammlung an Originalexponaten ??ber den 1948 in Wien gedrehten Filmklassiker "Der dritte Mann" besch??ftigt sich eine ausf??hrliche Dokumentation mit dem historischen Hintergrund des Films und zeigt Originale aus der Besatzungszeit in Wien (1945-1955).
27	J	Museum Judenplatz	/images/j/museum-judenplatz-c-nafez-rerhuf.jpg	35.00	Der Judenplatz gilt als einzigartiger Ort der Erinnerung: Er vereint Rachel Whitereads Mahnmal mit den Ausgrabungen der mittelalterlichen Synagoge und einem Museum zum mittelalterlichen Judentum zu einer Einheit des Gedenkens.
34	N	Prunksaal der Nationalbibliothek	/images/n/prunksaal-nationalbibliothek-3-.jpg	21.00	Der Prunksaal, das Herz der ??sterreichischen Nationalbibliothek, z??hlt zu den sch??nsten Bibliothekss??len der Welt. Sie ist die gr????te Barock-Bibliothek Europas.
32	K	Klimt-Villa	/images/k/klimt-villa-nordfassade.jpg	37.00	Von 1911 bis zu seinem Tod 1918 benutzte Gustav Klimt eine Villa im 13. Wiener Bezirk als Atelier. Dieses wurde revitalisiert und wieder der ??ffentlichkeit zug??nglich gemacht.
24	G	Globen- und Esperantomuseum	/images/g/globenmuseum.jpg	24.00	Im restaurierten Palais Mollard erwarten Sie das einzige Globenmuseum der Welt sowie das Esperantomuseum. Das einzigartige Globenmuseum, das unweit der Hofburg im Palais Mollard untergebracht ist, pr??sentiert 240 Erd- und Himmelsgloben, Mond- und Marsgloben im Original.
23	F	Foltermuseum	/images/f/foltermuseum-wien.jpg	22.00	Aufkl??rung und Information ??ber die dunklen Seiten der Menschheitsgeschichte bietet das "Foltermuseum". Mit anschaulichen und bedr??ckend eindringlichen Exponaten.
31	K	Kirche am Steinhof	/images/k/kirche-am-steinhof-50230.jpg	11.00	Die 1904 bis 1907 erbaute Kirche zum Hl. Leopold am Steinhof ist ein architektonisches Meisterwerk Otto Wagners und der erste Kirchenbau der Moderne in Europa.
33	K	Kunstkammer Wien	/images/k/kunstkammer-saliera-benvenuto-cellini.jpg	36.00	Mehr als 2.100 wertvolle Objekte, die von den Habsburgern ??ber Jahrhunderte gesammelt wurden, sind in der Kunstkammer Wien zu sehen, eine der bedeutendsten Kunstkammern der Welt
26	J	Josephinum	/images/j/ausstellungsansicht-josephinum.jpg	34.00	1785 wurde die medizinisch-chirurgische Akademie von Kaiser Joseph II. gegr??ndet, um ??rzte und Hebammen f??r den zivilen und milit??rischen Bereich nach einem neuen Modell auszubilden. Von 1784 bis 1788 wurden insgesamt 1192 Wachsmodelle in Florenz hergestellt, m??hsam nach Wien transportiert und in sieben R??umen in Vitrinen aus Rosenholz und venezianischem Glas ausgestellt. Zur Erl??uterung waren Beschreibungen in Italienisch und Deutsch beigelegt. Heute ist die Sammlung in sechs R??umen des Josephinums untergebracht.
28	J	J??disches Museum	/images/j/juedisches-museum-wien-palais-eskeles-dorotheergasse.jpg	19.00	Das J??dische Museum in der Dorotheergasse gibt einen ??berblick ??ber die Geschichte und Gegenwart der J??dinnen und Juden in Wien - mit einer Dauerausstellung, spannenden Wechselausstellungen und einem Schaudepot.
25	G	Die Gloriette	/images/g/gloriette.jpg	18.00	Erbaut wurde die Gloriette 1775. Daran erinnert heute noch die Inschrift des Mittelteils: "JOSEPHO II. AUGUSTO ET MARIA THERESIA IMPERANTIB. MDCCLXXV" (Unter der Regierung von Kaiser Joseph und Kaiserin Maria Theresia errichtet 1775). Damals wusste man sch??ne Ausblicke zu sch??tzen - und hat eine 20 Meter hohe Aussichts-Terrasse geschaffen (nur ??ber eine Wendeltreppe zug??nglich). Unser Tipp: Fotoapparat nicht vergessen!
29	K	Kaiserappartements	/images/k/kaiserappartements-neu-1-.jpg	25.00	In den Kaiserappartements in der Wiener Hofburg kann man die privaten und offiziellen Gem??cher von Kaiser Franz Joseph und Kaiserin Elisabeth erkunden. Die Wiener Hofburg diente bis zum Ende der Monarchie 1918 als Wohn- und Arbeitsst??tte der kaiserlichen Familie.
30	K	Karlskirche	/images/k/50869-karlskirche-karlsplatz.jpg	29.00	1739 von seinem Sohn Joseph Emanuel Fischer von Erlach vollendet, erfolgte der Bau auf Grund eines Gel??bdes von Kaiser Karl VI. w??hrend einer Pestepidemie. Geweiht ist die Kirche dem Namenspatron des Habsburgerkaisers, dem Hl. Karl Borrom??us: Das kleine Museo Borromeo stellt unter anderem Reisekleider des Mail??nder Bischofs aus.
4	A	Augarten Wien 	/images/a/porzellanmuseum-im-augarten-porzellanmanufaktur-schloss-augarten.jpg	8.00	1718 gegr??ndet, ist die Wiener Porzellanmanufaktur die zweit??lteste Europas. Heute wie damals wird Porzellan von Hand gefertigt und bemalt. Somit wird jedes St??ck zum Unikat.
43	W	Wotrubakirche	/images/w/50890-wotruba-kirche-kirche-zur-heiligsten-dreifaltigkeit.jpg	14.00	Die Kirche auf dem Sankt-Georgen-Berg am Rand des Wienerwaldes wurde 1974 bis 1976 nach dem Entwurf des ??sterreichischen Bildhauers Fritz Wotruba (1907- 1975) erbaut.
13	D	Dokumentationsarchiv	/images/d/doew-1-.jpg	0.00	Das Dokumentationsarchiv des ??sterreichischen Widerstandes (D??W) besch??ftigt sich mit der grausamen NS-Vergangenheit.
1	A	Akademie der bildenden K??nste	/images/a/gemaeldegalerie-akademie-der-bildenden-kuenste.jpg	32.00	Die Gem??ldegalerie im von Theophil Hansen errichteten Geb??ude am Wiener Schillerplatz umfasst herausragende Werke alter Meister aus mehreren Jahrhunderten Kunstgeschichte.
16	E	Schloss Esterh??zy	/images/e/schloss-esterh??zy-regionalpartner-2022.jpg	37.00	Die Esterh??zy Kulturangebote im Burgenland bieten das ganze Jahr spannende Erlebnisse: vom ma??geschneiderten Ausflugsprogramm bis zur Open-Air-Oper im Steinbruch St. Margarethen oder einem Besuch beim Herbstgold Festival in Eisenstadt.
\.


--
-- Name: sights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sights_id_seq', 43, true);


--
-- Name: packages packages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (bez);


--
-- Name: packages_sights packages_sights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages_sights
    ADD CONSTRAINT packages_sights_pkey PRIMARY KEY (id, bez);


--
-- Name: sights sights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sights
    ADD CONSTRAINT sights_pkey PRIMARY KEY (id);


--
-- Name: packages_sights packages_sights_bez_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages_sights
    ADD CONSTRAINT packages_sights_bez_fkey FOREIGN KEY (bez) REFERENCES public.packages(bez) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

