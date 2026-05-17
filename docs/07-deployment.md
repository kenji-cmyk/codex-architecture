# Deployment

No concrete deployment target is present yet. Use this document as the deployment checklist when infra files are added.

## Environment Separation

- Keep local, test, staging, and production config separate.
- Use real secrets only through environment variables or secret stores.
- Keep `.env.example` safe and complete.
- Do not commit real `.env` files.

## Required Variables

Document variables here as they are introduced:

```txt
DATABASE_URL=<placeholder>
JWT_SECRET=<placeholder>
FRONTEND_ORIGIN=<placeholder>
```

These are placeholders, not confirmed current requirements.

## Docker And Compose

- Run `docker compose config` after Compose changes.
- Add health checks for backend, database, and other dependent services.
- Avoid exposing internal services publicly.
- Use production-safe image settings before deploying.

## Release Checklist

1. Backend tests pass.
2. Frontend lint and build pass.
3. Database migrations are reviewed.
4. Required environment variables are documented.
5. Secrets are configured outside the repository.
6. Rollback steps are known.
