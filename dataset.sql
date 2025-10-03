/*
Queries used for the Visualization
*/

-- 1. 
--Global Numbers

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From TableauVisualization..CovidDeaths
where continent is not null 
order by 1,2


-- 2. 
--Total Death Per Continent

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From TableauVisualization..CovidDeaths
Where continent is null 
and location not in ('World', 'European Union', 'International', 'Upper middle income', 'High income', 'Lower middle income', 'Low income')
Group by location
order by TotalDeathCount desc


-- 3.
--Percent Population Infected Per Country

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From TableauVisualization..CovidDeaths
Group by Location, Population
order by PercentPopulationInfected desc


-- 4.
--Percent Population Infected 

Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From TableauVisualization..CovidDeaths
Group by Location, Population, date
order by PercentPopulationInfected desc
