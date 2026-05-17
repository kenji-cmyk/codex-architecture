# Write Test Skill

## When To Use

Use when adding or improving backend or frontend tests.

## Inputs To Inspect

- Existing tests in the same module.
- The code under test and its callers.
- `docs/06-testing.md`
- Relevant module `AGENTS.md`.

## Workflow

1. Identify the behavior and risk to cover.
2. Match existing test framework and naming.
3. Prefer focused behavior tests over snapshots or brittle implementation tests.
4. Cover success and important failure paths.
5. Run the narrow test first, then relevant module validation.

## Checks Before Editing

- Test data contains no real secrets or personal data.
- The test would fail for the bug or missing behavior.
- The assertion checks behavior, not incidental implementation.

## Validation Commands

```bash
./scripts/test-all.sh
```

## Definition Of Done

- Test is readable and deterministic.
- It covers meaningful behavior.
- Relevant validation passes or blockers are explained.

## Common Mistakes To Avoid

- Snapshotting large output by default.
- Testing private implementation details.
- Adding sleeps or network-dependent tests.
