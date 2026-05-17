# Backend Feature Skill

## When To Use

Use for new or changed Spring Boot API behavior, service logic, validation, persistence, or security-sensitive backend work.

## Inputs To Inspect

- `AGENTS.md`
- `backend/AGENTS.md`
- `docs/01-architecture.md`
- `docs/03-api-conventions.md`
- Existing controller, service, repository, DTO, mapper, exception, and test files.

## Workflow

1. Identify the feature boundary and affected API endpoints.
2. Check existing package structure and naming.
3. Define or update request and response DTOs.
4. Add controller code for HTTP concerns only.
5. Add service logic and transaction boundaries.
6. Add repository or mapper changes only if needed.
7. Add exception handling for expected failures.
8. Add or update focused tests.
9. Update docs if API, auth, database, or architecture changed.

## Checks Before Editing

- Confirm no controller returns entities.
- Confirm secrets or credentials are not needed in source.
- Confirm no new dependency is required.
- Confirm validation and error response shape.

## Validation Commands

```bash
cd backend
./mvnw -DskipTests compile
./mvnw test
```

## Definition Of Done

- Backend compiles.
- Relevant tests pass.
- API response shape is consistent.
- Docs and examples are updated when behavior changes.

## Common Mistakes To Avoid

- Business logic in controllers.
- Missing `@Valid` on request bodies.
- Transactions on controllers.
- Returning entities or sensitive fields.
- Swallowing exceptions without safe responses.
