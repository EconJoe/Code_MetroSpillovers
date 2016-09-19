
* AGGREGATION
gen metaread_agg=.

* -------------------------------------------------------------------------
* Los Angeles-Long Beach-Anaheim-Santa Ana-Orange County-Riverside-San Bernardino-Oxnard-Thousand Oaks-Ventura, CA 90001
*   Los Angeles-Long Beach, CA 4480
*   Anaheim-Santa Ana, CA 4481
*   Orange County, CA 4482
*   Riverside-San Bernardino,CA 6780
*   San Bernardino, CA 6781
*   Oxnard-Thousand Oaks-Ventura, CA 8730

replace metaread_agg=90064 if metaread==4480 
replace metaread_agg=90064 if metaread==4481
replace metaread_agg=90064 if metaread==4482
replace metaread_agg=90064 if metaread==6780
replace metaread_agg=90064 if metaread==6781
replace metaread_agg=90064 if metaread==8730										
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Chicago-Gary-Hammond-Lake-Aurora-Elgin-Joliet-Kenosha-Kankakee, IL 90002
*   Chicago-Gary-Lake, IL 1600
*   Aurora-Elgin, IL 1601
*   Gary-Hammond, IN 1602
*   Joliet, IL 1603
*   Lake, IL 1604
*   Kenosha, WI 3800
*   Kankakee, IL 3740

replace metaread_agg=90061 if metaread==1600 
replace metaread_agg=90061 if metaread==1601
replace metaread_agg=90061 if metaread==1602
replace metaread_agg=90061 if metaread==1603
replace metaread_agg=90061 if metaread==1604
replace metaread_agg=90061 if metaread==3800
replace metaread_agg=90061 if metaread==3740
*------------------------------------------------------------------------------------------------------------------------


* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Pittsburgh-Beaver Valley, PA 90003
*   Pittsburgh-Beaver Valley, PA 6280
*   Beaver County, PA 6281

replace metaread_agg=90003 if metaread==6280
replace metaread_agg=90003 if metaread==6281
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------																					
* Houston-Brazoria, TX 90004
*   Houston-Brazoria, TX 3360
*   Brazoria, TX 1145
*   Brazoria, TX 3361
*   Galveston 2920
replace metaread_agg=90004 if metaread==3360
replace metaread_agg=90004 if metaread==3361
replace metaread_agg=90004 if metaread==2920
* ---------------------------------------------------------------------------
																
* ---------------------------------------------------------------------------
* Hartford-Bristol-Middleton-New Britain, CT 90005
*   Hartford-Bristol-Middleton-New Britain, CT 3280
*   Bristol, CT 3281
*   New Britian, CT 3283
*   Middletown, CT 3282
replace metaread_agg=90005 if metaread==3280
replace metaread_agg=90005 if metaread==3281
replace metaread_agg=90005 if metaread==3283
replace metaread_agg=90005 if metaread==3282																
* ---------------------------------------------------------------------------	
																				

* ---------------------------------------------------------------------------	
* Raleigh-Durham, NC	90008
*   Raleigh-Durham, NC 6640
*   Durham, NC 6641

replace metaread_agg=90008 if metaread==6640
replace metaread_agg=90008 if metaread==6641																					
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Providence-Fall River-Pawtucket, MA/RI	90011
*   Providence-Fall River-Pawtucket, MA/RI 6480
*   Fall River, MA/RI 6481
*   Pawtuckett 6482
*   New Bedford 5400

replace metaread_agg=90011 if metaread==6480
replace metaread_agg=90011 if metaread==6481
replace metaread_agg=90011 if metaread==6482
replace metaread_agg=90011 if metaread==5400																	
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Miami-Hialeah, FL 90013
*   Miami-Hialeah, FL 5000
*   Fort Lauderdale-Hollywood-Pompano Beach 2680

replace metaread_agg=90013 if metaread==5000
replace metaread_agg=90013 if metaread==2680																					
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Dallas-Fort Worth, TX 90014
*   Dallas-Fort Worth, TX 1920
*   Fort Worth-Arlington, TX 1921

replace metaread_agg=90014 if metaread==1920
replace metaread_agg=90014 if metaread==1921															
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
*  OH/KY/IN 90016
*   Cincinnati OH/KY/IN 1640
*   Hamilton-Middletown, OH 3200
					
replace metaread_agg=90016 if metaread==1640
replace metaread_agg=90016 if metaread==3200																						
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
*Boston, MA 90018: Boston, MA 1120
*   Lawrence-Haverhil, MA 1121
*   Lowell, MA/NH 1122
*   Salem-Gloucester, MA 1123
*   Brockton 1200

replace metaread_agg=90018 if metaread==1120
replace metaread_agg=90018 if metaread==1121
replace metaread_agg=90018 if metaread==1122
replace metaread_agg=90018 if metaread==1123
replace metaread_agg=90018 if metaread==1200	
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Cleveland-Akron-Lorain-Elyria, OH 90019
*   Cleveland, OH 1680
*   Lorain-Elyria, OH 4440
*   Akron, OH 80
replace metaread_agg=90060 if metaread==1680
replace metaread_agg=90060 if metaread==4440
replace metaread_agg=90060 if metaread==80
*------------------------------------------------------------------------------------------------------------------------

* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
*New York-Northeastern NJ 90020
*   New York-Northeastern NJ 5600
*   Monmouth-Ocean, NJ 5190
*   Jersey City 5603
*   Bergen Passaic 875
*   Bergen Passaic 5602
*   New Burnswick 5460
*   Newburgh 5660
*   Orange 5950
*   Nassau Suffolk 5601
*   Middlesex-Somerset-Hunt, NJ 5604
*   Trenton, NJ 8480
*   Newark, NJ 5605
*   Danbury, CT 1930
*   Stamford, CT 8040
*   Waterbury, CT 8880
*   Norwalk, CT 5760
*   New Haven-Meriden, CT 5480
*  Poughkeepsie, NY 6460
*  Dutchess County, NY 2281

replace metaread_agg=90066 if metaread==5600
replace metaread_agg=90066 if metaread==5190
replace metaread_agg=90066 if metaread==5603
replace metaread_agg=90066 if metaread==5602
replace metaread_agg=90066 if metaread==5460
replace metaread_agg=90066 if metaread==5660
replace metaread_agg=90066 if metaread==5950
replace metaread_agg=90066 if metaread==5601
replace metaread_agg=90066 if metaread==5604
replace metaread_agg=90066 if metaread==8480
replace metaread_agg=90066 if metaread==5605
replace metaread_agg=90066 if metaread==1930
replace metaread_agg=90066 if metaread==8040
replace metaread_agg=90066 if metaread==8880
replace metaread_agg=90066 if metaread==5760
replace metaread_agg=90066 if metaread==5480
replace metaread_agg=90066 if metaread==6460
replace metaread_agg=90066 if metaread==2281
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Norfolk-VA Beach-Newport News, VA 90021
*   Norfolk-VA Beach-Newport News, VA 5720
*   New Port News, VA 5721

replace metaread_agg=90021 if metaread==5720
replace metaread_agg=90021 if metaread==5721
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Columbus, OH 90022
*   Columbus, OH 1840
*   Newark, OH 5640
replace metaread_agg=90022 if metaread==1840
replace metaread_agg=90022 if metaread==5640
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Buffalo-Niagara Falls, NY 90023
*   Buffalo-Niagara Falls, NY 1280
*   Niagara Falls, NY 1281

replace metaread_agg=90023 if metaread==1280
replace metaread_agg=90023 if metaread==1281
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Salt Lake City-Ogden, UT 90024
*   Salt Lake City-Ogden, UT 7160
*   Ogden, UT 7161

replace metaread_agg=90024 if metaread==7160
replace metaread_agg=90024 if metaread==7161																						
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Richmond-Petersburg, VA 90025
*   Richmond-Petersburg, VA 6760
*   Petersburg-Colonial Heights-Hopeviille, VA 6761

replace metaread_agg=90025 if metaread==6760
replace metaread_agg=90025 if metaread==6761	
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Charlotte-Gastonia-Rock Hill, SC 90026
*   Charlotte-Gastonia-Rock Hill, SC 1520
*   Rock Hill, SC 1521
replace metaread_agg=90026 if metaread==1520
replace metaread_agg=90026 if metaread==1521	
* ---------------------------------------------------------------------------


* ---------------------------------------------------------------------------
* San Francisco-Oakland, CA	90028
*   San Francisco-Oakland-Vallejo, CA 7360
*   Oakland, CA 7361
*   San Jose, CA 7400
*   Santa Cruz, CA 7480
*   Santa Rosa-Petaluma, CA 7500
*   Vallejo-Fairfield-Napa, CA 7362

replace metaread_agg=90067 if metaread==7360
replace metaread_agg=90067 if metaread==7361
replace metaread_agg=90067 if metaread==7400
replace metaread_agg=90067 if metaread==7480
replace metaread_agg=90067 if metaread==7500
replace metaread_agg=90067 if metaread==7362	
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Seattle-Everett-Tacoma-Olympia, WA 90030
*   Seattle-Everett, WA 7600
*   Tacoma, WA 8200
*   Olympia, WA 5910
replace metaread_agg=90068 if metaread==7600
replace metaread_agg=90068 if metaread==8200
replace metaread_agg=90068 if metaread==5910
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Portland-Vancouver-Salem, OR 90032
*   Portland-Vancouver, OR 6440
*   Vancouver, WA 6441
*   Salem, OR 7080
replace metaread_agg=90069 if metaread==6440
replace metaread_agg=90069 if metaread==6441
replace metaread_agg=90069 if metaread==7080
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Scranton-Wilkes-Barre, PA 90033
*   Scranton-Wilkes-Barre, PA 7560
*   Wilkes-Barre-Hazleton, PA 7561

replace metaread_agg=90033 if metaread==7560
replace metaread_agg=90033 if metaread==7561
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Philadelphia, PA/NJ 90034
*   Philadelphia, PA/NJ 6160
*   Wilmington, DE/NJ/MD 9160
*   Atlantic City, NJ 560
*   Vineland-Milville-Bridgetown, NJ 8760
replace metaread_agg=90070 if metaread==6160
replace metaread_agg=90070 if metaread==9160
replace metaread_agg=90070 if metaread==560
replace metaread_agg=90070 if metaread==8760
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Greensboro-Winston Salem-High Point, NC 90035
*   Greensboro-Winston Salem-High Point, NC 3120
*   Winston-Salem, NC 3121
replace metaread_agg=90035 if metaread==3120
replace metaread_agg=90035 if metaread==3121	
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Sacramento, CA 90036
*   Sacramento, CA 6920
*   Yolo, CA 9270
replace metaread_agg=90036 if metaread==6920
replace metaread_agg=90036 if metaread==9270
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
*Indianapolis, IN 90052
*   Indianapolis, IN 3480
*   Anderson, IN 400
replace metaread_agg=90052 if metaread==3480
replace metaread_agg=90052 if metaread==400
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
*Saginaw-Bay City-Midland, MI 90053
*   Saginaw-Bay City-Midland, MI 6960
*   Bay City, MI 6961
replace metaread_agg=90053 if metaread==6960
replace metaread_agg=90053 if metaread==6961
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Battle Creek, MI 90054
*   Battle Creek, MI 780
*   Kalamazoo-Portage, MI 3720
replace metaread_agg=90054 if metaread==780
replace metaread_agg=90054 if metaread==3720
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Dayton-Springfield, OH 90055
*   Dayton-Springfield, OH 2000
*   Springfield, OH 2001
replace metaread_agg=90055 if metaread==2000
replace metaread_agg=90055 if metaread==2001

* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Greenville-Spartanburg-Anderson SC 90056
*   Greenville-Spartanburg-Anderson SC 3160
*   Anderson, SC 3161
replace metaread_agg=90056 if metaread==3160
replace metaread_agg=90056 if metaread==3161
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Muskegon-Norton Shores-Muskegon Heights, MI 90057
*   Muskegon-Norton Shores-Muskegon Heights, MI 5320
*   Grand Rapids, MI 3000
replace metaread_agg=90057 if metaread==5320
replace metaread_agg=90057 if metaread==3000
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* "Biloxi-Gulfport-Pascagoula-Moss Point, MS 90058
*   Biloxi-Gulfport, MS 920
*   Pascagoula-Moss Point, MS 6030
replace metaread_agg=90058 if metaread==920
replace metaread_agg=90058 if metaread==6030
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
*Sarasota, FL 90059
*   Sarasota, FL 7510
*   Bradenton FL 1140
replace metaread_agg=90059 if metaread==1140
replace metaread_agg=90059 if metaread==7510
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Detroit-Flint-Ann Arbor, MI 90062
*   Detroit, MI 2160
*   Flint, MI 2640
*   Ann Arbor, MI 440
replace metaread_agg=90062 if metaread==2160
replace metaread_agg=90062 if metaread==2640
replace metaread_agg=90062 if metaread==440
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Denver-Boulder-Longmont-Greeley, CO 90063
*   Denver-Boulder-Longmont, CO 2080
*   Boulder-Longmont, CO 2081
*   Greeley, CO 3060
replace metaread_agg=90063 if metaread==2080
replace metaread_agg=90063 if metaread==2081
replace metaread_agg=90063 if metaread==3060
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Milwaukee-Racine, WI 90065
*   Milwaukee, WI 5080
*   Racine, WI 6600
replace metaread_agg=90065 if metaread==5080
replace metaread_agg=90065 if metaread==6600
* ---------------------------------------------------------------------------

* ---------------------------------------------------------------------------
* Washington DC-Baltimore-Hagerstown, DC/MD/VA 90071
*   Washington, DC/MD/VA 8840
*   Baltimore, MD 720
*   Hagerstown, MD 3180
replace metaread_agg=90071 if metaread==8840
replace metaread_agg=90071 if metaread==720
replace metaread_agg=90071 if metaread==3180
* ---------------------------------------------------------------------------

replace metaread_agg=metaread if metaread_agg==.
