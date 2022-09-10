local AtlasLoot = _G.AtlasLoot
local Companion = {}
AtlasLoot.Data.Companion = Companion
local AL = AtlasLoot.Locales
local ALIL = AtlasLoot.IngameLocales

-- lua
local format = string.format

-- WoW
local COMPANION_TYPE = {
    [1] = { "CRITTER",  ALIL["Pet"] },
    [2] = { "MOUNT",    ALIL["Mount"] },
}

local COMPANION_DATA = {
    -- [itemID] = {spellID, creatureID, creatureType}
    [1029] = {3599,2523,1},
	[1032] = {5730,3579,1},
	[1041] = {578,356,2},
	[1132] = {580,358,2},
	[1133] = {581,359,2},
	[1134] = {459,4268,2},
	[2411] = {470,308,2},
	[2413] = {471,306,2},
	[2414] = {472,307,2},
	[2415] = {468,305,2},
	[3112] = {6377,3907,1},
	[3125] = {6363,3902,1},
	[3133] = {5675,3573,1},
	[4158] = {6392,3913,1},
	[4168] = {2484,2630,1},
	[4171] = {6391,3912,1},
	[4181] = {6392,3913,1},
	[4201] = {126,4277,1},
	[4401] = {4055,2671,1},
	[5655] = {6648,4269,2},
	[5656] = {458,284,2},
	[5663] = {579,4270,2},
	[5665] = {6653,4271,2},
	[5668] = {6654,4272,2},
	[5697] = {5394,3527,1},
	[5700] = {6375,3906,1},
	[5701] = {6495,3968,1},
	[5702] = {6390,3911,1},
	[5705] = {6377,3907,1},
	[5706] = {6364,3903,1},
	[5712] = {6365,3904,1},
	[5864] = {6777,4710,2},
	[5872] = {6899,4779,2},
	[5873] = {6898,4777,2},
	[5874] = {6896,4780,2},
	[5875] = {6897,4778,2},
	[6648] = {8071,5873,1},
	[6649] = {3599,2523,1},
	[6650] = {5394,3527,1},
	[8485] = {10673,7385,1},
	[8486] = {10674,7384,1},
	[8487] = {10676,7382,1},
	[8488] = {10678,7381,1},
	[8489] = {10679,7386,1},
	[8490] = {10677,7380,1},
	[8491] = {10675,7383,1},
	[8492] = {10683,7387,1},
	[8494] = {10682,7391,1},
	[8495] = {10684,7389,1},
	[8496] = {10680,7390,1},
	[8497] = {10711,7560,1},
	[8498] = {10698,7545,1},
	[8499] = {10697,7544,1},
	[8500] = {10707,7553,1},
	[8501] = {10706,7555,1},
	[8563] = {10873,7739,2},
	[8583] = {8980,6486,2},
	[8586] = {16084,7704,2},
	[8588] = {8395,6075,2},
	[8589] = {10795,7706,2},
	[8590] = {10798,7703,2},
	[8591] = {10796,7707,2},
	[8592] = {10799,7708,2},
	[8595] = {10969,7749,2},
	[8627] = {10787,7322,2},
	[8628] = {10792,7689,2},
	[8629] = {10793,7690,2},
	[8630] = {10790,7686,2},
	[8631] = {8394,6074,2},
	[8632] = {10789,7687,2},
	[8633] = {10788,7684,2},
	[8881] = {6392,3913,1},
	[9038] = {3599,2523,1},
	[9039] = {3599,2523,1},
	[9041] = {2484,2630,1},
	[9043] = {5730,3579,1},
	[9045] = {3599,2523,1},
	[9046] = {3599,2523,1},
	[9047] = {3599,2523,1},
	[9059] = {3599,2523,1},
	[9214] = {1122,89,1},
	[10360] = {10714,7565,1},
	[10361] = {10716,7562,1},
	[10392] = {10717,7567,1},
	[10393] = {10688,7395,1},
	[10394] = {10709,14421,1},
	[10398] = {12243,8376,1},
	[10822] = {10695,7543,1},
	[11023] = {10685,7394,1},
	[11026] = {10704,7549,1},
	[11027] = {10703,7550,1},
	[11110] = {13548,30379,1},
	[11474] = {15067,9662,1},
	[11825] = {15048,9656,1},
	[11826] = {15049,9657,1},
	[11903] = {15648,9936,1},
	[12264] = {15999,10259,1},
	[12302] = {16056,10322,2},
	[12303] = {16055,7322,2},
	[12325] = {16058,10336,2},
	[12326] = {16059,10337,2},
	[12327] = {16060,10338,2},
	[12330] = {16080,4270,2},
	[12351] = {16081,359,2},
	[12353] = {16083,305,2},
	[12354] = {16082,306,2},
	[12529] = {16450,10598,1},
	[13086] = {17229,11021,2},
	[13317] = {17450,7706,2},
	[13321] = {17453,11147,2},
	[13322] = {17454,10180,2},
	[13323] = {17455,11148,2},
	[13324] = {17456,11149,2},
	[13325] = {17458,10178,2},
	[13326] = {15779,10179,2},
	[13327] = {17459,11150,2},
	[13328] = {17461,4780,2},
	[13329] = {17460,4778,2},
	[13331] = {17462,11153,2},
	[13332] = {17463,11154,2},
	[13333] = {17464,11155,2},
	[13334] = {17465,11156,2},
	[13335] = {17481,30542,2},
	[13582] = {17709,11327,1},
	[13583] = {17707,11325,1},
	[13584] = {17708,11326,1},
	[14062] = {18363,11689,2},
	[15277] = {18989,12149,2},
	[15290] = {18990,11689,2},
	[15292] = {18991,12151,2},
	[15293] = {18992,12148,2},
	[15996] = {19772,12419,1},
	[16338] = {458,284,2},
	[16339] = {16082,306,2},
	[16343] = {6654,4272,2},
	[18241] = {22717,14332,2},
	[18242] = {22723,14336,2},
	[18243] = {22719,14334,2},
	[18244] = {22720,14335,2},
	[18245] = {22724,14329,2},
	[18246] = {22721,14330,2},
	[18247] = {22718,14333,2},
	[18248] = {22722,14331,2},
	[18766] = {23221,14556,2},
	[18767] = {23219,14555,2},
	[18768] = {23220,14557,2},
	[18772] = {23225,14553,2},
	[18773] = {23223,14552,2},
	[18774] = {23222,14551,2},
	[18776] = {23227,14559,2},
	[18777] = {23229,14561,2},
	[18778] = {23228,14560,2},
	[18785] = {23240,14547,2},
	[18786] = {23238,14546,2},
	[18787] = {23239,14548,2},
	[18788] = {23241,14545,2},
	[18789] = {23242,14543,2},
	[18790] = {23243,14544,2},
	[18791] = {23246,14558,2},
	[18793] = {23247,14542,2},
	[18794] = {23249,14549,2},
	[18795] = {23248,14550,2},
	[18796] = {23250,14540,2},
	[18797] = {23251,14539,2},
	[18798] = {23252,14541,2},
	[18902] = {23338,14602,2},
	[18963] = {23428,14633,1},
	[18964] = {23429,14629,1},
	[18965] = {23432,14632,1},
	[18966] = {23431,14630,1},
	[18967] = {23430,14631,1},
	[19029] = {23509,14744,2},
	[19030] = {23510,14745,2},
	[19054] = {23530,14756,1},
	[19055] = {23531,14755,1},
	[19450] = {23811,14878,1},
	[19872] = {24242,15090,2},
	[19902] = {24252,15104,2},
	[20371] = {24696,15186,1},
	[20651] = {25018,15361,1},
	[20769] = {25162,15429,1},
	[21168] = {25849,15661,1},
	[21176] = {26656,15711,2},
	[21218] = {25953,15666,2},
	[21277] = {26010,15699,1},
	[21292] = {25361,15464,1},
	[21301] = {26533,15698,1},
	[21305] = {26541,15705,1},
	[21308] = {26529,15706,1},
	[21309] = {26045,15710,1},
	[21321] = {26054,15716,2},
	[21323] = {26056,15715,2},
	[21324] = {26055,15714,2},
	[21736] = {3363,16597,2},
	[22114] = {27241,16069,1},
	[22235] = {27570,16085,1},
	[22780] = {28487,16445,1},
	[22781] = {28505,16456,1},
	[23002] = {28738,16547,1},
	[23007] = {28739,16548,1},
	[23015] = {28740,16549,1},
	[23083] = {28871,16701,1},
	[23193] = {29059,11195,2},
	[23712] = {30152,17254,1},
	[23713] = {30156,17255,1},
	[23720] = {30174,17266,2},
	[25470] = {32235,18360,2},
	[25471] = {32239,18357,2},
	[25472] = {32240,18359,2},
	[25473] = {32242,18406,2},
	[25474] = {32243,18363,2},
	[25475] = {32244,18364,2},
	[25476] = {32245,18365,2},
	[25477] = {32246,18377,2},
	[25527] = {32289,18376,2},
	[25528] = {32290,18375,2},
	[25529] = {32292,18362,2},
	[25531] = {32295,18378,2},
	[25532] = {32296,18380,2},
	[25533] = {32297,18379,2},
	[25535] = {32298,18381,1},
	[25596] = {32345,18545,2},
	[25664] = {32420,18474,2},
	[27445] = {33050,18839,1},
	[28481] = {34406,19658,2},
	[28482] = {34407,19659,2},
	[28915] = {39316,22511,2},
	[28927] = {34795,19280,2},
	[28936] = {33660,19281,2},
	[29102] = {34896,20072,2},
	[29103] = {34897,20151,2},
	[29104] = {34898,20152,2},
	[29105] = {34899,20150,2},
	[29220] = {35020,20220,2},
	[29221] = {35022,20222,2},
	[29222] = {35018,20217,2},
	[29223] = {35025,20224,2},
	[29224] = {35027,20223,2},
	[29227] = {34896,20072,2},
	[29228] = {34790,20149,2},
	[29229] = {34898,20152,2},
	[29230] = {34899,20150,2},
	[29231] = {34897,20151,2},
	[29363] = {35156,20408,1},
	[29364] = {35239,20472,1},
	[29465] = {22719,14334,2},
	[29466] = {22718,14333,2},
	[29467] = {22720,14335,2},
	[29468] = {22717,14332,2},
	[29469] = {22724,14329,2},
	[29470] = {22722,14331,2},
	[29471] = {22723,14336,2},
	[29472] = {22721,14330,2},
	[29743] = {35711,20847,2},
	[29744] = {35710,20846,2},
	[29745] = {35713,20848,2},
	[29746] = {35712,20849,2},
	[29747] = {35714,20850,2},
	[29901] = {35907,21010,1},
	[29902] = {35909,21009,1},
	[29903] = {35910,21008,1},
	[29904] = {35911,21018,1},
	[29953] = {36027,21055,1},
	[29956] = {36028,21064,1},
	[29957] = {36029,21063,1},
	[29958] = {36031,21056,1},
	[29960] = {36034,21076,1},
	[30360] = {24988,15358,1},
	[30480] = {36702,21354,2},
	[30609] = {37015,21510,2},
	[31665] = {38842,22328,1},
	[31760] = {39181,22445,1},
	[31829] = {39315,22510,2},
	[31830] = {39315,22510,2},
	[31831] = {39317,22512,2},
	[31832] = {39317,22512,2},
	[31833] = {39318,22513,2},
	[31834] = {39318,22513,2},
	[31835] = {39319,22514,2},
	[31836] = {39319,22514,2},
	[32233] = {39709,22943,1},
	[32314] = {39798,22958,2},
	[32316] = {39801,22975,2},
	[32317] = {39800,22976,2},
	[32318] = {39802,22977,2},
	[32319] = {39803,22978,2},
	[32458] = {40192,18545,2},
	[32465] = {40319,23114,1},
	[32498] = {40405,23198,1},
	[32588] = {40549,23234,1},
	[32616] = {40614,23258,1},
	[32617] = {40613,23231,1},
	[32622] = {40634,23266,1},
	[32768] = {41252,23408,2},
	[32857] = {41513,23455,2},
	[32858] = {41514,23456,2},
	[32859] = {41515,23460,2},
	[32860] = {41516,23458,2},
	[32861] = {41517,23457,2},
	[32862] = {41518,23459,2},
	[33154] = {42609,23909,1},
	[33179] = {42668,30305,2},
	[33224] = {42776,24003,2},
	[33225] = {42777,24004,2},
	[33809] = {43688,24379,2},
	[33816] = {43697,24388,1},
	[33817] = {43697,24388,1},
	[33818] = {43698,24389,1},
	[33976] = {43899,23588,2},
	[33977] = {43900,24368,2},
	[33993] = {43918,24480,1},
	[33999] = {43927,24488,2},
	[34060] = {44153,24653,2},
	[34061] = {44151,24654,2},
	[34092] = {44744,24743,2},
	[34129] = {35028,20225,2},
	[34425] = {54187,24968,1},
	[34478] = {45082,25062,1},
	[34492] = {45125,25109,1},
	[34493] = {45127,25110,1},
	[34495] = {45125,25109,1},
	[34518] = {45174,25146,1},
	[34519] = {45175,25147,1},
	[34535] = {10696,7547,1},
	[34955] = {45890,25706,1},
	[35225] = {46197,26192,2},
	[35226] = {46199,26164,2},
	[35349] = {46425,26050,1},
	[35350] = {46426,26056,1},
	[35504] = {46599,26119,1},
	[35513] = {46628,26131,2},
	[35906] = {48027,26439,2},
	[37012] = {48025,27153,2},
	[37297] = {48406,27217,1},
	[37298] = {48408,27346,1},
	[37598] = {48954,27541,2},
	[37676] = {49193,27637,2},
	[37719] = {49322,27684,2},
	[37827] = {49378,27706,2},
	[37828] = {49379,27707,2},
	[38050] = {49964,27914,1},
	[38576] = {51412,28363,2},
	[38628] = {51716,28470,1},
	[38658] = {51851,28513,1},
	[38690] = {51960,28531,2},
	[39286] = {52615,28883,1},
	[39656] = {53082,29089,1},
	[39896] = {61348,32589,1},
	[39898] = {61351,32591,1},
	[39899] = {61349,32590,1},
	[39973] = {53316,29147,1},
	[40653] = {40990,23274,1},
	[40775] = {54729,29582,2},
	[40777] = {54753,29596,2},
	[41133] = {55068,29726,1},
	[41508] = {55531,29929,2},
	[43516] = {58615,31124,2},
	[43599] = {58983,31319,2},
	[43698] = {59250,31575,1},
	[43951] = {59569,31717,2},
	[43952] = {59567,31694,2},
	[43953] = {59568,31695,2},
	[43954] = {59571,31698,2},
	[43955] = {59570,31697,2},
	[43956] = {59785,31849,2},
	[43957] = {59791,31851,2},
	[43958] = {59799,31855,2},
	[43959] = {61465,31862,2},
	[43961] = {61470,31858,2},
	[43962] = {54753,29596,2},
	[43963] = {59573,31700,2},
	[43964] = {59572,31699,2},
	[43965] = {41515,23460,2},
	[43986] = {59650,31778,2},
	[44077] = {59788,31850,2},
	[44079] = {59793,31852,2},
	[44080] = {59797,31854,2},
	[44083] = {61467,31861,2},
	[44086] = {61469,31857,2},
	[44151] = {59996,32151,2},
	[44160] = {59961,31902,2},
	[44164] = {59976,31912,2},
	[44168] = {60002,32153,2},
	[44175] = {60021,32156,2},
	[44177] = {60024,32157,2},
	[44178] = {60025,32158,2},
	[44223] = {60118,32203,2},
	[44224] = {60119,32205,2},
	[44225] = {60114,32206,2},
	[44226] = {60116,32207,2},
	[44230] = {59791,31851,2},
	[44231] = {59793,31852,2},
	[44234] = {61447,32640,2},
	[44235] = {61425,32633,2},
	[44413] = {60424,32286,2},
	[44554] = {61451,33029,2},
	[44555] = {61442,32634,2},
	[44556] = {61446,32636,2},
	[44557] = {61444,32635,2},
	[44558] = {61309,33030,2},
	[44689] = {61229,32335,2},
	[44690] = {61230,32336,2},
	[44707] = {61294,32562,2},
	[44721] = {61350,32592,1},
	[44723] = {61357,32595,1},
	[44738] = {61472,32643,1},
	[44794] = {61725,32791,1},
	[44810] = {61773,32818,1},
	[44819] = {61855,32841,1},
	[44822] = {10713,7561,1},
	[44823] = {35910,21008,1},
	[44824] = {10709,14421,1},
	[44825] = {10688,7395,1},
	[44826] = {10706,7555,1},
	[44827] = {10711,7560,1},
	[44828] = {10676,7382,1},
	[44829] = {36029,21063,1},
	[44841] = {61991,32939,1},
	[44842] = {61997,32944,2},
	[44843] = {61996,31239,2},
	[44857] = {62048,25064,2},
	[44965] = {62491,33188,1},
	[44970] = {62508,33194,1},
	[44971] = {62510,33197,1},
	[44972] = {62514,33199,1},
	[44973] = {62513,33198,1},
	[44974] = {62516,33200,1},
	[44980] = {62542,33219,1},
	[44982] = {62564,33227,1},
	[44983] = {62561,33226,1},
	[44984] = {62562,33205,1},
	[44998] = {62609,33238,1},
	[45002] = {62674,33274,1},
	[45022] = {62746,33239,1},
	[45125] = {63232,33297,2},
	[45180] = {63318,33578,1},
	[45586] = {63636,33408,2},
	[45589] = {63638,33301,2},
	[45590] = {63639,33416,2},
	[45591] = {63637,33298,2},
	[45592] = {63641,33300,2},
	[45593] = {63635,33299,2},
	[45595] = {63640,33409,2},
	[45596] = {63642,33418,2},
	[45597] = {63643,33414,2},
	[45606] = {63712,33810,1},
	[45693] = {63796,33848,2},
	[45725] = {63844,33857,2},
	[45801] = {63956,33892,2},
	[45802] = {63963,33904,2},
	[45942] = {64351,34031,1},
	[46099] = {64658,356,2},
	[46100] = {64657,34155,2},
	[46101] = {64656,34154,2},
	[46102] = {64659,34156,2},
	[46109] = {64731,34187,2},
	[46171] = {65439,34425,2},
	[46308] = {64977,34238,2},
	[46398] = {65358,34364,1},
	[46544] = {65382,33529,1},
	[46545] = {65381,33530,1},
	[46707] = {44369,24753,1},
	[46708] = {64927,34225,2},
	[46743] = {65644,34549,2},
	[46744] = {65638,34550,2},
	[46745] = {65637,34551,2},
	[46746] = {65645,34552,2},
	[46747] = {65642,34553,2},
	[46748] = {65643,34554,2},
	[46749] = {65646,34555,2},
	[46750] = {65641,34558,2},
	[46751] = {65639,34556,2},
	[46752] = {65640,34557,2},
	[46755] = {65641,34558,2},
	[46756] = {65637,34551,2},
	[46757] = {65646,34555,2},
	[46758] = {65640,34557,2},
	[46759] = {65638,34550,2},
	[46760] = {65644,34549,2},
	[46761] = {65639,34556,2},
	[46762] = {65643,34554,2},
	[46763] = {65642,34553,2},
	[46764] = {65645,34552,2},
	[46767] = {65682,34587,1},
	[46778] = {65917,34655,2},
	[46802] = {66030,34694,1},
	[46813] = {66087,35147,2},
	[46814] = {66088,35148,2},
	[46815] = {66090,33840,2},
	[46816] = {66091,33841,2},
	[46820] = {66096,34724,1},
	[46821] = {66096,34724,1},
	[46890] = {63318,33578,1},
	[46892] = {63318,33578,1},
	[46894] = {66520,34930,1},
	[47100] = {66847,35168,2},
	[47101] = {66846,35169,2},
	[47179] = {66906,35179,2},
	[47180] = {67466,35445,2},
	[47840] = {67336,35362,2},
	[48112] = {67413,35396,1},
	[48114] = {67414,35395,1},
	[48116] = {67415,35400,1},
	[48118] = {67416,35387,1},
	[48120] = {67417,35399,1},
	[48122] = {67418,35397,1},
	[48124] = {67419,35398,1},
	[48126] = {67420,35394,1},
	[48527] = {67527,35468,1},
	[49044] = {68057,35808,2},
	[49046] = {68056,35809,2},
	[49096] = {68187,35876,2},
	[49098] = {68188,35878,2},
	[49282] = {51412,28363,2},
	[49283] = {42776,24003,2},
	[49284] = {42777,24004,2},
	[49285] = {46197,26192,2},
	[49286] = {46199,26164,2},
	[49287] = {68767,36482,1},
	[49290] = {65917,34655,2},
	[49343] = {68810,36511,1},
	[49362] = {69002,36607,1},
	[49636] = {69395,36837,2},
	[49646] = {69452,36871,1},
	[49662] = {69535,36908,1},
	[49663] = {69536,36909,1},
	[49664] = {69539,36910,1},
	[49665] = {69541,36911,1},
	[49693] = {69677,36979,1},
	[49912] = {70613,37865,1},
	[50250] = {71342,38204,2},
	[50435] = {71810,38361,2},
	[50446] = {71840,38374,1},
	[50818] = {72286,38545,2},
	[51954] = {72808,38778,2},
	[51955] = {72807,38695,2},
	[52200] = {73313,39046,2},
	[53641] = {74932,40198,1},
	[54068] = {74918,40191,2},
	[54069] = {74856,40165,2},
	[54436] = {75134,40295,1},
	[54797] = {75596,40533,2},
	[54810] = {75613,40624,1},
	[54811] = {75614,40625,2},
	[54847] = {75906,40703,1},
	[54857] = {75936,40721,1},
	[54860] = {75973,40725,2},
	[56806] = {78381,42078,1},
	[180089] = {330659,11325,1},
	[184865] = {348459,176708,2},
	[192455] = {372677,189739,2},
	[194518] = {377159,40703,1},
	[198628] = {387311,26164,2},
	[198629] = {387323,26192,2},
	[198630] = {387320,40165,2},
	[198631] = {387308,34655,2},
	[198632] = {387319,28363,2},
	[198633] = {387321,40191,2},
	[198634] = {387330,23234,1},
	[198635] = {387325,25110,1},
	[198636] = {387332,17255,1},
	[198637] = {387328,25109,1},
	[198638] = {387329,27914,1},
	[198639] = {387326,36511,1},
	[198640] = {387331,36482,1},
	[198665] = {384796,194870,1},
}

function Companion.IsCompanion(itemID)
    return COMPANION_DATA[itemID] and true or false
end

function Companion.GetCreatureID(itemID)
    return COMPANION_DATA[itemID] and COMPANION_DATA[itemID][2] or nil
end

function Companion.GetTypeID(itemID)
    return COMPANION_DATA[itemID] and COMPANION_DATA[itemID][3] or nil
end

function Companion.GetTypeName(itemID)
    if COMPANION_DATA[itemID] and COMPANION_DATA[itemID][3] then
        return COMPANION_TYPE[COMPANION_DATA[itemID][3]] and COMPANION_TYPE[COMPANION_DATA[itemID][3]][2] or nil
    end
end

function Companion.GetBlizzardType(itemID)
    if COMPANION_DATA[itemID] and COMPANION_DATA[itemID][3] then
        return COMPANION_TYPE[COMPANION_DATA[itemID][3]] and COMPANION_TYPE[COMPANION_DATA[itemID][3]][1] or nil
    end
end