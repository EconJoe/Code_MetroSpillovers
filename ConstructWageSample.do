

global path "B:\Research\Projects\RDSpillovers\Spillovers9"

cd $path\Data\Raw\IPUMS
use usa_00031.dta, clear
*collapse perwt, by(metaread year)

* Drop from next extraction: citypop

* Keep variables used in the analysis
keep perwt ///
	 year ///
	 metaread ///
	 gqtype qgqtype ///
	 age qage ///
	 sex qsex ///
	 marst qmarst ///
	 race qrace ///
	 citizen qcitizen ///
	 hispan qhispan ///
	 bpl qbpl ///
	 educd qeduc ///
	 school qschool ///
	 empstatd qempstat ///
	 OCC1990 ///
	 IND1990 ///
	 WKSWORK1 WKSWORK2 qwkswork ///
	 incwage qincwage
	 
********************************************************************************************************************
*********************************************** SAMPLE RESTRICTIONS ************************************************
********************************************************************************************************************

* Drop if weeks worked last year is "N/A (or Missing)"
* Note: WKSWORK1 measures the precise number of wkkes worked last year while WKSWORK2 measures in intervals. 
* Note: Collection of WKSWORK1 stopped after the 2007 ACS. Thus we only have intervals (WKSWORK2) for 2009, 2010, and 2011. We need to impute. See below.
* Note: WKSWORK2==0 IFF WKSWORK1==0.
* Note: We lose 9,864,950 observations out of 30,289,352, leaving us with 15,921,907
drop if WKSWORK2==0

* Drop individuals younger than 18 and older than 65
* Note: We lose 11,498,119 observations out of 30,289,352, leaving us with 18,791,233
drop if age<18 | age>65

* Drop individuals that are "Not identifiable or not in an MSA"
* Note: We lose 8,813,778 observations out of 30,289,352, leaving us with 21,475,574
drop if metaread==0
drop if metaread==.
	 
* Drop individuals in the armed services
* Note: We lose 116,423 observations out of 30,289,352, leaving us with 30,172,929
drop if empstatd==13 | empstatd==14 | empstatd==15
drop empstatd

* Drop institutionalized individuals
* Note: We lose 7,806,397 observations out of 30,289,352, leaving us with 29,911,197
drop if gqtype==1 | gqtype==2 | gqtype==3 | gqtype==4 | gqtype==6
drop gqtype

* Drop students enrolled in school
* Note: We lose 378,155 observations out of 30,289,352, leaving us with 22,482,955
drop if school==2
drop school

* Drop individuals with " N/A (not applicable)"
* Note: We lose 12,308,462 observations out of 30,289,352, leaving us with 17,980,890
drop if IND1990==0

* Drop university employees
* Note: We lose 450,861 observations out of 30,289,352, leaving us with 29,838,491
drop if IND1990==850

* Drop individuals who last worked in 1984 or earlier
* Note: We lose 127,487 observations out of 30,289,352, leaving us with 30,161,865
drop if IND1990==992

* Drop active duty military personnel
* Note: We lose 112,409 observations out of 30,289,352, leaving us with 30,176,943
drop if IND1990>=940 & IND1990<=960

* Drop individuals who did not respond to the IND1990 question
* Note: We lose 0 observations out of 30,289,352, leaving us with 30,289,352
drop if IND1990==999
drop IND1990

* Drop professors
* Note: We lose 152,631 observations out of 30,289,352, leaving us with 30,136,721
drop if OCC1990>=113 & OCC1990<=154

* Drop individuals who are unemployed
* Note: We lose 120,291 observations out of 30,289,352, leaving us with 30,169,061
drop if OCC1990==991

* Drop individuals who have an unknown occupation
* Note: We lose 12,299,141 observations out of 30,289,352, leaving us with 17,990,211
drop if OCC1990==999
drop OCC1990

* Drop any values that were imputed
replace qgqtype=0 if qgqtype==.
local imputed qgqtype qage qmarst qsex qbpl qcitizen qhispan qrace qeduc qschool qempstat qwkswork qincwage
* Note: We lose 7,288,417 observations out of 30,289,352, leaving us with 23,000,935
foreach i in `imputed' {
	drop if `i'>0
	drop `i'
}
********************************************************************************************************************
********************************************************************************************************************

********************************************************************************************************************
****************************** CONSTRUCTION OF THE SAMPLE: AGGREGATION OF METROS ***********************************
********************************************************************************************************************
cd $path\Code_Spillovers9
do MetroAggregation.do
********************************************************************************************************************

********************************************************************************************************************
*********************************CONSTRUCTION OF THE SAMPLE: NEW VARIABLES *****************************************
********************************************************************************************************************
* Use WKSWORK1 and WKSWORK2 data from 1980-2007 to impute WKSWORK1 data for 2009-2011
reg WKSWORK1 ibn.WKSWORK2 [aweight=perwt], noconstant
predict yhat
rename yhat wkswork_imp
keep if year==1980 | year==1990 | year==2000 |(year>=2009 & year<=2011)
replace wkswork_imp=WKSWORK1 if WKSWORK1!=.
drop WKSWORK1 WKSWORK2

* Citizen dummy variable
gen nocitizen=1 if citizen>=3
replace nocitizen=0 if nocitizen==.
drop citizen
label var nocitizen "Not a U.S. citizen"

* Race dummies
gen black=1 if race==2
replace black=0 if black==.
gen otherrace=1 if race>=3
replace otherrace=0 if otherrace==.
drop race
label var black "Black"
label var otherrace "Other race (non-white)"

* Hispanic dummies
gen hispanic=0 if hispan==0
replace hispanic=1 if hispanic!=0
drop hispan
label var hispanic "Hispanic"

* N/A or no schooling
drop if educd==0
* N/A
drop if educd==1
* Note: We lose 1,144,288 observations out of 30,289,352, leaving us with 29,145,124

* Years of schooling (https://usa.ipums.org/usa-action/variables/EDUC#codes_section)
gen ys=.

* No schooling completed
replace ys=0 if educd==2
* Nursery school, preschool
replace ys=0 if educd==11
* Kindergarten
replace ys=0 if educd==12

* Grade 1
replace ys=1 if educd==14

* Grade 2
replace ys=2 if educd==15

* Grade 3
replace ys=3 if educd==16

* Nursery school to grade 4
replace ys=4 if educd==10
* Grade 1, 2, 3, or 4
replace ys=4 if educd==13
* Grade 4
replace ys=4 if educd==17

* "Grade 5"
replace ys=5 if educd==22

* Grade 5 or 6
replace ys=6 if educd==21
* Grade 6 
replace ys=6 if educd==23

* Grade 7
replace ys=7 if educd==25

* Grade 5, 6, 7, or 8
replace ys=8 if educd==20
* Grade 7 or 8
replace ys=8 if educd==24
* Grade 8
replace ys=8 if educd==26

* Grade 9
replace ys=9 if educd==30

* Grade 10
replace ys=10 if educd==40

* Grade 11
replace ys=11 if educd==50
* 12th grade, no diploma
replace ys=11 if educd==61

* Grade 12
replace ys=12 if educd==60
* High school graduate or GED
replace ys=12 if educd==62
* Regular high school diploma
replace ys=12 if educd==63
* GED or alternative credential
replace ys=12 if educd==64
* Some college, but less than 1 year
replace ys=12 if educd==65

* 1 year of college
replace ys=13 if educd==70
* 1 or more years of college credit, no degree
replace ys=13 if educd==71

* 2 years of college
replace ys=14 if educd==80
* Associate's degree, type not specified
replace ys=14 if educd==81
* Associate's degree, occupational program
replace ys=14 if educd==82
* Associate's degree, academic program
replace ys=14 if educd==83

* 3 years of college
replace ys=15 if educd==90

* 4 years of college
replace ys=16 if educd==100
* Bachelor's degree
replace ys=16 if educd==101

* 5+ years of college
replace ys=17 if educd==110

* 6 years of college (6+ in 1960-1970)
replace ys=18 if educd==111
* Master's degree
replace ys=18 if educd==114
* Professional degree beyond a bachelor's degree
replace ys=18 if educd==115

* 7 years of college
replace ys=19 if educd==112

* 8+ years of college
replace ys=20 if educd==113
* Doctoral degree
replace ys=20 if educd==116

label var ys "Years of schooling"

* NOTE: SHOULD WE ELIMINATE "4 years of college"???
* College Graduates
* 4 years of college | Bachelor's degree | 5+ years of college | 6 years of college (6+ in 1960-1970) | 7 years of college 
* 8+ years of college | Master's degree | Professional degree beyond a bachelor's degree | Doctoral degree
gen collgrad=0
replace collgrad=1 if educd>=100 & educd!=999
by metaread year, sort: egen collgradm=mean(collgrad)
label var collgradm "Share college grads"
drop educd
drop collgrad

* Years of experience
gen exp=age-ys-6
* Note: We lose 2,903,858 observations out of 29,145,124, leaving us with 26,241,266
drop if exp<0
label var exp "Years of experience"

* Impute top-coded incomes
* Top-coded incomes for other years are already imputed (see: https://usa.ipums.org/usa-action/variables/INCWAGE#codes_section)
replace incwage=incwage*1.5 if incwage==75000 & year==1980

* Compute income per week
replace incwage=incwage/wkswork_imp
drop wkswork_imp

* Adjust weekly income for inflation using 2011 as the base year
* Source: http://www.bls.gov/cpi/cpid1605.pdf Table 24
local cpi80 82.4
local cpi90 130.7
local cpi00 172.2
local cpi09 214.537
local cpi10 218.056
local cpi11 224.939
gen incwage11=.
replace incwage11=incwage*(`cpi11'/`cpi80') if year==1980
replace incwage11=incwage*(`cpi11'/`cpi90') if year==1990
replace incwage11=incwage*(`cpi11'/`cpi00') if year==2000
replace incwage11=incwage*(`cpi11'/`cpi09') if year==2009
replace incwage11=incwage*(`cpi11'/`cpi10') if year==2010
replace incwage11=incwage*(`cpi11'/`cpi11') if year==2011
drop incwage

*gen incwage80=.
*replace incwage80=incwage*(`cpi80'/`cpi80') if year==1980
*replace incwage80=incwage*(`cpi80'/`cpi90') if year==1990
*replace incwage80=incwage*(`cpi80'/`cpi00') if year==2000
*replace incwage80=incwage*(`cpi80'/`cpi09') if year==2009
*replace incwage80=incwage*(`cpi80'/`cpi10') if year==2010
*replace incwage80=incwage*(`cpi80'/`cpi11') if year==2011
*drop incwage

* SHOULD THIS BE ALTERED IF WE ARE MOVING UP TO 2011 CPI? 
* Drop if real weekly income is less than 40 or greater than 4000.
drop if incwage<40 | incwage>4000
gen lw=ln(incwage)
drop incwage
label var lw "Log real weekly wages"

********************************************************************************************************************
********************************************************************************************************************


gen year_agg=year
replace year_agg=2010 if year_agg==2009 | year_agg==2011

sort metaread year_agg
tempfile hold
save `hold', replace


cd $path\Data\Raw
use XVAR.dta, clear
rename metrocode metaread
keep metaread pop* total* pat4* pat6* ss1*
drop pop73

rename pop70 pop1970
rename pop80 pop1980
rename pop90 pop1990
rename pop00 pop2000
rename pop10 pop2010

rename total80P total1980
rename total90P total1990
rename total00P total2000
rename total10P total2010

rename pat4_80P pat41980
rename pat4_90P pat41990
rename pat4_00P pat42000
rename pat4_10P pat42010

rename pat6_80P pat61980
rename pat6_90P pat61990
rename pat6_00P pat62000
rename pat6_10P pat62010

rename ss1_80 ss11980
rename ss1_90 ss11990
rename ss1_00 ss12000
rename ss1_10 ss12010

reshape long pop total pat4 pat6 ss1, i(metaread) j(year) 
drop if year==1970
label var total "Academic R&D"
label var pat4 "Patents"
label var pat6 "Patent cites"
label var ss1 "Share shift index"

gen lpop=ln(pop)
label var lpop "Log population"

rename metaread metaread_agg
rename year year_agg
sort metaread year_agg
merge 1:m metaread_agg year_agg using `hold'
keep if _merge==3
drop _merge
sort metaread year_agg
save `hold', replace
********************************************************************************************************************
********************************************************************************************************************

local ivs enroliv lguniv 
foreach i in `ivs' {
	
	cd $path\Data\Raw\IVs
	use `i'.dta, clear
	rename metrocode metaread_agg
	sort metaread
	merge 1:m metaread_agg using `hold'
	tab _merge
	drop if _merge==1
	drop _merge
	save `hold', replace
}


drop lgstarcode enrol25_level degree25_level pop25 miss_pop25_enrol pos_enrol25
rename lgcode lg

* Replace missing IVs with 0s
replace lg=0 if lg==.
replace enrol25=0 if enrol25==.
replace degree25=0 if degree25==.

label var lg "Land Grant University"
label var enrol25 "1925 Enrollment Proportion"
label var degree25 "1925 Degree Proportion"

sort metaread year_agg
save `hold', replace

********************************************************************************************************************
******************************  ***********************************
********************************************************************************************************************
keep pop metaread year_agg
duplicates drop

tempfile pop
save `pop', replace
replace year_agg=1975 if year_agg==1980
replace year_agg=1985 if year_agg==1990
replace year_agg=1995 if year_agg==2000
replace year_agg=2005 if year_agg==2010
replace pop=.
append using `pop'
sort metaread year_agg
by metaread: ipolate pop year, gen(pop_imp) epolate
drop pop
keep if year==1975 | year==1985 | year==1995 | year==2005
sort metaread year_agg
save `pop', replace

cd $path\Data\Raw
use rd_five_year_lag, clear
keep year totse mc
rename mc metaread
rename year year_agg
rename totse total_lag5
collapse (sum) total_lag5, by(metaread year_agg)
sort metaread year
merge 1:1 metaread year using `pop'
keep if _merge==3
drop _merge

*Create CPI weights with base year 2005
local cpi75 53.8
local cpi85 107.6
local cpi95 152.4
local cpi05 195.3
replace total_lag5=total_lag5*(`cpi05'/`cpi75') if year==1975
replace total_lag5=total_lag5*(`cpi05'/`cpi85') if year==1985
replace total_lag5=total_lag5*(`cpi05'/`cpi95') if year==1995
replace total_lag5=total_lag5*(`cpi05'/`cpi05') if year==2005

replace total_lag5=total_lag5/pop_imp
drop pop_imp

replace year_agg=1980 if year_agg==1975
replace year_agg=1990 if year_agg==1985
replace year_agg=2000 if year_agg==1995
replace year_agg=2010 if year_agg==2005
label var total_lag5 "Academic R&D lagged 5 years"
sort metaread year_agg
merge 1:m metaread year_agg using `hold'
drop _merge
sort metaread year_agg
save `hold', replace
********************************************************************************************************************
********************************************************************************************************************

cd $path\Data\Raw
use jadams_data, clear
rename metrocode metaread_agg
collapse (sum) papers citsuniv citsfirm, by(metaread_agg year)
replace year=year+1900
tempfile ja
save `ja', replace
keep if year==1981 | year==1990 | year==1999
replace year=1980 if year==1981
replace year=2000 if year==1999
rename year year_agg
gen citsall=citsuniv+citsfirm
sort metaread year_agg
merge 1:m metaread year_agg using `hold'
drop if _merge==1
drop _merge
replace papers=papers/pop
replace citsuniv=citsuniv/pop
replace citsfirm=citsfirm/pop
replace citsall=citsall/pop
drop pop
label var papers "Papers"
label var citsuniv "Cites by universities"
label var citsfirm "Cites by firms"
label var citsall "Cites"

label var metaread_agg "Aggregated Metropolitan area"
label var metaread "Metropolitan area"

order metaread_agg metaread year lw total total_lag5 pat4 pat6 collgradm
compress

cd $path\Data
save PANEL.dta, replace



********************************************************************************************************************
********************************************************************************************************************
* Identify top 100 metros in terms of population in 1990
keep if year==1990
keep metaread_agg lpop
duplicates drop
gsort -lpop
gen rank_=_n
by lpop, sort: egen rank=min(rank_)
gsort -lpop
keep if rank<=100
keep metaread_agg
merge 1:m metaread_agg using PANEL
gen top100=0
replace top100=1 if _merge==3
drop _merge

compress
cd $path\Data
save PANEL.dta, replace



