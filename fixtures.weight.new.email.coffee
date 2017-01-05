mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"



data = [
    {lname: 'Гаева', fname: 'Эмма',  phone: '+79501979111', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Гаева', fname: 'Эмма',  phone: '+79501979111', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Балыко', fname: 'Татьяна',  phone: '+79222179012', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Балыко', fname: 'Татьяна',  phone: '+79222179012', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Городилова', fname: 'Елена',  phone: '+79122778909', email: '', weight: 6.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Городилова', fname: 'Елена',  phone: '+79122778909', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Демчук', fname: 'Наталья',  phone: '+79090036160', email: '', weight: 4.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Лобанцева', fname: 'Елена',  phone: '+79086347601', email: '', weight: 2.2, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Пехова', fname: 'Елена',  phone: '+79049862652', email: '', weight: 1.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Тебенькова', fname: 'Валентина',  phone: '+79220368155', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Тебенькова', fname: 'Валентина',  phone: '+79220368155', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Городилова', fname: 'Татьяна',  phone: '+79122744791', email: '', weight: 3.7, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Петухова', fname: 'Любовь',  phone: '+79193744284', email: '', weight: 3.4, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Петухова', fname: 'Любовь',  phone: '+79193744284', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Бурцева', fname: 'Ольга',  phone: '+79222013754', email: '', weight: 2.8, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Бурцева', fname: 'Ольга',  phone: '+79222013754', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Саяпова', fname: 'Юлия',  phone: '+79086339717', email: '', weight: 4.7, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Саяпова', fname: 'Юлия',  phone: '+79086339717', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Яковлева', fname: 'Анастасия',  phone: '+79226152102', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Яковлева', fname: 'Анастасия',  phone: '+79226152102', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Швейковская', fname: 'Раиса',  phone: '+79920137232', email: '', weight: 2.8, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Копыткина', fname: 'Юлия',  phone: '+79226070466', email: '', weight: 5.02, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Копыткина', fname: 'Юлия',  phone: '+79226070466', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Валамина', fname: 'Елена',  phone: '+79002077811', email: '', weight: 2.5, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Слушкина', fname: 'Рамиля (Наталья)',  phone: '+79126068648', email: '', weight: 3.8, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Слушкина', fname: 'Рамиля (Наталья)',  phone: '+79126068648', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Севастьянова', fname: 'Дарья',  phone: '+79122809648', email: '', weight: 2.8, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Трифонова', fname: 'Юлия',  phone: '+79222963863', email: '', weight: 4.4, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Трифонов', fname: 'Александр',  phone: '+79226063137', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Трифонов', fname: 'Александр',  phone: '+79226063137', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Лейдерман', fname: 'Елена',  phone: '+79126896714', email: '', weight: 5.23, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Лейдерман', fname: 'Елена',  phone: '+79126896714', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Комарова', fname: 'Елена',  phone: '+79122555840', email: '', weight: 3.8, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Щелкунова', fname: 'Татьяна',  phone: '+79022530567', email: '', weight: 2.5, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Евдокимова', fname: 'Валентина',  phone: '+79068032562', email: '', weight: 2.8, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Банных', fname: 'Александр',  phone: '+79222153217', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Банных', fname: 'Александр',  phone: '+79222153217', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Банных', fname: 'Анастасия',  phone: '+79530413133', email: '', weight: 4.3, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Пахомова', fname: 'Светлана',  phone: '+79826533903', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Пахомова', fname: 'Светлана',  phone: '+79826533903', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Савельева', fname: 'Маргарита',  phone: '+79122403983', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Савельева', fname: 'Маргарита',  phone: '+79122403983', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Казмер', fname: 'Михаил',  phone: '+79049843820', email: '', weight: 4.4, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Бабирь', fname: 'Лариса',  phone: '+79022754077', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Бабирь', fname: 'Лариса',  phone: '+79022754077', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Волкова', fname: 'Елена',  phone: '+79678579543', email: '', weight: 3.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Швецова', fname: 'Тамара',  phone: '+79221187190', email: '', weight: 2.54, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Безгодова', fname: 'Анна',  phone: '+79041641261', email: '', weight: 2.9, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Дерябина', fname: 'Александра',  phone: '+79221258256', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Дерябина', fname: 'Александра',  phone: '+79221258256', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Устинов', fname: 'Антон',  phone: '+79126374386', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Устинов', fname: 'Антон',  phone: '+79126374386', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Тагарифуллина', fname: 'Людмила',  phone: '+79530403759', email: '', weight: 5.13, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Тагарифуллина', fname: 'Людмила',  phone: '+79530403759', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Костенкова', fname: 'Алёна',  phone: '+79638563179', email: '', weight: 3.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Костенкова', fname: 'Алёна',  phone: '+79638563179', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Косованова', fname: 'Юлия',  phone: '+79089043909', email: '', weight: 5.4, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Косованова', fname: 'Юлия',  phone: '+79089043909', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Локис', fname: 'Мария',  phone: '+79049814984', email: '', weight: 1.8, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Дерябина', fname: 'Александра',  phone: '+79221258256', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Дерябина', fname: 'Александра',  phone: '+79221258256', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Устинова', fname: 'Елена',  phone: '+79126374389', email: '', weight: 3.5, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Шардыко', fname: 'Владимир',  phone: '+79022605497', email: '', weight: 5.06, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Шардыко', fname: 'Владимир',  phone: '+79022605497', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Шардыко', fname: 'Людмила',  phone: '+79022738194', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Шардыко', fname: 'Людмила',  phone: '+79022738194', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Терентьева', fname: 'Мария',  phone: '+79826922608', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Терентьева', fname: 'Мария',  phone: '+79826922608', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Алексеева', fname: 'Елена',  phone: '+79028724197', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Алексеева', fname: 'Елена',  phone: '+79028724197', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Киселев', fname: 'Дмитрий',  phone: '+79090229229', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Киселев', fname: 'Дмитрий',  phone: '+79090229229', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Редикульцева', fname: 'Анжелика',  phone: '+79632719094', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Редикульцева', fname: 'Анжелика',  phone: '+79632719094', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Панкова', fname: 'Екатерина',  phone: '+79058062546', email: '', weight: 2.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Ермаков', fname: 'Валерий',  phone: '+79222078177', email: '', weight: 2.7, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Хилюк', fname: 'Елена',  phone: '+79122847657', email: '', weight: 4.5, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Хилюк', fname: 'Вера',  phone: '+79126346808', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Хилюк', fname: 'Вера',  phone: '+79126346808', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Киселев', fname: 'Дмитрий',  phone: '+79090229228', email: '', weight: 2.5, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Трефилова', fname: 'Анна',  phone: '+79502089129', email: '', weight: 3.2, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Трефилова', fname: 'Анна',  phone: '+79502089129', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Скорева', fname: 'Анастасия',  phone: '+79501940844', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Скорева', fname: 'Анастасия',  phone: '+79501940844', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Логинов', fname: 'Олег',  phone: '+79521417352', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Логинов', fname: 'Олег',  phone: '+79521417352', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Логинова', fname: 'Анна',  phone: '+79022598026', email: '', weight: 3.9, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Кизнер', fname: 'Дарья',  phone: '+79122046045', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Кизнер', fname: 'Дарья',  phone: '+79122046045', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Сурикова', fname: 'Ольга',  phone: '+79122823974', email: '', weight: 4.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Караваннова', fname: 'Наталья',  phone: '+79126995960', email: '', weight: 4.6, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Яманова', fname: 'Дарья',  phone: '+79090197291', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Яманова', fname: 'Дарья',  phone: '+79090197291', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Поспелова', fname: 'Екатерина',  phone: '+79126158508', email: '', weight: 2.9, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Нестеренко', fname: 'Ольга',  phone: '+79122820447', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Нестеренко', fname: 'Ольга',  phone: '+79122820447', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Нестеренко', fname: 'Жанна',  phone: '+79126391633', email: '', weight: 3.7, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Костиков', fname: 'Алексей',  phone: '+79502086593', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Костиков', fname: 'Алексей',  phone: '+79502086593', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Костикова', fname: 'Евгения',  phone: '+79089237759', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Костикова', fname: 'Евгения',  phone: '+79089237759', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Бородин', fname: 'Максим',  phone: '+79221691973', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Бородина', fname: 'Елена',  phone: '+79041746189', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Бородина', fname: 'Елена',  phone: '+79041746189', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Капитонова', fname: 'Нина',  phone: '+79220289630', email: '', weight: 3.6, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Нурисламова', fname: 'Алена',  phone: '+79826121240', email: '', weight: 3.8, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Мамылина', fname: 'Мария',  phone: '+79126336259', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Мамылина', fname: 'Мария',  phone: '+79126336259', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Мухаева', fname: 'Антонина',  phone: '+79122223489', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Мухаева', fname: 'Антонина',  phone: '+79122223489', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Михайлов', fname: 'Сергей',  phone: '+79126122410', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Михайлов', fname: 'Сергей',  phone: '+79126122410', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Михайлова', fname: 'Маргарита',  phone: '+79193677244', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Михайлова', fname: 'Маргарита',  phone: '+79193677244', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Чушева', fname: 'Евгения',  phone: '+79049871734', email: '', weight: 3.92, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Журавлева', fname: 'Ирина',  phone: '+79527399145', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Журавлева', fname: 'Ирина',  phone: '+79527399145', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Перевощикова', fname: 'Екатерина',  phone: '+79638504882', email: '', weight: 4.16, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Кузюкова', fname: 'Людмила',  phone: '+79086302937', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Кузюкова', fname: 'Людмила',  phone: '+79086302937', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Рапопорт', fname: 'Илья',  phone: '+79222034605', email: '', weight: 2.9, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Пешкина', fname: 'Марина',  phone: '+79122197993', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Пешкина', fname: 'Марина',  phone: '+79122197993', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Козлова', fname: 'Татьяна',  phone: '+79502033050', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Козлова', fname: 'Татьяна',  phone: '+79502033050', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Гарипова', fname: 'Наталья',  phone: '+79043836657', email: '', weight: 9.1, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Гарипова', fname: 'Наталья',  phone: '+79043836657', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Бабинов', fname: 'Игорь',  phone: '+79630481835', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Бабинов', fname: 'Игорь',  phone: '+79630481835', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Бабинова', fname: 'Любовь',  phone: '+79221683355', email: '', weight: 2.66, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Белозерова', fname: 'Вера',  phone: '+79089272088', email: '', weight: 1.3, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Шестоков', fname: 'Сергей',  phone: '+79000421310', email: '', weight: 9.26, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Шестоков', fname: 'Сергей',  phone: '+79000421310', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Охлупина', fname: 'Вера',  phone: '+79126463485', email: '', weight: 10.2, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Охлупина', fname: 'Вера',  phone: '+79126463485', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Горбачева', fname: 'Александра',  phone: '+79126162038', email: '', weight: 3.6, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Деева', fname: 'Ирина',  phone: '+79126833735', email: '', weight: 1.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Деев', fname: 'Юрий',  phone: '+79827259336', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Деев', fname: 'Юрий',  phone: '+79827259336', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Ажикеева', fname: 'Венера',  phone: '+79068093583', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Красноселова', fname: 'Ольга',  phone: '+79122436095', email: '', weight: 3.3, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Капитанова', fname: 'Полина',  phone: '+79122255597', email: '', weight: 2.3, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Борзяк', fname: 'Алёна',  phone: '+79221952530', email: '', weight: 4.9, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Барейша', fname: 'Татьяна',  phone: '+79045479299', email: '', weight: 4.1, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Шершнева', fname: 'Ирина',  phone: '+79086355145', email: '', weight: 2.74, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Городилина', fname: 'Елена',  phone: '+79126517017', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Городилина', fname: 'Елена',  phone: '+79126517017', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Кротов', fname: 'Роман',  phone: '+79221018084', email: '', weight: 2.7, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Егорова', fname: 'Елена',  phone: '+79122351951', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Егорова', fname: 'Елена',  phone: '+79122351951', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Абакумова', fname: 'Светлана',  phone: '+79501965320', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Абакумова', fname: 'Светлана',  phone: '+79501965320', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Абакумова', fname: 'Светлана',  phone: '+79501965320', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Абакумова', fname: 'Светлана',  phone: '+79501965320', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Солдашова', fname: 'Ирина',  phone: '+79089077794', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Солдашова', fname: 'Ирина',  phone: '+79089077794', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Рыбкина', fname: 'Елена',  phone: '+79126968285', email: '', weight: 0.9, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Рыбкина', fname: 'Анна',  phone: '+79827015518', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Рыбкина', fname: 'Анна',  phone: '+79827015518', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Комиссарова', fname: 'Елена',  phone: '+79221527565', email: '', weight: 3.9, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Ляпунова', fname: 'Ирина',  phone: '+79089208810', email: '', weight: 3.44, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Бобрик', fname: 'Данил',  phone: '+79995598911', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Бобрик', fname: 'Данил',  phone: '+79995598911', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Петленко', fname: 'Ирина',  phone: '+79122306700', email: '', weight: 4.34, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Сердцева', fname: 'Инна',  phone: '+79090014255', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Сердцева', fname: 'Инна',  phone: '+79090014255', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Жуков', fname: 'Алексей',  phone: '+79120488614', email: '', weight: 4.72, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Никитина', fname: 'Мария',  phone: '+79226056422', email: '', weight: 2.84, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Полупан', fname: 'Ирина',  phone: '+9120333273', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Полупан', fname: 'Ирина',  phone: '+9120333273', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Чермянинова', fname: 'Марина',  phone: '+79126160918', email: '', weight: 2.72, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Быстрова', fname: 'Мария',  phone: '+79049838871', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Быстрова', fname: 'Мария',  phone: '+79049838871', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Аверина', fname: 'Елена',  phone: '+79049838872', email: '', weight: 5.2, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Аверина', fname: 'Елена',  phone: '+79049838872', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Мохова', fname: 'Нина',  phone: '+79638507703', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Мохова', fname: 'Нина',  phone: '+79638507703', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Новикова', fname: 'Ирина',  phone: '+79226190061', email: '', weight: 4.7, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Новикова', fname: 'Ирина',  phone: '+79226190061', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Новиков', fname: 'Александр',  phone: '+79221415360', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Новиков', fname: 'Александр',  phone: '+79221415360', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Смирнова', fname: 'Любовь',  phone: '+79655288267', email: '', weight: 2.2, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Смирнова', fname: 'Любовь',  phone: '+79655288267', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Смирнов', fname: 'Михаил',  phone: '+79193740852', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Смирнов', fname: 'Михаил',  phone: '+79193740852', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Волкова', fname: 'Дарья',  phone: '+79122779542', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Волкова', fname: 'Дарья',  phone: '+79122779542', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Матвеева', fname: 'Галина',  phone: '+79089250357', email: '', weight: 1.3, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Матвеева', fname: 'Галина',  phone: '+79089250357', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Верещагина', fname: 'Маргарита',  phone: '+79827207001', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Верещагина', fname: 'Маргарита',  phone: '+79827207001', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Панферова', fname: 'Ольга',  phone: '+79122600310', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Панферова', fname: 'Ольга',  phone: '+79122600310', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Вдовина', fname: 'Юлия',  phone: '+79122134640', email: '', weight: 2.4, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Гришина', fname: 'Татьяна',  phone: '+79655013399', email: '', weight: 1.2, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Гришина', fname: 'Татьяна',  phone: '+79655013399', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Гришина', fname: 'Наталья',  phone: '+79120320571', email: '', weight: 4.8, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Будняцкий', fname: 'Роман',  phone: '+79043849629', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Будняцкий', fname: 'Роман',  phone: '+79043849629', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Будняцкая', fname: 'Лариса',  phone: '+79043868238', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Будняцкая', fname: 'Лариса',  phone: '+79043868238', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Росич', fname: 'Алёна',  phone: '+79049834496', email: '', weight: 3.74, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Макарова', fname: 'Евгения',  phone: '+79126747787', email: '', weight: 3.9, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Макарова', fname: 'Евгения',  phone: '+79126747787', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Мокеев', fname: 'Алексей',  phone: '+79221005868', email: '', weight: 2.2, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Новоселова', fname: 'Надежда',  phone: '+79505600704', email: '', weight: 2.6, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Аксенова', fname: 'Ирина',  phone: '+79527323993', email: '', weight: 5.66, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Аксенова', fname: 'Ирина',  phone: '+79527323993', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Солиева', fname: 'Нигина',  phone: '+79090101920', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Солиева', fname: 'Нигина',  phone: '+79090101920', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Ибакаева', fname: 'Анна',  phone: '+79041799762', email: '', weight: 4.22, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Шнайдер', fname: 'Эдуар',  phone: '+79193900440', email: '', weight: 5.0, created_at: '28.03.2016', mega: 'mega_ek'}
    {lname: 'Шнайдер', fname: 'Эдуар',  phone: '+79193900440', email: '', weight: , created_at: '28.03.2016', mega: 'mega_ek'}
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