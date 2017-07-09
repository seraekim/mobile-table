CREATE TABLE user_agent
(
PHONE_CD varchar(30) primary key comment '제품코드',
PHONE_NM varchar(100) comment '제품명',
MANU_YMD date comment '출시년월(일)',
MANU_CD varchar(30) comment '제조사',
CARRIER_CD  varchar(30) comment '통신사',
CARRIER_NATION varchar(30) comment '서비스국가',
SCR_WIDTH int comment '화면크기-가로',
SCR_HEIGHT int comment '화면크기-세로',
SCR_CD varchar(30) comment '화면크기',
OS_TYPE varchar(30) comment 'os종류',
OS_VER varchar(20) comment 'os버전',
OS_NM varchar(30) comment 'os이름',
CPU_CORE varchar(20) comment 'cpu core',
CPU_HZ varchar(20) comment 'cpu hz',
RAM_SIZE decimal(5,2) comment 'ram size',
KOR_URL varchar(300) comment '힌극어 제품 url',
ENG_URL varchar(300) comment '영어 제품 url'

) DEFAULT CHARSET=utf8;




insert into user_agent values('GT-I8200L','Galaxy S III Mini Value Edition','20140304','Samsung',null,'KR','800','480',null,'Android','4.2.2','Jelly Bean','Dual-core','1.2','1','http://pdadb.net/index.php?m=device&id=5926&c=samsung_gt-i8200l_galaxy_s_iii_mini_value_edition__samsung_golden_ve',null);
insert into user_agent values('GT-I8552','Galaxy Win I8550','20130401','Samsung',null,'KR','800','480',null,'Android','4.1.2','Jelly Bean','Quad-core','1.2','1','http://www.gsmarena.com/samsung_galaxy_win_i8550-5392.php',null);
insert into user_agent values('GT-I9060I','Galaxy Grand Neo','20140101','Samsung',null,'KR','800','480',null,'Android','4.2','Jelly Bean','Quad-core','1.2','1','http://www.gsmarena.com/samsung_galaxy_grand_neo-5958.php',null);
insert into user_agent values('GT-I9082','Galaxy Grand I9082','20121201','Samsung',null,'KR','800','480',null,'Android','4.1.2','Jelly Bean','Dual-core','1.2','1','http://www.gsmarena.com/samsung_galaxy_grand_i9082-5163.php',null);
insert into user_agent values('GT-I9152','Galaxy Mega 5.8 I9150','20130401','Samsung',null,'KR','960','540',null,'Android','4.2.2','Jelly Bean','Dual-core','1.4','1.5','http://www.gsmarena.com/samsung_galaxy_mega_5_8_i9150-5396.php',null);
insert into user_agent values('GT-I9205','Galaxy Mega 6.3 I9200','20130401','Samsung',null,'KR','1280','720',null,'Android','4.2.2','Jelly Bean','Dual-core','1.7','1.5','http://www.gsmarena.com/samsung_galaxy_mega_6_3_i9200-5398.php',null);
insert into user_agent values('GT-I9295','I9295 Galaxy S4 Active','20130601','Samsung',null,'KR','1920','1080',null,'Android','4.2.2','Jelly Bean','Quad-core','1.9','2','http://www.gsmarena.com/samsung_i9295_galaxy_s4_active-5446.php',null);
insert into user_agent values('GT-I9300','Galaxy S III GT-I9300 International 16GB',null,'Samsung',null,'KR','1280','720','HD','Android','4.0.4','Ice Cream Sandwich','Quad-core','1.4','1','https://www.bhphotovideo.com/c/product/1046839-REG/samsung_i9300_white_galaxy_s3_i9300_16gb.html',null);
insert into user_agent values('GT-I9301I','I9301I Galaxy S3 Neo','20140601','Samsung',null,'KR','1280','720',null,'Android','4.4.2','KitKat','Quad-core','1.4','1.5','http://www.gsmarena.com/samsung_i9301i_galaxy_s3_neo-6433.php',null);
insert into user_agent values('GT-I9305','I9305 Galaxy S III','20120901','Samsung',null,'KR','1280','720',null,'Android','4.1.1','Jelly Bean','Quad-core','1.4','2','http://www.gsmarena.com/samsung_i9305_galaxy_s_iii-5001.php',null);
insert into user_agent values('GT-I9305T','Galaxy S3 GT-i9305T','20121008','Samsung',null,'KR','1280','720','FHD','Android','4.1.1','Jelly Bean','Quad-core','1.4','2','http://www.phonemore.com/phone/samsung-galaxy-s3-gt-i9305t/305',null);
insert into user_agent values('GT-I9500','I9500 Galaxy S4','20130301','Samsung',null,'KR','1920','1080',null,'Android','4.2.2','Jelly Bean','Octa-core','1.6+1.2','2','http://www.gsmarena.com/samsung_i9500_galaxy_s4-5125.php',null);
insert into user_agent values('GT-I9505','Galaxy S4 GT-I9505 International 16GB',null,'Samsung',null,'KR','1920','1080','FHD','Android','4.2.2','Jelly Bean','Quad-core','1.9','2','https://www.bhphotovideo.com/c/product/1036826-REG/samsung_i9505_white_galaxy_s4_i9505_16gb.html',null);
insert into user_agent values('GT-I9506','I9506 Galaxy S4','20130101','Samsung',null,'KR','1920','1080','Super AMOLED','Android','4.2.2','Jelly Bean','Quad-core','2.3','2','http://www.gsmarena.com/samsung_i9506_galaxy_s4-5542.php',null);
insert into user_agent values('GT-I9507','S4 TD-LTE',null,'Samsung',null,'KR','1920','1080','Super AMOLED','Android','4.2.3','Jelly Bean','Quad-core','1.9','2',null,null);
insert into user_agent values('GT-N5100','Galaxy Note 8.0','20130201','Samsung',null,'KR','1280','800',null,'Android','4.1.2','Jelly Bean','Quad-core','1.6','2','http://www.gsmarena.com/samsung_galaxy_note_8_0-5252.php',null);
insert into user_agent values('GT-N5120','Galaxy Note 8.0 LTE','20130501','Samsung',null,'KR','1280','800',null,'Android','4.1.2','Jelly Bean','Quad-core','1.6','1.8','http://pdadb.net/index.php?m=device&id=4462&c=samsung_gt-n5120_galaxy_note_8.0_lte_16gb__samsung_kona',null);
insert into user_agent values('GT-N7100','Galaxy Note 2 GT N7100 Tempered Glass Screen Guard',null,'Samsung',null,'KR',null,null,null,'Android',null,null,null,null,null,null,null);
insert into user_agent values('GT-N7105','Galaxy Note II N7100','20120801','Samsung',null,'KR','1280','720','Super AMOLED','Android','4.1.1','Jelly Bean','Quad-core','1.6','2','http://www.gsmarena.com/samsung_galaxy_note_ii_n7100-4854.php',null);
insert into user_agent values('GT-N7105T','Galaxy Note 2 LTE GT-N7105','20121101','Samsung',null,'KR','1280','720',null,'Android','4.1.1','Jelly Bean','Quad-core','1.6','2','http://www.phonemore.com/phone/samsung-galaxy-note-2-lte-gt-n7105-16gb/1051',null);
insert into user_agent values('GT-N8000','Galaxy Note 10.1 GT-N8000','20120801','Samsung',null,'KR','1280','800',null,'Android','4.0.3','Ice Cream Sandwich IC S','Quad-core','1.4','2','http://www.phonemore.com/tablet/samsung-galaxy-note-101-gt-n8000-16gb/1158',null);
insert into user_agent values('GT-P5200','Galaxy Tab 3 10.1 P5200','20130601','Samsung',null,'KR','1280','800','HD Plus','Android','4.2.2','Jelly Bean','Dual-core','1.6','1','http://www.gsmarena.com/samsung_galaxy_tab_3_10_1_p5200-5490.php',null);
insert into user_agent values('GT-P5210','Galaxy Tab 3 10.1 P5210','20130601','Samsung',null,'KR','1280','800','Full Web','Android','4.2.2','Jelly Bean','Dual-core','1.6','1','http://www.gsmarena.com/samsung_galaxy_tab_3_10_1_p5210-5478.php',null);
insert into user_agent values('GT-P6800','Galaxy Tab 7.7 GT-P6800','20111201','Samsung',null,'KR','1280','800','Super AMOLED Plus','Android','3.2','Honeycomb','Dual-core','1.4','1','http://www.phonemore.com/tablet/samsung-galaxy-tab-77-gt-p6800-16gb/1327',null);
insert into user_agent values('H30-U10','Honor 3C 3G Dual Sim','20131201','Huawei',null,'JP','1280','720',null,'Android','4.2.2','Jelly Bean','Quad-core','1.3','2',null,'http://www.phonemore.com/phone/huawei-honor-3c-3g-dual-sim/2124');
insert into user_agent values('H60-L01','Honor 6','20140601','Huawei',null,'JP','1920','1080',null,'Android','4.4.2','KitKat','Octa-core','1.7+1.3','3',null,'http://www.gsmarena.com/huawei_honor_6-6461.php');
insert into user_agent values('H60-L04','Honor 6 H60-L04',null,'Huawei',null,'JP','1920','1080','FHD','Android','4.4','KitKat','Octa-core','1.7+1.3','3',null,'http://www.newzars.com/shop/huawei-honor-6-h60-l04/');