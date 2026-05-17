# Refactor Safely Skill

## When To Use

Use for code cleanup, layering improvements, renames, duplication removal, or architecture alignment without intended behavior changes.

## Inputs To Inspect

- Existing tests around the code.
- Callers of the code being changed.
- `docs/01-architecture.md`
- `docs/02-coding-conventions.md`
- Relevant module `AGENTS.md`.

## Workflow

1. State the behavior that must remain unchanged.
2. Identify the smallest refactor boundary.
3. Check current tests or add characterization tests when risk is high.
4. Refactor in small steps.
5. Keep public APIs stable unless the task requires a change.
6. Run focused tests after each meaningful step when possible.
7. Update docs only if architecture or conventions changed.

## Checks Before Editing

- Confirm the refactor has a clear maintainability benefit.
- Confirm no unrelated formatting churn is included.
- Confirm generated or user-edited files are preserved.

## Validation Commands

```bash
./scripts/test-all.sh
```

## Definition Of Done

- Behavior is unchanged.
- Tests pass or gaps are explained.
- Code is simpler or better aligned with architecture.
- No unrelated files were rewritten.

## Common Mistakes To Avoid

- Combining refactor and feature changes.
- Moving files without updating imports and docs.
- Introducing abstractions with only one use.
- Reformatting entire files unnecessarily.
