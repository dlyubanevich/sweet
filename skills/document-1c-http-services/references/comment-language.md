# Documenting comment language

A documenting comment describes one HTTP operation handled by the 1C function or procedure immediately following it. `Описание объектов` defines named types shared by handlers in the same module.

## Section order

Use sections in this order; omit sections that do not apply:

1. `Описание объектов:` — module-level named types.
2. `Устаревший!`
3. `Описание:` — behavior of this operation.
4. `Параметры URL:`
5. `Параметры запроса:`
6. `Заголовки:`
7. `Тело запроса:`
8. `Возвращаемые ответы:`

Every line remains a 1C `//` comment. Run `format` to obtain canonical indentation and full media-type names.

## Parameters and properties

Write a parameter as:

```text
* name (Обязательный) - Тип - Описание. По умолчанию: значение
```

`Параметры URL` are always required in OpenAPI. For query parameters and headers, mark required values with `(Обязательный)` or a trailing `*` on the name. A property in a structure uses the same leading `*`; its features may contain `Обязательный` and, for XML, `Атрибут`.

Use `. Пример: значение` for an example and `. По умолчанию: значение` for a default. Quote string, date, and date-time examples. Descriptions may continue on subsequent comment lines.

## Types

Scalar types are `Строка`, `Число`, `ЦелоеЧисло`, `Булево`, `Дата`, `ДатаВремя`, `ДвоичныеДанные`, `Неопределено`, and `Произвольный`.

- Add `Минимум` and `Максимум` in parentheses to strings, numbers, integers, or arrays: `Строка(Минимум: 1, Максимум: 100)`.
- Combine alternatives with `,` or `или`: `Строка,Неопределено`.
- Define an array as `Массив из Тип`.
- Define an inline structure as `Структура { ... }`.
- Define a map as `Соответствие { * Ключ - Тип; * Значение - Тип }`.
- Define an enum as `Перечисление [ * Значение1; * Значение2 ]`.
- Refer to a named type as `Объект(Имя)`.

For XML structures, optional representation attributes follow the type, for example `Структура<имя = "item", пространство = "urn:example", префикс = "ex"> { ... }`.

## Shared object descriptions

Place a single block in the module, conventionally near its beginning:

```bsl
// Описание объектов:
//   Error - Структура {
//     * message (Обязательный) - Строка - Описание ошибки
//   }
```

Names must be unique. Parameters, request bodies, and responses may then use `Объект(Error)` or `Массив из Объект(Error)`. When checking one operation, concatenate this current shared block and the operation comment in the `comment` JSON field. When applying the result, update the shared block once and keep the operation comment beside its handler.

## Request body and responses

A request body may begin with `Обязательный`, an optional description, and one or more media-type entries:

```bsl
// Тело запроса:
//   Обязательный - Данные для создания
//   json - Объект(CreateRequest)
```

A response starts with its numeric status, followed by content and an optional description:

```bsl
// Возвращаемые ответы:
//   200 - json - Объект(Result) - Успешный ответ
//   400 - json - Объект(Error) - Некорректный запрос
```

Supported media aliases are `json`, `xml`, `text`, `html`, `stream`, `image`, `multipart`, and `urlencoded`. Full values such as `application/json`, custom `application/<name>`, and custom `image/<name>` are also accepted. A response may contain `Заголовки ответа:` followed by parameter-style header entries.

Always use `check` as the authority for whether the current parser accepts a comment. A visually plausible comment is not necessarily correct.
