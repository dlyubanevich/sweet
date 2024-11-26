﻿
#Область ОбработчикиСобытий

Функция SwaggerUI(Запрос)
	
	КодОтвета = 200;
	ТелоОтвета = ТелоОтвета();
	ТипОтвета = "text/html;charset=utf-8";
	
	Ответ = ОбщегоНазначенияHTTP.HTTPСервисОтвет(КодОтвета, ТелоОтвета, ТипОтвета); 
	
	Возврат Ответ;
	
КонецФункции

Функция SwaggerSpec(Запрос)
	
	КодОтвета = 200;
	ТелоОтвета = ПолучитьОбщийМакет("SweetOAS").ПолучитьТекст();
	ТипОтвета = "application/json;charset=utf-8";
	
	Ответ = ОбщегоНазначенияHTTP.HTTPСервисОтвет(КодОтвета, ТелоОтвета, ТипОтвета); 
	
	Возврат Ответ;
	
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ТелоОтвета()
	
	// Доступные варианты (расскомментируйте строки подходящего варианта)
	
	// 1. В качестве параметра "spec" передается json-спецификация:
	
	Спецификация = ПолучитьОбщийМакет("SweetOAS").ПолучитьТекст();
	Data = "spec: " + Спецификация;
	
	// 2. В качестве параметра "url" передается url, возвращающий json-спецификацию:
	
	//URL = "http://localhost:80/hs/Swagger/Spec";
	//Data = "url: """ + URL + """;
	
	// 3. В качестве параметра "urls" можно передавать массив из url, возвращающие json-спецификацию.
	// Таким образом можно разбить спецификацию, например, на разные версии api. 
	// В Swagger UI можно будет выбрать версию API и увидеть только нужные сервисы.
	//
	// Для этого варианта нужно будет внести следующие изменения в макет SwaggerUI:
	// Вместо строк 18-20:
	//		presets: [
	//			SwaggerUIBundle.presets.apis
	//		]
	//
	// Должно быть:
	//		presets: [
	//			SwaggerUIBundle.presets.apis,
	//			SwaggerUIStandalonePreset
	//		],
	//		layout: "StandaloneLayout"
	//
	//	URL1 = "http://...";
	//	URL2 = "http://...";
	//	URL3 = "http://...";
	//	Data = "urls: [
	//	|	{url: """ + URL1 + """, name: ""api 1""},
	//	|	{url: """ + URL2 + """, name: ""api 2""},
	//	|	{url: """ + URL3 + """, name: ""api 3""},
	//	|]";
	
	SwaggerUI = ПолучитьОбщийМакет("SwaggerUI").ПолучитьТекст();
	ТелоОтвета = СтрЗаменить(SwaggerUI, "&data", Data);
	
	Возврат ТелоОтвета;
	
КонецФункции	

#КонецОбласти
