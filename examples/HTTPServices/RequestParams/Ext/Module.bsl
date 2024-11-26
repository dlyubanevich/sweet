﻿
#Область ОбработчикиСобытий

#Область Path

//	Описание:
//		Пример возможных вариантов описания параметров URL
//
//	Параметры URL:
//		* path1 - Строка - Тут пишется необязательное, но желательное описание параметра
//		* path2 - Число
//		* path3 - Булево - Описание
//			параметра
//			может быть
//			многострочным
//		* path4 - Дата
//
//	Возвращаемые ответы:
//		200 - application/json - Структура {
//			* path1 - Строка
//			* path2 - Число
//			* path3 - Булево
//			* path4 - Дата
//		} - Значения переданных параметров URL
Функция PathGET(Запрос)
	
	Структура = Новый Структура;
	Для Каждого ПараметрURL Из Запрос.ПараметрыURL Цикл
		Структура.Вставить(ПараметрURL.Ключ, ПараметрURL.Значение);
	КонецЦикла;	
	
	КодСостояния = 200;
	ТелоОтвета = ОбщегоНазначенияHTTP.ЗаписатьДанныеВJSON(Структура);
	ТипОтвета = "application/json;charset=utf-8";
	
	Ответ = ОбщегоНазначенияHTTP.HTTPСервисОтвет(КодСостояния, ТелоОтвета, ТипОтвета);
	
	Возврат Ответ;
	
КонецФункции

#КонецОбласти

#Область Query

//	Описание:
//		Пример возможных вариантов описания параметров запроса
//
//	Параметры запроса:
//		* query1 - Строка - Тут пишется необязательное, но желательное описание параметров
//		* query2 - Число - Параметр со значением по умолчанию. По умолчанию: 1
//		* query3 (Обязательный) - Булево - Этот параметр обязателен для заполнения
//		* query4 - Дата
//		* query5 - Массив из Строка
//
//	Возвращаемые ответы:
//		200 - application/json - Структура {
//			* query1 - Строка,Неопределено
//			* query2 - Число,Неопределено
//			* query3 - Булево
//			* query4 - Дата,Неопределено
//			* query5 - Массив из Строка,Неопределено
//		} - Значения переданных параметров запроса
Функция QueryGET(Запрос)
	
	МассивИменПараметров = Новый Массив;
	МассивИменПараметров.Добавить("query1");
	МассивИменПараметров.Добавить("query2");
	МассивИменПараметров.Добавить("query3");
	МассивИменПараметров.Добавить("query4");
	МассивИменПараметров.Добавить("query5");
	
	Структура = Новый Структура;
	Для Каждого ИмяПараметра Из МассивИменПараметров Цикл
		ЗначениеПараметра = Запрос.ПараметрыЗапроса.Получить(ИмяПараметра);
		Структура.Вставить(ИмяПараметра, ЗначениеПараметра);
	КонецЦикла;	
	
	КодСостояния = 200;
	ТелоОтвета = ОбщегоНазначенияHTTP.ЗаписатьДанныеВJSON(Структура);
	ТипОтвета = "application/json;charset=utf-8";
	
	Ответ = ОбщегоНазначенияHTTP.HTTPСервисОтвет(КодСостояния, ТелоОтвета, ТипОтвета);
	
	Возврат Ответ;

КонецФункции

#КонецОбласти

#Область Header

//	Описание:
//		Пример возможных вариантов описания заголовков
//
//	Заголовки:
//		* X-Header1 - Строка - Тут пишется необязательное, но желательное описание параметров
//		* Y-Header2 - Число - Заголовок со значением по умолчанию. По умолчанию: 1
//		* U-Header3 (Обязательный) - Булево - Этот заголовок обязателен для заполнения
//
//	Возвращаемые ответы:
//		200 - application/json - Соответствие {
//			* Ключ - Строка. Пример: "X-Header2"
//			* Значение - Число,Строка,Булево,Неопределено. Пример: 1
//		} - Значения переданных заголовков
Функция HeaderGET(Запрос)
	
	МассивИменЗаголовков = Новый Массив;
	МассивИменЗаголовков.Добавить("X-Header1");
	МассивИменЗаголовков.Добавить("Y-Header2");
	МассивИменЗаголовков.Добавить("U-Header3");

	Соответствие = Новый Соответствие;
	Для Каждого ИмяЗаголовка Из МассивИменЗаголовков Цикл
		ЗначениеЗаголовка = Запрос.Заголовки.Получить(ИмяЗаголовка);
		Соответствие.Вставить(ИмяЗаголовка, ЗначениеЗаголовка);
	КонецЦикла;	
	
	КодСостояния = 200;
	ТелоОтвета = ОбщегоНазначенияHTTP.ЗаписатьДанныеВJSON(Соответствие);
	ТипОтвета = "application/json;charset=utf-8";
	
	Ответ = ОбщегоНазначенияHTTP.HTTPСервисОтвет(КодСостояния, ТелоОтвета, ТипОтвета);
	
	Возврат Ответ;
	
КонецФункции

#КонецОбласти

#КонецОбласти
