![SWEET](./logo/sweet-logo-full-light.svg#gh-light-mode-only) ![SWEET](./logo/sweet-logo-full-dark.svg#gh-dark-mode-only)

# Swagger Easy Editing Tool for 1С

**SWEET** - это продукт для генерации Swagger (OpenApi) спецификации для конфигураций 1С. 

Состав:

- **Документирующий комментарий** - описание спецификации формируется на основании комментариев к функциям-обработчикам HTTP-запросов. Разработанный синтаксис и структура комментария максимально приближены к стандартам 1С.

- [**Онлайн-редактор**](https://sweet-editor.ru/#editor) - редактор документирующего комментария для быстрого и безошибочного написания документирующего комментария с предпоказом в Swagger UI.

- [**Генератор спецификации**](https://infostart.ru/marketplace/2230565/) - бинарный файл приложения для генерации спецификации (CLI и GUI). 

![Infostart](https://infostart.ru/bitrix/templates/sandbox_empty/assets/tpl/abo/img/logo.svg)


## Преимущества

- ### Наглядность

Не требует знания структуры спецификации. Чтобы описать http-сервис, достаточно написать комментарий к коду, который будет полезен разработчикам

- ### Скорость

Быстрое создание и поддержка документирующего комментария при помощи онлайн-редактора

- ### Вариативность

Работает как с файлами проекта EDT, так и с файлами конфигурации, выгруженных из конфигуратора

- ### Минимальность

Не требует установки стороннего ПО. Можно использовать на серверах с минимальным набором ПО, без доступа в Internet

- ### Доступность

Консольный и десктопный вариант приложения доступны для Windows, Linux и MacOs


## Документация

- [Документирующий комментарий](documentation/Разделы)
- [Онлайн-редактор](documentation/Редактор)
- [Генератор спецификации](documentation/Приложение)
- [Варианты использования](documentation/Варианты)

## Примеры

Доступны [примеры](/exts/) и сгенерированный [json-файл спецификации](/examples/swagger.json) для проекта EDT и файлов конфигурации.

## FAQ
- [Часто задаваемые вопросы](FAQ.md)
