#Область ОбработчикиСобытий

&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	
	ПараметрыФормы = Новый Структура("УзелОбмена", ПараметрКоманды);
	ОткрытьФорму("ПланОбмена.OS_ОбменСИнтернетМагазином.Форма.ФормаИнформацияОЗарегистрированныхИзменениях",
		ПараметрыФормы, ПараметрыВыполненияКоманды.Источник, ПараметрыВыполненияКоманды.Уникальность, ПараметрыВыполненияКоманды.Окно);
	
КонецПроцедуры

#КонецОбласти
