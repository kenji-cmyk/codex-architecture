# Create Backend Module Skill

## When To Use

Use when adding a new Spring Boot feature area with controller, DTO, service, repository, mapper, exception, or tests.

## Inputs To Inspect

- `backend/AGENTS.md`
- `docs/01-architecture.md`
- `docs/03-api-conventions.md`
- Existing backend package structure.

## Workflow

1. Confirm the module name and API responsibility.
2. Mirror existing package and naming conventions.
3. Create DTOs before controller methods.
4. Put business logic in services and persistence in repositories.
5. Add mapper and exception classes only when needed.
6. Add focused tests for service rules and validation.
7. Run backend validation.

## Checks Before Editing

- No entity is returned from a controller.
- No secret or credential is introduced.
- No new dependency is required without approval.

## Validation Commands

```bash
cd backend
./mvnw -DskipTests compile
./mvnw test
```

## Definition Of Done

- Module follows backend layering.
- Tests or test-gap explanation are present.
- API docs are updated when contract changes.

## Common Mistakes To Avoid

- Creating generic helpers too early.
- Skipping request validation.
- Mixing HTTP concerns into services.
