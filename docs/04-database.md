# Database

No concrete database engine or schema is present yet. Use these rules when persistence is added.

## JPA Rules

- Entities model persisted state only.
- Controllers must not return entities.
- Use repositories for persistence access.
- Keep business decisions in services, not entities or repositories unless the domain model explicitly requires it.
- Avoid lazy-loading surprises in API serialization by mapping entities to DTOs before returning.

## Transactions

- Put transaction boundaries on service methods.
- Use `@Transactional` for write operations.
- Use `@Transactional(readOnly = true)` for reads.
- Keep transactions as short as practical.

## Schema Management

- Prefer Flyway or Liquibase before production use.
- Do not rely on `ddl-auto=update` for production.
- Document schema changes and rollback considerations.
- Add indexes for fields used in frequent lookup, filtering, or uniqueness checks.

## Safety

- Never drop or rewrite data without explicit approval.
- Do not commit database credentials.
- Use least-privilege database accounts for deployed environments.
