# Copyright @ Ye XIA <qazxiaye@126.com>
# data comes from course Méthodologie expérimentale pour la recherche - approches qualitatives et quantitatives

library(ggplot2)
library(reshape)

df <- read.table(header=TRUE, textConnection("Gpe	accesTuteur	Retroaction Sexe	Parcours	PreTK	PostTK	Duree	score_max	nb_modif	nb_page_cours	nb_evaluation	nb_simul
GT	illim.	epistemic	F	BIO	8.5	8.375	42.6	20	43	18	18	0
GT	illim.	epistemic	F	CHB	3	3	82.8	11	90	20	19	0
GT	illim.	epistemic	M	CHB	5	5.75	89.1	11	51	8	26	0
GC	illim.	epistemic	M	GSC	4.25	6.25	89.7	18	125	28	69	0
GC	illim.	epistemic	F	CHB	3.75	6.5	66.1	20	90	10	19	9
GC	illim.	epistemic	F	CHB	7.25	6.5	72.2	20	69	12	34	24
GC	illim.	epistemic	M	CHB	7.5	10.25	85.4	20	123	6	23	15
GC	illim.	epistemic	F	BIO	2.5	6.5	76.1	20	63	25	28	3
GC	illim.	epistemic	F	BIO	2.75	6.875	88.7	15	136	62	76	15
GC	illim.	epistemic	F	BIO	8.375	11.125	88.8	14	115	45	24	16
GC	illim.	epistemic	M	CHB	5	10.5	85.8	18	70	5	2	11
GC	illim.	epistemic	M	BIO	6.75	11.25	86.5	20	52	37	15	0
GC	illim.	epistemic	F	CHB	8.5	12.25	51.5	20	44	14	11	4
GC	illim.	epistemic	M	BIO	8	12	44.1	20	89	28	16	0
GC	illim.	epistemic	M	BIO	-1	-1	83.3	8	27	20	11	0
GC	illim.	epistemic	F	BIO	6.25	10.5	57.1	20	99	15	14	10
GC	illim.	epistemic	M	BIO	9.625	12	91.4	15	174	48	46	8
GC	illim.	epistemic	F	CHB	4.75	6.25	79.3	20	49	4	15	9
GC	illim.	epistemic	F	BIO	5.25	9.625	44.3	20	72	11	5	11
GC	illim.	epistemic	F	BIO	4	5.25	87.6	29	49	29	30	0
GC	illim.	epistemic	M	CHB	9.75	13	56.4	20	100	6	15	3
GC	illim.	epistemic	M	CHB	3	3.5	87.2	18	143	46	46	5
GC	illim.	epistemic	F	BIO	5.5	8.5	38.5	20	49	16	16	37
GC	illim.	epistemic	F	CHB	6.5	9.75	50.9	20	46	10	7	0
GC	illim.	epistemic	M	BIO	4	4.5	36	20	82	7	19	0
GC	illim.	epistemic	F	BIO	4.5	8.75	58.8	20	57	16	19	3
GC	illim.	epistemic	F	BIO	5	7.75	92.9	14	95	13	35	5
GC	illim.	epistemic	F	BIO	4.75	6.5	77.5	20	210	12	92	0
GC	illim.	epistemic	F	CHB	3	1.5	87.7	7	135	13	71	0
GC	illim.	epistemic	F	BIO	6	7.25	61.9	20	58	13	15	5
GC	illim.	epistemic	M	BIO	6.25	6.875	86.9	17	88	27	23	13
GC	illim.	epistemic	M	BIO	5.625	7.25	28.9	20	33	10	22	0
GC	illim.	epistemic	M	GSC	5.5	7.25	74.9	20	97	17	25	0
GC	illim.	epistemic	F	BIO	3	5	80.3	17	129	13	23	6
GC	illim.	epistemic	M	BIO	1.5	4	24.1	20	53	7	28	0
GC	illim.	epistemic	M	GSC	6.75	8.75	43	20	62	3	20	0
GC	illim.	epistemic	M	BIO	5.5	5	83.8	17	99	106	47	0
GC	illim.	epistemic	F	BIO	3	7.75	89.2	13	31	40	5	0
GC	illim.	epistemic	F	BIO	4	8.5	88.2	15	92	49	26	0
GC	illim.	epistemic	M	BIO	6.25	4.75	86.9	11	86	31	67	0
GExp	illim.	progress	F	CHB	7	7.875	90	18	142	16	45	0
GExp	illim.	progress	M	BIO	3.75	4.875	91.4	19	190	22	68	17
GExp	illim.	progress	F	BIO	5	7.25	89.5	12	56	19	6	0
GExp	illim.	progress	F	BIO	9	9.625	90.3	7	123	14	28	0
GExp	illim.	progress	M	CHB	8.375	11	93.5	15	75	14	30	0
GExp	illim.	progress	F	CHB	-1	-1	87.4	13	59	15	27	3
GExp	illim.	progress	F	CHB	9.25	8	85.4	14	56	36	19	4
GExp	illim.	progress	M	GSC	4.5	5.5	86.7	11	98	23	47	0
GExp	illim.	progress	M	BIO	5.75	5.25	92.2	20	162	18	102	0
GExp	illim.	progress	F	CHB	6.75	9	84.2	13	132	29	30	0
GExp	illim.	progress	F	BIO	6.75	10.25	44.2	20	78	6	6	0
GExp	illim.	progress	M	CHB	8	10.25	85.2	16	78	9	26	26
GExp	illim.	progress	F	GSC	6.25	8.125	93.4	9	66	20	16	0
GExp	illim.	progress	M	BIO	5	6.25	91.1	18	145	25	65	0
GExp	illim.	progress	F	CHB	1.5	7.25	84.4	19	124	10	49	27
GExp	illim.	progress	F	BIO	8.125	8	91.1	19	93	34	40	29
GExp	illim.	progress	F	BIO	5.25	8.5	86.2	15	82	12	33	0
GExp	illim.	progress	F	CHB	3.25	6.25	92.3	13	89	33	55	0
GExp	illim.	progress	M	BIO	3	4.5	78.5	14	54	6	46	0
GExp	illim.	progress	M	BIO	4.5	6.25	84.8	19	118	14	25	27
GExp	illim.	progress	F	BIO	3.5	3.25	86.4	14	70	21	40	0
GExp	illim.	progress	F	BIO	4.5	8	80.5	13	44	33	3	0
GExp	illim.	progress	F	BIO	3.25	6	76.8	14	78	16	62	0
GExp	illim.	progress	M	BIO	6.5	6.75	91.2	19	234	29	65	20
GExp	illim.	progress	F	CHB	5.75	5	84.8	16	115	14	33	25
GExp	illim.	progress	M	CHB	6.375	7.875	84.9	13	95	24	39	0
GExp	illim.	progress	F	BIO	8.5	10.75	66	20	50	10	11	9
GExp	illim.	progress	F	BIO	10	12	86.9	15	95	15	14	10
GExp	illim.	progress	M	CHB	2.25	2.5	84.8	11	57	9	42	0
GExp	illim.	progress	F	BIO	6.5	10.375	90.7	14	116	38	40	0
GExp	illim.	progress	M	CHB	2.625	6	88	16	135	8	79	0
GExp	illim.	progress	F	BIO	5	10.75	86.5	5	30	34	9	0
GExp	illim.	progress	F	CHB	7.25	6.5	70.1	20	104	7	19	30
GExp	illim.	progress	M	GSC	9	12.25	74.4	20	92	12	37	5
GExp	illim.	progress	F	BIO	0.5	6	86.3	6	42	45	4	0
GExp	illim.	progress	M	BIO	8	8	91.7	12	174	11	31	10
GExp	illim.	progress	F	CHB	6	7.75	86.9	13	67	17	33	0
GExp	illim.	progress	M	BIO	9.875	10.75	86.5	16	132	16	24	3
GExp	illim.	progress	F	CHB	5.75	8.5	58	20	75	7	33	7
GExp	illim.	progress	M	BIO	7.125	12	93.9	16	98	26	15	12
GExp	illim.	progress	M	BIO	4.75	7.75	88.3	19	119	20	46	13
GExp	illim.	progress	F	BIO	4.5	6.75	90.3	18	54	24	52	10
GExp	illim.	progress	F	BIO	4.25	6.25	87.5	14	134	14	93	0
GExp	illim.	progress	M	BIO	6.5	10	42.5	20	102	10	12	8
GExp	illim.	progress	M	BIO	4.25	8.5	92.8	19	69	30	21	21
GExp	illim.	progress	F	BIO	6.5	7	79.3	11	35	22	9	0
"))

png("1.png", width = 1000, height = 1000)
ggplot(df) + labs(title = "score_max vs Gpe", x = "Gpe", y = "score_max", fill = NULL) + geom_boxplot(aes(x = Gpe, y = score_max))

png("2.png", width = 1000, height = 1000)
ggplot(df) + labs(title = "Distribution of score_max", x = "score_max", y = "count", fill = NULL) + geom_histogram(aes(x=score_max, fill=Gpe))

png("3.png", width = 1000, height = 1000)
ggplot(df) + labs(title = "Distribution of score_max", x = "score_max", y = "count", fill = NULL) + geom_histogram(aes(x=score_max, fill=Gpe)) + facet_grid(Gpe ~ ., scale = "free_y") + theme(legend.position = "none")

png("4.png", width = 1000, height = 1000)
ggplot(df, aes(x=Duree, y=score_max)) + labs(title = "score_max vs duree", x = "duree", y = "score_max", fill = NULL) + geom_point(aes(color=Gpe, shape = Gpe)) + stat_smooth()

png("5.png", width = 1000, height = 1000)
ggplot(df, aes(x=Duree, y=score_max)) + labs(title = "score_max vs duree", x = "duree", y = "score_max", fill = NULL) + geom_point(aes(color=Gpe, shape = Gpe)) + stat_smooth() + facet_grid(Gpe ~ ., scale = "free_y") + theme(legend.position = "none")

png("6.png", width = 1000, height = 1000)
ggplot(df, aes(x=nb_modif, y=score_max)) + labs(title = "score_max vs nb_modif", x = "nb_modif", y = "score_max", fill = NULL) + geom_point(aes(color=Gpe, shape = Gpe)) + stat_smooth(se=FALSE)
