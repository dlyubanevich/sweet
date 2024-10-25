![Sweet](./logo/sweet-logo-full-light.svg#gh-light-mode-only) ![Sweet](./logo/sweet-logo-full-dark.svg#gh-dark-mode-only)

## Swagger Easy Editing Tool for 1С

**Sweet** - это продукт для генерации Swagger (OpenApi) спецификации для конфигураций 1С. 

Состав:

- **Документирующий комментарий** - описание спецификации формируется на основании комментариев к функциям-обработчикам HTTP-запросов. Разработанный синтаксис и структура комментария максимально приближены к стандартам 1С.

- **Онлайн-редактор** - [редактор документирующего комментария](https://1c-swagger.ru) для быстрого и безошибочного написания документирующего комментария с предпоказом в Swagger UI.

- **Генератор спецификации** - бинарный файл приложения для генерации спецификации. Приложение написано на языке Rust.



### Преимущества

- **Вариативность**: Работает как с файлами проекта EDT, так и с файлами конфигурации, выгруженных из конфигуратора

- **Минимальность**: Не требует установки стороннего ПО. Можно использовать на серверах с минимальным набором ПО, без доступа в Internet

- **Наглядность**: Не требует знания структуры спецификации. Чтобы описать http-сервис, достаточно написать комментарий к коду, который будет полезен самим разработчикам

- **Доступность**: Консольный и десктопный вариант приложения доступны для Windows, Linux и MacOs


### Документация

- [Разделы документирующего комментария](docs/Разделы)
- [Онлайн-редактор](docs/Редактор)
- [Приложение](docs/Типы)

### Примеры

Доступны примеры и сгенерированные файлы спецификаций для [проекта EDT](examples/EDT) и [файлов конфигурации](examples/Conf).

### FAQ