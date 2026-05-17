# Create Frontend Module Skill

## When To Use

Use when adding a new React feature, page, component group, API client, hook, or form workflow.

## Inputs To Inspect

- `frontend/AGENTS.md`
- `docs/02-coding-conventions.md`
- Existing `src/` feature, component, API, and routing structure.

## Workflow

1. Find the closest existing feature pattern.
2. Define typed props and API types.
3. Put HTTP calls in the API client layer.
4. Build components with loading, error, empty, and success states.
5. Extract hooks only for shared stateful behavior.
6. Add focused tests when the project has a test setup.
7. Run frontend validation.

## Checks Before Editing

- No tokens or secrets are rendered or logged.
- UI states are accessible and user-safe.
- Styling follows the existing app.

## Validation Commands

```bash
cd frontend
npm run lint
npm run build
```

## Definition Of Done

- Feature is typed and usable.
- Lint and build pass.
- Tests are added or skipped with a reason.

## Common Mistakes To Avoid

- Fetching directly inside many components.
- Missing error states.
- Adding global state for local UI.
