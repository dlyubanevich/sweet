# Examples

Create a UTF-8 `request.json` for one operation:

```json
{
  "method": "POST",
  "comment": "// Описание объектов:\n//   Error - Структура {\n//     * message - Строка - Описание ошибки\n//   }\n//\n// Описание:\n//   Создаёт элемент.\n// Тело запроса:\n//   Обязательный - Данные элемента\n//   json - Структура {\n//     * name (Обязательный) - Строка(Минимум: 1)\n//   }\n// Возвращаемые ответы:\n//   201 - json - Строка - Идентификатор созданного элемента\n//   400 - json - Объект(Error) - Некорректный запрос\n"
}
```

Check it and inspect the exit code plus `errors`:

```console
sweet-cli check < request.json
```

Format only after the check succeeds. Write to a separate file:

```console
sweet-cli format < request.json > formatted-comment.bsl
```

Put the formatted `Описание объектов` definitions into the module's existing shared block. Put only the formatted operation sections immediately before the target handler. Preserve other named types, handler comments, regions, and code.

For a concrete partial update, compare [examples/module-before.bsl](examples/module-before.bsl) with [examples/module-after.bsl](examples/module-after.bsl). The update adds one property to the single shared `Error` definition and changes only `GetItem`; `Health` and its documentation remain intact.

For an invalid response such as this:

```bsl
// Возвращаемые ответы:
//   not-a-status - json - Строка
```

`check` returns a nonzero code and a nonempty `errors` array even when it can still return a partial OpenAPI string. Fix the reported section and run `check` again; do not treat the presence of `spec` as success.

After inserting the comment, create the full configuration specification to verify real routes and all handlers:

```console
sweet-cli auto settings.json
```

or:

```console
sweet-cli manual --input ./configuration --servers http://localhost/hs \
  --title "Service API" --api 1.0 --output ./openapi.json
```
