
global path "D:\Research\RDSpillovers\Spillovers7"

cd $path\Data\IPUMS
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

* Drop if weeks worked last year is unknown or 0 (no WKSWORK1 in ACS for 2008-2011)
drop if WKSWORK2==0

* Use WKSWORK1 and WKSWORK2 data from 1980-2007 to impute WKSWORK1 data for 2009-2011
tab WKSWORK2, gen(W_)
reg WKSWORK1 W_* [aweight=perwt], noconstant
predict yhat
rename yhat wkswork_imp
drop if year>2000 & year<2009
replace wkswork_imp=WKSWORK1 if WKSWORK1!=.
drop WKSWORK1 WKSWORK2 W_*

* Drop individuals younger than 18 and older than 65
drop if age<18 | age>65

* Drop individuals that do not live in a metro (or metro not identified)
drop if metaread==0
	 
* Drop individuals in the armed services
drop if empstatd==13 | empstatd==14 | empstatd==15
drop empstatd

* Drop institutionalized individuals
drop if gqtype==1 | gqtype==2 | gqtype==3 | gqtype==4 | gqtype==6
drop gqtype

* Drop students enrolled in school
drop if school==2
drop school

* Drop individuals with no industry
drop if IND1990==0

* Drop university employees
drop if IND1990==850

* Drop individuals who last worked in 1984 or earlier
drop if IND1990==992

* Drop active duty military personnel
drop if IND1990>=940 & IND1990<=960

* Drop individuals who did not respond to the IND1990 question
drop if IND1990==999
drop IND1990

* Drop professors
drop if OCC1990>=113 & OCC1990<=154

* Drop individuals who are unemployed
drop if OCC1990==991

* Drop individuals who have an unknown occupation
drop if OCC1990==999
drop OCC1990

* Drop any values that were imputed
replace qgqtype=0 if qgqtype==.
local imputed qgqtype qage qmarst qsex qbpl qcitizen qhispan qrace qeduc qschool qempstat qwkswork qincwage
foreach i in `imputed' {
	drop if `i'>0
	drop `i'
}
********************************************************************************************************************
********************************************************************************************************************


********************************************************************************************************************
*********************************CONSTRUCTION OF THE SAMPLE: NEW VARIABLES *****************************************
********************************************************************************************************************
* Gender dummmy variables
gen female=0
replace female=1 if sex==2
gen male=0
replace male=1 if sex==1
drop sex
label var female "Female"
label var male "Male"

* Marital status dummy variables
gen married=1 if marst==1 | marst==2
replace married=0 if marst!=1 & marst!=2
label var married "Married" 

tab marst, gen(m)
local marstnum=`r(r)'
drop marst
label var m1 "Married, spouse present"
label var m2 "Married, spouse absent"
label var m3 "Separated"
label var m4 "Divorced"
label var m5 "Widowed"
label var m6 "Never married/single"

* Interaction between gender and married
forvalues i=1/`marstnum' {
	gen female_m`i' = female*m`i'
	gen male_m`i' = male*m`i'
}
label var female_m1 "Married female, spouse present"
label var female_m2 "Married female, spouse absent"
label var female_m3 "Separated female"
label var female_m4 "Divorced female"
label var female_m5 "Widowed female"
label var female_m6 "Never married/single female"
label var male_m1 "Married male, spouse present"
label var male_m2 "Married male, spouse absent"
label var male_m3 "Separated male"
label var male_m4 "Divorced male"
label var male_m5 "Widowed male"
label var male_m6 "Never married/single male"

* Citizen dummy variable
gen nocitizen=1 if citizen==3 | citizen==4
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

* Years of schooling (https://usa.ipums.org/usa-action/variables/EDUC#codes_section)
gen ys=.
replace ys=0 if educd==2
replace ys=0 if educd==11
replace ys=0 if educd==12
replace ys=1 if educd==14
replace ys=2 if educd==15 
replace ys=3 if educd==16
replace ys=4 if educd==10 | educd==13 | educd==17
replace ys=5 if educd==22
replace ys=6 if educd==21 | educd==23
replace ys=7 if educd==25
replace ys=8 if educd==20 | educd==24 | educd==26
replace ys=9 if educd==30
replace ys=10 if educd==40
replace ys=11 if educd==50 | educd==61
replace ys=12 if educd==60 | educd==62 | educd==63 | educd==64 | educd==65
replace ys=13 if educd==70 | educd==71
replace ys=14 if educd==80 | educd==81 | educd==82 | educd==83
replace ys=15 if educd==90
replace ys=16 if educd==100 | educd==101
replace ys=17 if educd==110
replace ys=18 if educd==111 | educd==114 | educd==115
replace ys=19 if educd==112
replace ys=20 if educd==113 | educd==116
label var ys "Years of schooling"

* College Graduates
gen collgrad=0
replace collgrad=1 if educd>=100 & educd!=999
by metaread year, sort: egen collgradm=mean(collgrad)
label var collgradm "Share college grads"
drop educd
drop collgrad

* Polynomials of experience 
gen exp=age-ys-6
drop if exp<0
gen exp_2=exp^2
gen exp_3=exp^3
gen exp_4=exp^4
label var exp "Years of experience"
label var exp_2 "Years of experience ^ 2"
label var exp_3 "Years of experience ^ 3"
label var exp_4 "Years of experience ^ 4"

* Impute top-coded incomes
* Top-coded incomes for other years are already imputed (see: https://usa.ipums.org/usa-action/variables/INCWAGE#codes_section)
replace incwage=incwage*1.5 if incwage==75000 & year==1980

* Compute income per week
replace incwage=incwage/wkswork_imp
drop wkswork_imp

* Adjust weekly income for inflation using 2011 as the base year
* Source: http://data.bls.gov/cgi-bin/surveymost
local cpi80 82.4
local cpi90 130.7
local cpi00 172.2
local cpi09 214.537
local cpi10 218.056
local cpi11 224.939
replace incwage=incwage*(`cpi11'/`cpi80') if year==1980
replace incwage=incwage*(`cpi11'/`cpi90') if year==1990
replace incwage=incwage*(`cpi11'/`cpi00') if year==2000
replace incwage=incwage*(`cpi11'/`cpi09') if year==2009
replace incwage=incwage*(`cpi11'/`cpi10') if year==2010
replace incwage=incwage*(`cpi11'/`cpi11') if year==2011

drop if incwage<40 | incwage>4000
gen lw=ln(incwage)
drop incwage
label var lw "Log real weekly wages"

********************************************************************************************************************
********************************************************************************************************************

********************************************************************************************************************
****************************** CONSTRUCTION OF THE SAMPLE: AGGREGATION OF METROS ***********************************
********************************************************************************************************************
cd B:\Research\RDSpillovers\Spillovers6\Code\DoFiles
rename metaread metrocode
do AggregationCodes.do

*cd C:\Users\JoeS\Desktop\Research\RDSpillovers\Spillovers5\Data\IPUMS
*save test, replace
********************************************************************************************************************
********************************************************************************************************************


********************************************************************************************************************
******************************  ***********************************
********************************************************************************************************************
*cd C:\Users\JoeS\Desktop\Research\RDSpillovers\Spillovers5\Data\IPUMS
*use test, clear

gen year_m=year
replace year_m=2010 if year_m==2009 | year_m==2011

sort metrocode year_m
tempfile hold
save "`hold'", replace


cd $path\Data
use XVAR.dta, clear
keep metrocode pop* total* pat4* pat6* ss1*
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

reshape long pop total pat4 pat6 ss1, i(metrocode) j(year) 
drop if year==1970
label var total "Academic R&D"
label var pat4 "Patents"
label var pat6 "Patent cites"
label var ss1 "Share shift index"

gen lpop=ln(pop)
gen lpop_2=lpop^2
label var lpop "Log population"
label var lpop_2 "Log population ^ 2"

tempfile xvar
save `xvar', replace
********************************************************************************************************************
********************************************************************************************************************



********************************************************************************************************************
******************************  ***********************************
*******************************************************************************************************

cd $path\Data
use PRA_Data, clear
keep metroname metrocode vcr* pcr* pse* u*
drop *06
gen id=_n

local vars `" "vcr" "pcr" "pse" "u" "'

foreach i in `vars' {

	rename `i'80 `i'1
	rename `i'90 `i'2
	rename `i'00 `i'3
	rename `i'10 `i'4
}

order metroname metrocode vcr* pcr* pse* u*, seq
reshape long vcr pcr pse u, i(id) j(year)
drop id
replace year=1980 if year==1
replace year=1990 if year==2
replace year=2000 if year==3
replace year=2010 if year==4

collapse (mean) vcr* pcr* pse* u*, by(metrocode year)

order metrocode year
sort metrocode year

merge m:1 metrocode year using "`xvar'"
drop _merge

rename year year_m
sort metrocode year_m
merge 1:m metrocode year_m using "`hold'"
keep if _merge==3
drop _merge
sort metrocode year_m
save "`hold'", replace


local ivs enroliv lguniv 
foreach i in `ivs' {
	
	cd B:\Research\RDSpillovers\Spillovers5\Data\IVs
	use `i'.dta, clear
	sort metrocode
	merge 1:m metrocode using "`hold'"
	tab _merge
	drop if _merge==1
	drop _merge
	save "`hold'", replace
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

sort metrocode year_m
save "`hold'", replace

********************************************************************************************************************
******************************  ***********************************
********************************************************************************************************************
*cd C:\Users\JoeS\Desktop\Research\RDSpillovers\Spillovers5\Data\IPUMS
*save test, replace

*cd C:\Users\JoeS\Desktop\Research\RDSpillovers\Spillovers5\Data\IPUMS
*use test, clear
*tempfile hold
*save "`hold'", replace

collapse pop, by(metrocode year_m)
tempfile pop
save "`pop'", replace
replace year_m=1975 if year_m==1980
replace year_m=1985 if year_m==1990
replace year_m=1995 if year_m==2000
replace year_m=2005 if year_m==2010
replace pop=.
append using "`pop'"
sort metrocode year_m
by metrocode: ipolate pop year, gen(pop_imp) epolate
drop pop
keep if year==1975 | year==1985 | year==1995 | year==2005
sort metrocode year_m
save "`pop'", replace

cd B:\Research\RDSpillovers\Spillovers5\Data
use rd_five_year_lag, clear
keep year totse mc
rename mc metrocode
rename year year_m
rename totse total_lag5
collapse (sum) total_lag5, by(metrocode year_m)
sort metrocode year
merge 1:1 metrocode year using "`pop'"
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

replace year_m=1980 if year_m==1975
replace year_m=1990 if year_m==1985
replace year_m=2000 if year_m==1995
replace year_m=2010 if year_m==2005
label var total_lag5 "Academic R&D lagged 5 years"
sort metrocode year_m
merge 1:m metrocode year_m using "`hold'"
drop _merge
sort metrocode year_m
save "`hold'", replace
********************************************************************************************************************
********************************************************************************************************************

cd B:\Research\RDSpillovers\Spillovers5\Data
use jadams_data, clear
collapse (sum) papers citsuniv citsfirm, by(metrocode year)
replace year=year+1900
tempfile ja
save "`ja'", replace
keep if year==1981 | year==1990 | year==1999
replace year=1980 if year==1981
replace year=2000 if year==1999
rename year year_m
gen citsall=citsuniv+citsfirm
sort metrocode year_m
merge 1:m metrocode year_m using "`hold'"
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


rename metrocode metaread
label var metaread "Metropolitan area"
drop year_m

order metaread year lw total total_lag5 pat4 pat6 collgradm
compress

cd D:\Research\RDSpillovers\Spillovers7\Data
save PANEL_test.dta, replace

