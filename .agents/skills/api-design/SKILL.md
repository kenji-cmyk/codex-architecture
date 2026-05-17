# API Design Skill

## When To Use

Use before adding or changing backend endpoints, request/response DTOs, error contracts, or frontend API clients.

## Inputs To Inspect

- `docs/03-api-conventions.md`
- `examples/good-api-response.json`
- Existing controllers and API clients.
- Related frontend screens and backend services.

## Workflow

1. Define the user action and resource.
2. Choose the HTTP method and path.
3. Define request DTO fields and validation.
4. Define response DTO fields and sensitive fields to exclude.
5. Define success and error statuses.
6. Confirm the standard response envelope.
7. Update backend and frontend types together.
8. Update docs when the contract changes.

## Checks Before Editing

- Confirm the endpoint is not duplicating an existing route.
- Confirm status codes match the API convention.
- Confirm errors are safe and useful.
- Confirm auth requirements are explicit.

## Validation Commands

```bash
./scripts/test-backend.sh
./scripts/test-frontend.sh
```

## Definition Of Done

- Contract is documented or discoverable in code.
- Backend DTOs and frontend types agree.
- Validation and error shape are covered.
- Relevant tests pass.

## Common Mistakes To Avoid

- Returning raw entities.
- Exposing password hashes, tokens, or internals.
- Ambiguous endpoint names.
- Inconsistent error response shape.
