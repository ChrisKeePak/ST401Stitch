[LIT]
40
39	114	150	174	150
40	114	150	114	160
42	114	160	141	160
92	130	260	133	260
100	160	38	199	38
106	106	103	113	103
107	113	103	121	103
108	113	103	113	107
109	113	107	121	107
111	168	160	168	159
112	168	159	170	159
114	164	160	168	160
115	164	164	167	164
116	164	160	164	164
119	184	186	193	186
120	193	186	197	186
121	193	189	197	189
122	193	186	193	189
134	51	158	53	158
138	95	231	103	231
139	98	240	101	240
140	101	240	101	235
141	101	235	103	235
156	115	231	131	231
157	49	154	53	154
158	49	145	49	154
159	32	162	33	162
160	33	162	33	164
161	33	164	34	164
162	51	157	51	158
163	47	157	51	157
164	111	150	114	150
165	92	158	98	158
166	65	154	98	154
167	93	150	98	150
168	45	145	49	145
169	159	186	171	186
170	154	160	159	160
171	159	160	164	160
172	159	160	159	186

[TET]
41
0	113	37	124	39	4	5	BOOL#1
1	111	45	124	47	4	5	SAFETRUE
2	109	53	124	55	4	5	safetyReset
14	160	49	181	51	4	3	CabinetEstopDiag
15	160	41	179	43	4	3	CabinetEstopOK
20	74	149	93	151	4	5	CabinetEstopOK
27	151	189	171	191	4	5	SAFETIME#60ms
28	212	37	230	39	4	3	SafetyRunning
32	201	149	213	151	4	3	SafetyOK
41	120	163	141	165	4	5	SAFETIME#500ms
57	113	68	124	70	4	5	BOOL#1
58	111	76	124	78	4	5	SAFETRUE
59	109	84	124	86	4	5	safetyReset
74	108	110	121	112	4	5	TIME#0ms
75	108	114	121	116	4	5	SAFETRUE
76	106	125	121	127	4	5	safetyReset
77	160	72	176	74	4	3	BackEstopOk
78	167	110	186	112	4	3	GuardDoorsDiag
79	167	102	184	104	4	3	GuardDoorsOk
80	75	157	92	159	4	5	GuardDoorsOk
87	111	259	130	261	4	5	CabinetEstopOK
88	160	211	181	213	4	3	GuardDoorsStatus
89	116	211	133	213	4	5	GuardDoorsOk
90	160	259	183	261	4	3	CabinetEstopStatus
91	158	230	178	232	4	3	BackEstopStatus
93	160	80	178	82	4	3	BackEstopDiag
101	183	41	199	43	4	5	TIME#100ms
102	104	41	124	43	4	5	FrontEstopInput
103	110	98	121	100	4	5	BOOL#1
104	105	72	124	74	4	5	BackEstopInput
105	87	102	106	104	4	5	GuardDoorInput
110	170	158	182	160	4	3	VFD_STO
113	167	163	180	165	4	3	VFD_STO2
117	197	185	218	187	4	3	Release_VFD_STO
118	197	188	219	190	4	3	Release_VFD_STO2
135	2	147	32	149	4	5	ExternalMachineOption000
136	4	159	34	161	4	5	ExternalMachineOption000
137	16	161	32	163	4	5	BackEstopOk
142	52	230	82	232	4	5	ExternalMachineOption000
143	55	242	85	244	4	5	ExternalMachineOption000
144	69	246	85	248	4	5	BackEstopOk

[FBS]
17
12	126	34	158	58	0	SF_EmergencyStop_V1_00	CabinetEStop
19	100	146	109	161	1	AND_S	
25	173	182	182	194	0	TON_S	ReleaseTimer
31	176	146	199	154	1	SAFEBOOL_TO_BOOL	
37	143	156	152	168	0	TOF_S	STO_Delay
45	135	208	158	216	1	SAFEBOOL_TO_BOOL	
55	126	65	158	89	0	SF_EmergencyStop_V1_00	BackEStop
72	123	95	165	127	0	SF_GuardMonitoring_V1_00	GuardDoorMonitoring
83	133	227	156	235	1	SAFEBOOL_TO_BOOL	
86	135	256	158	264	1	SAFEBOOL_TO_BOOL	
98	201	34	210	46	0	TON	SafetyProgramRunningDelay
125	34	144	43	152	1	NOT_S	
129	55	150	63	162	1	OR_S	
133	36	156	45	168	1	AND_S	
153	84	227	93	235	1	NOT_S	
154	105	227	113	239	1	OR_S	
155	87	239	96	251	1	AND_S	

[FPT]
69
3	126	37	137	39	Activate	0	128	0	BOOL
4	126	41	140	43	S_EStopIn	0	128	0	SAFEBOOL
5	126	45	143	47	S_StartReset	0	128	0	SAFEBOOL
6	126	49	143	51	S_AutoReset	0	128	0	SAFEBOOL
7	126	53	135	55	Reset	0	128	0	BOOL
8	150	37	158	39	Ready	1	0	128	BOOL
9	143	41	158	43	S_EStopOut	1	0	128	SAFEBOOL
10	151	45	158	47	Error	1	0	128	BOOL
11	146	49	158	51	DiagCode	1	0	128	WORD
16	100	149	102	151		0	1665	0	ANY_SAFEBIT
17	100	153	102	155		0	1665	0	ANY_SAFEBIT
18	108	149	109	151		1	0	643	ANY_SAFEBIT
21	173	185	178	187	IN	0	129	0	SAFEBOOL
22	173	189	178	191	PT	0	128	0	SAFETIME
23	179	185	182	187	Q	1	0	129	SAFEBOOL
24	178	189	182	191	ET	1	0	128	SAFETIME
29	176	149	178	151		0	640	0	SAFEBOOL
30	198	149	199	151		1	0	640	BOOL
33	143	159	148	161	IN	0	129	0	SAFEBOOL
34	143	163	148	165	PT	0	128	0	SAFETIME
35	149	159	152	161	Q	1	0	129	SAFEBOOL
36	148	163	152	165	ET	1	0	128	SAFETIME
43	135	211	137	213		0	640	0	SAFEBOOL
44	157	211	158	213		1	0	640	BOOL
46	126	68	137	70	Activate	0	128	0	BOOL
47	126	72	140	74	S_EStopIn	0	128	0	SAFEBOOL
48	126	76	143	78	S_StartReset	0	128	0	SAFEBOOL
49	126	80	143	82	S_AutoReset	0	128	0	SAFEBOOL
50	126	84	135	86	Reset	0	128	0	BOOL
51	150	68	158	70	Ready	1	0	128	BOOL
52	143	72	158	74	S_EStopOut	1	0	128	SAFEBOOL
53	151	76	158	78	Error	1	0	128	BOOL
54	146	80	158	82	DiagCode	1	0	128	WORD
60	100	157	102	159		0	1665	0	ANY_SAFEBIT
61	123	98	134	100	Activate	0	128	0	BOOL
62	123	102	143	104	S_GuardSwitch1	0	128	0	SAFEBOOL
63	123	106	143	108	S_GuardSwitch2	0	128	0	SAFEBOOL
64	123	110	143	112	DiscrepancyTime	0	128	0	TIME
65	123	114	140	116	S_StartReset	0	128	0	SAFEBOOL
66	123	118	140	120	S_AutoReset	0	128	0	SAFEBOOL
67	123	125	132	127	Reset	0	128	0	BOOL
68	157	98	165	100	Ready	1	0	128	BOOL
69	143	102	165	104	S_GuardMonitoring	1	0	128	SAFEBOOL
70	158	106	165	108	Error	1	0	128	BOOL
71	153	110	165	112	DiagCode	1	0	128	WORD
81	133	230	135	232		0	640	0	SAFEBOOL
82	155	230	156	232		1	0	640	BOOL
84	135	259	137	261		0	640	0	SAFEBOOL
85	157	259	158	261		1	0	640	BOOL
94	201	37	206	39	IN	0	129	0	BOOL
95	201	41	206	43	PT	0	128	0	TIME
96	207	37	210	39	Q	1	0	129	BOOL
97	206	41	210	43	ET	1	0	128	TIME
123	34	147	36	149		0	641	0	ANY_SAFEBIT
124	42	144	43	146		1	0	641	ANY_SAFEBIT
126	55	153	57	155		0	1665	0	ANY_SAFEBIT
127	55	157	57	159		0	1665	0	ANY_SAFEBIT
128	62	153	63	155		1	0	641	ANY_SAFEBIT
130	36	159	38	161		0	1665	0	ANY_SAFEBIT
131	36	163	38	165		0	1665	0	ANY_SAFEBIT
132	44	156	45	158		1	0	641	ANY_SAFEBIT
145	84	230	86	232		0	641	0	ANY_SAFEBIT
146	92	230	93	232		1	0	641	ANY_SAFEBIT
147	105	230	107	232		0	1665	0	ANY_SAFEBIT
148	105	234	107	236		0	1665	0	ANY_SAFEBIT
149	112	230	113	232		1	0	641	ANY_SAFEBIT
150	87	242	89	244		0	1665	0	ANY_SAFEBIT
151	87	246	89	248		0	1665	0	ANY_SAFEBIT
152	95	239	96	241		1	0	641	ANY_SAFEBIT

[KOT]
0

[VER]
0

