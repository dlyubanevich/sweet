﻿
#Область ОписаниеПеременных

//	Описание объектов:
//		Object - Структура {
//			* Свойство - Строка
//		}
//		Map - Соответствие {
//			* Ключ - Строка. Пример: "1"
//			* Значение - Булево
//		}
//		Enum - Перечисление [
//			* Один
//			* Два
//			* Три
//		]

#КонецОбласти

#Область ОбработчикиСобытий

#Область Primitive

//	Описание:
//		Возможные варианты описаний примитивных типов
//
//	Тело запроса:
//		application/json - Структура {
//			* string - Строка
//			* number - ЦелоеЧисло. Пример: 100
//			* double - Число. Пример: 36.6
//			* boolean - Булево. Пример: Ложь
//			* date - Дата. Пример: "2024-12-31"
//			* datetime - ДатаВремя. Пример: "2024-12-31T23:59:59"
//		}
//
//	Возвращаемые ответы:
//		200 - Неопределено
Функция PrimitivePOST(Запрос)
	
	Ответ = Новый HTTPСервисОтвет(200);
	Возврат Ответ;
	
КонецФункции

//	Описание:
//		Возможные варианты описаний ограничений строковых и числовых типов:
//		- Ограничения типов действуют для строки, числа и целого числа
//
//	Возвращаемые ответы:
//		200 - application/json - Структура {
//			* ИНН - Строка(Минимум: 10,Максимум: 12) - Свойство с ограничениями на размер строки. Пример: "1234567890"
//			* ДеньВГоду - ЦелоеЧисло(Минимум: 1,Максимум: 366) - Свойство с ограничениями на длину числа. Пример: 256
//			* ТемператураТела - Число(Минимум: 36.6,Максимум: 42.9) - Свойство с ограничениями на длину числа. Пример: 36.6
//			* ПоложительноеЧисло - Число(Минимум: 1) - Пример положительного числа
//			* ОтрицательноЧисло - Число(Максимум: -1) - Пример отрицательного числа
//		}
Функция PrimitiveGET(Запрос)
	
	ИменаСвойств = "ИНН, ДеньВГоду, ТемператураТела, ПоложительноеЧисло, ОтрицательноЧисло";
	Структура = Новый Структура(ИменаСвойств);
	Структура.ИНН = "1234567890";
	Структура.ДеньВГоду = 256;
	Структура.ТемператураТела = 36.6;
	Структура.ПоложительноеЧисло = 1;
	Структура.ОтрицательноЧисло = -1;	
	
	КодСостояния = 200;
	ТелоОтвета = ОбщегоНазначенияHTTP.ЗаписатьДанныеВJSON(Структура);
	ТипОтвета = "application/json;charset=utf-8";
	
	Ответ = ОбщегоНазначенияHTTP.HTTPСервисОтвет(КодСостояния, ТелоОтвета, ТипОтвета);
	
	Возврат Ответ;
	
КонецФункции

#КонецОбласти

#Область Array

//	Описание:
//		Возможные варианты описания массивов
//
//	Тело запроса:
//		application/json - Массив из Структура {
//			* strings - Массив из Строка. Пример: "Строка"
//			* numbers - Массив из ЦелоеЧисло. Пример: 100
//			* doubles - Массив из Число. Пример: 36.6
//			* booleans - Массив из Булево. Пример: Ложь
//			* dates - Массив из Дата. Пример: "2024-12-31"
//			* datetimes - Массив из ДатаВремя. Пример: "2024-12-31T23:59:59"
//			* enums - Массив из Перечисление [
//				* Значение1
//				* Значение2
//				* Значение3
//			]
//			* maps - Массив из Соответствие {
//				* Ключ - Строка. Пример: "1"
//				* Значение - Число. Пример: 1
//			}
//			* binaries - Массив из ДвоичныеДанные. Пример: D0A5D183D0B9
//			* any_types - Массив из Произвольный
//			* objects - Массив из Объект(Map)
//			* inner_strings - Массив из Массив из Строка. Пример: Строка
//		}
//
//	Возвращаемые ответы:
//		200 - Неопределено
Функция ArrayPOST(Запрос)
	
	Ответ = Новый HTTPСервисОтвет(200);
	Возврат Ответ;
	
КонецФункции

//	Описание:
//		Возможные варианты описаний ограничений для массива
//
//	Возвращаемые ответы:
//		200 - application/json - Структура {
//			* array1 - Массив(Минимум: 1) из Булево - Не пустой массив
//			* array2 - Массив(Максимум: 10) из Строка - Массив состоит максимум из 10 элементов
//			* array3 - Массив(Минимум: 5, Максимум: 10) из ДатаВремя - Массив от 5 до 10 элементов
//			* array4 - Массив(Минимум: 1) из Число(Минимум: 1) - Не пустой массив из положительных чисел
//			* array5 - Массив(Минимум: 1) из Массив(Максимум: 2) из Булево - Массив булевых массивов, максимум из 2-х элементов
//		}
Функция ArrayGET(Запрос)
	
	Массив1 = Новый Массив;
	Массив1.Добавить(Истина);
	
	Массив2 = Новый Массив;
	Массив2.Добавить("Массив № 2");
	
	Массив3 = Новый Массив;
	Для н = 1 По 5 Цикл
		Массив3.Добавить(ТекущаяДатаСеанса() + н);		
	КонецЦикла;
	
	Массив4 = Новый Массив;
	Массив4.Добавить(2);
	
	МассивБулева = Новый Массив(2);
	МассивБулева[0] = Истина;
	МассивБулева[1] = Ложь;
	
	Массив5 = Новый Массив;
	Массив5.Добавить(МассивБулева);
		
	Структура = Новый Структура;
	Структура.Вставить("array1", Массив1);
	Структура.Вставить("array2", Массив2);
	Структура.Вставить("array3", Массив3);
	Структура.Вставить("array4", Массив4);
	Структура.Вставить("array5", Массив5);
	
	КодСостояния = 200;
	ТелоОтвета = ОбщегоНазначенияHTTP.ЗаписатьДанныеВJSON(Структура);
	ТипОтвета = "application/json;charset=utf-8";
	
	Ответ = ОбщегоНазначенияHTTP.HTTPСервисОтвет(КодСостояния, ТелоОтвета, ТипОтвета);
	
	Возврат Ответ;
	
КонецФункции

#КонецОбласти

#Область Object 

//	Описание:
//		Варианты описания структуры:
//		- Обязательные свойства структуры помечаются ключевым словом "Обязательный"
//
//	Возвращаемые ответы:
//		200 - application/json - Структура {
//			* string(Обязательный) - Строка,Неопределено. Пример: Строка
//			* enum - Перечисление [
//				* Один
//				* Два
//				* Три
//			]
//			* object - Объект(Object) - ссылка на объект из блока "Описание объектов"
//			* map - Соответствие {
//				* Ключ - Строка. Пример: "1"
//				* Значение - Число. Пример: 1
//			}
//			* array - Массив из Структура {
//				* array_of_num - Массив из Число
//				* ebum_object - Объект(Enum)
//			}
//		}
Функция StructureGET(Запрос)
	
	Соответствие = Новый Соответствие;
	Соответствие.Вставить("1", 1);
	
	Массив = Новый Массив;
	Массив.Добавить(Новый Структура("Массив", Новый Массив));
	
	ИменаСвойств = "string, enum, object, map, array";
	Структура = Новый Структура(ИменаСвойств);
	Структура.string = "Строка";
	Структура.enum = "Один";
	Структура.object = Новый Структура("Свойство", "Строка");
	Структура.map = Соответствие;
	Структура.array = Массив;	
	
	КодСостояния = 200;
	ТелоОтвета = ОбщегоНазначенияHTTP.ЗаписатьДанныеВJSON(Структура);
	ТипОтвета = "application/json;charset=utf-8";
	
	Ответ = ОбщегоНазначенияHTTP.HTTPСервисОтвет(КодСостояния, ТелоОтвета, ТипОтвета);
	
	Возврат Ответ;
	
КонецФункции

#КонецОбласти

#Область Прочие

//	Описание:
//		Варианты описания прочих типов:
//		- Произвольный тип может быть любым примитивным типом, объектом или массивом
//		- Неопределено - тип-маркер,этим типом следует помечать поля, которые могут быть равны null
//		- Двоичные данные - двоичные данные файла
//
//	Возвращаемые ответы:
//		200 - application/json - Структура {
//			* any - Произвольный,Неопределено
//		}
//		201 - application/octet-stream - ДвоичныеДанные
Функция OtherGET(Запрос)
	Ответ = Новый HTTPСервисОтвет(200);
	Возврат Ответ;
КонецФункции

#КонецОбласти

#КонецОбласти
