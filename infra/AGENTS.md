# Infra Agent Instructions

## Scope

This directory contains Docker, Docker Compose, deployment, and environment configuration.

Infra changes can affect security and production reliability. Keep them small, explicit, and documented.

## Configuration Rules

- Separate local, test, staging, and production configuration.
- Do not commit real `.env` files, credentials, private keys, tokens, certificates, or production secrets.
- Use `.env.example` for variable names and safe placeholder values only.
- Prefer environment variables for runtime configuration.
- Document new variables in `docs/07-deployment.md`.

## Docker Rules

- Keep images reproducible and minimal.
- Do not bake secrets into Dockerfiles, images, or compose files.
- Use non-root users in production images when practical.
- Avoid installing unnecessary packages.
- Pin image versions for production-oriented services when possible.

## Compose Rules

- Use clear service names.
- Use health checks for services that other services depend on.
- Use `depends_on` with health conditions when the Compose version supports it.
- Keep local-only conveniences out of production deployment config.
- Do not expose internal service ports publicly unless needed.

## Deployment Rules

- Prefer zero-downtime and rollback-friendly changes.
- Document manual steps and migration requirements.
- Validate that required environment variables are present.
- Keep production config auditable and boring.

## Database And Migrations

- Do not drop or rewrite persisted data without explicit approval.
- Coordinate schema changes with backend migrations.
- Document backup, rollback, and migration assumptions for risky changes.

## Validation

When infra files exist, use the most specific available command:

```bash
docker compose config
```

If full workspace validation is needed:

```bash
../scripts/test-all.sh
```

On Windows PowerShell:

```powershell
docker compose config
..\scripts\test-all.ps1
```
