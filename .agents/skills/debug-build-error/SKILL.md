# Debug Build Error Skill

## When To Use

Use when compile, test, lint, build, or validation scripts fail.

## Inputs To Inspect

- Exact failing command and full error output.
- Recently changed files.
- Relevant `AGENTS.md` files.
- Build config such as `pom.xml`, `package.json`, Dockerfiles, or Compose files.

## Workflow

1. Reproduce the failure with the smallest relevant command.
2. Read the first meaningful error, not only the last line.
3. Identify whether the failure is code, config, dependency, environment, or test data.
4. Inspect only the files involved in the failing path.
5. Make the smallest fix that addresses the root cause.
6. Rerun the failing command.
7. Rerun broader validation if the fix affects shared code.

## Checks Before Editing

- Confirm the failure is not caused by a missing unscaffolded module.
- Confirm dependency installation or network access is actually required.
- Do not hide failures by weakening tests or removing validation.

## Validation Commands

Run the originally failing command first, then:

```bash
./scripts/test-all.sh
```

## Definition Of Done

- The original failure is fixed or clearly explained.
- The fix is minimal.
- No unrelated behavior changed.
- Remaining failures are documented.

## Common Mistakes To Avoid

- Fixing symptoms while ignoring the first error.
- Disabling tests or lint rules without approval.
- Making broad refactors during debugging.
- Assuming dependency versions without checking project files.
