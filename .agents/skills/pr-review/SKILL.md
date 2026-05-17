# PR Review Skill

## When To Use

Use when reviewing a branch, diff, patch, or pull request.

## Inputs To Inspect

- The diff or changed files.
- Relevant tests and validation output.
- `AGENTS.md` and module-specific instructions.
- Docs for changed API, database, auth, or deployment behavior.

## Workflow

1. Identify the intent of the change.
2. Review changed behavior first, formatting last.
3. Look for correctness, security, data loss, API compatibility, and missing tests.
4. Verify docs are updated when contracts or operations changed.
5. Provide findings ordered by severity with file and line references.
6. Include open questions and residual risk.

## Checks Before Commenting

- Confirm the issue is real from the diff or code.
- Avoid comments about unchanged surrounding code unless it affects the change.
- Avoid style-only feedback unless it blocks maintainability.

## Validation Commands

Use the relevant command from the changed module:

```bash
./scripts/test-all.sh
```

## Definition Of Done

- Findings are actionable and prioritized.
- No speculative issues are presented as facts.
- Test gaps and assumptions are explicit.

## Common Mistakes To Avoid

- Summarizing before listing serious findings.
- Requesting broad rewrites for narrow issues.
- Missing auth, validation, migration, or secret-handling risks.
