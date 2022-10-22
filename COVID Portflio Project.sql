SELECT *
FROM PortfolioProject..CovidDeaths
ORDER BY 3,4

--SELECT *
--FROM PortfolioProject..CovidVaccinations
--ORDER BY 3,4

-- Select the data that I am going to use

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths
WHERE continent is not null
ORDER BY 1,2


-- I am looking at Total Cases vs Total Deaths
-- Shows the likelihood of dying if you contract covid in certain countries

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE location like '%un%state%'
ORDER BY 1,2


-- Looking at Total Cases vs Population
-- Shows what percentage of the population got Covid

SELECT location, date, total_cases, population, (total_cases/population)*100 as PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
--WHERE location like '%un%state%'
ORDER BY 1,2


-- Looking at Countries with Highest Infection Rate compared to Population
SELECT continent, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
--WHERE location like '%un%state%'
GROUP BY continent, population
ORDER BY PercentPopulationInfected desc


-- Showing countries with Highest Death Count per Population
SELECT continent, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
--WHERE location like '%un%state%'
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeathCount desc


-- Breaking things down by continent!


-- Showing continents with the highest death count

SELECT continent, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
--WHERE location like '%un%state%'
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeathCount desc


-- GLOBAL NUMBERS
SELECT SUM(new_cases) AS total_cases, SUM(cast(new_deaths AS int)) AS total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100  AS DeathPercentage
FROM PortfolioProject..CovidDeaths
--WHERE location like '%un%state%'
WHERE continent is not null
--GROUP BY date
ORDER BY 1,2


-- Looking at Total Population VS Vaccinations

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CONVERT(bigint,vac.new_vaccinations)) OVER (Partition by dea.location Order by dea.location, dea.date) AS RollingPeopleVaccinated, --(RollingPeopleVaccinated/population)*100
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
WHERE dea.continent is not null
order by 2,3


-- USING CTE

With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
AS
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CONVERT(bigint,vac.new_vaccinations)) OVER (Partition by dea.location Order by dea.location, dea.date) AS RollingPeopleVaccinated --, (RollingPeopleVaccinated/population)*100
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
WHERE dea.continent is not null
--order by 2,3
)
SELECT *, (RollingPeopleVaccinated/Population)*100
FROM PopvsVac


-- Creating view to store data for visualization later

Create View PercentPopulationVaccinated as
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CONVERT(bigint,vac.new_vaccinations)) OVER (Partition by dea.location Order by dea.location, dea.date) AS RollingPeopleVaccinated --, (RollingPeopleVaccinated/population)*100
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
WHERE dea.continent is not null
--order by 2,3