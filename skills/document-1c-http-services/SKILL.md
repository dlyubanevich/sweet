---
name: document-1c-http-services
description: Generate OpenAPI for 1C configurations and create, check, format, or update documenting comments for 1C HTTP-service handlers.
---

# Document 1C HTTP services

Use `sweet-cli` 1.1.0 or newer. If it is unavailable, read [references/installation.md](references/installation.md).

Choose the workflow from the user's requested outcome:

- Generate the complete configuration specification with `auto` when a settings JSON already exists, or `manual` when the arguments should be supplied directly.
- Read [references/comment-language.md](references/comment-language.md) before creating or changing a documenting comment.
- Use `check` to validate one operation and its shared object descriptions.
- Use `format` only after `check` succeeds. Read [references/examples.md](references/examples.md) for command inputs and worked comments.

## Generate a configuration specification

For a settings file:

```console
sweet-cli auto settings.json
```

The settings object accepts `input`, `servers`, `title`, `description`, `api`, `output`, and optional `urls.include` or `urls.exclude`. `input` points to an EDT configuration source directory or a Configurator XML export.

Without a settings file:

```console
sweet-cli manual --input ./configuration --servers http://localhost/hs \
  --title "Service API" --description "HTTP services" --api 1.0 \
  --output ./openapi.json
```

Use `--urls-include Service/Template` or `--urls-exclude Service/Template` when the user requests filtering. Inspect both the generated OpenAPI and CLI diagnostics: legacy `auto` and `manual` may exit successfully while reporting a parsing failure in their messages.

## Check or format one operation

Determine the target handler and HTTP method from the 1C module and HTTP-service metadata. Create one UTF-8 JSON object with string fields `method` and `comment`. Include the module's current `Описание объектов` block in `comment` when the operation refers to named objects.

```console
sweet-cli check < request.json
sweet-cli format < request.json
```

`check` writes only JSON to stdout:

- `spec` is an OpenAPI JSON string, or `null` when generation could not start.
- `messages` is diagnostic text.
- `errors` is an array. Treat only exit code 0 with an empty array as success.

`format` writes only the formatted comment to stdout. On failure it returns a nonzero code, writes diagnostics to stderr, and leaves stdout empty. Capture stdout before changing source code; never redirect it over the module being read.

## Update a handler comment

1. Read the complete module. Preserve documentation unrelated to the requested change.
2. Keep one `Описание объектов` block for the module. Merge changed named types into that block once.
3. Keep the operation description immediately before its target handler. Do not treat it as the HTTP-service description.
4. Check the candidate comment together with the shared object block, then format it and check the formatted result again.
5. Replace only the shared definitions and target operation that changed. Replace all existing documentation only when the user explicitly requests it.
6. Generate OpenAPI from the full configuration with `auto` or `manual` when configuration-level validation is required. A successful single-operation check uses synthetic metadata and does not validate the real route or the rest of the configuration.

The CLI returns text and diagnostics; editing the BSL module remains the agent's responsibility.
