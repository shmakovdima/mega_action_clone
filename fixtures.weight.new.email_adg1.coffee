mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"



data = [
  {lname: 'Мамай', fname: 'Елена',  phone: '+79184471583 ', email: '', weight: 5.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Малдавский ', fname: 'Александр',  phone: '+79183456490', email: '', weight: 5.1, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Осадчая', fname: 'Светлана',  phone: '+79181503253', email: '', weight: 5.4, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Николаева', fname: 'Людмила ',  phone: '+79189455468', email: '', weight: 4.2, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Молоткова', fname: 'Надежда ',  phone: '+79184700636', email: '', weight: 5.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Астафьева', fname: 'Ирина',  phone: '+79615907521', email: '', weight: 5.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Ефстафьева', fname: 'Ольга ',  phone: '+79227693369', email: '', weight: 5.1, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Деменко', fname: 'Оксана ',  phone: '+79615176585', email: '', weight: 5.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Элиозашвили', fname: 'Абесалом',  phone: '+79528536954', email: '', weight: 5.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Редкогород', fname: 'Ирина',  phone: '+79528567806', email: '', weight: 5.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Сафарбекова', fname: 'Диана',  phone: '+79002549824', email: '', weight: 5.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Липчанская', fname: 'Татьяна',  phone: '+79649292636', email: '', weight: 5.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Липчанский', fname: 'Кирилл',  phone: '+79676679944', email: '', weight: 5.3, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Колесникова', fname: 'Оксана ',  phone: '+79189005446', email: '', weight: 5.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Алиев', fname: 'Аларбек',  phone: '+79282580442', email: '', weight: 5.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Костенко', fname: 'Мария',  phone: '+79189744424', email: '', weight: 5.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Бвез', fname: 'Виктория',  phone: '+79604851747', email: '', weight: 5.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Яковдев', fname: 'Сергей',  phone: '+79883889093', email: '', weight: 5.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Солодовская', fname: 'Анна',  phone: '+79183330327', email: '', weight: 5.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Солодовский', fname: 'Валерий',  phone: '+79184474401', email: '', weight: 2.9, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Коль', fname: 'Радмила',  phone: '+79181542509', email: '', weight: 5.2, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Коль', fname: 'Виталий',  phone: '+79189540291', email: '', weight: 5.1, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Мкртчян', fname: 'Мкртич',  phone: '+79531054500', email: '', weight: 5.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Смирнова', fname: 'Екатерина',  phone: '+79898266653', email: '', weight: 3.1, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Кулешова', fname: 'Ксения',  phone: '+79604945619', email: '', weight: 3.7, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Ползикова', fname: 'Анастасия',  phone: '+79180361498', email: '', weight: 3.3, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Дмитриева', fname: 'Елена',  phone: '+79186750879', email: '', weight: 5.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Дмитриев', fname: 'Александр',  phone: '+79883631116', email: '', weight: 5.1, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Васильева', fname: 'Ирина',  phone: '+79184789558', email: '', weight: 5.5, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Васильева', fname: 'Галина',  phone: '+79284421506', email: '', weight: 5.5, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Ажелецкий', fname: 'Александр',  phone: '+79673051089', email: '', weight: 3.3, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Михалкина', fname: 'Виктория',  phone: '+79094463524', email: '', weight: 3.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Самаан', fname: 'Елена',  phone: '+79182681400', email: '', weight: 5.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Ушенин', fname: 'Михаил',  phone: '+79061878719', email: '', weight: 3.7, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Головкина', fname: 'Лариса',  phone: '+79186277611', email: '', weight: 3.8, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Жатовская', fname: 'Юлия',  phone: '+79183869598', email: '', weight: 2.7, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Гиренко', fname: 'Евгений',  phone: '+79649344441', email: '', weight: 5.0, created_at: '26.03.2016', mega: 'mega_ad'}
  {lname: 'Пирогова', fname: 'Нелля',  phone: '+791893829180', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Клинкова', fname: 'Юлия',  phone: '+79184558620', email: '', weight: 2.9, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Клинков', fname: 'Анатолий',  phone: '+79184558621', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Кобазева', fname: 'Виктория',  phone: '+79183423421', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Быков', fname: 'Евгений',  phone: '+79182399865', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Быкова', fname: 'Анна',  phone: '+79183111148', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Зленко', fname: 'Ольга ',  phone: '+79054950623', email: '', weight: 4.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Оськина', fname: 'Алиса',  phone: '+79189843367', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Оськин', fname: 'Кирилл',  phone: '+79182781329', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Сафронова', fname: 'Светлана',  phone: '+79183731707', email: '', weight: 5.3, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Голубицкая', fname: 'Ольга ',  phone: '+79186824516', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Здоровенко', fname: 'Татьяна',  phone: '+79628717251', email: '', weight: 2.5, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Здоровенко', fname: 'Елена',  phone: '+79094462041', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Шевцова', fname: 'Дарья',  phone: '+79892145763', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Честюхина', fname: 'Валентина',  phone: '+79183871235', email: '', weight: 3.3, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Горобец', fname: 'Любовь',  phone: '+79182711571', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Думанина', fname: 'Нина',  phone: '+79282926020', email: '', weight: 1.7, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Броволева', fname: 'Ольга ',  phone: '+79604759208', email: '', weight: 2.8, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Погорская', fname: 'Татьяна',  phone: '+79180103864', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Гридасова', fname: 'Ольга ',  phone: '+79282295734', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Карпенко', fname: 'Сергей',  phone: '+79184728779', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Лысенко', fname: 'Анна',  phone: '+79184459895', email: '', weight: 0.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Лысенко', fname: 'Анна',  phone: '+79184459895', email: '', weight: 2.5, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Лузан', fname: 'Ирина',  phone: '+79284173344', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Дворовая', fname: 'Юлия',  phone: '+79094523446', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Дворовой', fname: 'Александр',  phone: '+79182476278', email: '', weight: 2.2, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Гребенюк', fname: 'Ольга ',  phone: '+79184811807', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Рыбникова', fname: 'Татьяна',  phone: '+79996321377', email: '', weight: 4.6, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Коршикова', fname: 'Валентина',  phone: '+79180106810', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Пипченко', fname: 'Максим',  phone: '+79186333997', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Коршикова', fname: 'Надежда ',  phone: '+79183646337', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Матвеев', fname: 'Сергей',  phone: '+79183354327', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Матвеева', fname: 'Татьяна',  phone: '+79182454253', email: '', weight: 1.5, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Старостин', fname: 'Сергей',  phone: '+79183222318', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Старостина', fname: 'Елена',  phone: '+79181151765', email: '', weight: 5.2, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Багдасалов', fname: 'Тимофей',  phone: '+79189821697', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Ситников', fname: 'Роман',  phone: '+79181486458', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Ситникова', fname: 'Дарья',  phone: '+79892974929', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Вылегжанина', fname: 'Елена',  phone: '+79183552472', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Сабадашова', fname: 'Марина',  phone: '+79604754970', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Сабадашов', fname: 'Константин',  phone: '+79086853883', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Ткач', fname: 'Ксения',  phone: '+79054069536', email: '', weight: 5.3, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Циколенко', fname: 'Марина',  phone: '+79883818714', email: '', weight: 3.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Чумаченко', fname: 'Виталина',  phone: '+79282401828', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Чумаченко', fname: 'Андрей',  phone: '+79886049734', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Турбылев', fname: 'Александр',  phone: '+79182211735', email: '', weight: 2.2, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Власова', fname: 'Татьяна',  phone: '+79183549785', email: '', weight: 3.5, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Голубова', fname: 'Ольга ',  phone: '+79186394745', email: '', weight: 2.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Андриенко', fname: 'Александр',  phone: '+79189805396', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Андриенко', fname: 'Татьяна',  phone: '+79184445403', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Видченко', fname: 'Стас',  phone: '+79615805290', email: '', weight: 2.5, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Густенева,', fname: 'Елена',  phone: '+79528737904', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Кусова', fname: 'Екатерина',  phone: '+79180999931', email: '', weight: 2.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Гриценко', fname: 'Михаил',  phone: '+79604809225', email: '', weight: 2.3, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Ангел', fname: 'Александр',  phone: '+79280397775', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Ангел', fname: 'Ирина',  phone: '+79280397776', email: '', weight: 3.3, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Попова', fname: 'Екатерина',  phone: '+79604743838', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Репина', fname: 'Марина',  phone: '+79002492510', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Жучева', fname: 'Юлия',  phone: '+79184414559', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Горячкин', fname: 'Максим',  phone: '+79183448146', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Янко', fname: 'Александр',  phone: '+79284115727', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Пономарёва', fname: 'Татьяна',  phone: '+79284115727', email: '', weight: 4.3, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Шиповалова', fname: 'Анастасия',  phone: '+79649135994', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Сухотько', fname: 'Максим',  phone: '+79183775779', email: '', weight: 4.3, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Синикосова', fname: 'Елена',  phone: '+79184419610', email: '', weight: 3.8, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Осипова', fname: 'Людмила ',  phone: '+79183247433', email: '', weight: 4.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Гатов', fname: 'Вячеслав',  phone: '+79604718485', email: '', weight: 1.3, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Синельникова', fname: 'Ирина',  phone: '+79184605600', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Синельникова', fname: 'Александр',  phone: '+79184997777', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Курбанова', fname: 'Анна',  phone: '+79182204995', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Волихова', fname: 'Марина',  phone: '+79531104460', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Бертенева', fname: 'Елена',  phone: '+79184989835', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Басс', fname: 'Ольга ',  phone: '+79184871835', email: '', weight: 3.7, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Волошок', fname: 'Анастасия',  phone: '+79086840085', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Волошок', fname: 'Мария ',  phone: '+79528528766', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Волкова', fname: 'Екатерина',  phone: '+79604977407', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Волков', fname: 'Андрей',  phone: '+79604973494', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Кречетова', fname: 'Юлия',  phone: '+79054721149', email: '', weight: 3.9, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Кречетова', fname: 'Татьяна',  phone: '+79054721165', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Дарьина', fname: 'Карина',  phone: '+79184442928', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Сёмин', fname: 'Виталий',  phone: '+79529873763', email: '', weight: 1.4, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Сёмина', fname: 'Наталья',  phone: '+79649090310', email: '', weight: 5.2, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Ветрова', fname: 'Наталья',  phone: '+79184442028', email: '', weight: 5.2, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Мкртчян', fname: 'Мкртич',  phone: '+79531054500', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Окунева', fname: 'Анаид',  phone: '+79034544941', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Окунев', fname: 'Константин',  phone: '+79615856996', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Окунев', fname: 'Виктор',  phone: '+79618520783', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Васильева', fname: 'Галина',  phone: '+79284421506', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Рябчук', fname: 'Владимир',  phone: '+79286626753', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Рябчук', fname: 'Анна',  phone: '+79298301553', email: '', weight: 3.3, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Ползикова', fname: 'Ольга ',  phone: '+79182733145', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Ползикова', fname: 'Анастасия',  phone: '+79180361498', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Липнина', fname: 'Татьяна',  phone: '+79180878735', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Деменко', fname: 'Оксана',  phone: '+79615176585', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Сафарбекова ', fname: 'Диана',  phone: '+79002549824', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Люблинчинкова', fname: 'Любовь',  phone: '+79284224987', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Колесникова', fname: 'Оксана',  phone: '+79189005446', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Разыграев', fname: 'Константин',  phone: '+79885587030', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Костенко', fname: 'Мария ',  phone: '+79189744424', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Костенко', fname: 'Анастасия',  phone: '+79094664168', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Снегирёва', fname: 'Ирина',  phone: '+79180361498', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Трубина', fname: 'Анастасия',  phone: '+79086914186', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Боус', fname: 'Дина',  phone: '+79186888585', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Жильцова', fname: 'Наталья',  phone: '+79186862618', email: '', weight: 4.7, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Семчихина', fname: 'Екатерина',  phone: '+79284336633', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Герасименко', fname: 'Сергей',  phone: '+79528348107', email: '', weight: 3.2, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Анпилогова', fname: 'Екатерина',  phone: '+79183134464', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Ованесян', fname: 'Араик',  phone: '+79604878189', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Саакян', fname: 'Алвар',  phone: '+79285022253', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Костадян', fname: 'Ануш',  phone: '+79385022254', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Чернова', fname: 'Людмила ',  phone: '+79891415939', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Вадим', fname: 'Вохмянин',  phone: '+79891415900', email: '', weight: 3.3, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Дубовский', fname: 'Владимир',  phone: '+79181366990', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Подаш', fname: 'Марина',  phone: '+79181606672', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Кубовская', fname: 'Татьяна',  phone: '+79604912589', email: '', weight: 3.2, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Бондарева', fname: 'Наталья',  phone: '+79002304360', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Анисимова', fname: 'Лионелла',  phone: '+79086935470', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Неплюев', fname: 'Николай',  phone: '+79184564037', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Меньшикова', fname: 'Надежда ',  phone: '+79182535037', email: '', weight: 3.7, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Андросов', fname: 'Фёдор',  phone: '+79086809994', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Андросова', fname: 'Анна',  phone: '+79002293300', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Юров', fname: 'Степан',  phone: '+79189926314', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Корх', fname: 'Герман',  phone: '+79182158809', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Корх', fname: 'Екатерина',  phone: '+79284018367', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Юдин', fname: 'Сергей',  phone: '+79883434097', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Алексеева', fname: 'Лида',  phone: '+79189686570', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Алексеев', fname: 'Александр',  phone: '+79189344874', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Рыбалкина', fname: 'Евгения',  phone: '+79615389793', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Елина', fname: 'Анна',  phone: '+79183278785', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Сухомлинов', fname: 'Владимир',  phone: '+79002890869', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Михайлова', fname: 'Ольга ',  phone: '+79615859875', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Мартовицкая', fname: 'Марьяна',  phone: '+79615219949', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Мартовицкий', fname: 'Роман',  phone: '+79054021491', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Моисеева', fname: 'Юлия',  phone: '+79182196690', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Шишонен', fname: 'Анатолий',  phone: '+79182720369', email: '', weight: 1.5, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Оглы', fname: 'Николай',  phone: '+79676572212', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Оглы', fname: 'Роман',  phone: '+79649382001', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Нехай', fname: 'Даур',  phone: '+79880835016', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Чуриев', fname: 'Махомод',  phone: '+79618270842', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Михайлюк', fname: 'Денис',  phone: '+79604864616', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Власова', fname: 'Нина',  phone: '+79184958050', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Власов', fname: 'Николай',  phone: '+79184784592', email: '', weight: 4.6, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Понова', fname: 'Екатерина',  phone: '+79189321583', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Горбань', fname: 'Людмила ',  phone: '+79184362210', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Абдулкеримова', fname: 'Елена',  phone: '+79649060149', email: '', weight: 3.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Гусаренко', fname: 'Валентина',  phone: '+79034584231', email: '', weight: 3.3, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Зинова', fname: 'Татьяна',  phone: '+79898072867', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Орлов', fname: 'Михаил',  phone: '+79186223284', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Зинова', fname: 'Ирина',  phone: '+79181410949', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Мирошниченко', fname: 'Мария ',  phone: '+79183729955', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Павлова', fname: 'Виктория',  phone: '+79184671276', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Модебадзе', fname: 'Мамука',  phone: '+79898332907', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Кромичева', fname: 'Елена',  phone: '+79183638617', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Титова', fname: 'Инна',  phone: '+79010080707', email: '', weight: 4.2, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Николаева', fname: 'Людмила ',  phone: '+79189455468', email: '', weight: 3.6, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Строчеус', fname: 'Валентина',  phone: '+79064340975', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Мирошниченко', fname: 'Татьяна',  phone: '+79002788623', email: '', weight: 5.5, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Азизова', fname: 'Мадина',  phone: '+79528375249', email: '', weight: 0.8, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Соболь', fname: 'Валерий',  phone: '+79649224537', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Чадранцев', fname: 'Василий',  phone: '+79184834610', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Чадранцева', fname: 'Людмила ',  phone: '+79181885127', email: '', weight: 5.2, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Ермакова', fname: 'Виктория',  phone: '+79528172099', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Тертычная', fname: 'Екатерина',  phone: '+79604784938', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Медведева', fname: 'Ольга ',  phone: '+79180246397', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Комаров', fname: 'Александр',  phone: '+79282551144', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Кромичев', fname: 'Александр',  phone: '+79898331967', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Дорофеева', fname: 'Екатерина',  phone: '+79528326064', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Чигринева', fname: 'Светлана',  phone: '+79064348060', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Денисенко', fname: 'Екатерина',  phone: '+79184557768', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Скиба', fname: 'Виктория',  phone: '+79184440518', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Чегринев', fname: 'Александр',  phone: '+79627658021', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Гондаренко', fname: 'Екатерина',  phone: '+79181618161', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Чигадаева', fname: 'Ирина',  phone: '+79529862043', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Пичман', fname: 'Надежда ',  phone: '+79825266472', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Чагадаев', fname: 'Павел',  phone: '+79528613713', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Верченко', fname: 'Екатерина',  phone: '+79183423213', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Козлова', fname: 'Анна',  phone: '+79531086581', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Пономарёва', fname: 'Станислав',  phone: '+79883190725', email: '', weight: 2.5, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Папанова', fname: 'Ирина',  phone: '+79094499789', email: '', weight: 10.2, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Андрющенко', fname: 'Юлия',  phone: '+79189693292', email: '', weight: 6.2, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Андрющенко', fname: 'Александр',  phone: '+79183669001', email: '', weight: 5.5, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Ким', fname: 'Альбина',  phone: '+79184384443', email: '', weight: 5.1, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Мартиньянов', fname: 'Иннокентий',  phone: '+79034471337', email: '', weight: 14.5, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Ежова', fname: 'Ольга ',  phone: '+79628762788', email: '', weight: 8.8, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Гончаров', fname: 'Виталий',  phone: '+79186499933', email: '', weight: 5.7, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Чаган', fname: 'Евгения',  phone: '+79002484400', email: '', weight: 5.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Тлехурай', fname: 'Руслан',  phone: '+79181483444', email: '', weight: 4.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Соловей', fname: 'Ольга ',  phone: '+79186938647', email: '', weight: 8.0, created_at: '27.03.2016', mega: 'mega_ad'}
  {lname: 'Аксанова', fname: 'Инна',  phone: '+79528629078', email: '', weight: 3.8, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Пономаренко', fname: 'Татьяна',  phone: '+79530959099 ', email: '', weight: 10.4, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Молотилина', fname: 'Наиля',  phone: '+79183122288', email: '', weight: 4.8, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Немчинская', fname: 'Татьяна',  phone: '+79615042849', email: '', weight: 10.0, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Ожигова', fname: 'Ольга ',  phone: '+79189847113', email: '', weight: 5.3, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Алпатова', fname: 'Юлия',  phone: '+79183310724', email: '', weight: 4.6, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Мариничева', fname: 'Валентина',  phone: '+79186342146', email: '', weight: 1.5, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Добродей', fname: 'Анастасия',  phone: '+79284051248', email: '', weight: 5.4, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Утукина', fname: 'Татьяна',  phone: '+79898320238', email: '', weight: 5.1, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Понаморчук', fname: 'Ольга ',  phone: '+79884194375', email: '', weight: 5.8, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Зотова', fname: 'Татьяна',  phone: '+79648977654', email: '', weight: 5.4, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Ротко', fname: 'Евгения',  phone: '+79531170862', email: '', weight: 5.1, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Ярофеева', fname: 'Анастасия',  phone: '+79002328754', email: '', weight: 3.8, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Фирсова', fname: 'Анна',  phone: '+79181177802', email: '', weight: 9.7, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Самерханова', fname: 'Дарья',  phone: '+79182425444', email: '', weight: 8.1, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Лынникова', fname: 'Елена',  phone: '+79181670311', email: '', weight: 4.2, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Скалыженко', fname: 'Михаил',  phone: '+79628535625', email: '', weight: 5.2, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Ежак', fname: 'Сергей',  phone: '+79615858951', email: '', weight: 7.0, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Хатит', fname: 'Света',  phone: '+79189995922', email: '', weight: 4.0, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Рашитов', fname: 'Равель',  phone: '+79189770093', email: '', weight: 2.2, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Шевцова', fname: 'Татьяна',  phone: '+79615828026', email: '', weight: 5.7, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Карпенко', fname: 'Виктория',  phone: '+79184211051', email: '', weight: 5.3, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Горобец', fname: 'Любовь',  phone: '+79182711571', email: '', weight: 5.3, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Ситникова', fname: 'Елена',  phone: '+79002305250', email: '', weight: 7.0, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Бондаренко', fname: 'Елена',  phone: '+79618554808', email: '', weight: 4.4, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Малявина', fname: 'Оксана',  phone: '+79618195415', email: '', weight: 6.0, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Каратабан', fname: 'Саида',  phone: '+79184957649', email: '', weight: 2.0, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Азизова', fname: 'Мадина',  phone: '+79528375249', email: '', weight: 1.3, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Григорьев', fname: 'Алексей',  phone: '+79186934058', email: '', weight: 5.3, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Наздрина', fname: 'Людмила ',  phone: '+79189258955', email: '', weight: 6.0, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Ложиков', fname: 'Антон',  phone: '+79528181792', email: '', weight: 17.3, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Маркосьян', fname: 'Андрей',  phone: '+79181200339', email: '', weight: 5.3, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Киселёва', fname: 'Елена',  phone: '+79183743284', email: '', weight: 4.5, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Габсаматова', fname: 'Яна',  phone: '+79183132264', email: '', weight: 7.0, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Кобцева', fname: 'Людмила ',  phone: '+79184775899', email: '', weight: 5.7, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Сивокон', fname: 'Людмила ',  phone: '+79298508894', email: '', weight: 5.3, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Поляк', fname: 'Валентина',  phone: '+79180990899', email: '', weight: 13.4, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Ткаченко', fname: 'Надежда ',  phone: '+79284003827', email: '', weight: 5.6, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Плотникова', fname: 'Лилия',  phone: '+79892829017', email: '', weight: 4.7, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Коньков', fname: 'Алексей',  phone: '+79186358555', email: '', weight: 11.8, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Гергель', fname: 'Ирина',  phone: '+79011010000', email: '', weight: 6.2, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Подгорная', fname: 'Ирина',  phone: '+79604848979', email: '', weight: 2.7, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Ушенин', fname: 'Михаил',  phone: '+79061878719', email: '', weight: 4.2, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Лёгкая', fname: 'Любовь',  phone: '+79184564883', email: '', weight: 4.8, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Киреева', fname: 'Анастасия',  phone: '+79284323356', email: '', weight: 3.0, created_at: '28.03.2016', mega: 'mega_ad'}
  {lname: 'Галинская', fname: 'Светлана',  phone: '+79615815086', email: '', weight: 6.7, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Коломиец', fname: 'Татьяна',  phone: '+79184555508', email: '', weight: 4.5, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Юрчинок', fname: 'Нина',  phone: '+79180500315', email: '', weight: 4.5, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Шибанова', fname: 'Елена',  phone: '+79186002957', email: '', weight: 3.8, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Дудик', fname: 'Наталья',  phone: '+79615089975', email: '', weight: 2.5, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Тарасов', fname: 'Леонид',  phone: '+79183209278', email: '', weight: 14.6, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Меньшикова', fname: 'Юлия',  phone: '+79094554282', email: '', weight: 12.1, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Прибыткова', fname: 'Любовь',  phone: '+79183211690', email: '', weight: 1.1, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Боус', fname: 'Дина',  phone: '+79186888585', email: '', weight: 10.1, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Писаренко', fname: 'Наталья',  phone: '89181729857', email: '', weight: 4.0, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Елена', fname: 'Соколова',  phone: '89184833811', email: '', weight: 11.7, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Дарья', fname: 'Сорвина',  phone: '89186638911', email: '', weight: 16.2, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Пономарёва', fname: 'Тамара',  phone: '+79064310192', email: '', weight: 1.5, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Шарапова', fname: 'Елена',  phone: '+79054770541', email: '', weight: 9.8, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Джонмухоммад', fname: 'Асмата',  phone: '+79186843955', email: '', weight: 1.7, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Клинг', fname: 'Юлия',  phone: '+79282310133', email: '', weight: 3.8, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Литвинова', fname: 'Екатерина',  phone: '+79180092999', email: '', weight: 5.3, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Коршикова', fname: 'Валентина',  phone: '+79180106810', email: '', weight: 2.7, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Ежелова', fname: 'Татьяна',  phone: '+79189090077', email: '', weight: 5.2, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Майданкина', fname: 'Надежда ',  phone: '+79182762564', email: '', weight: 1.3, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Карпова', fname: 'Ирина',  phone: '+79182216674', email: '', weight: 6.7, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Голубятникова', fname: 'Юлия',  phone: '+79183436964', email: '', weight: 2.6, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Безрукова', fname: 'Анна',  phone: '+79180449595', email: '', weight: 2.9, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Падалка', fname: 'Екатерина',  phone: '+79184315612', email: '', weight: 9.5, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Аламанкина', fname: 'Алена',  phone: '+79182604050', email: '', weight: 6.8, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Медведева', fname: 'Ольга ',  phone: '+79180246397', email: '', weight: 5.8, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Медведева', fname: 'Полина',  phone: '+79094686437', email: '', weight: 9.7, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Худына', fname: 'Нина',  phone: '+79184807937', email: '', weight: 8.6, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Радуль', fname: 'Екатерина',  phone: '+79181610727', email: '', weight: 3.3, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Бадоян', fname: 'Елена',  phone: '+79181970775', email: '', weight: 10.4, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Оксюк', fname: 'Ольга ',  phone: '+79182971616', email: '', weight: 5.0, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Аганин', fname: 'Сегрей',  phone: '+79064387669', email: '', weight: 3.1, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Кривоконь', fname: 'Владимир',  phone: '+79183138102', email: '', weight: 4.2, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Шумная', fname: 'Людмила ',  phone: '+79284094915', email: '', weight: 4.0, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Волихова', fname: 'Марина',  phone: '+79531104460', email: '', weight: 10.6, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Бердыш', fname: 'Наталья',  phone: '+79086790457', email: '', weight: 2.8, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Лебедев', fname: 'Елена',  phone: '+79184168661', email: '', weight: 14.4, created_at: '29.03.2016', mega: 'mega_ad'}
  {lname: 'Шпитальная', fname: 'Татьяна',  phone: '+79184591142', email: '', weight: 5.4, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Сорокопуд', fname: 'Ольга ',  phone: '+79184424526', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Костерина', fname: 'Наталья',  phone: '+79528613783', email: '', weight: 6.5, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Кукульян', fname: 'Мария ',  phone: '+79184812689', email: '', weight: 5.1, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Хакуй ', fname: 'Зарема',  phone: '+79182210264', email: '', weight: 5.3, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Хакуй ', fname: 'Марина',  phone: '+79180722588', email: '', weight: 6.6, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Барчо', fname: 'Мурат',  phone: '+79183214622', email: '', weight: 5.6, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Шибанова', fname: 'Елена',  phone: '+79186002957', email: '', weight: 2.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Шаповалова', fname: 'Светлана',  phone: '+79094609231', email: '', weight: 2.5, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Патрушева', fname: 'Ольга ',  phone: '+79282377740', email: '', weight: 2.9, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Рощупкина', fname: 'Анастасия',  phone: '+79094447519', email: '', weight: 4.2, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Алпатова', fname: 'Юлия',  phone: '+79183310724', email: '', weight: 2.5, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Кукурьян', fname: 'Юрий',  phone: '+79184812683', email: '', weight: 10.3, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Калякина', fname: 'Кристина',  phone: '+79530911084', email: '', weight: 5.2, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Калякин', fname: 'Роман',  phone: '+79884600387', email: '', weight: 6.3, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Беляева', fname: 'Яна',  phone: '+79186235217', email: '', weight: 3.7, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Шевцова', fname: 'Яна',  phone: '+79186933763', email: '', weight: 2.9, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Лобачёва', fname: 'Марина',  phone: '+79186494049', email: '', weight: 5.1, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Евсеев', fname: 'Андрей',  phone: '+79086787950', email: '', weight: 3.9, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Железняков', fname: 'Анатолий',  phone: '+79180879681', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Железнякова', fname: 'Людмила ',  phone: '+79530854120', email: '', weight: 4.6, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Кульбина', fname: 'Наталья',  phone: '+79183707709', email: '', weight: 4.3, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Загородская', fname: 'Ирина',  phone: '+79298308872', email: '', weight: 2.6, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Татульян', fname: 'Снежана',  phone: '+79184120115', email: '', weight: 2.5, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Татульян', fname: 'Сагак',  phone: '+79186109840', email: '', weight: 2.7, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Симельникова', fname: 'Милана',  phone: '+79531055077', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Бордиловская', fname: 'Татьяна',  phone: '+79284252948', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Бордиловский', fname: 'Андрей',  phone: '+79282585761', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Усталов', fname: 'Михаил',  phone: '+79184161182', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Хачатуров', fname: 'Сергей',  phone: '+79183730773', email: '', weight: 2.6, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Ситова', fname: 'Лариса',  phone: '+79181536746', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Зуев', fname: 'Александр',  phone: '+79384030946', email: '', weight: 5.2, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Лысенко', fname: 'Екатерина',  phone: '+79898103208', email: '', weight: 4.6, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Здоровенко', fname: 'Антонина',  phone: '+79094462553', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Панина', fname: 'Юлия',  phone: '+79649198900', email: '', weight: 4.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Петрова', fname: 'Светлана',  phone: '+79628809849', email: '', weight: 4.6, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Шелестов', fname: 'Сергей',  phone: '+79182115656', email: '', weight: 4.5, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Устинов', fname: 'Андрей',  phone: '+79284362033', email: '', weight: 5.1, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Устинова', fname: 'Елена',  phone: '+79282320245', email: '', weight: 1.1, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Непиющая', fname: 'Марина',  phone: '+79184346677', email: '', weight: 3.9, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Семёнова', fname: 'Наталья',  phone: '+79034599017', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Семёнов', fname: 'Владимир',  phone: '+79034516868', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Семёнов', fname: 'Виктор',  phone: '+79615011070', email: '', weight: 2.5, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Устинова', fname: 'Елена',  phone: '+79282320245', email: '', weight: 3.9, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Ашанова', fname: 'Ирина',  phone: '+79094442708', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Чагадаев', fname: 'Павел',  phone: '+79528613713', email: '', weight: 5.1, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Чагадаева', fname: 'Ирина',  phone: '+79529862043', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Чагодаева', fname: 'Анна',  phone: '+79673068841', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Шарабаева', fname: 'Марина',  phone: '+79184680629', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Сиваканян', fname: 'Юрий',  phone: '+79282050878', email: '', weight: 5.1, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Осипова', fname: 'Людмила ',  phone: '+79183247433', email: '', weight: 5.2, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Борисова', fname: 'Валентина',  phone: '+79604945751', email: '', weight: 4.7, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Самойленко', fname: 'Ольга ',  phone: '+79184492437', email: '', weight: 5.2, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Бойчук', fname: 'Ирина',  phone: '+79189498714', email: '', weight: 2.4, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Оганесян', fname: 'Лаура',  phone: '+79181243833', email: '', weight: 5.1, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Аванесян', fname: 'Анна',  phone: '+79858880882', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Нагапетян', fname: 'Арсен',  phone: '+79858887818', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Ковтунова', fname: 'Ксения',  phone: '+79615255520', email: '', weight: 5.1, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Истягин', fname: 'Андрей',  phone: '+79604882783', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Шульга', fname: 'Виорика',  phone: '+79604742745', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Кутушев', fname: 'Сергей',  phone: '+79604710270', email: '', weight: 2.1, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Ефремова', fname: 'Екатерина',  phone: '+79189260160', email: '', weight: 2.6, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Халинева', fname: 'Карина',  phone: '+79676542848', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Иванова', fname: 'Оксана',  phone: '+79649090662', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Щербаков', fname: 'Андрей',  phone: '+79897655240', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Давыдова', fname: 'Елена',  phone: '+79180511213', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Ковригина', fname: 'Олеся',  phone: '+79528266043', email: '', weight: 5.1, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Чегодаев', fname: 'Виктор',  phone: '+79528613705', email: '', weight: 5.0, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Чумаченко', fname: 'Мария ',  phone: '+79189974600', email: '', weight: 2.5, created_at: '30.03.2016', mega: 'mega_ad'}
  {lname: 'Быкова', fname: 'Анна',  phone: '+79183111148', email: '', weight: 5.1, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Быков', fname: 'Евгений',  phone: '+79182399863', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Третьякова', fname: 'Светлана',  phone: '+79604925126', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Еськин', fname: 'Сергей',  phone: '+79094698530', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  #ССЫЛ!
  {lname: 'Кизиль', fname: 'Светлана',  phone: '+79186756808', email: '', weight: 5.1, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Осадчая', fname: 'Светлана',  phone: '+79181503253', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Мартынова', fname: 'Елена',  phone: '+79282025348', email: '', weight: 4.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Медведева', fname: 'Анастасия',  phone: '+79186487628', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Вальгер', fname: 'Анастасия',  phone: '+79186622830', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Медведева', fname: 'Елена',  phone: '+79189967369', email: '', weight: 4.5, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Силиверстова', fname: 'Татьяна',  phone: '+79184608097', email: '', weight: 2.8, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Бондаренко', fname: 'Никита',  phone: '+79654576620', email: '', weight: 3.4, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Петренко', fname: 'Ярослава',  phone: '+79528789999', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Москаленко', fname: 'Анастасия',  phone: '+79604991942', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Колтунова', fname: 'Наталья',  phone: '+79180106569', email: '', weight: 5.1, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Колтунов', fname: 'Александр',  phone: '+79180106468', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Иванова', fname: 'Оксана',  phone: '+79648956435', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Махно', fname: 'Юрий',  phone: '+79649141160', email: '', weight: 5.2, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Ковригина', fname: 'Олеся',  phone: '+79528266043', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Чагодаева', fname: 'Анна',  phone: '+79673068841', email: '', weight: 5.1, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Чагодаев', fname: 'Виктор',  phone: '+79528613705', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Чагодаев', fname: 'Павел',  phone: '+79528613713', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Чигадаева', fname: 'Ирина',  phone: '+79529862043', email: '', weight: 5.1, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Ярмошевич', fname: 'Мария ',  phone: '+79527628453', email: '', weight: 2.7, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Железнякова', fname: 'Людмила ',  phone: '+79530854120', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Зубкова', fname: 'Мария ',  phone: '+79002502455', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Железняков', fname: 'Анатолий',  phone: '+79002719016', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Кульбина', fname: 'Наталья',  phone: '+79183707709', email: '', weight: 2.6, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Панфилова', fname: 'Наталья',  phone: '+79886701868', email: '', weight: 5.1, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Сафронов', fname: 'Матвей',  phone: '+79180107234', email: '', weight: 5.1, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Сафронова', fname: 'Лидия',  phone: '+79180494644', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Волобуев', fname: 'Александр',  phone: '+79528579481', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Верченко', fname: 'Екатерина',  phone: '+79183423213', email: '', weight: 2.5, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Рахматулина', fname: 'Ирина',  phone: '+79183043793', email: '', weight: 4.6, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Ивах', fname: 'Анастасия',  phone: '+79528241555', email: '', weight: 3.6, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Кириченко', fname: 'Ирина',  phone: '+79182778213', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Якубов', fname: 'Руслан',  phone: '+79384333554', email: '', weight: 3.6, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Хатит', fname: 'Ася',  phone: '+79183136761', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Варчо', fname: 'Али',  phone: '+79996369608', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Смирнов', fname: 'Сергей',  phone: '+79385522868', email: '', weight: 5.1, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Агаджанян', fname: 'Георгий',  phone: '+79528680184', email: '', weight: 5.1, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Баранова', fname: 'Екатерина',  phone: '+79604747954', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Баранова', fname: 'Мария ',  phone: '+79618190097', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Муртазинова', fname: 'Ольга ',  phone: '+79618544347', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Прокопенко', fname: 'Наталья',  phone: '+79676624901', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Бедарева', fname: 'Лидия',  phone: '+79886032915', email: '', weight: 1.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Овсепьянц', fname: 'Ольга ',  phone: '+79298278782', email: '', weight: 2.6, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Герасимова', fname: 'Татьяна',  phone: '+79184359850', email: '', weight: 3.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Рубан', fname: 'Наталья',  phone: '+79094554763', email: '', weight: 1.8, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Еремеев', fname: 'Константин',  phone: '+79649385750', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Еремеева', fname: 'Валентина',  phone: '+79184267126', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Яковенко', fname: 'Виталий',  phone: '+79897640009', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Лыйман', fname: 'Юлия',  phone: '+79184202299', email: '', weight: 1.6, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Евсеев', fname: 'Андрей',  phone: '+79086787950', email: '', weight: 3.6, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Евсеева', fname: 'Марина',  phone: '+79615165879', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Власов', fname: 'Николай',  phone: '+79184784592', email: '', weight: 0.4, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Власов', fname: 'Денис',  phone: '+79180696999', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Власова', fname: 'Нина',  phone: '+79184958050', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Сидарец', fname: 'Юлия',  phone: '+79282068265', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Касян', fname: 'Мурат',  phone: '+79180477333', email: '', weight: 5.2, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Шевцова', fname: 'Анастасия',  phone: '+79189240263', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Горобец', fname: 'Любовь',  phone: '+79182711571', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Пащенко', fname: 'Валентина',  phone: '+79184291086', email: '', weight: 4.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Александр', fname: 'Павлычев',  phone: '+79181687062', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Вылегжанина', fname: 'Елена',  phone: '+79183552472', email: '', weight: 5.1, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Пирогова', fname: 'Неля',  phone: '+79189382918', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Цмиханов', fname: 'Нажмудин',  phone: '+79284008830', email: '', weight: 3.2, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Морозова', fname: 'Дарья',  phone: '+79883335702', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Галякин', fname: 'Алексей',  phone: '+79883576435', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Ханина', fname: 'Ирина',  phone: '+79673047757', email: '', weight: 1.2, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Резникова', fname: 'Антонина',  phone: '+79284093126', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Годак', fname: 'Людмила ',  phone: '+79186962154', email: '', weight: 4.5, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Редкогород', fname: 'Ирина',  phone: '+79528567806', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Большанова', fname: 'Екатерина',  phone: '+79184432800', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Баранова', fname: 'Виолетта',  phone: '+79180934461', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Бальшанова', fname: 'Марина',  phone: '+79282729142', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Черненко', fname: 'Игорь',  phone: '+79181348680', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Меркулов', fname: 'Никита',  phone: '+79181970307', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Алёшкин', fname: 'Артём',  phone: '+79189354769', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Гондаренко', fname: 'Анна',  phone: '+79288414105', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Недбайло', fname: 'Анна',  phone: '+79280440388', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Балашова', fname: 'Наталья',  phone: '+79182301093', email: '', weight: 3.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Чумаченко', fname: 'Виталина',  phone: '+79282401828', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Татарникова', fname: 'Наталья',  phone: '+79180802578', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Татарников', fname: 'Александр',  phone: '+79384929244', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Ташырева', fname: 'Марьяна',  phone: '+79189427985', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Ташырев', fname: 'Андрей',  phone: '+79189427986', email: '', weight: 3.4, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Черникова', fname: 'Екатерина',  phone: '+79183110211', email: '', weight: 1.9, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Карпенко', fname: 'Виктория',  phone: '+79184211051', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Шевцова', fname: 'Мария ',  phone: '+79615074674', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Рыжова', fname: 'Виктория',  phone: '+79180774965', email: '', weight: 5.1, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Максименко', fname: 'Юлия',  phone: '+79649302909', email: '', weight: 5.1, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Петросян', fname: 'Венера',  phone: '+79184512670', email: '', weight: 3.4, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Павлинова', fname: 'Оксана',  phone: '+79181817975', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Павлинов', fname: 'Антон',  phone: '+79184165713', email: '', weight: 3.9, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Куако', fname: 'Эмма',  phone: '+79183869492', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Слободская', fname: 'Елена',  phone: '+79615071000', email: '', weight: 4.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Попова', fname: 'Татьяна',  phone: '+79649162676', email: '', weight: 5.1, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Марченко', fname: 'Валентин',  phone: '+79649229678', email: '', weight: 3.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Баранова', fname: 'Валерий',  phone: '+7918428714', email: '', weight: 5.1, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Мищихина', fname: 'Марина',  phone: '+79184288241', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Грудкин', fname: 'Армен',  phone: '+79034520965', email: '', weight: 4.5, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Петрова', fname: 'Надежда',  phone: '+79184281230', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Владимиров', fname: 'Александр',  phone: '+79184222467', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Павлычева', fname: 'Ольга ',  phone: '+79182513141', email: '', weight: 1.1, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Солод', fname: 'Екатерина',  phone: '+79615130964', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Глушко', fname: 'Софья',  phone: '+79673048711', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Кузнецов', fname: 'Максим',  phone: '+79180170024', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Карпаченко', fname: 'Диана',  phone: '+79676610662', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Ковалёва', fname: 'Елена',  phone: '+79615291178', email: '', weight: 3.3, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Кумук', fname: 'Адам',  phone: '+79284748014', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Виктория', fname: 'Грибачёва',  phone: '+79184716684', email: '', weight: 4.3, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Шеремета', fname: 'Екатерина',  phone: '+79181921320', email: '', weight: 4.7, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Верченко', fname: 'Екатерина',  phone: '+79183423213', email: '', weight: 2.5, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Скиба', fname: 'Валерия',  phone: '+79184440518', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Нагапетян', fname: 'Арсен',  phone: '+79858887818', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Гладких', fname: 'Антон',  phone: '+79186999972', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Александрова', fname: 'Кристина',  phone: '+79180813240', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Иванова', fname: 'Александр',  phone: '+79615330094', email: '', weight: 4.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Рослякова', fname: 'Екатерина',  phone: '+79604896389', email: '', weight: 5.1, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Зорин', fname: 'Александр',  phone: '+79094590372', email: '', weight: 3.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Утукин', fname: 'Сергей',  phone: '+79181477077', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Скороходова', fname: 'Татьяна',  phone: '+79528726623', email: '', weight: 5.0, created_at: '31.03.2016', mega: 'mega_ad'}
  {lname: 'Клинков', fname: 'Анатолий',  phone: '+79184558621', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Клинкова', fname: 'Наталья',  phone: '+79181596544', email: '', weight: 5.1, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Скрипкина', fname: 'Ирина',  phone: '+79184993168', email: '', weight: 3.8, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Мишустина', fname: 'Елена',  phone: '+79182927788', email: '', weight: 2.6, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Кульбина', fname: 'Наталья',  phone: '+79183707709', email: '', weight: 1.4, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Сабадашова', fname: 'Марина',  phone: '+79284050090', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Сабадашова', fname: 'Марина',  phone: '+79604754970', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Сабадашов', fname: 'Константин',  phone: '+79086853883', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Еремев', fname: 'Константин',  phone: '+79649385750', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Смирнов', fname: 'Сергей',  phone: '+79385522868', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Михалкина', fname: 'Виктория',  phone: '+79094463524', email: '', weight: 4.5, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Болдакова', fname: 'Юлия',  phone: '+79384016827', email: '', weight: 1.1, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Комкова', fname: 'Инна',  phone: '+79884891888', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Мотвиенко', fname: 'Людмила ',  phone: '+79184473871', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Мотвиенко', fname: 'Анна',  phone: '+79054940067', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Коломиец', fname: 'Татьяна',  phone: '+79184555508', email: '', weight: 1.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Неринг', fname: 'Алёна',  phone: '+79184516850', email: '', weight: 5.1, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Щербаков', fname: 'Олег',  phone: '+79189713333', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Петрова', fname: 'Ирина',  phone: '+79531093705', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Антошин', fname: 'Артём',  phone: '+79189377878', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Потошина', fname: 'Инна',  phone: '+79898388624', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Паныч', fname: 'Екатерина',  phone: '+79181457192', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Тюльченко', fname: 'Александр',  phone: '+79184296104', email: '', weight: 2.7, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Мишустина', fname: 'Елена',  phone: '+79182927788', email: '', weight: 2.5, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Ковригина', fname: 'Олеся',  phone: '+79528266043', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Чагодаев', fname: 'Виктор',  phone: '+79528613705', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Чагодаева', fname: 'Анна',  phone: '+79673068841', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Морозова', fname: 'Дарья',  phone: '+79883335702', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Мирошниченко', fname: 'Агата',  phone: '+79282959259', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Чавликова', fname: 'Людмила ',  phone: '+79615262756', email: '', weight: 2.1, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Паймакова', fname: 'Лариса',  phone: '+79189357260', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Слупицкая', fname: 'Людмила ',  phone: '+79184426768', email: '', weight: 4.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Ганченко', fname: 'Елена',  phone: '+79618534063', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Салиев', fname: 'Николай',  phone: '+79183435692', email: '', weight: 1.5, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Курзина', fname: 'Зульфия',  phone: '+79183707351', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Железнеков', fname: 'Анатолий',  phone: '+79002719016', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Гуща', fname: 'Мария ',  phone: '+79184488496', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Пащенко', fname: 'Валентина',  phone: '+79184291086', email: '', weight: 4.1, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'алиебердова', fname: 'Сусанна',  phone: '+79184274245', email: '', weight: 5.1, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Алиебердов', fname: 'Эдуард',  phone: '+79182254481', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Михалкин', fname: 'Максим',  phone: '+79628568424', email: '', weight: 5.3, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Ханина', fname: 'Ирина',  phone: '+79673047757', email: '', weight: 3.8, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Смольникова', fname: 'Катарина',  phone: '+79180803734', email: '', weight: 3.5, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Лисицина', fname: 'Валентина',  phone: '+79881886500', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Лисицин', fname: 'Георгий',  phone: '+79881886700', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Лисицина', fname: 'Наталья',  phone: '+79649191939', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Артёменко', fname: 'Татьяна',  phone: '+79183439736', email: '', weight: 5.1, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Артёменко', fname: 'Анастасия',  phone: '+79183479830', email: '', weight: 4.1, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Горбическая', fname: 'Оксана',  phone: '+79186865894', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Гашинова', fname: 'Эллина',  phone: '+79182701091', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Аксюк', fname: 'Татьяна',  phone: '+79898241347', email: '', weight: 5.1, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Сокольская', fname: 'Екатерина',  phone: '+79181366548', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Шихова', fname: 'Анна',  phone: '+79284329590', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Шаповалова', fname: 'Анастасия',  phone: '+79649135994', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Павлычев', fname: 'Александр',  phone: '+79181687062', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Муртазин', fname: 'Анеета',  phone: '+79286636872', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Даштова', fname: 'Ася',  phone: '+79284680440', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Бирков', fname: 'Каплан',  phone: '+79280373999', email: '', weight: 3.7, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Молотилина', fname: 'Наиля',  phone: '+79183122288', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Кутухин', fname: 'Алексей',  phone: '+79282232058', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Белоусов', fname: 'Андрей',  phone: '+79615922247', email: '', weight: 4.7, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Кузнецова', fname: 'Дарья',  phone: '+79676595760', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Каптур', fname: 'Юлия',  phone: '+79530707292', email: '', weight: 5.1, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Назиренко', fname: 'Дарья',  phone: '+79528416092', email: '', weight: 5.1, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Абакумов', fname: 'Алексей',  phone: '+79180105705', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Щетникова', fname: 'Елена',  phone: '+79181503570', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Щетников', fname: 'Олег',  phone: '+79184603644', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Гайворонская', fname: 'Анна',  phone: '+79892107419', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Петрищина', fname: 'Виктория',  phone: '+79054749006', email: '', weight: 1.1, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Пригарина', fname: 'Наталия',  phone: '+79892600715', email: '', weight: 3.4, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Пригарин', fname: 'Ярослав',  phone: '+79648914593', email: '', weight: 1.8, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Клачёва', fname: 'Кристина',  phone: '+79282924366', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Клачёв', fname: 'Евгений',  phone: '+79282711360', email: '', weight: 4.6, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Устинова', fname: 'Елена',  phone: '+79282320245', email: '', weight: 1.8, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Маркасьян', fname: 'Антаран',  phone: '+79282320245', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Черилова', fname: 'Евгения',  phone: '+79186617717', email: '', weight: 3.3, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Алтунбаева', fname: 'Асия',  phone: '+79002961701', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Аркаева', fname: 'Умма',  phone: '+79288834464', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Колесникова', fname: 'Оксана',  phone: '+79189005446', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Верченко', fname: 'Екатерина',  phone: '+79183423213', email: '', weight: 2.5, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Максимова', fname: 'Таисия',  phone: '+79189551476', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Паленая', fname: 'Анастасия',  phone: '+79180056805', email: '', weight: 1.4, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Фаменко', fname: 'Юлия',  phone: '+79883633936', email: '', weight: 4.9, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Макеева', fname: 'Марина',  phone: '+79189088713', email: '', weight: 1.6, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Бертенева', fname: 'Елена',  phone: '+79184989835', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Бас', fname: 'Ольга ',  phone: '+79184871835', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Лебедева', fname: 'Елена',  phone: '+79884769901', email: '', weight: 3.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'петровна', fname: 'Надежда',  phone: '+79184281230', email: '', weight: 5.2, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Лунёва', fname: 'Яна',  phone: '+79384740927', email: '', weight: 5.1, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Лунёв ', fname: 'Максим',  phone: '+79384740878', email: '', weight: 5.2, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Борисова', fname: 'Валентина',  phone: '+79604945751', email: '', weight: 4.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Якель', fname: 'Мария ',  phone: '+79189617519', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Якель', fname: 'Алексей',  phone: '+79184468322', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Дульцев', fname: 'Алексей',  phone: '+79288447697', email: '', weight: 5.1, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Чернякова', fname: 'Лариса',  phone: '+79898151215', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Чернякова', fname: 'Елена',  phone: '+79184672836', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Скрипник', fname: 'Анастасия',  phone: '+79615320076', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Морозова', fname: 'Дарья',  phone: '+79181183828', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Морозов', fname: 'Павел',  phone: '+79183967779', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Кобельков', fname: 'Андрей',  phone: '+79627678693', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Волкова', fname: 'Роза',  phone: '+79892855555', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Волкова', fname: 'Орис',  phone: '+79892877777', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Муксинова', fname: 'Суфия',  phone: '+79183689285', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Татарина', fname: 'Татьяна',  phone: '+79184177862', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Джалишева', fname: 'Роза',  phone: '+79385521125', email: '', weight: 5.1, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Валиев', fname: 'Расул',  phone: '+79182240646', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Петрова', fname: 'Светлана',  phone: '+79628809849', email: '', weight: 0.4, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Параев', fname: 'Александр',  phone: '+79189530464', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Бойчук', fname: 'Ирина',  phone: '+79189498714', email: '', weight: 5.3, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Стась', fname: 'Наталья',  phone: '+79183881770', email: '', weight: 5.1, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Курдюкова', fname: 'Елена',  phone: '+79184507487', email: '', weight: 3.5, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Кулажонок', fname: 'Евгений',  phone: '+79002613952', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Липнина', fname: 'Татьяна',  phone: '+79180878735', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Самусаев', fname: 'Сергей',  phone: '+79184676665', email: '', weight: 5.4, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Миронова', fname: 'Светлана',  phone: '+79604899531', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Миронов', fname: 'Михаил',  phone: '+79182614550', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Назарова', fname: 'Татьяна',  phone: '+79180235160', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Барба', fname: 'Людмила ',  phone: '+79024081944', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Козлов', fname: 'Василий',  phone: '+79628807483', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Брилёва', fname: 'Лариса',  phone: '+79186233122', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Кузекмаева', fname: 'Татьяна',  phone: ' +79181027447  ', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Жукова', fname: 'Татьяна',  phone: '+79673050630', email: '', weight: 0.4, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Кравченко', fname: 'Наталья',  phone: '+79184659585', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Рылина', fname: 'Олеся',  phone: '+79181199769', email: '', weight: 3.7, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Бровалёва', fname: 'Ольга ',  phone: '+79604759208', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Полуэктова', fname: 'Елена',  phone: '+79002660833', email: '', weight: 3.2, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Петрова', fname: 'Ирина',  phone: '+79531093705', email: '', weight: 5.1, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Каширская', fname: 'Мария ',  phone: '+79094614946', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Волкова', fname: 'Артём',  phone: '+79064342437', email: '', weight: 5.1, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Бумбак', fname: 'Юлия',  phone: '+79618518323', email: '', weight: 2.2, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Вебер', fname: 'Лидия',  phone: '+79183136077', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Мелихова', fname: 'Анна',  phone: '+79184380884', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Розенберг', fname: 'Виктор',  phone: '+79618271052', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Оглы', fname: 'Роман',  phone: '+79649382001', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Чуриев', fname: 'Махомод',  phone: '+79618270842', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Казаков', fname: 'Дима',  phone: '+79628742896', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Оглы', fname: 'Артур',  phone: '+79654578112', email: '', weight: 5.3, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Мелина', fname: 'Татьяна',  phone: '+79182188881', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Чцхраева', fname: 'Ирина',  phone: '+79180332302', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Мищихина', fname: 'Марина',  phone: '+79184288241', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Слука', fname: 'Игорь',  phone: '+79183801000', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Щербаков', fname: 'Олег',  phone: '+79189713333', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Щербакова', fname: 'Любовь',  phone: '+79183888806', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Озерова', fname: 'Лариса',  phone: '+79183458582', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Лузан', fname: 'Ирина',  phone: '+79284173344', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Мамий', fname: 'Елена',  phone: '+79184765476', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Рутина', fname: 'Наталья',  phone: '+79184927009', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Казаков', fname: 'Владимир',  phone: '+79183348105', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Казакова', fname: 'Людмила ',  phone: '+79181149979', email: '', weight: 2.9, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Устинова', fname: 'Елена',  phone: '+79282320245', email: '', weight: 2.5, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Кривошапко', fname: 'Ольга ',  phone: '+79184172626', email: '', weight: 3.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Леходедова', fname: 'Картина',  phone: '+79604916882', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Валеева', fname: 'Татьяна',  phone: '+79184923241', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Гаджанян', fname: 'Георгий',  phone: '+79528680184', email: '', weight: 5.1, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Брус', fname: 'Оксана',  phone: '+79184789513', email: '', weight: 1.2, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Брус', fname: 'Оксана',  phone: '+79184789513', email: '', weight: 2.6, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Марченко', fname: 'Григорий',  phone: '+79002386081', email: '', weight: 5.1, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Марченко', fname: 'Светлана',  phone: '+79002386080', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Сидорова', fname: 'Надежда',  phone: '+79094535054', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Бажанов', fname: 'Геннадий',  phone: '+79892697177', email: '', weight: 3.9, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Бажанова', fname: 'Диана',  phone: '+79181488087', email: '', weight: 2.5, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Белорицкая', fname: 'Виктория',  phone: '+79182792585', email: '', weight: 5.1, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Сидоренко', fname: 'Сергей',  phone: '+79184395810', email: '', weight: 2.5, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Скальженко', fname: 'Михаил',  phone: '+79628535625', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Бейдик', fname: 'Елена',  phone: '+79385328885', email: '', weight: 2.5, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Шеремета', fname: 'Екатерина',  phone: '+79628535625', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Устинова', fname: 'Андрей',  phone: '+79284362033', email: '', weight: 2.5, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Дмитриева', fname: 'Галина',  phone: '+79183835435', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Скрынникова', fname: 'Наталья',  phone: '+79183888218', email: '', weight: 5.1, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Скрипкина', fname: 'Ирина',  phone: '+79184993168', email: '', weight: 2.5, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Кравцова', fname: 'Олеся',  phone: '+79628627027', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Кравченко', fname: 'Александра',  phone: '+79181188090', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Якуба', fname: 'Софья',  phone: '+79181611113', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Абрамова', fname: 'Нина',  phone: '+79034526805', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Скрипник', fname: 'Анастасия',  phone: '+79615320076', email: '', weight: 5.1, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Анисимова', fname: 'Нина',  phone: '+79182257280', email: '', weight: 4.2, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Панфилова', fname: 'Наталья',  phone: '+79886701868', email: '', weight: 3.8, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Шевченко', fname: 'Вероника',  phone: '+79892747274', email: '', weight: 5.1, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Алибертова', fname: 'Рима',  phone: '+79648911918', email: '', weight: 5.1, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Папова', fname: 'Ирина',  phone: '+79284433082', email: '', weight: 3.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Ермаков', fname: 'Николай',  phone: '+79180600660', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Нестеренко', fname: 'Сергей',  phone: '+79189225071', email: '', weight: 4.3, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Давыгора', fname: 'Дарья',  phone: '+79094600115', email: '', weight: 1.2, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Рокоянская', fname: 'Тамара',  phone: '+79298522530', email: '', weight: 2.5, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Азовцева', fname: 'Анна',  phone: '+79604377871', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Савченко', fname: 'Андрей',  phone: '+79094636771', email: '', weight: 2.5, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Ланская', fname: 'Анастасия',  phone: '+79186766855', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Курдумова', fname: 'Анастасия',  phone: '+79186497130', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Птрушенко', fname: 'Татьяна',  phone: '+79886049753', email: '', weight: 5.1, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Маргорян', fname: 'Арарат',  phone: '+79649055560', email: '', weight: 5.1, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Кумеркина', fname: 'Анастасия',  phone: '+79181447514', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Малыхина', fname: 'Ригина',  phone: '+79883517799', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Посивенко', fname: 'Наталья',  phone: '+79182230616', email: '', weight: 4.7, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Луцкая', fname: 'Галина',  phone: '+79183753935', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Луцкий', fname: 'Юрий',  phone: '+79186418414', email: '', weight: 5.1, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Луцкий', fname: 'Дмитрий',  phone: '+79184487041', email: '', weight: 5.1, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Ермакова', fname: 'Наталья',  phone: '+79180413947', email: '', weight: 3.2, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Гутерман', fname: 'Наталья',  phone: '+79186305009', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Абрамова', fname: 'Раиса',  phone: '+79183534150', email: '', weight: 4.8, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Орлова', fname: 'Юлия',  phone: '+79181644430', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Орлов', fname: 'Юрий',  phone: '+79183953881', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Шаруда', fname: 'Инесса',  phone: '+79530858226', email: '', weight: 3.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Чавликова', fname: 'Людмила ',  phone: '+79615262756', email: '', weight: 3.4, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Щербина', fname: 'Анастасия',  phone: '+79183745004', email: '', weight: 2.6, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Моргун', fname: 'Оксана',  phone: '+79898280004', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Купор', fname: 'Елена',  phone: '+79604965144', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Купор', fname: 'Николай',  phone: '+79183721929', email: '', weight: 5.1, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Кустанова', fname: 'Ольга ',  phone: '+79181616217', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Кустанов', fname: 'Егор',  phone: '+79186782240', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Воровская', fname: 'Елена',  phone: '+79186823517', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Мамий', fname: 'Михаил',  phone: '+79884785338', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Мамий', fname: 'Елена',  phone: '+79180192525', email: '', weight: 4.1, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Маргуй', fname: 'Марина',  phone: '+79181762316', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Ковычкова', fname: 'Ольга ',  phone: '+79183855251', email: '', weight: 6.6, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Хайдукова', fname: 'Дарья',  phone: '+79182533791', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Гоголинский', fname: 'Владислав',  phone: '+79531081124', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Хайдуков', fname: 'Алексей',  phone: '+79182533793', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Абашева', fname: 'Наталья',  phone: '+79181680871', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Кракосенко', fname: 'Татьяна',  phone: '+79094526619', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Кракосенко', fname: 'Оксана',  phone: '+79649197721', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Хайдукова', fname: 'Лариса',  phone: '+79182645400', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Новиков', fname: 'Валерий',  phone: '+79898502179', email: '', weight: 5.0, created_at: '05.04.2016', mega: 'mega_ad'}
  {lname: 'Хайдуков', fname: 'Александр',  phone: '+79182533794', email: '', weight: 5.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Макаренко', fname: 'Галина',  phone: '+79181340156', email: '', weight: 9.1, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Панасюк', fname: 'Анна',  phone: '+791838415785', email: '', weight: 1.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Колодова', fname: 'Мария',  phone: '+79286615366', email: '', weight: 12.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Дологуб', fname: 'Юзиль',  phone: '+79892614761', email: '', weight: 6.3, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Кезик', fname: 'Валентина',  phone: '+79002382495', email: '', weight: 4.2, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Степанова', fname: 'Анна',  phone: '+79649264957', email: '', weight: 4.1, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Ким', fname: 'Мария',  phone: '+79528696423', email: '', weight: 10.0, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Шулика', fname: 'Лариса',  phone: '+79181683453', email: '', weight: 9.9, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Гудкова', fname: 'Ангелина',  phone: '+79054020168', email: '', weight: 5.3, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Кухаренко', fname: 'Сергей',  phone: '+79180872162', email: '', weight: 10.9, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Назаренко', fname: 'Валентина',  phone: '+79181265277', email: '', weight: 10.2, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Жиляков', fname: 'Сергей',  phone: '+79298239933', email: '', weight: 6.6, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Труфанова', fname: 'Алёна',  phone: '+79189478636', email: '', weight: 14.4, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Богумен', fname: 'Варвара',  phone: '+79182945191', email: '', weight: 9.2, created_at: '01.04.2016', mega: 'mega_ad'}
  {lname: 'Ржих', fname: 'Ольга ',  phone: '+79182393180', email: '', weight: 1.1, created_at: '01.04.2016', mega: 'mega_ad'}
  ]



# database connection
mongoose.connect(config.db.path + config.db.name)
db = mongoose.connection

db.on 'error', (err)->
  console.log "Error connection to database: ", err
db.once 'open', ()->
  console.log "Connected to db!"

  # Schemas loading
  PreRegisterModel = require('./schemas/preregister.coffee').get mongoose
  WeightModel = require('./schemas/weight.coffee').get mongoose

  getMega = (mega_login)->
    mega_login = mega_login.toUpperCase()
    res = switch
      when mega_login is "MEGA_TS" then 0
      when mega_login is "MEGA_BD" then 1
      when mega_login is "MEGA_KH" then 2
      when mega_login is "MEGA_DY" then 3
      when mega_login is "MEGA_PA" then 4
      when mega_login is "MEGA_AD" then 5
      when mega_login is "MEGA_EK" then 6
      when mega_login is "MEGA_KA" then 7
      when mega_login is "MEGA_NN" then 8
      when mega_login is "MEGA_NO" then 9
      when mega_login is "MEGA_OM" then 10
      when mega_login is "MEGA_RO" then 11
      when mega_login is "MEGA_SA" then 12
      when mega_login is "MEGA_UF" then 13
      when mega_login is "MOBILE_TS" then 14
      when mega_login is "MOBILE_BD" then 14
      when mega_login is "MOBILE_KH" then 14
      when mega_login is "MOBILE_DY" then 14
      when mega_login is "MOBILE_PA" then 14
      when mega_login is "MOBILE_EK" then 14
      when mega_login is "MOBILE_OM" then 14
      when mega_login is "MOBILE_RO" then 14
      when mega_login is "MOBILE_SA" then 14
      when mega_login is "MOBILE_UF" then 14

  createWeight = (message, record, weight, created_at, mega, cb)->
    _data = 
      weight: weight
      created_at: moment(created_at, "DD.MM.YYYY").format()
      mega: getMega mega
      whos: mega
      owner: record._id

    model = new WeightModel _data
    model.save ()->
      message += "Created weight for record " + record.phone + ": " + weight + "kg "

      today_income = 0
      now = created_at
      for w in record.weight
        w_date = moment(w.created_at).format("DD.MM.YYYY")
        if w_date is now
          today_income += w.weight*100

      message += "Current total income of " + record.phone + " is " + today_income + " "
      
      record.weight.push _data

      record.balance += if today_income >= 500 then 0 else (if (today_income + weight*100) > 500 then 500-today_income else weight*100)
      record.balance = 1500 if record.balance > 1500

      record.save ()->
        message += "User " + record.phone + " saved with new weight " + weight + "kg " 
        cb message

  createPreregister = (message, lname, fname, phone, created_at, mega, email, cb)->
    model = new PreRegisterModel
      fname: fname
      lname: lname
      email: email
      mega: getMega mega
      phone: phone
      created_at: moment(created_at, "DD.MM.YYYY").format()
    model.save (err, m)->
      message += "Successfully created user " + fname + " " + lname + " " + phone + " record!"
      cb(message, m, model)

  getPreregister = (message, phone, fname, lname, created_at, mega, email, cb)->
    PreRegisterModel.findOne {phone: phone}, (err, pr)->
      if !pr
        message += "User " + phone + " is not found! " + "\n"
        createPreregister message, lname, fname, phone, created_at, mega, email, (message, p, prereg)->
          cb message, p, prereg
      else
        message += "User " + phone + " is found! "
        cb message, pr, pr

  users_iterator = (user, cb)->
    phone = user.phone
    mega = user.mega
    fname = user.fname
    lname = user.lname
    created_at = user.created_at
    weight = user.weight
    email = user.email
    message = ""
    getPreregister message, phone, fname, lname, created_at, mega, email, (message, p, prereg)->
      createWeight message, prereg, weight, created_at, mega, (message)->
        console.log message + "\n\n"
        cb()

  i = 0
  l = data.length

  sync_function = ()->
    if i<l
      users_iterator data[i], sync_function
      i++

  sync_function()