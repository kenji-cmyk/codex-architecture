# Auth And Security

Authentication is not implemented in visible source yet. When it is added, follow these rules.

## Authentication

- Never store raw passwords.
- Use Spring Security `PasswordEncoder` for password hashing.
- Keep auth endpoints and auth services separate from unrelated business services.
- Tokens and credentials must never appear in API responses except when intentionally issuing a token.

## Authorization

- Enforce authorization on the backend.
- Frontend route hiding is user experience only, not security.
- Use method-level or route-level authorization where appropriate.
- Deny by default for protected resources.

## Secrets

- Do not commit real `.env` files.
- Do not hardcode JWT secrets, API keys, passwords, private keys, or production URLs.
- Document variable names with safe placeholders in example config only.

## Logging

- Do not log passwords, tokens, authorization headers, secrets, or full payment/identity data.
- Log enough context to debug failures without exposing sensitive data.

## Web Security

- Validate and sanitize all external input.
- Configure CORS narrowly.
- Use HTTPS in production.
- Keep dependency updates and vulnerability checks part of regular maintenance.
