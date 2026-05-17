# Architecture

## High-Level Shape

The intended system has three main areas:

- Backend API in `backend/`, implemented with Spring Boot.
- Frontend web app in `frontend/`, implemented with React.
- Infrastructure in `infra/`, implemented with Docker, Compose, and deployment config as needed.

No production application source is present yet, so this document defines the target boundaries future code should follow.

## Backend Layers

Use a conventional layered Spring Boot structure unless an existing module establishes another pattern:

```txt
controller -> service -> repository -> database
          \-> dto
          \-> mapper
          \-> exception
          \-> security
```

- Controllers handle HTTP concerns only.
- Services hold business rules and transaction boundaries.
- Repositories hold persistence queries only.
- DTOs define API input and output.
- Mappers convert between entities and DTOs.
- Exception handlers translate failures to stable API responses.
- Security code handles authentication, authorization, tokens, and principals.

## Frontend Boundaries

React code should keep concerns separated:

- Pages compose routes, data loading, and feature components.
- Components render UI and emit events.
- Hooks share stateful UI or data-loading behavior.
- API clients own HTTP details and response typing.
- Utilities contain pure helpers only.

## Data Flow

1. The frontend calls typed API client functions.
2. The backend controller validates request DTOs.
3. The service applies business rules inside the correct transaction.
4. The repository performs persistence operations.
5. The controller returns a standard API response DTO.
6. The frontend maps success, error, loading, and empty states into UI.

## Cross-Cutting Concerns

- Auth and authorization must be enforced by the backend.
- Validation belongs on both the frontend and backend; backend validation is authoritative.
- Secrets must come from environment variables or secret stores.
- Database schema changes should be migration-based before production use.
