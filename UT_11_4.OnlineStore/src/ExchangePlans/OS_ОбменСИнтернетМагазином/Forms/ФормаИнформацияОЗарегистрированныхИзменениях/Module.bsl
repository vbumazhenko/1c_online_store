#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	УзелОбмена = Параметры.УзелОбмена;
	
	Если УзелОбмена = ПланыОбмена.ОбменССайтом.ЭтотУзел() Тогда
		
		Отказ = Истина;
		Возврат;
		
	КонецЕсли;
	
	ОбновитьДеревоИзмененийСервер();
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	Если ДеревоИзменений.ПолучитьЭлементы().Количество() = 0 Тогда
		
		ПоказатьОповещениеПользователя(
			НСтр("ru = 'Изменения не зарегистрированы.'")
			,,,
			БиблиотекаКартинок.Информация32);
			
		Отказ = Истина;
		
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовФормы

&НаКлиенте
Процедура ДеревоИзмененийВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	
	ТекущиеДанные = ТекущийЭлемент.ТекущиеДанные;
	Если ЗначениеЗаполнено(ТекущиеДанные.Объект) Тогда
		ПоказатьЗначение(, ТекущиеДанные.Объект);
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ДеревоИзмененийПередНачаломДобавления(Элемент, Отказ, Копирование, Родитель, ЭтоГруппа, Параметр)
	
	Отказ = Истина;
	
КонецПроцедуры

&НаКлиенте
Процедура ДеревоИзмененийПередУдалением(Элемент, Отказ)
	
	Родитель = Элементы.ДеревоИзменений.ТекущиеДанные.ПолучитьРодителя();
	
	Если Родитель = Неопределено Тогда
		Отказ = Истина;
		Возврат;
	КонецЕсли;
	
	УдалитьРегистрациюСервер(Элементы.ДеревоИзменений.ТекущиеДанные.Объект);
	//Родитель.ПолучитьЭлементы().Удалить(Элементы.ДеревоИзменений.ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура Обновить(Команда)
	ОбновитьДеревоИзмененийСервер();
КонецПроцедуры

&НаКлиенте
Процедура УдалитьИзменения(Команда)
	
	УдалитьРегистрациюСервер(Неопределено);
	ОбновитьДеревоИзмененийСервер();

КонецПроцедуры


#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура УдалитьРегистрациюСервер(ДанныеСсылка);
	
	ПланыОбмена.УдалитьРегистрациюИзменений(УзелОбмена, ДанныеСсылка);
	
КонецПроцедуры

&НаСервере
Процедура ОбновитьДеревоИзмененийСервер()
	
	СтруктураИзменений = Новый Структура;

	ОбменССайтомСобытия.ЗаполнитьСтруктуруИзмененийДляУзла(УзелОбмена, СтруктураИзменений);
	
	СтрокиДерева = ДеревоИзменений.ПолучитьЭлементы();
	СтрокиДерева.Очистить();
	
	Если СтруктураИзменений.Товары.Количество() > 0 Тогда
		
		СтрокаДерева = СтрокиДерева.Добавить();
		СтрокаДерева.ВидОбъекта = НСтр("ru = 'Товары'");
	
		Для Каждого ЭлементМассива Из СтруктураИзменений.Товары Цикл
			СтрокаОбъекта = СтрокаДерева.ПолучитьЭлементы().Добавить();
			СтрокаОбъекта.Объект = ЭлементМассива;
		КонецЦикла;
		
	КонецЕсли;
	
	Если СтруктураИзменений.Заказы.Количество() > 0 Тогда
		
		СтрокаДерева = СтрокиДерева.Добавить();
		СтрокаДерева.ВидОбъекта = НСтр("ru = 'Заказы'");
		
		Для Каждого ЭлементМассива Из СтруктураИзменений.Заказы Цикл
			СтрокаОбъекта = СтрокаДерева.ПолучитьЭлементы().Добавить();
			СтрокаОбъекта.Объект = ЭлементМассива;
		КонецЦикла;
		
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти
