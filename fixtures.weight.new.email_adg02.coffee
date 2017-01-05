mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"

data = [
  {lname: ' быкова', fname: 'Анна',  phone: ' +79183111148', email: '', weight: 5, created_at: '02.03.2016', mega: 'mega_ad'}
  {lname: ' быков', fname: 'Евгений',  phone: ' +79182399865', email: '', weight: 5, created_at: '02.03.2018', mega: 'mega_ad'}
  {lname: ' кобазева', fname: 'Виктория',  phone: ' +79183423421', email: '', weight: 5, created_at: '02.03.2020', mega: 'mega_ad'}
  {lname: 'Оськина', fname: ' ирина',  phone: ' +79676610763 ', email: '', weight:  5.1  , created_at: '02.03.2022', mega: 'mega_ad'}
  {lname: 'Карниенко', fname: ' татьяна',  phone: ' +79180129312', email: '', weight: 5.2, created_at: '02.03.2024', mega: 'mega_ad'}
  {lname: ' базарова', fname: 'Ольга',  phone: ' +79181213000', email: '', weight:   3 , created_at: '02.03.2026', mega: 'mega_ad'}
  {lname: 'Севрюкова', fname: ' анастасия',  phone: ' +79615188530', email: '', weight:  5   , created_at: '02.03.2027', mega: 'mega_ad'}
  {lname: ' сланда', fname: 'Янтыль',  phone: ' +79180420298 ', email: '', weight:  4.8 , created_at: '02.03.2029', mega: 'mega_ad'}
  {lname: ' Кременцова', fname: 'Нина',  phone: ' +79184559208 ', email: '', weight: 5, created_at: '02.03.2030', mega: 'mega_ad'}
  {lname: ' трубина', fname: 'Анастасия',  phone: '+79086914186', email: '', weight: 5, created_at: '02.03.2035', mega: 'mega_ad'}
  {lname: 'зорин', fname: 'Александр',  phone: '+79094590372', email: '', weight: 2.5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'юлия', fname: 'Тлецерукова',  phone: '+79529837693', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'камаль', fname: 'Тлецеруков',  phone: '+79529830123', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'бондаренко', fname: 'Никита',  phone: '+79654576620', email: '', weight: 3.2, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'ольга', fname: 'Сухарева',  phone: '+79186610050', email: '', weight: 5.5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'Лисицин', fname: 'Георгий',  phone: '+79881886700', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'гриненко', fname: 'Анастасия',  phone: '+79184623319­', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'наталья', fname: 'Луговая',  phone: '+79183524843', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'зинаида', fname: 'Лыткина',  phone: '+79186218316', email: '', weight: 4.3, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'алексей', fname: 'Шабунин',  phone: '+79180114606', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'елена', fname: 'Шабунина',  phone: '+79189777629', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'Юдин', fname: 'Сергей',  phone: '+79883434097', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'галина', fname: 'Папова',  phone: '+79186894454', email: '', weight: 4.3, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'боровик', fname: 'Светлана',  phone: '+79181611372', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'алена', fname: 'Концевик',  phone: '+79189710327', email: '', weight: 2.7, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'максим', fname: 'Коновалов',  phone: '+77918153321', email: '', weight: 3.7, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'ольга', fname: 'Алейникова',  phone: '+79180105335', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'татьяна', fname: 'Дудникова',  phone: '+79282614347', email: '', weight: 2.5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'елена', fname: 'Маркова',  phone: '+79182494627', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'евгения', fname: 'Рябуха',  phone: '+79528377872', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'александр', fname: 'Степанков',  phone: '+79673014205', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'белоусов', fname: 'Андрей',  phone: '+79615922247', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'устинова', fname: 'Елена',  phone: '+79282320245', email: '', weight: 3.4, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'катя', fname: 'Дуда',  phone: '+79615355773', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'эсма', fname: 'Аметова',  phone: '+79884795042', email: '', weight: 4.4, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'фирсова', fname: 'Людмила',  phone: '+79885219505', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'тимофей', fname: 'Фирсов',  phone: '+79182967692', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'евтвлья', fname: 'Ризниченко',  phone: '+79183141316', email: '', weight: 5.1, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'волкова', fname: 'Екатерина',  phone: '+79604977407', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'андрей', fname: 'Волков',  phone: '+79604973494', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'гуща', fname: 'Мария',  phone: '+79184488496', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'игорь', fname: 'Гуща',  phone: '+79184336000', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'леша', fname: 'Абакумов',  phone: '+79280404149', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'мария', fname: 'Горбанец',  phone: '+79528389915', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'мерзликин', fname: 'Сергей',  phone: '+79186202898', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'антонидзе', fname: 'Екатерина',  phone: '+79184958256', email: '', weight: 3, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'ирина', fname: 'Раманова',  phone: '+79628800864', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'таня', fname: 'Соколова',  phone: '+79897716252', email: '', weight: 2.6, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'мишустина', fname: 'Елена',  phone: '+79182927788', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'елена', fname: 'Мороз',  phone: '+79182244226', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'турбылев', fname: 'Алксанд',  phone: '+79182211735', email: '', weight: 2.8, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'мария', fname: 'Шевцова',  phone: '+79615074674', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'любовь', fname: 'Кривобок',  phone: '+79064357844', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'валентина', fname: 'Пащенко',  phone: '+79184291086', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'валерьевна', fname: 'Ануш',  phone: '+79181636920', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'борис', fname: 'Миракьян',  phone: '+79181935048', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'петрова', fname: 'Надежда',  phone: '+79184281230', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'ольга', fname: 'Зленко',  phone: '+79054950625', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'инна', fname: 'Андриян',  phone: '+79183457009', email: '', weight: 3.5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'катя', fname: 'Демидова',  phone: '+79184739231', email: '', weight: 2.5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'смирнов', fname: 'Сергей',  phone: '+79385522868', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'Людмила', fname: 'Слупицкая',  phone: '+79184426768', email: '', weight: 1.5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'коста', fname: 'Фанич',  phone: '+79530723584', email: '', weight: 3, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'тина', fname: 'Рыбалка',  phone: '+79528350993', email: '', weight: 3.2, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'катя', fname: 'Верченко',  phone: '+79183423213', email: '', weight: 2.5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'дарья', fname: 'Хайдукова',  phone: '+79182533791', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'елена', fname: 'Соколова',  phone: '+79184833811', email: '', weight: 1.4, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'соболь', fname: 'Валерий',  phone: '+79649224537', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'карина', fname: 'Гринь',  phone: '+79676542848', email: '', weight: 2.5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'ольга', fname: 'Симерджанс',  phone: '+79892713707', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'серджанс', fname: 'Ольга',  phone: '+79284218039', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'катаева', fname: 'Светлана',  phone: '+79182532193', email: '', weight: 4.1, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'тэона', fname: 'Какабадзе',  phone: '+79183992955', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'морщихина', fname: 'Марина',  phone: '+79184288241', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'евгений', fname: 'Бедовский',  phone: '+79528508035', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'наталья', fname: 'Коморова',  phone: '+79615968823', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'анна', fname: 'Гриневич',  phone: '+79676624736', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'иван', fname: 'Гриневич',  phone: '+79615907080', email: '', weight: 0.8, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'людмила', fname: 'Жученко',  phone: '+79528474912', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'никита', fname: 'Лужиченко',  phone: '+79528474911', email: '', weight: 1.6, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'ярославна', fname: 'Короткова',  phone: '+79881619262', email: '', weight: 3.4, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'александра', fname: 'Вернер',  phone: '+79618502209', email: '', weight: 3.7, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'колосова', fname: 'Наталья',  phone: '+79183864678', email: '', weight: 0, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'елена', fname: 'Бугай',  phone: '+79183843240', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'евгений', fname: 'Бугай',  phone: '+79182194593', email: '', weight: 5.1, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'светлана', fname: 'Шабунина',  phone: '+79183172530', email: '', weight: 3.4, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'маулекбек', fname: 'Тюлекбаев',  phone: '+79384987889', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'виктория', fname: 'Медведева',  phone: '+79891407666', email: '', weight: 3.4, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'пушкина', fname: 'Люба',  phone: '+79184242735', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'пушкина', fname: 'Татьяна',  phone: '+79182212225', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'сергей', fname: 'Пушкин',  phone: '+79184233370', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'чернышова', fname: 'Елена',  phone: '+79615020189', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'блынская', fname: 'Татьяна',  phone: '+79615072047', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'ирина', fname: 'Бирюкова',  phone: '+79181137890', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'ванда', fname: 'Катя',  phone: '+79184684920', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'глеб', fname: 'Ванда',  phone: '+79604880251', email: '', weight: 2.8, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'наталья', fname: 'Ермакова',  phone: '+79180413947', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'галина', fname: 'Ильина',  phone: '+79384487840', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'илья', fname: 'Ильин',  phone: '+79002848065', email: '', weight: 3.7, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'ксения', fname: 'Вакуленко',  phone: '+79898373611', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'артем', fname: 'Лыков',  phone: '+79181605557', email: '', weight: 2.2, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'катя', fname: 'Лысенко',  phone: '+79898103208', email: '', weight: 29, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'тамара', fname: 'Тарасенко',  phone: '+79184085094', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'светлана', fname: 'Хела',  phone: '+79086766509', email: '', weight: 5.3, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'карина', fname: 'Коткова',  phone: '+79284681604', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'светлана', fname: 'Воробьева',  phone: '+79180259002', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'никита', fname: 'Воробьев',  phone: '+79180033760', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'людмила', fname: 'Авликова',  phone: '+79615262756', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'диян', fname: 'Анджелика',  phone: '+79184310177', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'диян', fname: 'Алиса',  phone: '+79184492486', email: '', weight: 5.3, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'светлана', fname: 'Колесникова',  phone: '+79186295967', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'владимир', fname: 'Петров',  phone: '+79002486191', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'виктория', fname: 'Якимова',  phone: '+79180827817', email: '', weight: 5.1, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'наталья', fname: 'Якимова',  phone: '+79184835749', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'света', fname: 'Карасева',  phone: '+79649215842', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'бузырева', fname: 'Татьяна',  phone: '+79181659448', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'светлана', fname: 'Качановская',  phone: '+79183436467', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'дмитрий', fname: 'Луцкий',  phone: '+79184487041', email: '', weight: 5.1, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'юлия', fname: 'Среброва',  phone: '+79284314412', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'максим', fname: 'Сребров',  phone: '+79183150566', email: '', weight: 2.1, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'марина', fname: 'Киселева',  phone: '+79184950287', email: '', weight: 5.1, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'шигапова', fname: 'Маргорита',  phone: '+79182975530', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'денисов', fname: 'Виктор',  phone: '+79180202161', email: '', weight: 3.4, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'евгения', fname: 'Даценко',  phone: '+79181372273', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'василий', fname: 'Даценко',  phone: '+79183334914', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'микульский', fname: 'Родольф',  phone: '+79024046659', email: '', weight: 4.4, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'орлов', fname: 'Михаил',  phone: '+79186223284', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'анастасия', fname: 'Кучерявых',  phone: '+79183457239', email: '', weight: 5.5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'анатолий', fname: 'Бочко',  phone: '+79604810877', email: '', weight: 2.8, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'мартиньянов', fname: 'Инакентий',  phone: '+79034471337', email: '', weight: 10, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'мартиньянова', fname: 'Елена',  phone: '+79628732482', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'алла', fname: 'Матвиец',  phone: '+79286663927', email: '', weight: 4, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'елена', fname: 'Шкребец',  phone: '+79615140782', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'Олег', fname: 'Кременский',  phone: '+79184423469', email: '', weight: 5.3, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'александр', fname: 'Крынин',  phone: '+79892661275', email: '', weight: 2.6, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'руслан', fname: 'Шаруда',  phone: '+79180348738', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'инесса', fname: 'Шаруда',  phone: '+79530858226', email: '', weight: 3, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'третьякова', fname: 'Светлана',  phone: '+79604925126', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'третьяков', fname: 'Владимир',  phone: '+79094630723', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'руденко', fname: 'Диана',  phone: '+79654578123', email: '', weight: 4, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'дмитрий', fname: 'Таранухин',  phone: '+79615887788', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'иванов', fname: 'Александр',  phone: '+79615330094', email: '', weight: 1, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'валентина', fname: 'Александрова',  phone: '+79604794730', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'базаров', fname: 'Юрий',  phone: '+79184101803', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'евгений', fname: 'Александров',  phone: '+79604866803', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'бертенева', fname: 'Елена',  phone: '+79184989835', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'басс', fname: 'Ольга',  phone: '+79184871835', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'лариса', fname: 'Гросова',  phone: '+79288445408', email: '', weight: 4.5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'потошина', fname: 'Инна',  phone: '+79898388624', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'евгения', fname: 'Золотарева',  phone: '+79180607708', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'анна', fname: 'Лобачева',  phone: '+79189232912', email: '', weight: 3.6, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'шарабаева', fname: 'Марина',  phone: '+79184680629', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'лариса', fname: 'Хайдукова',  phone: '+79182645400', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'нагуа', fname: 'Александра',  phone: '+79615364516', email: '', weight: 2.5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'алексей', fname: 'Хайдуков',  phone: '+79182533793', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'люблинчикова', fname: 'Любовь',  phone: '+79284224987', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'мотвиенко', fname: 'Анна',  phone: '+79054940067', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'яковенко', fname: 'Диана',  phone: '+79182156457', email: '', weight: 1.7, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'Рожнов', fname: 'Андрей',  phone: '+791839901742', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'Виктор', fname: 'Дружинин',  phone: '+79282631566', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'Виктория', fname: 'Дружинина',  phone: '+79615252444', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'Киракосян', fname: 'Елена',  phone: '+79183626867', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'Виктория', fname: 'Антимирова',  phone: '+79628539009', email: '', weight: 3, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'Екатерина', fname: 'Кузнецова',  phone: '+79284336739', email: '', weight: 5.4, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'савосько', fname: 'Елена',  phone: '+79054740646', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'мочалин', fname: 'Владимир',  phone: '+79530924674', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'дворовой', fname: 'Александр',  phone: '+79182476278', email: '', weight: 2.8, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'дворовая', fname: 'Юлия',  phone: '+79094523446', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'елена', fname: 'Михайлова',  phone: '+79618516967', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'лариса', fname: 'Тимчук',  phone: '+79164976563', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'дидиченко', fname: 'Лилия',  phone: '+79183577244', email: '', weight: 5.1, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'валерия', fname: 'Высоцкая',  phone: '+79615142910', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'наземцева', fname: 'Светлана',  phone: '+79528683404', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'артем', fname: 'Черноморский',  phone: '+79615306818', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'александр', fname: 'Шишкин',  phone: '+79530728403', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'ольга', fname: 'Высоцкая',  phone: '+79054959433', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'оксана', fname: 'Селенко',  phone: '+79648968025', email: '', weight: 2, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'анна', fname: 'Алексеева',  phone: '+79189832806', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'манукян', fname: 'Оксана',  phone: '+79181382793', email: '', weight: 5.3, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'ирина', fname: 'Гоможа',  phone: '+79615908631', email: '', weight: 4.8, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'станислав', fname: 'Рублев',  phone: '+79232730373', email: '', weight: 5.9, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'яловой', fname: 'Иоан',  phone: '+79628596391', email: '', weight: 4.9, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'дмитрий', fname: 'Фомин',  phone: '+79615881058', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'надежда', fname: 'Фомина',  phone: '+79615274457', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'ксения', fname: 'Бабкова',  phone: '+79086785050', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'наталья', fname: 'Бобкова',  phone: '+79086785088', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'раиса', fname: 'Кипель',  phone: '+79086785011', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'валентина', fname: 'Хван',  phone: '+79184117896', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'олег', fname: 'Хван',  phone: '+79186274619', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'самоан', fname: 'Елена',  phone: '+79182681400', email: '', weight: 3.3, created_at: '02.04.16', mega: 'mega_ad'}
  {lname: 'азамат', fname: 'Янтыль',  phone: '+79182242722', email: '', weight: 5, created_at: '02.04.16', mega: 'mega_ad'}
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

  createPreregister = (message, lname, fname, phone, created_at, mega, cb)->
    model = new PreRegisterModel
      fname: fname
      lname: lname
      mega: getMega mega
      phone: phone
      created_at: moment(created_at, "DD.MM.YYYY").format()
    model.save (err, m)->
      message += "Successfully created user " + fname + " " + lname + " " + phone + " record!"
      cb(message, m, model)

  getPreregister = (message, phone, fname, lname, created_at, mega, cb)->
    PreRegisterModel.findOne {phone: phone}, (err, pr)->
      if !pr
        message += "User " + phone + " is not found! " + "\n"
        createPreregister message, lname, fname, phone, created_at, mega, (message, p, prereg)->
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
    message = ""
    getPreregister message, phone, fname, lname, created_at, mega, (message, p, prereg)->
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