use covid_19_data;
select * from country_wise_latest;
select * from covid_19_clean_complete;
select * from full_grouped;
select * from usa_county_wise;
select * from worldometer_data;
-- 1. Find Out the Death Percentage Locally and Globally
SELECT (SUM(Deaths) / SUM(Confirmed)) * 100 AS GlobalDeathPercentage
FROM country_wise_latest;

SELECT Country, (Deaths / Confirmed) * 100 AS DeathPercentage
FROM country_wise_latest;

-- 2 Find Out the Infected Population Percentage Locally and Globally
SELECT (SUM(c.Confirmed) / SUM(w.Population)) * 100 AS GlobalInfectedPercentage
FROM country_wise_latest c
Join worldometer_data w
ON c.Country = w.Country; 

-- 3. Find Out the Countries with the Highest Infection Rates
SELECT Country, Confirmed AS InfectionRate
FROM country_wise_latest
ORDER BY InfectionRate DESC
LIMIT 10;

-- 4. Find Out the Countries with the Highest Death Counts
SELECT Country, Deaths
FROM country_wise_latest
ORDER BY Deaths DESC
LIMIT 10;

-- 5 
SELECT WHORegion, SUM(Deaths) AS TotalDeaths
FROM country_wise_latest
GROUP BY  WHORegion
ORDER BY TotalDeaths DESC;




-- join 
ALTER TABLE covid_19_clean_complete
RENAME COLUMN `WHO Region` TO `WHORegion`;

ALTER TABLE country_wise_latest
RENAME COLUMN `WHO Region` TO `WHORegion`;

ALTER TABLE full_grouped
RENAME COLUMN `WHO Region` TO `WHORegion`;

ALTER TABLE worldometer_data
RENAME COLUMN `WHO Region` TO `WHORegion`;

ALTER TABLE covid_19_clean_complete
RENAME COLUMN `Country/Region` TO `Country`;

ALTER TABLE worldometer_data
RENAME COLUMN `Country/Region` TO `Country`;

ALTER TABLE full_grouped
RENAME COLUMN `Country/Region` TO `Country`;

-- 1
Select c1.Country, c2.WHORegion, w.population
from country_wise_latest c1
inner join covid_19_clean_complete c2
on c1.Country = c2.Country
inner join  worldometer_data w 
on c2.Country = w.Country;

-- 2
select c1.WHORegion, c1.deaths, c2.lat, c2.Long, f.Recovered, w.NewCases
From country_wise_latest c1
inner join covid_19_clean_complete c2
on c1.WHORegion = c2.WHORegion
inner join full_grouped f
on c2.WHORegion = f.WHORegion
inner join  worldometer_data w 
on f.WHORegion = w.WHORegion;


ALTER TABLE covid_19_india
RENAME COLUMN `State/UnionTerritory` TO `State`;
-- 3
select c1.State, c2.TotalSamples, c2.Positive
from covid_19_india c1
inner join statewisetestingdetails c2
on c1.state = c2.state;

-- 4
Select c1.Country, c2.WHORegion, w.population, c3.Sessions
from country_wise_latest c1
inner join covid_19_clean_complete c2
on c1.Country = c2.Country
inner join  worldometer_data w 
on c2.Country = w.Country
inner join covid_vaccine_statewise c3
on w.Country = c3.State;

-- 5
Select c1.Country, c2.WHORegion, w.population, c3.Sessions, f.Recovered
from country_wise_latest c1
inner join covid_19_clean_complete c2
on c1.Country = c2.Country
inner join  worldometer_data w 
on c2.Country = w.Country
inner join covid_vaccine_statewise c3
on w.Country = c3.State
inner join full_grouped f
on c3.state = f.Country;


select covid_19_clean_complete.Country,covid_19_india.State
 from covid_19_clean_complete inner join covid_19_india on covid_19_clean_complete.`Date`=covid_19_india.`Date`;


select
    c.`Country`, 
    c.`Deaths`,
    d.`State`, 
    f.`Recovered`,
    f.`Deaths` as `DayWiseDeaths`, 
    g.`New cases`, 
    g.`New deaths`, 
    g.`New recovered`,
    h.`Negative`, 
    h.`Positive`,
    i.`Province_State`, 
    i.`Country_Region`
from
    covid_19_clean_complete c
join
    covid_19_india d on c.`Date` = d.`Date`
join 
    day_wise f on c.`Date` = f.`Date`
join  
    full_grouped g on c.`Date` = g.`Date`
join  
    statewisetestingdetails h on c.`Date` = h.`Date`
join  
    usa_county_wise i on c.`Date` = i.`Date`;

