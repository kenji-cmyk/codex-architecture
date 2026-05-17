# Testing

## Backend

Prioritize tests for:

- Service business rules.
- Request validation.
- Exception handling and response shape.
- Security-sensitive behavior.
- Mapper behavior.
- Custom repository queries.

Use focused tests first. Add broader integration tests for cross-layer behavior.

## Frontend

Prioritize tests for:

- User workflows.
- Form validation.
- Error, loading, and empty states.
- Data formatting.
- Components with non-trivial branching.

Prefer behavior assertions over snapshots.

## Validation Commands

Backend:

```bash
cd backend
./mvnw -DskipTests compile
./mvnw test
```

Frontend:

```bash
cd frontend
npm run lint
npm run build
```

All:

```bash
./scripts/test-all.sh
```

Windows:

```powershell
.\scripts\test-all.ps1
```

If a module has not been scaffolded yet, validation scripts should say so and continue.
