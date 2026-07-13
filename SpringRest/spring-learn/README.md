# Hands-on 1: Create a Spring Web Project using Maven

## Scenario
Set up a basic Spring Web project structure named `spring-learn`.

## Steps Completed
1. Created Maven project with `pom.xml` configuration including Spring Web and DevTools dependencies.
2. Configured `server.port=8083` in `application.properties`.
3. Created `SpringLearnApplication.java` main class with entry logging inside `main`.

---

# Hands-on 4: Spring Core – Load Country from Spring Configuration XML

## Scenario
Configure countries in `country.xml` and read the data using Spring ApplicationContext.

## Steps Completed
1. Created `Country.java` with getters, setters, and constructors containing debug logs.
2. Configured `country.xml` in resources containing definitions for countries (`US`, `DE`, `IN`, `JP`, and default `country` with code `IN`).
3. Implemented `displayCountry()` in `SpringLearnApplication.java` to load and display the default country bean.

---

# Hello World RESTful Web Service

## Scenario
Write a REST service that returns "Hello World!!" at `/hello`.

## Steps Completed
1. Created `HelloController.java` with a GET mapping for `/hello`.
2. Included start and end logger messages inside `sayHello()`.

---

# REST - Country Web Service & Get All Countries

## Scenario
Implement REST services that return India country details and all configured countries.

## Steps Completed
1. Created `CountryController.java` with request mapping at `/country` (returns India country bean) and `/countries` (returns list of all country beans loaded from `country.xml`).

---

# REST - Get Country based on Country Code

## Scenario
Implement a REST service that returns country details for a given country code, case-insensitively.

## Steps Completed
1. Created `CountryService.java` with a method `getCountry(String code)` that loads all countries from `country.xml` and streams them to find a case-insensitive code match.
2. Updated `CountryController.java` to autowire `CountryService` and handle GET requests at `/countries/{code}` using `@PathVariable`.
