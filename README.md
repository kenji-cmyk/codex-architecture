# Codex Architecture Workspace

This repository is a prepared long-term workspace for Codex-assisted development. It is organized for a Java Spring Boot backend, a React frontend, infrastructure configuration, practical documentation, reference examples, reusable agent skills, and repeatable validation scripts.

The application source code has not been scaffolded yet. The current focus of the repository is to provide a clean operating environment so future backend, frontend, and infra changes are easier to make safely.

## Repository Structure

```txt
backend/          Spring Boot backend workspace and backend agent rules
frontend/         React frontend workspace and frontend agent rules
infra/            Docker, Compose, deployment, and environment guidance
docs/             Architecture, API, database, security, testing, and deployment docs
examples/         Small reference examples for backend and frontend code style
scripts/          Cross-platform validation scripts
.agents/skills/   Reusable Codex workflows for common engineering tasks
.codex/           Minimal repository-local Codex config
```

## Start Here

- Read `AGENTS.md` for repository-wide working rules.
- Read `backend/AGENTS.md` before backend work.
- Read `frontend/AGENTS.md` before frontend work.
- Read `infra/AGENTS.md` before Docker, Compose, or deployment work.
- Read `docs/00-project-overview.md` and `docs/01-architecture.md` before architectural changes.

## Validation

Run all available checks:

```bash
./scripts/test-all.sh
```

On Windows PowerShell:

```powershell
.\scripts\test-all.ps1
```

The scripts skip unscaffolded modules with a clear message. Once backend and frontend projects exist, they will run Maven compile/tests and frontend lint/build checks.

## Workspace Principles

- Keep changes small, focused, and easy to review.
- Prefer existing project patterns over new abstractions.
- Do not commit secrets or edit real `.env` files.
- Do not add dependencies unless they are necessary and explained.
- Update docs when API, architecture, database, security, or deployment behavior changes.
- Run relevant validation before considering work done.

## Current Status

- Backend source: not scaffolded yet.
- Frontend source: not scaffolded yet.
- Infra files: not scaffolded yet.
- Codex workspace docs, examples, skills, and scripts: present.

See `docs/` for the intended architecture and conventions.
