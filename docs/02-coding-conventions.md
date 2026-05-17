# Coding Conventions

## General

- Prefer clear names over clever names.
- Keep changes focused on the requested behavior.
- Match existing style before introducing a new pattern.
- Avoid new dependencies unless they clearly reduce risk or complexity.
- Keep comments rare and useful; explain why, not what.

## Java And Spring

- Use package names that reflect feature and layer boundaries.
- Use DTOs for API input and output.
- Do not return JPA entities from controllers.
- Keep controller methods thin and service methods meaningful.
- Use constructor injection.
- Use `@Transactional` on service methods, not controllers.
- Use validation annotations on request DTOs.

## TypeScript And React

- Prefer TypeScript types and interfaces over implicit object shapes.
- Avoid `any`; use `unknown` at external boundaries and narrow it.
- Keep components small enough to understand without scrolling through unrelated logic.
- Use custom hooks for shared behavior.
- Centralize API calls.

## Markdown And Docs

- Keep docs practical and short.
- Use examples when they clarify a convention.
- Update docs when changing API shape, auth behavior, database schema, deployment, or architecture.

## Scripts

- Scripts should fail fast.
- Print clear module names before running checks.
- Skip missing modules gracefully only when the repository truly does not contain that module yet.
