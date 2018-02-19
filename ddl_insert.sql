-- ----------------------------------------------------------------------------------------
-- 테스트용 아이디. user(일반 계정), admin(관리자 계정)
INSERT INTO MEMBER (num,ID,PASSWORD,email,gender,register_date,birthday,marketing_check,ip,last_join,phone,ROLE,NAME) VALUES (1,'admin','1234','manager@bf.com','male',SYSDATE,to_date('87/07/02','RR/MM/DD'),'yes','0.0.0.1',to_date('18/02/16','RR/MM/DD'),'010-1111-1111','role_admin','전상헌');
INSERT INTO MEMBER (num,ID,PASSWORD,email,gender,register_date,birthday,marketing_check,ip,last_join,phone,name) VALUES (2,'user','1234','user@bf.com','male',SYSDATE,to_date('87/07/02','RR/MM/DD'),'yes','0.0.0.1',to_date('18/02/16','RR/MM/DD'),'010-2222-2222','박성호');

-- ----------------------------------------------------------------------------------------
-- 테이블과 시퀀스를 다 생성후 밑의 쿼리로 국가를 추가할것
SET define OFF;
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GH','가나','GHANA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GA','가봉','GABON');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GM','감비아','GAMBIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GG','건지','GUERNSEY');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GP','과델로프','GUADELOUPE');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GT','과테말라','GUATEMALA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GU','괌','GUAM');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GD','그라나다','GRENADA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GE','그루지아','GEORGIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GR','그리스','GREECE');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GL','그린랜드','GREENLAND');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GW','기네비소','GUINEA-BISSAU');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GN','기니','GUINEA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GY','기야나','GUYANA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('NA','나미비아','NAMIBIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('NR','나우루','NAURU');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('NG','나이지리아','NIGERIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('ZA','남아프리카','SOUTH AFRICA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GS','남조지아 & 남샌드위치 군도','SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('NL','네덜란드','NETHERLANDS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('AN','네덜란드 열도','NETHERLANDS ANTILLES');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('NP','네팔','NEPAL');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('NO','노르웨이','NORWAY');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('NF','노포크 섬','NORFOLK ISLAND');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('NZ','뉴질랜드','NEW ZEALAND');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('NC','뉴 칼레도니아','NEW CALEDONIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('NU','니우에','NIUE');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('NE','니제르','NIGER');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('NI','니카라과','NICARAGUA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('TW','대만','TAIWAN, PROVINCE OF CHINA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('DK','덴마크','DENMARK');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('DM','도미니카','DOMINICA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('DO','도미니카 공화국','DOMINICAN REPUBLIC');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('DE','독일','GERMANY');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('TL','동티모르','EAST TIMOR');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('LA','라오스','LAO PEOPLE''S DEMOCRATIC REPUBLIC');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('LR','라이베리아','LIBERIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('LV','라트비아','LATVIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('RU','러시아','RUSSIAN FEDERATION');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('LB','레바논','LEBANON');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('LS','레소토','LESOTHO');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('RO','루마니아','ROMANIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('LU','룩셈부르크','LUXEMBOURG');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('RW','르완다','RWANDA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('LY','리비아','LIBYAN ARAB JAMAHIRIYA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('LT','리투아니아','LITHUANIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('LI','리히텐슈타인','LIECHTENSTEIN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MG','마다카스카르','MADAGASCAR');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MH','마샬군도','MARSHALL ISLANDS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('FM','마이크로네시아','MICRONESIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MO','마카오','MACAU');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MK','마케도니아','REPUBLIC OF MACEDONIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MQ','마티니크','MARTINIQUE');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MW','말라위','MALAWI');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MY','말레이시아','MALAYSIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('ML','말리','MALI');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('IM','맨섬','ISLE OF MAN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('YT','메요트','MAYOTTE');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MX','멕시코','MEXICO');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MC','모나코','MONACO');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MA','모로코','MOROCCO');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MU','모리셔스','MAURITIUS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MR','모리타니','MAURITANIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MZ','모잠비크','MOZAMBIQUE');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MS','몬세라','MONTSERRAT');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('ME','몬테네그로','MONTENEGRO');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MD','몰도바','MOLDOVA, REPUBLIC OF');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MV','몰디브','MALDIVES');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MT','몰타','MALTA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MN','몽골','MONGOLIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('US','미국','UNITED STATES');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('VI','미국령 버진군도','VIRGIN ISLANDS, U.S.');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('UM','미국의 군도','UNITED STATES MINOR OUTLYING ISLANDS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MM','미얀마(버마)','MYANMAR');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('VU','바누아투','VANUATU');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BH','바레인','BAHRAIN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BB','바베이도스','BARBADOS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('VA','바티칸시티','VATICAN CITY STATE ');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BS','바하마','BAHAMAS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BD','방글라데시','BANGLADESH');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BM','버뮤다','BERMUDA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('VE','베네주엘라','VENEZUELA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BJ','베닌','BENIN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('VN','베트남','VIET NAM');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BE','벨기에','BELGIUM');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BY','벨로루시','BELARUS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BZ','벨리즈','BELIZE');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BV','보빗 군도','BOUVET ISLAND');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BA','보스니아-헤르체코비나','BOSNIA HERCEGOVINA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BW','보츠와나','BOTSWANA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BO','볼리비아','BOLIVIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BI','부룬디','BURUNDI');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BF','부르키나 파소','BURKINA FASO');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BT','부탄','BHUTAN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('MP','북마리아나 군도','NORTHERN MARIANA ISLANDS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('KP','북한','KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BG','불가리아','BULGARIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BR','브라질','BRAZIL');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BN','브루나이','BRUNEI DARUSSALAM');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('WS','사모아','SAMOA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('SA','사우디 아라비아','SAUDI ARABIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CY','사이프러스','CYPRUS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('SM','산마리노','SAN MARINO');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('ST','상토메 프린스페','SAO TOME AND PRINCIPE');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('EH','서부 사하라','WESTERN SAHARA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('SN','세네갈','SENEGAL');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('RS','세르비아','SERBIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CS','세르비아 몬테네그로','SERBIA AND MONTENEGRO');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('SC','세이쉘','SEYCHELLES');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('LC','세인트 루시아','SAINT LUCIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('VC','세인트 빈센트 그레나딘','SAINT VINCENT AND THE GRENADINES');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('KN','세인트 키츠 네비스','SAINT KITTS AND NEVIS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('PM','세인트 피레 미켈론','ST. PIERRE AND MIQUELON');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('SH','세인트 헬레나','ST. HELENA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('SO','소말리아','SOMALIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('SB','솔로몬 군도','SOLOMON ISLANDS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('SD','수단','SUDAN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('SR','수리남','SURINAME');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('LK','스리랑카','SRI LANKA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('SJ','스발비드 군도','SVALBARD AND JAN MAYEN ISLANDS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('SZ','스와질랜드','SWAZILAND');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('SE','스웨덴','SWEDEN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CH','스위스','SWITZERLAND');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('ES','스페인','SPAIN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('SK','슬로바키아','SLOVAKIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('SI','슬로베니아','SLOVENIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('SY','시리아','SYRIAN ARAB REPUBLIC');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('SL','시에라 리온','SIERRA LEONE');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('SG','싱가포르','SINGAPORE');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('AE','아랍에미리트 연합','UNITED ARAB EMIRATES');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('AW','아루바','ARUBA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('AM','아르메니아','ARMENIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('AR','아르헨티나','ARGENTINA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('AS','아메리칸 사모아','AMERICAN SAMOA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('IS','아이슬란드','ICELAND');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('HT','아이티','HAITI');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('IE','아일랜드','IRELAND');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('AZ','아제르바이잔','AZERBAIJAN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('AF','아프가니스탄','AFGHANISTAN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('AD','안도라','ANDORRA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('AQ','안타티카(남극)','ANTARCTICA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('AG','안티가 바부다','ANTIGUA AND BARBUDA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('AX','알랜드 군도','ALAND ISLANDS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('AL','알바니아','ALBANIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('DZ','알제리','ALGERIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('AO','앙골라','ANGOLA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('AI','앙귈라','ANGUILLA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('ER','에리트리아','ERITREA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('EE','에스토니아','ESTONIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('EC','에콰도르','ECUADOR');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('SV','엘살바도르','EL SALVADOR');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GB','영국','UNITED KINGDOM');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('VG','영국령 버진군도','VIRGIN ISLANDS, BRITISH');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('IO','영국령 인도양','BRITISH INDIAN OCEAN TERRITORY');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('YE','예멘','YEMEN, REPUBLIC OF');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('OM','오만','OMAN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('AT','오스트리아','AUSTRIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('HN','온두라스','HONDURAS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('WF','왈라스 & 퓨투나','WALLIS AND FUTUNA ISLANDS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('JO','요르단','JORDAN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('UG','우간다','UGANDA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('UY','우루과이','URUGUAY');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('UZ','우즈베키스탄','UZBEKISTAN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('UA','우크라이나','UKRAINE');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('ET','이디오피아','ETHIOPIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('IQ','이라크','IRAQ');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('IR','이란','IRAN ');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('IL','이스라엘','ISRAEL');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('EG','이집트','EGYPT');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('IT','이탈리아','ITALY');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('IN','인도','INDIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('ID','인도네시아','INDONESIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('JP','일본','JAPAN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('JM','자메이카','JAMAICA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('ZM','잠비아','ZAMBIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('JE','저지','JERSEY');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GQ','적도 기니','EQUATORIAL GUINEA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CN','중국','CHINA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CF','중앙아프리카','CENTRAL AFRICAN REPUBLIC');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('DJ','지부티','DJIBOUTI');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GI','지브랄타','GIBRALTAR');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('ZW','짐바브웨','ZIMBABWE');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('TD','챠드','CHAD');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CZ','체코공화국','CZECH REPUBLIC');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CL','칠레','CHILE');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CM','카메룬','CAMEROON');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CV','카보 베르데','CAPE VERDE');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('KZ','카자흐스탄','KAZAKHSTAN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('QA','카타르','QATAR');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('KH','캄보디아','CAMBODIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CA','캐나다','CANADA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('KE','케냐','KENYA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('KY','케이만 군도','CAYMAN ISLANDS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('KM','코모로스','COMOROS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CR','코스타리카','COSTA RICA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CC','코코스 군도','COCOS ISLANDS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CI','코트디봐르','COTE D''IVOIRE');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CO','콜롬비아','COLOMBIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CG','콩고','CONGO');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CD','콩고 민주공화국','DEMOCRATIC REPUBLIC OF THE CONGO');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CU','쿠바','CUBA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('KW','쿠웨이트','KUWAIT');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CK','쿡 아일랜드','COOK ISLANDS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('HR','크로아티아','CROATIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('CX','크리스마스 아일랜드','CHRISTMAS ISLAND');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('KG','키르기스','KYRGYZSTAN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('KI','키리바티','KIRIBATI');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('TJ','타지크스탄','TAJIKISTAN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('TZ','탄자니아','TANZANIA, UNITED REPUBLIC OF');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('TH','태국','THAILAND');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('TR','터키','TURKEY');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('TG','토고','TOGO');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('TK','토켈라우','TOKELAU');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('TO','통가','TONGA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('TC','투르크 & 카이코스 군도','TURKS AND CAICOS ISLANDS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('TM','투르크멘','TURKMENISTAN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('TV','투발루','TUVALU');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('TN','튀니지','TUNISIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('TT','트리니다드 토바고','TRINIDAD AND TOBAGO');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('PA','파나마','PANAMA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('PY','파라과이','PARAGUAY');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('FO','파로에 군도','FAROE ISLANDS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('PK','파키스탄','PAKISTAN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('PG','파푸아 뉴기니','PAPUA NEW GUINEA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('PW','팔라우','PALAU');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('PS','팔레스타인 지구','PALESTINE');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('PE','페루','PERU');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('PT','포르투갈','PORTUGAL');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('FK','포클랜드 군도','FALKLAND ISLANDS ');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('PL','폴란드','POLAND');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('PR','푸에르토리코','PUERTO RICO');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('FR','프랑스','FRANCE');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('GF','프랑스령 가이아나','FRENCH GUIANA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('TF','프랑스령 남부지역','FRENCH SOUTHERN TERRITORIES');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('RE','프랑스령 리유니온','REUNION');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('PF','프랑스령 폴리네시아','FRENCH POLYNESIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('FJ','피지','FIJI');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('PN','피트카이른','PITCAIRN');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('FI','핀란드','FINLAND');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('PH','필리핀','PHILIPPINES');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('KR','대한민국','KOREA, REPUBLIC OF');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('HM','허드 앤 맥도날드 군도','HEARD AND MC DONALD ISLANDS');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('HU','헝가리','HUNGARY');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('AU','호주','AUSTRALIA');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('HK','홍콩','HONG KONG');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('NOT','없음','NOT');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('ATR','오스트레일리아','Australia');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BVI','영국령 버진 아일랜드','British Virgin Islands');
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('NAN','네덜란드령 안틸레스','Nederlandse Antillen');	
Insert into BF.COUNTRY (COUNTRY_NUM,COUNTRY_NAME,COUNTRY_EN) values ('BLS','벨라루스','Belarus');

