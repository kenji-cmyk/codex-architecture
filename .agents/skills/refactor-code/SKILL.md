# Refactor Code Skill

## When To Use

Use for cleanup that should preserve behavior. For larger refactors, also follow `.agents/skills/refactor-safely/SKILL.md`.

## Inputs To Inspect

- Current tests.
- Callers of changed code.
- `docs/01-architecture.md`
- `docs/02-coding-conventions.md`

## Workflow

1. Define the behavior that must not change.
2. Choose a narrow refactor boundary.
3. Prefer renames, extraction, or duplication removal over architecture churn.
4. Keep public contracts stable unless requested.
5. Run relevant tests.

## Checks Before Editing

- Refactor has a clear readability or maintainability benefit.
- No unrelated formatting churn.
- No dependency changes.

## Validation Commands

```bash
./scripts/test-all.sh
```

## Definition Of Done

- Behavior is unchanged.
- Tests pass or gaps are explained.
- Code is simpler and still follows local patterns.

## Common Mistakes To Avoid

- Combining refactor with feature work.
- Creating abstractions for one caller.
- Moving files without need.
