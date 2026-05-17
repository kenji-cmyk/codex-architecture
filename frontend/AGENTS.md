# Frontend Agent Instructions

## Scope

This directory contains the React frontend. Keep UI changes focused, accessible, and consistent with existing project patterns.

## Expected Stack

- React with TypeScript when available.
- npm scripts for linting and builds.
- A shared API client layer for backend calls.
- Component, hook, and utility modules organized by feature when the app grows.

If the actual stack differs, follow the existing code first and update this file.

## Component Structure

- Prefer small components with clear props.
- Keep page components responsible for composition and data loading.
- Keep reusable UI components presentation-focused.
- Do not put API calls, routing decisions, and complex business rules in low-level presentational components.
- Use explicit prop types and avoid `any` unless integrating unknown external data.

Suggested layout when no stronger pattern exists:

```txt
src/
  api/
  components/
  features/
  hooks/
  pages/
  routes/
  styles/
  types/
  utils/
```

## Hooks Rules

- Name custom hooks with `use`.
- Keep hooks focused on one concern.
- Do not call hooks conditionally.
- Put reusable data-loading or stateful behavior in hooks instead of duplicating it across components.
- Keep side effects in `useEffect` narrow and dependency arrays accurate.

## API Client Rules

- Centralize HTTP calls in `src/api/` or the existing client module.
- Do not scatter raw `fetch` or HTTP client calls through components.
- Map backend errors to user-safe messages.
- Keep request and response types close to the client function that uses them.
- Never expose tokens or secrets through logs, UI text, or committed config.

## State Management

- Use local component state for local UI concerns.
- Lift state only when multiple components need it.
- Introduce global state only when the need is clear.
- Keep server state separate from purely local UI state when practical.

## Forms

- Validate required fields and formats before submit.
- Display field-level validation errors when possible.
- Disable or guard duplicate submissions.
- Preserve user input after recoverable errors.
- Do not trust frontend validation as the only validation.

## Styling

- Follow existing styling conventions first.
- Keep styles close to components unless the project uses global design tokens.
- Use semantic HTML and accessible labels.
- Provide loading, error, empty, disabled, and success states for user workflows.
- Avoid visual rewrites unrelated to the requested task.

## Testing

Prioritize tests for:

- User-facing workflows.
- Data formatting and validation.
- Error, loading, and empty states.
- Components with non-trivial branching.

Prefer tests that exercise behavior over snapshots.

## Validation Commands

Run from `frontend/` when the project files exist:

```bash
npm run lint
npm run build
```

On Windows PowerShell:

```powershell
npm run lint
npm run build
```

If `package.json` is not present yet, state that frontend validation is not available.
