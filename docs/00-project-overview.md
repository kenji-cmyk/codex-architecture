# Project Overview

This repository is prepared as a long-term Codex workspace for a Java Spring Boot backend, a React frontend, and deployment support under `infra/`.

## Current Status

- `backend/` currently contains workspace instructions but no visible application source.
- `frontend/` currently contains workspace instructions but no visible application source.
- `infra/` currently contains workspace instructions but no visible deployment files.
- `docs/`, `examples/`, `scripts/`, and `.agents/skills/` provide the working environment Codex should use before adding application code.

Update this document when the product domain, runtime services, or deployment target becomes concrete.

## Primary Goals

- Keep backend, frontend, and infra responsibilities separate.
- Make future code changes easy to validate.
- Preserve security defaults around secrets, auth, and data exposure.
- Favor clear examples and repeatable scripts over long agent prompts.

## Repository Entry Points

- Start with `AGENTS.md` for repository-wide rules.
- Use `backend/AGENTS.md` for Spring Boot work.
- Use `frontend/AGENTS.md` for React work.
- Use `infra/AGENTS.md` for Docker and deployment work.
- Use `.agents/skills/` for repeatable workflows.

## Validation

Use `scripts/test-all.sh` or `scripts/test-all.ps1` once backend and frontend project files exist. The scripts are designed to skip missing modules with a clear message.
