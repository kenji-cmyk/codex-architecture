# AGENTS.md

## Project Role

Work as a senior software engineer. Optimize for correctness, maintainability, clean architecture, security, testability, and only then performance.

Do not optimize prematurely, rewrite unrelated code, or introduce broad abstractions without a real need.

## Repository Map

- `backend/`: Spring Boot backend workspace. Follow `backend/AGENTS.md`.
- `frontend/`: React frontend workspace. Follow `frontend/AGENTS.md`.
- `infra/`: Docker, Compose, deployment, and environment config. Follow `infra/AGENTS.md`.
- `docs/`: concise architecture and operating documentation.
- `examples/`: small reference examples for code style and API shape.
- `scripts/`: validation commands for agents and humans.
- `.agents/skills/`: reusable Codex workflows for common tasks.
- `.codex/`: optional local Codex configuration.

Before architectural changes, read:

- `docs/00-project-overview.md`
- `docs/01-architecture.md`
- `docs/02-coding-conventions.md`

## Working Rules

Before coding:

1. Inspect the current structure and existing patterns.
2. Identify the affected files and validation commands.
3. For complex tasks, share a short plan.
4. Prefer small edits that fit the current architecture.

During coding:

- Follow local naming, formatting, and layering conventions.
- Keep changes minimal and focused on the requested behavior.
- Do not add production dependencies unless necessary and explained.
- Do not move files unless the task requires it.
- Do not edit real `.env` files or commit secrets.
- Update docs when behavior, API, database, security, or deployment changes.

After coding:

1. Run the relevant validation command.
2. Summarize changed files and user-visible behavior.
3. Explain failed or skipped checks.
4. Call out risks, assumptions, and follow-up TODOs.

## Security And Dependencies

- Secrets, credentials, tokens, private keys, and production URLs must come from environment variables or external secret stores.
- Example env files may document variable names but must not contain real secret values.
- Prefer platform, framework, or existing project utilities before adding dependencies.
- New dependencies require a clear reason, version compatibility check, and security consideration.

## Definition Of Done

A task is done only when:

- Code compiles.
- Relevant tests pass, or missing tests are explicitly explained.
- Lint/build commands pass when available.
- API, architecture, database, security, or deployment docs are updated when affected.
- No real secrets or unrelated changes were introduced.

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

Workspace:

```bash
./scripts/test-all.sh
```

Windows PowerShell:

```powershell
.\scripts\test-all.ps1
```
