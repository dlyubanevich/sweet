﻿
#Область ОбработчикиСобытий

//	Описание:
//		Пример обязательного тела запроса
//
//	Тело запроса:
//		Обязательный - Представление тела запроса
//		application/json - Структура {
//			* string - Строка
//			* integer - ЦелоеЧисло
//		}
//
//	Возвращаемые ответы:
//		200 - Неопределено
Функция ObjectsPOST(Запрос)
	
	Ответ = Новый HTTPСервисОтвет(200);
	Возврат Ответ;
	
КонецФункции

//	Описание:
//		Пример необязательного тела запроса без представления, но с различными типами контента
//
//	Тело запроса:
//		application/json - Структура {
//			* string - Строка
//			* integer - ЦелоеЧисло
//		}
//		application/xml - Структура<имя = "data"> {
//			* string - Строка
//			* integer - ЦелоеЧисло
//			* bool - Булево
//		}
//		text/plain - Число - какое-то число. Пример: 3.14
//
//	Возвращаемые ответы:
//		200 - Неопределено
Функция ObjectsPUT(Запрос)
	
	Ответ = Новый HTTPСервисОтвет(200);
	Возврат Ответ;
	
КонецФункции

#КонецОбласти
