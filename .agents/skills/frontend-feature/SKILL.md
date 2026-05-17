# Frontend Feature Skill

## When To Use

Use for React UI features, pages, components, hooks, forms, API client changes, and user-facing state handling.

## Inputs To Inspect

- `AGENTS.md`
- `frontend/AGENTS.md`
- `docs/02-coding-conventions.md`
- `docs/03-api-conventions.md`
- Existing pages, components, hooks, API clients, routes, and tests.

## Workflow

1. Find the existing feature or page boundary.
2. Identify data needs and API client changes.
3. Build or update typed API functions outside components.
4. Implement UI with loading, error, empty, disabled, and success states.
5. Keep reusable behavior in hooks when repeated.
6. Add or update focused component tests when available.
7. Run lint and build.

## Checks Before Editing

- Confirm the styling approach already used by the app.
- Confirm frontend validation does not replace backend validation.
- Confirm no secrets or tokens are logged or rendered.
- Confirm accessibility labels and keyboard behavior.

## Validation Commands

```bash
cd frontend
npm run lint
npm run build
```

## Definition Of Done

- UI works for success and failure paths.
- Types are explicit.
- Lint and build pass.
- Tests are added or skipped with a reason.

## Common Mistakes To Avoid

- Raw API calls scattered in components.
- Missing loading or error states.
- Overusing global state.
- Using `any` instead of typed boundaries.
- Large visual rewrites unrelated to the task.
