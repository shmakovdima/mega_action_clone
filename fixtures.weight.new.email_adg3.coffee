mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"



data = [
  {lname: 'Вера', fname: 'Гребенникова',  phone: '+79183120575', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Брау', fname: 'Марина',  phone: '+79183944568', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Сухарева', fname: 'Ольга',  phone: '+79186610050', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Лариса', fname: 'Брилева',  phone: '+79186233122', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Надежда', fname: 'Плесская',  phone: '+79002468447', email: '', weight: 3.8, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Александр', fname: 'Проценко',  phone: '+79086780269', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Лозовая', fname: 'Людмила',  phone: '+79181555233', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Алла', fname: 'Мирожнеченко',  phone: '+79184566877', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Екатерина', fname: 'Краева',  phone: '+79184632558', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Альбина', fname: 'Некрасова',  phone: '+79284112234', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Арина', fname: 'Яшина',  phone: '+79628800252', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Софья', fname: 'Хецуриани',  phone: '+79898181963', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Юрий', fname: 'Покровский',  phone: '+79200297884', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Гиа', fname: 'Хецуряни',  phone: '+79618506535', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Евгения', fname: 'Пинашкина',  phone: '+79183756838', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Ольга', fname: 'Фандеева',  phone: '+79184450291', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Колтунова', fname: 'Наталья',  phone: '+79180106569', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Елена', fname: 'Абрамова',  phone: '+79604986472', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Ольга', fname: 'Антропова',  phone: '+79284170676', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Елесеева', fname: 'Елена',  phone: '+79384014247', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Любовь', fname: 'Кривобок',  phone: '+79064357844', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Людмила', fname: 'Подгорная',  phone: '+79604949710', email: '', weight: 2.7, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Людмила', fname: 'Карашаева',  phone: '+79189496240', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Лариса', fname: 'Шулика',  phone: '+79181683453', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Вадим', fname: 'Шулика',  phone: '+79615065216', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Людмила', fname: 'Протопокова',  phone: '+79884643580', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Юзиль', fname: 'Долголуб',  phone: '+79892614761', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Марина', fname: 'Коноплева',  phone: '+79615251274', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Евгений', fname: 'Коноплев',  phone: '+79628521117', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Бака', fname: 'Елена',  phone: '+79282582144', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Ольга', fname: 'Семенова',  phone: '+79283310303', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Оксана', fname: 'Брус',  phone: '+79184789513', email: '', weight: 3.8, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Виталий', fname: 'Брус',  phone: '+79882423568', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Диана', fname: 'Бажанова',  phone: '+79181488087', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Геннадий', fname: 'Бажанов',  phone: '+79892697177', email: '', weight: 3.6, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Раиса', fname: 'Зборомирская',  phone: '+79189814346', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Нина', fname: 'Зайцева',  phone: '+79183375771', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Елена', fname: 'Завадская',  phone: '+79180111321', email: '', weight: 3.9, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Екатерина', fname: 'Паномирская',  phone: '+79186418363', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Елена', fname: 'Завадская',  phone: '+79180111321', email: '', weight: 1.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Екатерина', fname: 'Семенова',  phone: '+79189543614', email: '', weight: 2.6, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Зинаида', fname: 'Згоронирская',  phone: '+79189906971', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Анна', fname: 'Лобачева',  phone: '+79189232912', email: '', weight: 4.6, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Светлана', fname: 'Галинская',  phone: '+79615815086', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Виктор', fname: 'Крикунов',  phone: '+79604914908', email: '', weight: 2.7, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Марина', fname: 'Мартина',  phone: '+79184469570', email: '', weight: 3.8, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Дмитрий', fname: 'Колпинский',  phone: '+79002571947', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Светлана', fname: 'Качановская',  phone: '+79183436467', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Казбек', fname: 'Енух',  phone: '+79182224480', email: '', weight: 5.2, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Лариса', fname: 'Гросова',  phone: '+79288445408', email: '', weight: 5.3, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Ирина', fname: 'Килимова',  phone: '+79385505877', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Малежек', fname: 'Виктор',  phone: '+79181336401', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Александр', fname: 'Килиммов',  phone: '+79284027595', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Григорий', fname: 'Береза',  phone: '+79282711110', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Винокуров', fname: 'Дмитрий',  phone: '+79181409394', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Денисенко', fname: 'Екатерина',  phone: '+79184557768', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Владимир', fname: 'Левин',  phone: '+79884787723', email: '', weight: 2.6, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Валерия', fname: 'Чобан',  phone: '+79186870405', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Петр', fname: 'Гаврилов',  phone: '+79180781648', email: '', weight: 2.5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Карина', fname: 'Кулибякина',  phone: '+79024083554', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Наталья', fname: 'Овсянникова',  phone: '+79649021738', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Александр', fname: 'Петренко',  phone: '+79034564082', email: '', weight: 4.2, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Татьяна', fname: 'Бахмутская',  phone: '+79531143985', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Юлия', fname: 'Шевченко',  phone: '+79180349003', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Рубан', fname: 'Наталья',  phone: '+79094554763', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Александр', fname: 'Железняков',  phone: '+79180879681', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Людмила', fname: 'Железнякова',  phone: '+79530854120', email: '', weight: 1.8, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Александра', fname: 'Евтушенко',  phone: '+79171814007', email: '', weight: 3.2, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Артур', fname: 'Ованесян',  phone: '+79298546904', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Алла', fname: 'Саакян',  phone: '+79385022253', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Андроник', fname: 'Саакян',  phone: '+79385330780', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Чавликова', fname: 'Людмила',  phone: '+79615262756', email: '', weight: 4, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Андрей', fname: 'Маркосьян',  phone: '+79181200339', email: '', weight: 4.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Ольга', fname: 'Евенко',  phone: '+79628591971', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Нина', fname: 'Анисимова',  phone: '+79182257280', email: '', weight: 4.5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Виктория', fname: 'Алексеева',  phone: '+79529858850', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Галина', fname: 'Лукичева',  phone: '+79183475981', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Дмитрий', fname: 'Лукичев',  phone: '+79182739618', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Ирина', fname: 'Адабашян',  phone: '+79180334424', email: '', weight: 4.8, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Анна', fname: 'Морозова',  phone: '+79604775581', email: '', weight: 4, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Евгения', fname: 'Браженко',  phone: '+79181277825', email: '', weight: 3.3, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Ирина', fname: 'Скрипкина',  phone: '+79184993168', email: '', weight: 6.2, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Асия', fname: 'Алтунбаева',  phone: '+79002961701', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Елена', fname: 'Мороз',  phone: '+79182244226', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Галина', fname: 'Попова',  phone: '+79186894454', email: '', weight: 0.7, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Юлия', fname: 'Лыйман',  phone: '+79184202299', email: '', weight: 2.3, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Мария', fname: 'Каширская',  phone: '+79094614946', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Артем', fname: 'Волков',  phone: '+79064342437', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Светлана', fname: 'Емиж',  phone: '+79385286141', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Михаил', fname: 'Бельков',  phone: '+79385112610', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Рима', fname: 'Чернушеп',  phone: '+79184333260', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Жанна', fname: 'Варенникова',  phone: '+79884771228', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Анатолий', fname: 'Григорьев',  phone: '+79673165995', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Светлана', fname: 'Донская',  phone: '+79880829397', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Эльдар', fname: 'Комаров',  phone: '+79887972021', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Сергей', fname: 'Денисов',  phone: '+79182438333', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Виктория', fname: 'Лой',  phone: '+79180806818', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Наталья', fname: 'Кульбина',  phone: '+79183707709', email: '', weight: 4.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Валентина', fname: 'Александрова',  phone: '+79604794730', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Евгений', fname: 'Александров',  phone: '+79604866803', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Оксана', fname: 'Горбичевская',  phone: '+79186865894', email: '', weight: 4.5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Олеся', fname: 'Рылина',  phone: '+79181199769', email: '', weight: 1.3, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Ирина', fname: 'Холова',  phone: '+79000070012', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Татьяна', fname: 'Богомолова',  phone: '+79885263858', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Тимур', fname: 'Хулов',  phone: '+79000070014', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Иоан', fname: 'Яловой',  phone: '+79628596391', email: '', weight: 0.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Наталья', fname: 'Молотилина',  phone: '+79182109088', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Олеся', fname: 'Козлова',  phone: '+79883154621', email: '', weight: 3.3, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Александра', fname: 'Пак',  phone: '+79094519878', email: '', weight: 5.4, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Дарья', fname: 'Кереселидзе',  phone: '+79094440560', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Людмила', fname: 'Рыбас',  phone: '+79882452909', email: '', weight: 3.3, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Анна', fname: 'Гайворонская',  phone: '+79892107419', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Алексей', fname: 'Гайворонский',  phone: '+79002520857', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Алиса', fname: 'Семич',  phone: '+79298290975', email: '', weight: 3.9, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Руслан', fname: 'Евенко',  phone: '+79094618770', email: '', weight: 2.5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Дорофеева', fname: 'Екатерина',  phone: '+79528326064', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Екатерина', fname: 'Тертычная',  phone: '+79604784938', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Карабашян', fname: 'Елена',  phone: '+79186350499', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Ефрем', fname: 'Семерджеян',  phone: '+79183670084', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Мария', fname: 'Проценко',  phone: '+79184920747', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Анастасия', fname: 'Вылегжанина',  phone: '+79184191562', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Максим', fname: 'Вылегжанин',  phone: '+79184427287', email: '', weight: 4.7, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Екатерина', fname: 'Селиванова',  phone: '+79528247644', email: '', weight: 2.3, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Андрей', fname: 'Евсеев',  phone: '+79094465530', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Евсеева', fname: 'Мария',  phone: '+79615165879', email: '', weight: 2, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Анна', fname: 'Солодовская',  phone: '+79183330327', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Антонина', fname: 'Резникова',  phone: '+79284093126', email: '', weight: 5.2, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Валерий', fname: 'Солодовский',  phone: '+79184474401', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Олеся', fname: 'Петрова',  phone: '+79530704036', email: '', weight: 4, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Скорик', fname: 'Елена',  phone: '+79054774419', email: '', weight: 3.5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Ирина', fname: 'Гатамова',  phone: '+79002564134', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Виктор', fname: 'Гатамов',  phone: '+79531123892', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Ольга', fname: 'Белобородова',  phone: '+79284185080', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Наталья', fname: 'Кравченко',  phone: '+79184659585', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Елена', fname: 'Мамий',  phone: '+79189308421', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Ольга', fname: 'Курманова',  phone: '+79184965248', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Сергей', fname: 'Жиляков',  phone: '+79298239933', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Руслан', fname: 'Омаров',  phone: '+79676602800', email: '', weight: 2.5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Ангелина', fname: 'Гудкова',  phone: '+79054020168', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Татьяна', fname: 'Косарева',  phone: '+79284278667', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Александр', fname: 'Фонарев',  phone: '+79181158280', email: '', weight: 2.5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'снежанна', fname: 'Штумпф',  phone: '+79183524320', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'кучерявых', fname: 'Анастасия',  phone: '+79183457239', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'алексей', fname: 'Кучерявых',  phone: '+79649198275', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'гаврия', fname: 'Виктория',  phone: '+79186672605', email: '', weight: 2.9, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'якуба', fname: 'Софья',  phone: '+79181611113', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'коваленко', fname: 'Сергей',  phone: '+79883673538', email: '', weight: 2.9, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'сергей', fname: 'Перепелицын',  phone: '+79184689508', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'павлычева', fname: 'Ольга',  phone: '+79182513141', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'кодолова', fname: 'Мария',  phone: '+79286615366', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Шестаков', fname: 'Василий',  phone: '+79528299171', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Юлия', fname: 'Чернышева',  phone: '+79183104040', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Алексей,', fname: 'Куксов',  phone: '+79002520183', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Коваленко', fname: 'Ольга',  phone: '+79181392954', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Давяденко', fname: 'Эллина',  phone: '+79649216331', email: '', weight: 0.6, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Анастасия,', fname: 'Капустина',  phone: '+79883867646', email: '', weight: 5.2, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Лидия', fname: 'Лавебная',  phone: '+79189880242', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Геннадий', fname: 'Лавебный',  phone: '+79183216891', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Дмитрий', fname: 'Гавриленко',  phone: '+79183333597', email: '', weight: 5.6, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Давыдова', fname: 'Елена',  phone: '+79282015541', email: '', weight: 2.8, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Радион', fname: 'Доронин',  phone: '+79282018231', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Варвара', fname: 'Богумен',  phone: '+79182945191', email: '', weight: 3.6, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Елена', fname: 'Дмитриева',  phone: '+79186750879', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Леонид', fname: 'Дмитриев',  phone: '+79189550669', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Арина', fname: 'Кострица',  phone: '+79186873184', email: '', weight: 2.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Васильева', fname: 'Галина',  phone: '+79284421506', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Мкртич', fname: 'Мкртчян',  phone: '+79182591375', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Сергей', fname: 'Кухаренко',  phone: '+79180872162', email: '', weight: 4.6, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Роза', fname: 'Джалишева',  phone: '+79385521125', email: '', weight: 3.6, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Виктор', fname: 'Розенберг',  phone: '+79618271052', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Махомод', fname: 'Чуриев',  phone: '+79618270842', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Роман', fname: 'Оглы',  phone: '+79649382001', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Тахир', fname: 'Оглы',  phone: '+79531072191', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Василий', fname: 'Гришанков',  phone: '+79627633801', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Ольга', fname: 'Третьякова',  phone: '+79054041448', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Светлана', fname: 'Шеболтина',  phone: '+79649383939', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Владимир', fname: 'Третьяков',  phone: '+79094630723', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Дмитрий', fname: 'Фомин',  phone: '+79615881058', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Надежда', fname: 'Фомина',  phone: '+79615274457', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Екатерина', fname: 'Рослякова',  phone: '+79604896389', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Максим', fname: 'Кузьмин',  phone: '+79181412272', email: '', weight: 3.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Евгения', fname: 'Рыбалкина',  phone: '+79615389793', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Андрей', fname: 'Белоусов',  phone: '+79615922247', email: '', weight: 2.2, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Виктория', fname: 'Меркулова',  phone: '+79183897970', email: '', weight: 4.4, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Александр', fname: 'Параев',  phone: '+79189530464', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Ирина,', fname: 'Бочок',  phone: '+79649033714', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Владимир', fname: 'Бурушкин',  phone: '+79184688824', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Екатерина', fname: 'Бурушкина',  phone: '+79182177030', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Евгения', fname: 'Маштакова',  phone: '+79189624427', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Юлия', fname: 'Орлова',  phone: '+79181644430', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Юрий', fname: 'Орлов',  phone: '+79183953881', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Игорь', fname: 'Маштаков',  phone: '+79883543045', email: '', weight: 4.4, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Анаид', fname: 'Окунева',  phone: '+79034544941', email: '', weight: 5.4, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Виктор', fname: 'Окунев',  phone: '+79618520783', email: '', weight: 5.5, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Шишкин', fname: 'Александр',  phone: '+79530728403', email: '', weight: 5.6, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Сергей', fname: 'Утукин',  phone: '+79181477077', email: '', weight: 5.1, created_at: '04.04.16', mega: 'mega_ad'}
  {lname: 'Утукина', fname: 'Татьяна',  phone: '+79898320238', email: '', weight: 5, created_at: '04.04.16', mega: 'mega_ad'}

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