# API Conventions

## Response Shape

Use one stable response envelope for JSON APIs.

Success:

```json
{
  "success": true,
  "message": "User created",
  "data": {}
}
```

Error:

```json
{
  "success": false,
  "message": "Validation failed",
  "errors": [
    {
      "field": "email",
      "message": "must be a well-formed email address"
    }
  ]
}
```

## HTTP Status Codes

- `200 OK`: successful read or update.
- `201 Created`: successful creation.
- `204 No Content`: successful deletion with no body.
- `400 Bad Request`: invalid syntax or validation failure.
- `401 Unauthorized`: authentication is missing or invalid.
- `403 Forbidden`: authenticated user lacks permission.
- `404 Not Found`: resource does not exist.
- `409 Conflict`: duplicate or conflicting state.
- `500 Internal Server Error`: unexpected server failure.

## DTO Rules

- Request DTOs describe client input.
- Response DTOs describe safe client output.
- Do not expose password hashes, tokens, secrets, internal flags, or implementation-only fields.
- Prefer ISO-8601 strings for dates and times in JSON.

## Error Rules

- Return safe, actionable messages.
- Log internal details server-side only.
- Do not expose stack traces, SQL errors, framework internals, or secrets.
