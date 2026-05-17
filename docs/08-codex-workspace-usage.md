# How to Reuse a Codex Workspace Structure

This document explains how to reuse your Codex workspace setup after it has been created, so you do not need to write the same setup prompt again for every new project.

---

## 1. Purpose

After setup, your repository should look similar to this:

```txt
project-root/
  AGENTS.md
  backend/
    AGENTS.md
  frontend/
    AGENTS.md
  infra/
    AGENTS.md
  docs/
    00-project-overview.md
    01-architecture.md
    02-coding-conventions.md
    03-api-conventions.md
    04-database.md
    05-auth-security.md
    06-testing.md
    07-deployment.md
  examples/
    good-api-response.json
    good-controller.java
    good-service.java
    good-dto.java
    good-exception-handler.java
    good-react-component.tsx
    good-api-client.ts
  scripts/
    test-backend.sh
    test-frontend.sh
    test-all.sh
    test-backend.ps1
    test-frontend.ps1
    test-all.ps1
  .agents/
    skills/
      create-backend-module/
        SKILL.md
      create-frontend-feature/
        SKILL.md
      debug-bug/
        SKILL.md
      refactor-code/
        SKILL.md
      write-tests/
        SKILL.md
  .codex/
    config.toml
```

The main idea:

```txt
AGENTS.md                  = global rules that always apply
backend/AGENTS.md          = backend-specific rules
frontend/AGENTS.md         = frontend-specific rules
infra/AGENTS.md            = infrastructure and deployment rules
docs/                      = longer project documentation for Codex to inspect when needed
examples/                  = reference code that Codex can imitate
scripts/                   = real validation commands
.agents/skills/            = reusable workflows for repeated tasks
.codex/config.toml         = optional Codex configuration
```

---

## 2. How to Reuse This Setup Without Prompting Again

There are three recommended ways to reuse this structure.

---

## Option 1: Create a Template Repository

This is the recommended approach.

Create a separate repository, for example:

```txt
codex-workspace-template
```

This repository should contain only the reusable Codex workspace files:

```txt
AGENTS.md
backend/AGENTS.md
frontend/AGENTS.md
infra/AGENTS.md
docs/
examples/
scripts/
.agents/skills/
.codex/config.toml
```

When starting a new project, clone the template:

```bash
git clone https://github.com/<your-username>/codex-workspace-template.git my-new-project
cd my-new-project
rm -rf .git
git init
```

Then add your real application source code into:

```txt
backend/
frontend/
infra/
```

Benefits:

- You do not need to rewrite the setup prompt.
- The template can be updated once and reused across many projects.
- It is version-controlled.
- It works well for Spring Boot + React projects.

---

## Option 2: Use a GitHub Template Repository

If you use GitHub, you can mark your `codex-workspace-template` repository as a template.

On GitHub:

```txt
Repository Settings
→ General
→ Template repository
→ Enable
```

When creating a new project:

```txt
Use this template
→ Create a new repository
```

Benefits:

- No manual cloning cleanup.
- Faster project creation.
- The Codex workspace structure is preserved automatically.

---

## Option 3: Copy the Workspace Into an Existing Project

If you already have a project, copy these files and folders into the project root:

```txt
AGENTS.md
docs/
examples/
scripts/
.agents/
.codex/
```

If the project has backend, frontend, or infrastructure folders, also copy:

```txt
backend/AGENTS.md
frontend/AGENTS.md
infra/AGENTS.md
```

After copying, update these files to match the real project:

```txt
docs/00-project-overview.md
docs/01-architecture.md
docs/03-api-conventions.md
docs/04-database.md
docs/05-auth-security.md
docs/07-deployment.md
```

Avoid leaving the documentation too generic. Codex works better when the docs describe the real project accurately.

---

## 3. What to Update After Copying to a New Project

Each new project usually requires only a few updates.

### 3.1. Update the Repository Map

In `AGENTS.md`, update this section:

```md
## Repository Map

- `backend/`: Spring Boot backend
- `frontend/`: React frontend
- `infra/`: Docker, compose, deployment config
- `docs/`: architecture and project documentation
- `.agents/skills/`: reusable Codex workflows
- `examples/`: reference implementations and coding style
- `scripts/`: validation commands
```

If the project does not have a `frontend/` directory, remove the frontend line.

If the project does not have an `infra/` directory, remove the infra line.

---

### 3.2. Update the Actual Tech Stack

In `backend/AGENTS.md`, update the backend stack.

Example:

```md
## Backend Stack

- Java 21
- Spring Boot 3
- Spring Web
- Spring Security
- Spring Data JPA
- PostgreSQL
- Maven
```

In `frontend/AGENTS.md`, update the frontend stack.

Example:

```md
## Frontend Stack

- React
- TypeScript
- Vite
- Tailwind CSS
- React Router
- Axios
```

Do not list technologies that the project does not use.

---

### 3.3. Update Validation Commands

In `AGENTS.md`, make sure the commands match the real project.

Backend with Maven:

```bash
cd backend
./mvnw test
./mvnw -DskipTests compile
```

Windows PowerShell:

```powershell
cd backend
.\mvnw.cmd test
.\mvnw.cmd -DskipTests compile
```

Frontend:

```bash
cd frontend
npm run lint
npm run build
```

Full check:

```bash
./scripts/test-all.sh
```

Windows:

```powershell
.\scripts\test-all.ps1
```

Important: validation commands in `AGENTS.md` must actually work. If the commands are wrong, Codex will validate the project incorrectly.

---

### 3.4. Update Docs for the Real Project

At minimum, update:

```txt
docs/00-project-overview.md
docs/01-architecture.md
docs/03-api-conventions.md
docs/04-database.md
docs/05-auth-security.md
```

The documentation does not need to be long. It only needs to help Codex understand:

```txt
What does this project do?
Which backend modules exist?
Which frontend pages exist?
Which database is used?
How does authentication work?
What is the API response format?
What coding style should be followed?
```

---

## 4. How to Use This Structure When Coding

You do not need to repeat all rules in every prompt.

Open Codex from the repository root:

```bash
cd my-project
codex
```

Or open the repository in VS Code and use the Codex panel.

Codex can then use instructions from:

```txt
AGENTS.md
backend/AGENTS.md
frontend/AGENTS.md
infra/AGENTS.md
.agents/skills/*/SKILL.md
docs/
examples/
```

Depending on the task, Codex should apply the relevant rules.

---

## 5. Backend Coding Prompts

Instead of writing a long prompt like:

```txt
Create a controller, service, repository, DTO, and entity using clean architecture...
```

Use a shorter prompt:

```txt
Create a backend module for Product with CRUD APIs.
Use the existing backend architecture and validation rules.
```

Or be more explicit:

```txt
Use the create-backend-module skill.

Create a Product module with:
- name
- description
- price
- stockQuantity

Requirements:
- create product
- update product
- get product by id
- list products
- delete product
- validate request DTOs
- return the standard API response shape
- add service tests
```

Codex should rely on:

```txt
backend/AGENTS.md
docs/03-api-conventions.md
docs/04-database.md
examples/good-controller.java
examples/good-service.java
.agents/skills/create-backend-module/SKILL.md
```

---

## 6. Frontend Coding Prompts

Example:

```txt
Use the create-frontend-feature skill.

Create a ProductList page that:
- fetches products from the backend
- shows loading, error, empty, and success states
- displays product name, price, and stock quantity
- follows existing component and API client patterns
```

Codex should rely on:

```txt
frontend/AGENTS.md
examples/good-react-component.tsx
examples/good-api-client.ts
.agents/skills/create-frontend-feature/SKILL.md
```

---

## 7. Debugging Prompts

Example:

```txt
Use the debug-bug skill.

Fix this backend error:

[paste stack trace here]

Find the root cause first, then make the smallest safe fix.
```

Another example:

```txt
Use the debug-bug skill.

The frontend build fails with this error:

[paste error here]

Do not rewrite unrelated files.
```

Codex should follow this workflow:

```txt
1. Read the error.
2. Identify the failing layer.
3. Find the root cause.
4. Make the smallest safe fix.
5. Run the relevant validation command.
6. Report the root cause and changed files.
```

---

## 8. Refactoring Prompts

Example:

```txt
Use the refactor-code skill.

Refactor the UserController because it currently contains business logic.
Move business logic into the service layer.
Preserve existing API behavior.
Run backend validation after changes.
```

Another example:

```txt
Use the refactor-code skill.

Clean up duplicated mapping logic in the order module.
Do not change API response shape.
```

Important principle:

```txt
Preserve behavior first.
Improve code structure second.
Do not change APIs unless explicitly required.
```

---

## 9. Testing Prompts

Example:

```txt
Use the write-tests skill.

Add tests for UserService login behavior:
- successful login
- wrong password
- user not found
- disabled account
```

Another example:

```txt
Use the write-tests skill.

Add validation tests for CreateProductRequest.
Follow existing test style.
```

---

## 10. Do You Need to Mention the Skill Name?

Not always, but it is recommended for important tasks.

There are two ways to use skills.

### Natural Prompt

```txt
Create a new backend module for Product.
```

Codex may choose the appropriate skill if the skill description is clear.

### Explicit Prompt

```txt
Use the create-backend-module skill.
Create a new backend module for Product.
```

The explicit approach is more reliable, especially when you want Codex to follow a checklist.

Use explicit skill prompts for:

```txt
- creating a new backend module
- creating a new frontend feature
- debugging difficult errors
- larger refactors
- writing tests
- reviewing pull requests
```

---

## 11. Daily Prompt Templates

### Backend Feature

```txt
Use the create-backend-module skill.

Create [module name] with [requirements].
Follow backend/AGENTS.md and existing project patterns.
Run backend validation commands.
```

### Frontend Feature

```txt
Use the create-frontend-feature skill.

Create [page/component/feature] with [requirements].
Follow frontend/AGENTS.md and existing project patterns.
Run frontend validation commands.
```

### Debugging

```txt
Use the debug-bug skill.

Fix this error:
[paste error]

Find the root cause first.
Make the smallest safe fix.
Run relevant validation.
```

### Refactoring

```txt
Use the refactor-code skill.

Refactor [target] to improve [reason].
Preserve existing behavior.
Do not change API contracts unless necessary.
Run validation.
```

### Testing

```txt
Use the write-tests skill.

Add tests for [target behavior].
Follow existing test style.
Run relevant tests.
```

---

## 12. When to Update AGENTS.md

Update `AGENTS.md` when the repository has a long-term workflow or architecture change.

Examples:

```txt
- backend or frontend stack changes
- API response shape changes
- folder structure changes
- validation commands change
- security rules change
- naming conventions change
- Docker or deployment workflow changes
```

Do not update `AGENTS.md` for one-off tasks or temporary rules.

---

## 13. When to Update a Skill

Update a skill when the same workflow problem happens repeatedly.

Examples:

```txt
- backend modules are often missing mappers
- frontend features often forget empty states
- debugging tasks often modify too many files
- tests are too focused on implementation details
```

Update the relevant file:

```txt
.agents/skills/create-backend-module/SKILL.md
.agents/skills/create-frontend-feature/SKILL.md
.agents/skills/debug-bug/SKILL.md
.agents/skills/refactor-code/SKILL.md
.agents/skills/write-tests/SKILL.md
```

---

## 14. When to Update Examples

Update `examples/` when you have a high-quality code sample that Codex should imitate.

Examples:

```txt
examples/good-controller.java
examples/good-service.java
examples/good-react-component.tsx
examples/good-api-client.ts
```

Examples should be:

```txt
- short
- aligned with the project style
- production-like
- free of unnecessary business complexity
- free of secrets
- not outdated
```

Do not make examples too long. Codex needs clear reference patterns, not a mini-project.

---

## 15. When to Update Docs

Update `docs/` when the meaning or behavior of the system changes.

Examples:

```txt
docs/00-project-overview.md       = what the project does
docs/01-architecture.md           = system architecture
docs/02-coding-conventions.md     = code conventions
docs/03-api-conventions.md        = API rules
docs/04-database.md               = schema, entities, migrations
docs/05-auth-security.md          = authentication, roles, permissions
docs/06-testing.md                = testing strategy
docs/07-deployment.md             = deployment, environment variables, Docker
```

Small bug fixes usually do not require documentation updates.

API, database, authentication, deployment, or architecture changes usually do require documentation updates.

---

## 16. Keep the Template Clean

Maintain a separate repository:

```txt
codex-workspace-template
```

Whenever you improve rules, skills, docs, examples, or scripts, update that template repository.

Then copy the improved files into real projects when needed.

Recommended improvement loop:

```txt
1. Notice a repeated Codex mistake.
2. Identify the cause: missing rule, missing example, missing script, or missing documentation.
3. Update the template.
4. Copy the update into the real project.
5. Reuse it in future projects.
```

---

## 17. What Not to Do

Avoid:

```txt
- putting long documentation directly into AGENTS.md
- writing AGENTS.md too generically
- keeping broken validation commands
- keeping outdated examples
- letting docs disagree with real code
- creating too many tiny skills
- adding abstractions only to look clean
- forcing Codex to guess the project stack
- repeating the entire rule set in every prompt
```

A good setup should make your daily prompts shorter, not longer.

---

## 18. Checklist Before Using Codex in a New Project

Before starting real development, check:

```txt
[ ] Root `AGENTS.md` exists.
[ ] `backend/AGENTS.md` matches the backend stack.
[ ] `frontend/AGENTS.md` matches the frontend stack, if a frontend exists.
[ ] `infra/AGENTS.md` matches the infrastructure setup, if infra exists.
[ ] `.agents/skills/*/SKILL.md` files exist.
[ ] `docs/00-project-overview.md` describes the real project.
[ ] `docs/01-architecture.md` describes the real architecture.
[ ] `examples/` contains code samples that match the project style.
[ ] `scripts/` commands actually work.
[ ] Validation commands in `AGENTS.md` work.
[ ] No real secrets are stored in docs, examples, or config files.
```

---

## 19. Recommended Daily Workflow

When working with Codex:

```txt
1. Open the project root.
2. Start Codex.
3. Write a short, specific prompt.
4. Mention the skill name for important tasks.
5. Let Codex inspect the project before editing.
6. Ask Codex to keep changes small and scoped.
7. Ask Codex to run validation commands.
8. Review the diff.
9. Run tests locally again if needed.
10. Commit with Git.
```

Example:

```txt
Use the create-backend-module skill.

Create a Product module with CRUD APIs.
Follow existing backend architecture.
Use DTOs for request/response.
Do not return entities directly.
Add service tests.
Run backend validation commands.
```

---

## 20. Conclusion

After setting up the workspace structure, you do not need to repeat the full rule set in every prompt.

You only need to:

```txt
1. Reuse the template repository.
2. Update docs and AGENTS.md for the real project.
3. Open Codex from the repository root.
4. Write a short task-specific prompt.
5. Mention a skill when the task needs a specific workflow.
```

The correct structure is:

```txt
AGENTS.md       = global rules
docs/           = project knowledge
examples/       = reference code patterns
scripts/        = real validation commands
.agents/skills/ = reusable workflows
prompt          = the specific request for the current task
```

If the setup is correct, your daily prompts can stay short because most of the context already lives inside the repository.
