
#Область ОписаниеПеременных

//  Описание объектов:
//      Item - Структура<пространство = "http://v8.1c.ru/8.1/data/core", префикс = "v8"> {
//          * lang - Строка. Пример: "ru"
//          * content - Строка. Пример: "Name"
//      }
//
//		HTTPServiceProperties - Структура {
//	        * Name - Строка. Пример: "Services"
//          * Synonym - Массив из Структура {
//	            * item - Объект(Item)
//	        }
//          * Comment - Строка. Пример:""
//          * RootURL - Строка. Пример: "Services"
//          * ReuseSessions - Перечисление [
//	            * AutoUse
//	            * Use
//              * DontUse
//	        ]. По умолчанию: AutoUse
//          * SessionMaxAge - ЦелоеЧисло. По умолчанию: 20
//      }
//
//      URLTemplateProperties - Структура {
//	    	* Name - Строка. Пример: "Request"
//          * Synonym - Массив из Структура {
//	            * item - Объект(Item)
//	        }
//          * Comment - Строка. Пример:""
//          * Template - Строка. Пример: "/Request"
//      }
//
//      MethodProperties - Структура {
//	    	* Name - Строка. Пример: "Request"
//          * Synonym - Массив из Структура {
//	            * item - Объект(Item)
//	        }
//          * Comment - Строка. Пример:""
//          * HTTPMethod - Строка. Пример: "GET"
//          * Handler - Строка. Пример: "RequestGET"
//      }

#КонецОбласти

#Область ОбработчикиСобытий

#Область Text

//	Описание:
//		Пример описания с текстовым ответом
//
//	Возвращаемые ответы:
//		200 - text/plain - Строка. Пример: "Произвольный текст"
Функция TextGet(Запрос)
	
	ТелоОтвета = "Произвольный текст";
	КодСостояния = 200;
	ТипОтвета = "text/plain;charset=utf-8";
	
	Ответ = ОбщегоНазначенияHTTP.HTTPСервисОтвет(КодСостояния, ТелоОтвета, ТипОтвета);
	
	Возврат Ответ;
	
КонецФункции

#КонецОбласти

#Область XML

//	Описание:
//		При описании XML представления нужно иметь в виду следующее:
//		- Если корневой узел не является типом "Объект", то ему необходимо указывать имя, при помощи <имя ="">
//		- Пространство имен и префикс указывается для каждой структуры/соответствия, где оно необходимо
//		- Для описания атрибута элемента после имени свойства необходимо указать "(Атрибут)"
//
//	Параметры запроса:
//		* id (Обязательный) - Строка - Идентификатор сотрудника
//
//	Возвращаемые ответы:
//		204 - application/xml - Структура<имя = "Employee"> {
//			* id(Атрибут) - Число. Пример: 1
//			* name - Структура<пространство = "http://example.com/names", префикс = "fl"> {
//				* last - Строка. Пример: "Doe"
//				* first - Строка. Пример: "John"
//			}
//			* age - ЦелоеЧисло. Пример: 40
//			* sex - Перечисление [
//				* Male
//				* Female
//			]
//			* job - Структура<пространство = "http://example.com/jobs", префикс = "contract"> {
//				* position - Строка. Пример: "Менеджер по продажам"
//				* salary - Число. Пример: 1000
//				* currency - Перечисление [
//					* USD
//					* EUR
//				]
//			}
//			* history - Соответствие {
//				* Ключ - Дата - Начало события
//				* Значение - Строка - Событие. Пример: "Прием на работу"
//			} - история сотрудника в компании
//		}
Функция XMLDELETE(Запрос)
	
	ТелоОтвета = "<?xml version=""1.0"" encoding=""UTF-8""?>
	|<Employee id=""1"">
	|	<age>40</age>
	|	<history>
	|		<01.01.1970>Прием на работу</01.01.1970>
	|	</history>
	|	<contract:job xmlns:contract=""http://example.com/jobs"">
	|		<contract:currency>USD</contract:currency>
	|		<contract:position>Менеджер по продажам</contract:position>
	|		<contract:salary>1000</contract:salary>
	|	</contract:job>
	|	<fl:name xmlns:fl=""http://example.com/names"">
	|		<fl:first>John</fl:first>
	|		<fl:last>Doe</fl:last>
	|	</fl:name>
	|	<sex>Male</sex>
	|</Employee>";
	
	КодСостояния = 204;
	ТипОтвета = "application/xml;charset=utf-8";
	
	Ответ = ОбщегоНазначенияHTTP.HTTPСервисОтвет(КодСостояния, ТелоОтвета, ТипОтвета);
	
	Возврат Ответ;
	
КонецФункции

//	Описание:
//		Пример описания XML-файла структуры данных http-сервиса (без использования ссылок на объекты).
//
//	Возвращаемые ответы:
//		200 - application/xml - Структура<имя = "MetaDataObject"> {
//			* HTTPService - Структура {
//				* uuid(Атрибут) - Строка. Пример: "262df146-a2c9-4a27-a003-3bea8a35f3b6"
//				* Properties - Структура {
//					* Name - Строка. Пример: "Services"
//					* Synonym - Массив из Структура {
//						* item - Структура<пространство = "http://v8.1c.ru/8.1/data/core", префикс = "v8"> {
//							* lang - Строка. Пример: "ru"
//							* content - Строка. Пример: "Services"
//						}
//					}
//					* Comment - Строка. Пример: ""
//					* RootURL - Строка. Пример: "Services"
//					* ReuseSessions - Перечисление [
//						* AutoUse
//						* Use
//						* DontUse
//					]. По умолчанию: AutoUse
//					* SessionMaxAge - ЦелоеЧисло. По умолчанию: 20
//				}
//				* ChildObjects - Массив из Структура {
//					* URLTemplate - Структура {
//						* uuid(Атрибут) - Строка. Пример: "6e09d60e-314b-4ea6-b09a-2e82d46bc133"
//						* Properties - Структура {
//							* Name - Строка. Пример: "Request"
//							* Synonym - Массив из Структура {
//								* item - Структура<пространство = "http://v8.1c.ru/8.1/data/core", префикс = "v8"> {
//									* lang - Строка. Пример: "ru"
//									* content - Строка. Пример: "Request"
//								}
//							}
//							* Comment - Строка. Пример: ""
//							* Template - Строка. Пример: "/Request"
//						}
//						* ChildObjects - Массив из Структура {
//							* Method - Структура {
//								* uuid(Атрибут) - Строка. Пример: "60334c2a-07fb-4c2f-910e-9a646b5a1422"
//								* Properties - Структура {
//									* Name - Строка. Пример: "GET"
//									* Synonym - Массив из Структура {
//										* item - Структура<пространство = "http://v8.1c.ru/8.1/data/core", префикс = "v8"> {
//											* lang - Строка. Пример: "ru"
//											* content - Строка. Пример: "Request"
//										}
//									}
//									* Comment - Строка. Пример: ""
//									* HTTPMethod - Строка. Пример: "GET"
//									* Handler - Строка. Пример: "RequestGET"
//								}
//							}
//						}
//					}
//				}
//			}
//		}
Функция XMLGET(Запрос)
	
	ТелоОтвета = ПолучитьОбщийМакет("HttpServicesXML").ПолучитьТекст();
	КодСостояния = 200;
	ТипОтвета = "application/xml;charset=utf-8";
	
	Ответ = ОбщегоНазначенияHTTP.HTTPСервисОтвет(КодСостояния, ТелоОтвета, ТипОтвета);
	
	Возврат Ответ;
	
КонецФункции

//	Описание:
//		Пример описания XML-файла структуры данных http-сервиса (с использованием объектов).
//
//	Возвращаемые ответы:
//		200 - application/xml - Структура<имя = "MetaDataObject"> {
//			* HTTPService - Структура {
//				* uuid(Атрибут) - Строка. Пример: "262df146-a2c9-4a27-a003-3bea8a35f3b6"
//				* Properties - Объект(HTTPServiceProperties)
//				* ChildObjects - Массив из Структура {
//					* URLTemplate - Структура {
//						* uuid(Атрибут) - Строка. Пример: "6e09d60e-314b-4ea6-b09a-2e82d46bc133"
//						* Properties - Объект(URLTemplateProperties)
//						* ChildObjects - Массив из Структура {
//							* Method - Структура {
//								* uuid(Атрибут) - Строка. Пример: "60334c2a-07fb-4c2f-910e-9a646b5a1422"
//								* Properties - Объект(MethodProperties)
//							}
//						}
//					}
//				}
//			}
//		}
Функция XMLPOST(Запрос)

	ТелоОтвета = ПолучитьОбщийМакет("HttpServicesXML").ПолучитьТекст();
	КодСостояния = 200;
	ТипОтвета = "application/xml;charset=utf-8";
	
	Ответ = ОбщегоНазначенияHTTP.HTTPСервисОтвет(КодСостояния, ТелоОтвета, ТипОтвета);
	
	Возврат Ответ;
	
КонецФункции

#КонецОбласти

#Область JSON

//	Описание:
//		Варианты описания для возвращения JSON-значения
//
//	Возвращаемые ответы:
//		200 - application/json - Структура {
//			* string - Строка
//			* date - Дата
//			* datetime - ДатаВремя
//			* boolean - Булево
//			* integer - ЦелоеЧисло
//			* double - Число
//			* enum - Перечисление [
//				* Один
//				* Два
//				* Три
//			]
//			* map - Соответствие {
//				* Ключ - Строка. Пример: "1"
//				* Значение - Число. Пример: 1
//			}
//			* array - Массив из Число
//		}
Функция JSONGet(Запрос)
	
	Соответствие = Новый Соответствие;
	Соответствие.Вставить("1", 1);
	
	Массив = Новый Массив;
	Массив.Добавить(1);
	
	ИменаСвойств = "string, date, datetime, boolean, integer, double, enum, map, array";
	Структура = Новый Структура(ИменаСвойств);
	Структура.string = "Строка";
	Структура.date = Формат(ТекущаяДатаСеанса(), "");
	Структура.datetime = ТекущаяДатаСеанса();
	Структура.boolean = Ложь;
	Структура.integer = 0;
	Структура.double = 0;
	Структура.enum = "Один";
	Структура.map = Соответствие;
	Структура.array = Массив;	
	
	КодСостояния = 200;
	ТелоОтвета = ОбщегоНазначенияHTTP.ЗаписатьДанныеВJSON(Структура);
	ТипОтвета = "application/json;charset=utf-8";
	
	Ответ = ОбщегоНазначенияHTTP.HTTPСервисОтвет(КодСостояния, ТелоОтвета, ТипОтвета);
	
	Возврат Ответ;
	
КонецФункции

#КонецОбласти

#Область Stream

//	Описание:
//		Варианты описания для возвращения двоичных данных файла
//
//	Возвращаемые ответы:
//		200 - application/octet-stream - ДвоичныеДанные
Функция StreamGet(Запрос)
	
	Текст = ПолучитьОбщийМакет("HttpServicesXML").ПолучитьТекст();
	
	ИмяФайла = ПолучитьИмяВременногоФайла();
	Файл = Новый ТекстовыйДокумент();
	Файл.ДобавитьСтроку(Текст);
	Файл.Записать(ИмяФайла);
	
	ТелоОтвета = Новый ДвоичныеДанные(ИмяФайла);
	
	УдалитьФайлы(ИмяФайла);
	
	КодСостояния = 200;
	ТипОтвета = "application/octet-stream";
	
	Ответ = ОбщегоНазначенияHTTP.HTTPСервисОтвет(КодСостояния, ТелоОтвета, ТипОтвета);
	
	Возврат Ответ;
	
КонецФункции

#КонецОбласти

#Область Image

//	Описание:
//		Варианты описания для изображения
//
//	Возвращаемые ответы:
//		200 - image/jpeg - ДвоичныеДанные
Функция ImageGet(Запрос)
	
	ТелоОтвета = ПолучитьОбщийМакет("ImageJPG");	
	КодСостояния = 200;
	ТипОтвета = "image/jpeg";
	
	Ответ = ОбщегоНазначенияHTTP.HTTPСервисОтвет(КодСостояния, ТелоОтвета, ТипОтвета);
	
	Возврат Ответ;
	
КонецФункции

#КонецОбласти

#Область Other

//	Описание:
//		Варианты описания для возвращения HTML-текста
//
//	Возвращаемые ответы:
//		200 - text/html - Строка. Пример: "<head></head>"
Функция OtherGet(Запрос)
	
	ТелоОтвета = "<!DOCTYPE html>
	|<html>
	|    <head>
	|        <title>Example</title>
	|    </head>
	|    <body>
	|        <p>This is an example of a simple HTML page with one paragraph.</p>
	|    </body>
	|</html>";
	
	КодСостояния = 200;
	ТипОтвета = "text/html;charset=utf-8";
	
	Ответ = ОбщегоНазначенияHTTP.HTTPСервисОтвет(КодСостояния, ТелоОтвета, ТипОтвета);
	
	Возврат Ответ;
	
КонецФункции

//	Описание:
//		Варианты описания отправки данных форм
//
//	Тело запроса:
//		application/x-www-form-urlencoded - Строка. Пример: "login=smith&password=12345678"
//
//	Возвращаемые ответы:
//		200 - Неопределено
Функция OtherPost(Запрос)
	
	КодСостояния = 200;
	Ответ = ОбщегоНазначенияHTTP.HTTPСервисОтвет(КодСостояния);
	
	Возврат Ответ;
	
КонецФункции

#КонецОбласти

#КонецОбласти
