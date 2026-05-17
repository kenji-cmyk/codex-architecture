# Debug Bug Skill

## When To Use

Use for behavior bugs that may or may not break the build.

## Inputs To Inspect

- Reproduction steps.
- Expected and actual behavior.
- Relevant logs, tests, routes, and recent changes.
- Module-specific `AGENTS.md`.

## Workflow

1. Reproduce or reason from the smallest reliable signal.
2. Locate the boundary where expected behavior diverges.
3. Add or update a focused failing test when practical.
4. Fix the root cause with the smallest change.
5. Run the failing test or validation command.
6. Note any remaining risk.

## Checks Before Editing

- Confirm the bug is not expected behavior from docs.
- Avoid broad rewrites while debugging.
- Preserve unrelated user changes.

## Validation Commands

```bash
./scripts/test-all.sh
```

## Definition Of Done

- The bug is fixed or clearly isolated.
- Validation was run or the blocker is explained.
- The explanation includes the cause, not only the changed file.

## Common Mistakes To Avoid

- Fixing the symptom only.
- Removing validation to make a bug disappear.
- Ignoring edge cases around auth, nulls, and errors.
