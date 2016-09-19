

*Aggregation

*CORRECTIONS


*Richmond-Petersburg, VA 6760; Petersburg-Colonial Heights-Hopeviille, VA 6761 
*6140 is not a ipums census code - but was mistakenly entered for a school with same metro address as Richmond - Petersberg
replace metrocode=6761 if metrocode==6140
*------------------------------------------------------------------------------------------------------------------------

*Rocky Mount, NC 6895
*6897 is not a ipums census code - but was mistakenly entered for a school  with same metro address as Rocky Mont
replace metrocode=6895 if metrocode==6897
*------------------------------------------------------------------------------------------------------------------------

*Rocky Mount, NC 6895
*6896 is not a ipums census code - but was mistakenly entered for a school with same metro address as Rocky Mont
replace metrocode=6895 if metrocode==6896
*------------------------------------------------------------------------------------------------------------------------

* Springfield-Holyoke-Chicopee, MA 8000
*8001 is not a ipums census code - but was mistakenly entered for a school with same metro address as Springfield
replace metrocode=8000 if metrocode==8001
*------------------------------------------------------------------------------------------------------------------------

*San Luis Obispo-Atascad-P Robles, CA 7460
*7461 is not a ipums census code - but was mistakenly entered for a school with same metro address as San Luis Obispo
replace metrocode=7460 if metrocode==7461
*------------------------------------------------------------------------------------------------------------------------
* Syracuse, NY 8160
*8161 is not a ipums census code - but was mistakenly entered for a school with same metro address as Syracuse
replace metrocode=8160 if metrocode==8161
*------------------------------------------------------------------------------------------------------------------------

*Norfolk-VA Beach-Newport News, VA 5720
*5680 is not a ipums census code - but was mistakenly entered for a school with same metro address as Norfolk
replace metrocode=5720 if metrocode==5680
*------------------------------------------------------------------------------------------------------------------------

*Jersey City, NJ 5603
*3641 is not a ipums census code - but was mistakenly entered for a school with same metro address as Jersey City
replace metrocode=5603 if metrocode==3641
*------------------------------------------------------------------------------------------------------------------------


*Allentown-Bethlehem-Easton, PA/NJ 240
*5606 is not a ipums census code - but was mistakenly entered for a school with same metro address as Allentown
replace metrocode=240 if metrocode==5606
*------------------------------------------------------------------------------------------------------------------------

*Jersey City, NJ 5603
*3642 is not a ipums census code - but was mistakenly entered for a school with same metro address as Jersey City
replace metrocode=5603 if metrocode==3642
*------------------------------------------------------------------------------------------------------------------------

*Norfolk-VA Beach-Newport News, VA 5720
*5121 is not a ipums census code - but was mistakenly entered for a school with same metro address as Norfolk
replace metrocode=5720 if metrocode==5121
*------------------------------------------------------------------------------------------------------------------------

*Jacksonville, FL 3590  
*5121 is not a ipums census code - but was mistakenly entered for a school with same metro address as Jacksonville, FL
replace metrocode=3590 if metrocode==3950
*------------------------------------------------------------------------------------------------------------------------



*REAL CHANGES

*Los Angeles-Long Beach, CA 90001: Los Angeles-Long Beach, CA 4480;	Anaheim-Santa, Ana, CA 4481; Orange County, CA 5945
replace metrocode=90001 if metrocode==4480 | metrocode==4481 | metrocode==5945 | metrocode==4482  																					
*------------------------------------------------------------------------------------------------------------------------

*Chicago-Gary-Lake, IL 90002: Chicago-Gary-Lake, IL 1600; Aurora-Elgin, IL 1601; Gary, IN 2960; Gary-Hammond, IN 1602; Joliet, IL 1603; Lake, IL 1604; Kenosha, WI 3800
replace metrocode=90002	if metrocode==1600 | metrocode==1601 | metrocode==2960 | metrocode==1602 | metrocode==1603 | metrocode==1604 | metrocode==3800
*------------------------------------------------------------------------------------------------------------------------

*Pittsburgh-Beaver Valley, PA 90003: Pittsburgh-Beaver Valley, PA 6280; Beaver County, PA 6281
replace metrocode=90003 if metrocode==6280 | metrocode==6281																							
*------------------------------------------------------------------------------------------------------------------------

*Houston-Brazoria, TX 90004: Houston-Brazoria, TX 3360; Brazoria, TX 1145; Brazoria, TX 3361; Galveston 2920
replace metrocode=90004 if metrocode==3360 | metrocode==1145 | metrocode==3361 | metrocode==2920																			
*------------------------------------------------------------------------------------------------------------------------

*Hartford-Bristol-Middleton-New Britain, CT	90005: Hartford-Bristol-Middleton-New Britain, CT 3280; Bristol, CT 3281; New Britian, CT 3283; Middletown, CT 3282
replace metrocode=90005	if metrocode==3280 | metrocode==3281 | metrocode==3283 | metrocode==3282																			
*------------------------------------------------------------------------------------------------------------------------

*Burlington, VT	90006: Burlington, VT 1310;	Burlington, VT 1305
replace metrocode=90006	if metrocode==1310 | metrocode==1305																							
*------------------------------------------------------------------------------------------------------------------------

*New Haven, CT 90007: New Haven, CT 5482; Danbury, CT 1930; Stamford, CT 8040; Waterbury, CT 8880; Norwalk, CT 5760; New Haven-Meriden, CT 5480
replace metrocode=90007	if metrocode==5482 | metrocode==1930 | metrocode==8040 | metrocode==8880 | metrocode==5760 | metrocode==5480															
*------------------------------------------------------------------------------------------------------------------------

*Raleigh-Durham, NC	90008: Raleigh-Durham, NC 6640; Durham, NC 6641
replace metrocode=90008 if metrocode==6640 | metrocode==6641																							
*------------------------------------------------------------------------------------------------------------------------

*Poughkeepsie, NY 90009: Poughkeepsie, NY 6460; Dutchess County, NY	2281
replace metrocode=90009	if metrocode==6460 | metrocode==2281																							
*------------------------------------------------------------------------------------------------------------------------

*Providence-Fall River-Pawtucket, MA/RI	90011: Providence-Fall River-Pawtucket, MA/RI 6480; Fall River, MA/RI 6481;	Pawtuckett 6482; New Bedford 5400
replace metrocode=90011	if metrocode==6480 | metrocode==6481 | metrocode==6482 | metrocode==5400																			
*------------------------------------------------------------------------------------------------------------------------

*Miami-Hialeah, FL 90013: Miami-Hialeah, FL 5000; Fort Lauderdale-Hollywood-Pompano Beach 2680
replace metrocode=90013 if metrocode==5000 | metrocode==2680																							
*------------------------------------------------------------------------------------------------------------------------

*Dallas-Fort Worth, TX 90014: Dallas-Fort Worth, TX 1920; Fort Worth-Arlington, TX 1921; Fort Worth-Arlington, TX 2800;
replace metrocode=90014 if metrocode==1920 | metrocode==1921 | metrocode==2800																					
*------------------------------------------------------------------------------------------------------------------------

*Grand Junction, CO 90015: Grand Junction, CO 3010; Grand Junction, CO 2995
replace metrocode=90015 if metrocode==3010 | metrocode==2995																							
*------------------------------------------------------------------------------------------------------------------------

*Cincinnati OH/KY/IN 90016: Cincinnati OH/KY/IN 1640; Hamilton-Middletown, OH 3200					
replace metrocode=90016 if metrocode==1640 | metrocode==3200																							
*------------------------------------------------------------------------------------------------------------------------

*Hattiesburg, MS 90017: Hattiesburg, MS 3300; Hattiesburg, MS 3285
replace metrocode=90017 if metrocode==3300 | metrocode==3285																							
*------------------------------------------------------------------------------------------------------------------------

*Boston, MA 90018: Boston, MA 1120; Lawrence-Haverhil, MA 1121; Lowell, MA/NH 1122; Lowell, MA/NH 4560; Salem-Gloucester, MA 1123; Lawrence, MA-NH 4160; Brockton 1200; Lawrence, MA-NH
replace metrocode=90018 if metrocode==1120 | metrocode==1121 | metrocode==1122 | metrocode==4560 | metrocode==1123 | metrocode==1200 | metrocode==4160									
*------------------------------------------------------------------------------------------------------------------------

*Cleveland, OH 90019: Cleveland, OH 1680; Lorain-Elyria, OH 4440
replace metrocode=90019 if metrocode==1680 | metrocode==4440																							
*------------------------------------------------------------------------------------------------------------------------

*New York-Northeastern NJ 90020: New York-Northeastern NJ 5600; Middlesex-Somerset-Hunterdon, NJ PMSA 5015;	Monmouth-Ocean, NJ 5190; Jersey City 3640; Jersey City 5603; Bergen Passaic 875; Bergen Passaic 5602; New Burnswick 5460; Newburgh 5660; Orange 5950; Nassau Suffolk 5601; Nassau Suffolk 5380; Middlesex-Somerset-Hunt, NJ 5604
replace metrocode=90020 if metrocode==5600 | metrocode==5015 | metrocode==5190 | metrocode==3640 | metrocode==5603 | metrocode==875 | metrocode==5602 | metrocode==5460 | metrocode==5660 | metrocode==5950 | metrocode==5601 | metrocode==5380 | metrocode==5604
*------------------------------------------------------------------------------------------------------------------------

*Norfolk-VA Beach-Newport News, VA 90021: Norfolk-VA Beach-Newport News, VA 5720; New Port News, VA 5721
replace metrocode=90021 if metrocode==5720 | metrocode==5721 | metrocode==5722																							
*------------------------------------------------------------------------------------------------------------------------

* Columbus, OH 90022: Columbus, OH 1840; Newark, OH 5640
replace metrocode=90022 if metrocode==1840 | metrocode==5640																					
*------------------------------------------------------------------------------------------------------------------------

*Buffalo-Niagara Falls, NY 90023: Buffalo-Niagara Falls, NY 1280; Niagara Falls, NY 1281
replace metrocode=90023 if metrocode==1280 | metrocode==1281																							
*------------------------------------------------------------------------------------------------------------------------

*Salt Lake City-Ogden, UT 90024: Salt Lake City-Ogden, UT 7160; Ogden, UT 7161
replace metrocode=90024 if metrocode==7160 | metrocode==7161																							
*------------------------------------------------------------------------------------------------------------------------

*Richmond-Petersburg, VA 90025: Richmond-Petersburg, VA 6760; Petersburg-Colonial Heights-Hopeviille, VA 6761
replace metrocode=90025 if metrocode==6760 | metrocode==6761																							
*------------------------------------------------------------------------------------------------------------------------

*Charlotte-Gastonia-Rock Hill, SC 90026: Charlotte-Gastonia-Rock Hill, SC 1520; Rock Hill, SC 1521
replace metrocode=90026 if metrocode==1520 | metrocode==1521																							
*------------------------------------------------------------------------------------------------------------------------

*Riverside-San Bernardino,CA 90027:	Riverside-San Bernardino,CA 6780; San Bernardino, CA 6781
replace metrocode=90027 if metrocode==6780 | metrocode==6781																							
*------------------------------------------------------------------------------------------------------------------------

*San Francisco-Oakland-Vallejo, CA	90028: San Francisco-Oakland-Vallejo, CA 7360; Oakland, CA 7361; Oakland 5775;
replace metrocode=90028 if metrocode==7360 | metrocode==7361 | metrocode==5775																					
*------------------------------------------------------------------------------------------------------------------------

*Santa Cruz, CA	90029: Santa Cruz, CA 7480; Santa Cruz-Watsonville, CA 7485
replace metrocode=90029 if metrocode==7480 | metrocode==7485																							
*------------------------------------------------------------------------------------------------------------------------

*Seattle-Everett, WA 90030:	Seattle-Everett, WA 7600; Tacoma, WA 8200	
replace metrocode=90030 if metrocode==7600 | metrocode==8200																							
*------------------------------------------------------------------------------------------------------------------------

*Vallejo-Fairfield-Napa, CA 90031: Vallejo-Fairfield-Napa, CA 7362; Vallejo-Fairfield-Napa, CA 7362; Vallejo-Fairfield-Napa, CA 8720
replace metrocode=90031 if metrocode==7362 | metrocode==8720																							
*------------------------------------------------------------------------------------------------------------------------

*Portland-Vancouver, OR	90032: Portland-Vancouver, OR 6440; Vancouver, WA 6441
replace metrocode=90032 if metrocode==6440 | metrocode==6441																							
*------------------------------------------------------------------------------------------------------------------------

*Scranton-Wilkes-Barre, PA 90033: Scranton-Wilkes-Barre, PA 7560; Wilkes-Barre-Hazleton, PA 7561
replace metrocode=90033 if metrocode==7560 | metrocode==7561																							
*------------------------------------------------------------------------------------------------------------------------

*Philadelphia, PA/NJ 90034: Philadelphia, PA/NJ 6160; Wilmington, DE/NJ/MD 9160
replace metrocode=90034 if metrocode==6160 | metrocode==9160																							
*------------------------------------------------------------------------------------------------------------------------

*Greensboro-Winston Salem-High Point, NC 90035: Greensboro-Winston Salem-High Point, NC 3120; Winston-Salem, NC 3121
replace metrocode=90035 if metrocode==3120 | metrocode==3121																							
*------------------------------------------------------------------------------------------------------------------------

*Sacramento, CA 90036: Sacramento, CA 6920; Yolo, CA 9270
replace metrocode=90036 if metrocode==6920 | metrocode==9270																							
*------------------------------------------------------------------------------------------------------------------------


* LOGICAL EDITS

*Indianapolis, IN 90052: Indianapolis, IN 3480; Anderson, IN 400
replace metrocode=90052 if metrocode==3480 | metrocode==400
* ----------------------------------------------------------------------------------------------

*Saginaw-Bay City-Midland, MI 90053: Saginaw-Bay City-Midland, MI 6960; Bay City, MI 6961
replace metrocode=90053 if metrocode==6960 | metrocode==6961
* ----------------------------------------------------------------------------------------------

*Battle Creek, MI 90054: Battle Creek, MI 780; Kalamazoo-Portage, MI 3720
replace metrocode=90054 if metrocode==780  | metrocode==3720
* ----------------------------------------------------------------------------------------------

*Dayton-Springfield, OH 90055: Dayton-Springfield, OH 2000; Springfield, OH 2001
replace metrocode=90055 if metrocode==2000 | metrocode==2001
* ----------------------------------------------------------------------------------------------

*Greenville-Spartanburg-Anderson SC 90056: Greenville-Spartanburg-Anderson SC 3160; Anderson, SC 3161
replace metrocode=90056 if metrocode==3160 | metrocode==3161
* ----------------------------------------------------------------------------------------------

*Muskegon-Norton Shores-Muskegon Heights, MI 90057: Muskegon-Norton Shores-Muskegon Heights, MI 5320; Grand Rapids, MI 3000
replace metrocode=90057 if metrocode==5320 | metrocode==3000
* ----------------------------------------------------------------------------------------------

*Biloxi-Gulfport, MS 90058: Biloxi-Gulfport, MS 920; Pascagoula-Moss Point, MS 6030
replace metrocode=90058 if metrocode==920  | metrocode==6030
* ----------------------------------------------------------------------------------------------

*Sarasota, FL 90059: Sarasota, FL 7510; Bradenton FL 1140
replace metrocode=90059 if metrocode==1140 | metrocode==7510
* ----------------------------------------------------------------------------------------------


*CMSA EDITS

*Cleveland, OH 90060: Cleveland, OH 90019; Akron, OH 80
replace metrocode=90060 if metrocode==90019 | metrocode==80      
*------------------------------------------------------------------------------------------------------------------------

*Chicago-Gary-Lake, IL 90061: Chicago-Gary-Lake, IL 90002; Kankakee, IL 3740
replace metrocode=90061 if metrocode==90002 | metrocode==3740
*------------------------------------------------------------------------------------------------------------------------

*Detroit, MI 90062: Detroit, MI 2160; Flint, MI 2640; Ann Arbor, MI 440
replace metrocode=90062 if metrocode==2160 | metrocode==2640 | metrocode==440
*------------------------------------------------------------------------------------------------------------------------

*Denver-Boulder-Longmont, CO 90063: Denver-Boulder-Longmont, CO 2080; Boulder-Longmont, CO 2081; Greeley, CO 3060
replace metrocode=90063 if metrocode==2080 | metrocode==2081 | metrocode==3060
*------------------------------------------------------------------------------------------------------------------------

*Los Angeles-Long Beach, CA 90064: Los Angeles-Long Beach, CA 90001; Riverside-San Bernardino, CA 90027; Oxnard-Thousand Oaks-Ventura, CA 8730
replace metrocode=90064 if metrocode==90001 | metrocode==90027 | metrocode==8730
*------------------------------------------------------------------------------------------------------------------------

*Milwaukee, WI 90065: Milwaukee, WI 5080; Racine, WI 6600
replace metrocode=90065 if metrocode==5080 | metrocode==6600
*------------------------------------------------------------------------------------------------------------------------

*New York-Northeastern NJ 90066: New York-Northeastern NJ 90020; Trenton, NJ 8480; Newark, NJ 5605; New Haven, CT 90007
replace metrocode=90066 if metrocode==90020 | metrocode==8480 | metrocode==5605 | metrocode==90007 | metrocode==90009
*------------------------------------------------------------------------------------------------------------------------

*San Francisco-Oakland-Vallejo, CA 90067: San Francisco-Oakland-Vallejo, CA 90028; San Jose, CA 7400; Santa Cruz, CA 90029; Santa Rosa-Petaluma, CA 7500; Vallejo-Fairfield-Napa, CA 90031
replace metrocode=90067 if metrocode==90028 | metrocode==7400 | metrocode==90029 | metrocode==7500 | metrocode==90031
*------------------------------------------------------------------------------------------------------------------------

*Seattle-Everett, WA 90068: Seattle-Everett, WA 90030; Olympia, WA 5910
replace metrocode=90068 if metrocode==90030 | metrocode==5910
*------------------------------------------------------------------------------------------------------------------------

*Portland-Vancouver, OR 90069: Portland-Vancouver, OR 90032; Salem, OR 7080
replace metrocode=90069 if metrocode==90032 | metrocode==7080  
*------------------------------------------------------------------------------------------------------------------------

*Philadelphia, PA/NJ 90070: Philadelphia, PA/NJ 90034; Atlantic City, NJ 560; Vineland-Milville-Bridgetown, NJ 8760
replace metrocode=90070 if metrocode==90034 | metrocode==560 | metrocode==8760
*------------------------------------------------------------------------------------------------------------------------

*Washington, DC/MD/VA 90071: Washington, DC/MD/VA 8840; Baltimore, MD 720; Hagerstown, MD 3180
replace metrocode=90071 if metrocode==8840 | metrocode==720 | metrocode==3180
***************************************************************************************
*_________________________________________________________________________________________
