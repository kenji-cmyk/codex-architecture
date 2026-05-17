# Backend Agent Instructions

## Backend Stack

- Java
- Spring Boot
- Spring Web
- Spring Security when authentication is enabled
- JPA/Hibernate when database persistence is enabled
- Maven

---

## Project Role

This directory contains the backend application.

Codex must prioritize correctness, maintainability, clear architecture, and minimal changes.  
Do not rewrite unrelated files.  
Do not introduce new dependencies unless necessary and explained.

---

## Build and Test Commands

Use these commands when applicable:

```bash
./mvnw -q -DskipTests compile
./mvnw test
./mvnw spring-boot:run
```

On Windows PowerShell:

```powershell
.\mvnw.cmd -q -DskipTests compile
.\mvnw.cmd test
.\mvnw.cmd spring-boot:run
```

If a command fails, explain the reason and do not hide the failure.

---

## Architecture Rules

Use this structure unless the existing project already differs:

```txt
controller/
dto/
entity/
repository/
service/
service/impl/
mapper/
exception/
config/
security/
```

Responsibilities:

- Controller handles HTTP only.
- Service handles business logic.
- Repository handles persistence only.
- DTOs are used for request and response.
- Entity classes represent database tables only.
- Mapper converts between entity and DTO.
- Exception package contains custom exceptions and global exception handling.
- Security package contains authentication, authorization, filters, JWT, and user principal logic.

---

## Naming Conventions

Use consistent names:

- Controllers: `UserController`
- Services: `UserService`
- Service implementations: `UserServiceImpl`
- Repositories: `UserRepository`
- Entities: `User`
- Request DTOs: `CreateUserRequest`, `LoginRequest`
- Response DTOs: `UserResponse`, `LoginResponse`
- Mappers: `UserMapper`
- Exceptions: `UserNotFoundException`, `InvalidCredentialsException`

Do not create vague names such as `Manager`, `Helper`, `Utils`, or `CommonService` unless there is a clear reason.

---

## Controller Rules

Controllers must:

- Accept request DTOs.
- Return response DTOs or standard API response wrappers.
- Use `@Valid` for validated request bodies.
- Delegate business logic to services.
- Not contain business rules.
- Not access repositories directly.
- Not return entities directly.

Example:

```java
@PostMapping
public ResponseEntity<ApiResponse<UserResponse>> createUser(
        @Valid @RequestBody CreateUserRequest request
) {
    UserResponse response = userService.createUser(request);
    return ResponseEntity.ok(ApiResponse.success("User created", response));
}
```

---

## Service Rules

Services must:

- Contain business logic.
- Own transaction boundaries.
- Validate business rules.
- Throw custom exceptions for business errors.
- Return DTOs or domain results, not controller-specific objects.

Use:

```java
@Transactional
```

for write operations.

Use:

```java
@Transactional(readOnly = true)
```

for read-only operations.

Do not put `@Transactional` on controllers.

---

## Repository Rules

Repositories must:

- Extend Spring Data JPA repositories when using JPA.
- Contain persistence queries only.
- Not contain business logic.
- Not return DTOs unless there is a specific projection use case.

---

## DTO Rules

Use DTOs for all API input and output.

Request DTOs should contain validation annotations when possible:

```java
@NotBlank
@Email
@Size(min = 8, max = 100)
```

Do not expose internal entity fields such as:

- password
- passwordHash
- refreshToken
- secret
- internal flags
- audit-only fields unless required

---

## API Response Rules

Use this success response shape:

```json
{
  "success": true,
  "message": "OK",
  "data": {}
}
```

Use this error response shape:

```json
{
  "success": false,
  "message": "Validation failed",
  "errors": []
}
```

Keep response shape consistent across controllers.

---

## Error Handling Rules

Use custom exceptions for business errors.

Use a global exception handler with `@RestControllerAdvice`.

Never expose stack traces, SQL errors, framework internals, or secrets to clients.

Return meaningful HTTP status codes:

- `400 Bad Request` for invalid input
- `401 Unauthorized` for unauthenticated requests
- `403 Forbidden` for unauthorized access
- `404 Not Found` for missing resources
- `409 Conflict` for duplicated or conflicting state
- `500 Internal Server Error` only for unexpected server failures

---

## Security Rules

When authentication is enabled:

- Never store raw passwords.
- Use `PasswordEncoder`.
- Do not expose passwords, password hashes, tokens, or secrets in API responses.
- Keep authentication logic separate from business services when possible.
- Authorization must be enforced on the backend, not only the frontend.
- Use method-level security when appropriate.
- Do not hardcode JWT secrets, API keys, database URLs, or credentials.

Secrets must come from environment variables or external configuration.

---

## Database Rules

When database persistence is enabled:

- Use entities only for persistence.
- Do not return entities directly from controllers.
- Prefer migration tools such as Flyway or Liquibase for schema changes when production readiness matters.
- Do not rely on `ddl-auto=update` for production.
- Use indexes for frequently queried fields when needed.
- Avoid N+1 query problems.

---

## Mapper Rules

Use mapper classes for entity/DTO conversion.

Do not perform large mapping logic inside controllers.

Mapping should be explicit and readable.

---

## Testing Rules

Prioritize tests for:

- service business logic
- validation behavior
- security-sensitive logic
- mapper behavior
- exception handling
- repository queries when custom queries are used

Prefer focused tests over broad, fragile tests.

After modifying backend code, run at least:

```bash
./mvnw -q -DskipTests compile
```

Run full tests when the change affects business logic, validation, security, or persistence:

```bash
./mvnw test
```

---

## Dependency Rules

Do not add new dependencies unless needed.

Before adding a dependency:

- Check whether Spring Boot or the JDK already provides the needed feature.
- Explain why the dependency is necessary.
- Avoid libraries that are unmaintained or excessive for the task.

---

## Do Not Do

- Do not put business logic in controllers.
- Do not return database entities directly from API controllers.
- Do not hardcode credentials, tokens, URLs, or secrets.
- Do not ignore failing tests.
- Do not silence errors without explaining why.
- Do not create abstractions without clear reuse.
- Do not rewrite unrelated files.
- Do not change public API behavior without updating docs or tests.