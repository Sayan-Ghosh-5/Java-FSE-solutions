# Exercise: Create Authentication Service that Returns JWT

## Scenario
Create an authentication service that generates and returns a JWT upon receiving valid basic authentication credentials.

## Steps Completed
1. Created Maven project with Spring Web, Spring Security, and Auth0 java-jwt dependencies.
2. Configured security settings in `SecurityConfig.java` to permit access to `/authenticate`.
3. Created `AuthController.java` to parse the `Authorization` header, decode credentials, validate them (`user:pwd`), and generate a JWT token.
