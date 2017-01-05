mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"

data = [
  {card: 2310022424409, phone: '+79183120575', mega: 'mega_ad'}
  {card: 2310022424425, phone: '+79183944568', mega: 'mega_ad'}
  {card: 2310022424441, phone: '+79186610050', mega: 'mega_ad'}
  {card: 2310022424466, phone: '+79186233122', mega: 'mega_ad'}
  {card: 2310022424482, phone: '+79002468447', mega: 'mega_ad'}
  {card: 2310022424490, phone: '+79086780269', mega: 'mega_ad'}
  {card: 2310022424516, phone: '+79181555233', mega: 'mega_ad'}
  {card: 2310022424532, phone: '+79184566877', mega: 'mega_ad'}
  {card: 2310022424557, phone: '+79184632558', mega: 'mega_ad'}
  {card: 2310022424573, phone: '+79284112234', mega: 'mega_ad'}
  {card: 2310022424607, phone: '+79628800252', mega: 'mega_ad'}
  {card: 2310022424615, phone: '+79898181963', mega: 'mega_ad'}
  {card: 2310022424649, phone: '+79200297884', mega: 'mega_ad'}
  {card: 2310022424664, phone: '+79618506535', mega: 'mega_ad'}
  {card: 2310022424672, phone: '+79183756838', mega: 'mega_ad'}
  {card: 2310022424698, phone: '+79184450291', mega: 'mega_ad'}
  {card: 2310022424714, phone: '+79180106569', mega: 'mega_ad'}
  {card: 2310022424730, phone: '+79604986472', mega: 'mega_ad'}
  {card: 2310022424755, phone: '+79284170676', mega: 'mega_ad'}
  {card: 2310022424771, phone: '+79384014247', mega: 'mega_ad'}
  {card: 2310022424797, phone: '+79064357844', mega: 'mega_ad'}
  {card: 2310022424813, phone: '+79604949710', mega: 'mega_ad'}
  {card: 2310022424821, phone: '+79189496240', mega: 'mega_ad'}
  {card: 2310022424847, phone: '+79181683453', mega: 'mega_ad'}
  {card: 2310022424870, phone: '+79615065216', mega: 'mega_ad'}
  {card: 2310022424896, phone: '+79884643580', mega: 'mega_ad'}
  {card: 2310022424920, phone: '+79892614761', mega: 'mega_ad'}
  {card: 2310022424938, phone: '+79615251274', mega: 'mega_ad'}
  {card: 2310022424953, phone: '+79628521117', mega: 'mega_ad'}
  {card: 2310022424979, phone: '+79282582144', mega: 'mega_ad'}
  {card: 2310022424995, phone: '+79283310303', mega: 'mega_ad'}
  {card: 2310022424334, phone: '+79184789513', mega: 'mega_ad'}
  {card: 2310022424342, phone: '+79882423568', mega: 'mega_ad'}
  {card: 2310022424367, phone: '+79181488087', mega: 'mega_ad'}
  {card: 2310022424383, phone: '+79892697177', mega: 'mega_ad'}
  {card: 2310022424391, phone: '+79189814346', mega: 'mega_ad'}
  {card: 2310023140020, phone: '+79183375771', mega: 'mega_ad'}
  {card: 2310023140046, phone: '+79180111321', mega: 'mega_ad'}
  {card: 2310023140061, phone: '+79186418363', mega: 'mega_ad'}
  {card: 2310023140079, phone: '+79180111321', mega: 'mega_ad'}
  {card: 2310023140087, phone: '+79189543614', mega: 'mega_ad'}
  {card: 2310023140103, phone: '+79189906971', mega: 'mega_ad'}
  {card: 2310023140111, phone: '+79189232912', mega: 'mega_ad'}
  {card: 2310023140137, phone: '+79615815086', mega: 'mega_ad'}
  {card: 2310023140151, phone: '+79604914908', mega: 'mega_ad'}
  {card: 2310023140178, phone: '+79184469570', mega: 'mega_ad'}
  {card: 2310023140186, phone: '+79002571947', mega: 'mega_ad'}
  {card: 2310023140202, phone: '+79183436467', mega: 'mega_ad'}
  {card: 2310023140228, phone: '+79182224480', mega: 'mega_ad'}
  {card: 2310023140244, phone: '+79288445408', mega: 'mega_ad'}
  {card: 2310023140269, phone: '+79385505877', mega: 'mega_ad'}
  {card: 2310023140293, phone: '+79181336401', mega: 'mega_ad'}
  {card: 2310023140319, phone: '+79284027595', mega: 'mega_ad'}
  {card: 2310023140335, phone: '+79282711110', mega: 'mega_ad'}
  {card: 2310023140350, phone: '+79181409394', mega: 'mega_ad'}
  {card: 2310023140376, phone: '+79184557768', mega: 'mega_ad'}
  {card: 2310023140384, phone: '+79884787723', mega: 'mega_ad'}
  {card: 2310023140400, phone: '+79186870405', mega: 'mega_ad'}
  {card: 2310023140558, phone: '+79180781648', mega: 'mega_ad'}
  {card: 2310023140426, phone: '+79024083554', mega: 'mega_ad'}
  {card: 2310023140434, phone: '+79649021738', mega: 'mega_ad'}
  {card: 2310023140459, phone: '+79034564082', mega: 'mega_ad'}
  {card: 2310023140475, phone: '+79034491119', mega: 'mega_ad'}
  {card: 2310023140509, phone: '+79531143985', mega: 'mega_ad'}
  {card: 2310023140525, phone: '+79180349003', mega: 'mega_ad'}
  {card: 2310023140533, phone: '+79094554763', mega: 'mega_ad'}
  {card: 2310023140582, phone: '+79180879681', mega: 'mega_ad'}
  {card: 2310023140566, phone: '+79530854120', mega: 'mega_ad'}
  {card: 2310023140590, phone: '+79171814007', mega: 'mega_ad'}
  {card: 2310023140657, phone: '+79298546904', mega: 'mega_ad'}
  {card: 2310023140640, phone: '+79385022253', mega: 'mega_ad'}
  {card: 2310023140624, phone: '+79385330780', mega: 'mega_ad'}
  {card: 2310023140665, phone: '+79615262756', mega: 'mega_ad'}
  {card: 2310023140673, phone: '+79181200339', mega: 'mega_ad'}
  {card: 2310023140715, phone: '+79628591971', mega: 'mega_ad'}
  {card: 2310023140723, phone: '+79182257280', mega: 'mega_ad'}
  {card: 2310023140731, phone: '+79529858850', mega: 'mega_ad'}
  {card: 2310023140764, phone: '+79183475981', mega: 'mega_ad'}
  {card: 2310023140780, phone: '+79182739618', mega: 'mega_ad'}
  {card: 2310023140798, phone: '+79180334424', mega: 'mega_ad'}
  {card: 2310023140806, phone: '+79604775581', mega: 'mega_ad'}
  {card: 2310023140814, phone: '+79181277825', mega: 'mega_ad'}
  {card: 2310023140822, phone: '+79184993168', mega: 'mega_ad'}
  {card: 2310023140855, phone: '+79002961701', mega: 'mega_ad'}
  {card: 2310023140863, phone: '+79182244226', mega: 'mega_ad'}
  {card: 2310023140913, phone: '+79186894454', mega: 'mega_ad'}
  {card: 2310023140889, phone: '+79184202299', mega: 'mega_ad'}
  {card: 2310023140921, phone: '+79094614946', mega: 'mega_ad'}
  {card: 2310023140897, phone: '+79064342437', mega: 'mega_ad'}
  {card: 2310023140947, phone: '+79385286141', mega: 'mega_ad'}
  {card: 2310023140970, phone: '+79385112610', mega: 'mega_ad'}
  {card: 2310023140996, phone: '+79184333260', mega: 'mega_ad'}
  {card: 2310023141002, phone: '+79884771228', mega: 'mega_ad'}
  {card: 2310023141028, phone: '+79673165995', mega: 'mega_ad'}
  {card: 2310023141051, phone: '+79880829397', mega: 'mega_ad'}
  {card: 2310023141077, phone: '+79887972021', mega: 'mega_ad'}
  {card: 2310023141085, phone: '+79182438333', mega: 'mega_ad'}
  {card: 2310023141119, phone: '+79180806818', mega: 'mega_ad'}
  {card: 2310023141127, phone: '+79183707709', mega: 'mega_ad'}
  {card: 2310023141143, phone: '+79604794730', mega: 'mega_ad'}
  {card: 2310023141176, phone: '+79604866803', mega: 'mega_ad'}
  {card: 2310023141184, phone: '+79186865894', mega: 'mega_ad'}
  {card: 2310023141200, phone: '+79000070012', mega: 'mega_ad'}
  {card: 2310023141218, phone: '+79885263858', mega: 'mega_ad'}
  {card: 2310023141234, phone: '+79000070014', mega: 'mega_ad'}
  {card: 2310023141259, phone: '+79628596391', mega: 'mega_ad'}
  {card: 2310023141275, phone: '+79182109088', mega: 'mega_ad'}
  {card: 2310023141283, phone: '+79883154621', mega: 'mega_ad'}
  {card: 2310023141309, phone: '+79094519878', mega: 'mega_ad'}
  {card: 2310023141325, phone: '+79094440560', mega: 'mega_ad'}
  {card: 2310023141333, phone: '+79882452909', mega: 'mega_ad'}
  {card: 2310023141358, phone: '+79892107419', mega: 'mega_ad'}
  {card: 2310023141374, phone: '+79002520857', mega: 'mega_ad'}
  {card: 2310023141382, phone: '+79298290975', mega: 'mega_ad'}
  {card: 2310023141390, phone: '+79094618770', mega: 'mega_ad'}
  {card: 2310023141416, phone: '+79528326064', mega: 'mega_ad'}
  {card: 2310023141432, phone: '+79604784938', mega: 'mega_ad'}
  {card: 2310023141457, phone: '+79186350499', mega: 'mega_ad'}
  {card: 2310023141473, phone: '+79183670084', mega: 'mega_ad'}
  {card: 2310023141481, phone: '+79184920747', mega: 'mega_ad'}
  {card: 2310023141507, phone: '+79184191562', mega: 'mega_ad'}
  {card: 2310023141523, phone: '+79184427287', mega: 'mega_ad'}
  {card: 2310023141549, phone: '+79183209278', mega: 'mega_ad'}
  {card: 2310023141606, phone: '+79528680125', mega: 'mega_ad'}
  {card: 2310023141622, phone: '+79528247644', mega: 'mega_ad'}
  {card: 2310023141630, phone: '+79094465530', mega: 'mega_ad'}
  {card: 2310023141655, phone: '+79183330327', mega: 'mega_ad'}
  {card: 2310023141689, phone: '+79284093126', mega: 'mega_ad'}
  {card: 2310023141705, phone: '+79184474401', mega: 'mega_ad'}
  {card: 2310023141713, phone: '+79530704036', mega: 'mega_ad'}
  {card: 2310023141721, phone: '+79054774419', mega: 'mega_ad'}
  {card: 2310023141739, phone: '+79002564134', mega: 'mega_ad'}
  {card: 2310023141754, phone: '+79531123892', mega: 'mega_ad'}
  {card: 2310023141770, phone: '+79284185080', mega: 'mega_ad'}
  {card: 2310023141796, phone: '+79184659585', mega: 'mega_ad'}
  {card: 2310023141812, phone: '+79189308421', mega: 'mega_ad'}
  {card: 2310023141838, phone: '+79184965248', mega: 'mega_ad'}
  {card: 2310023141853, phone: '+79298239933', mega: 'mega_ad'}
  {card: 2310023141879, phone: '+79676602800', mega: 'mega_ad'}
  {card: 2310023141903, phone: '+79054020168', mega: 'mega_ad'}
  {card: 2310023141887, phone: '+79284278667', mega: 'mega_ad'}
  {card: 2310023141929, phone: '+79181158280', mega: 'mega_ad'}
  {card: 2310023143099, phone: '+79183524320', mega: 'mega_ad'}
  {card: 2310023143107, phone: '+79183457239', mega: 'mega_ad'}
  {card: 2310023143131, phone: '+79649198275', mega: 'mega_ad'}
  {card: 2310023143149, phone: '+79186672605', mega: 'mega_ad'}
  {card: 2310023143156, phone: '+79181611113', mega: 'mega_ad'}
  {card: 2310023143180, phone: '+79883673538', mega: 'mega_ad'}
  {card: 2310023143206, phone: '+79184689508', mega: 'mega_ad'}
  {card: 2310023143222, phone: '+79182513141', mega: 'mega_ad'}
  {card: 2310023143230, phone: '+79286615366', mega: 'mega_ad'}
  {card: 2310023143263, phone: '+79528299171', mega: 'mega_ad'}
  {card: 2310023143289, phone: '+79183104040', mega: 'mega_ad'}
  {card: 2310023143305, phone: '+79002520183', mega: 'mega_ad'}
  {card: 2310023143321, phone: '+79181392954', mega: 'mega_ad'}
  {card: 2310023143339, phone: '+79649216331', mega: 'mega_ad'}
  {card: 2310023143354, phone: '+79883867646', mega: 'mega_ad'}
  {card: 2310023143370, phone: '+79189880242', mega: 'mega_ad'}
  {card: 2310023143388, phone: '+79183216891', mega: 'mega_ad'}
  {card: 2310023143412, phone: '+79183333597', mega: 'mega_ad'}
  {card: 2310023143438, phone: '+79282015541', mega: 'mega_ad'}
  {card: 2310023143453, phone: '+79282018231', mega: 'mega_ad'}
  {card: 2310023143461, phone: '+79182945191', mega: 'mega_ad'}
  {card: 2310023143487, phone: '+79186750879', mega: 'mega_ad'}
  {card: 2310023143495, phone: '+79189550669', mega: 'mega_ad'}
  {card: 2310023143451, phone: '+79186873184', mega: 'mega_ad'}
  {card: 2310023143529, phone: '+79284421506', mega: 'mega_ad'}
  {card: 2310023143552, phone: '+79182591375', mega: 'mega_ad'}
  {card: 2310023143560, phone: '+79180872162', mega: 'mega_ad'}
  {card: 2310023143586, phone: '+79385521125', mega: 'mega_ad'}
  {card: 2310023142604, phone: '+79618271052', mega: 'mega_ad'}
  {card: 2310023142620, phone: '+79618270842', mega: 'mega_ad'}
  {card: 2310023142638, phone: '+79649382001', mega: 'mega_ad'}
  {card: 2310023142661, phone: '+79531072191', mega: 'mega_ad'}
  {card: 2310023142679, phone: '+79627633801', mega: 'mega_ad'}
  {card: 2310023142695, phone: '+79054041448', mega: 'mega_ad'}
  {card: 2310023142711, phone: '+79649383939', mega: 'mega_ad'}
  {card: 2310023142737, phone: '+79094630723', mega: 'mega_ad'}
  {card: 2310023142752, phone: '+79615881058', mega: 'mega_ad'}
  {card: 2310023142778, phone: '+79615274457', mega: 'mega_ad'}
  {card: 2310023142794, phone: '+79604896389', mega: 'mega_ad'}
  {card: 2310023142810, phone: '+79181412272', mega: 'mega_ad'}
  {card: 2310023142828, phone: '+79615389793', mega: 'mega_ad'}
  {card: 2310023142844, phone: '+79615922247', mega: 'mega_ad'}
  {card: 2310023142851, phone: '+79183897970', mega: 'mega_ad'}
  {card: 2310023142877, phone: '+79189530464', mega: 'mega_ad'}
  {card: 2310023142893, phone: '+79649033714', mega: 'mega_ad'}
  {card: 2310023142919, phone: '+79184688824', mega: 'mega_ad'}
  {card: 2310023142935, phone: '+79182177030', mega: 'mega_ad'}
  {card: 2310023142950, phone: '+79189624427', mega: 'mega_ad'}
  {card: 2310023142968, phone: '+79181644430', mega: 'mega_ad'}
  {card: 2310023142984, phone: '+79183953881', mega: 'mega_ad'}
  {card: 2310023143008, phone: '+79883543045', mega: 'mega_ad'}
  {card: 2310023143024, phone: '+79034544941', mega: 'mega_ad'}
  {card: 2310023143032, phone: '+79618520783', mega: 'mega_ad'}
  {card: 2310023143057, phone: '+79530728403', mega: 'mega_ad'}
  {card: 2310023143081, phone: '+79181477077', mega: 'mega_ad'}
  {card: 2310023143636, phone: '+79898320238', mega: 'mega_ad'}
  {card: 2310025404416, phone: '+79037270707', mega: 'mega_ts'}
  {card: 2310025403392, phone: '+79153455072', mega: 'mega_ts'}
  {card: 2310025403384, phone: '+79153455072', mega: 'mega_ts'}
  {card: 2310017160810, phone: '+79261412593', mega: 'mega_ts'}
  {card: 2310017160802, phone: '+79261412593', mega: 'mega_ts'}
  {card: 2310022424417, phone: '+79183120575', mega: 'mega_ad'}
  {card: 2310022424433, phone: '+79183944568', mega: 'mega_ad'}
  {card: 2310022424458, phone: '+79186610050', mega: 'mega_ad'}
  {card: 2310022424474, phone: '+79186233122', mega: 'mega_ad'}
  {card: 2310022424508, phone: '+79086780269', mega: 'mega_ad'}
  {card: 2310022424524, phone: '+79181555233', mega: 'mega_ad'}
  {card: 2310022424540, phone: '+79184566877', mega: 'mega_ad'}
  {card: 2310022424565, phone: '+79184632558', mega: 'mega_ad'}
  {card: 2310022424581, phone: '+79284112234', mega: 'mega_ad'}
  {card: 2310022424599, phone: '+79628800252', mega: 'mega_ad'}
  {card: 2310022424623, phone: '+79898181963', mega: 'mega_ad'}
  {card: 2310022424631, phone: '+79200297884', mega: 'mega_ad'}
  {card: 2310022424656, phone: '+79618506535', mega: 'mega_ad'}
  {card: 2310022424680, phone: '+79183756838', mega: 'mega_ad'}
  {card: 2310022424706, phone: '+79184450291', mega: 'mega_ad'}
  {card: 2310022424722, phone: '+79180106569', mega: 'mega_ad'}
  {card: 2310022424748, phone: '+79604986472', mega: 'mega_ad'}
  {card: 2310022424763, phone: '+79284170676', mega: 'mega_ad'}
  {card: 2310022424789, phone: '+79384014247', mega: 'mega_ad'}
  {card: 2310022424805, phone: '+79064357844', mega: 'mega_ad'}
  {card: 2310022424839, phone: '+79189496240', mega: 'mega_ad'}
  {card: 2310022424862, phone: '+79181683453', mega: 'mega_ad'}
  {card: 2310022424888, phone: '+79615065216', mega: 'mega_ad'}
  {card: 2310022424904, phone: '+79884643580', mega: 'mega_ad'}
  {card: 2310022424912, phone: '+79892614761', mega: 'mega_ad'}
  {card: 2310022424946, phone: '+79615251274', mega: 'mega_ad'}
  {card: 2310022424961, phone: '+79628521117', mega: 'mega_ad'}
  {card: 2310022424987, phone: '+79282582144', mega: 'mega_ad'}
  {card: 2310022425000, phone: '+79283310303', mega: 'mega_ad'}
  {card: 2310022424359, phone: '+79882423568', mega: 'mega_ad'}
  {card: 2310022424375, phone: '+79181488087', mega: 'mega_ad'}
  {card: 2310023140012, phone: '+79189814346', mega: 'mega_ad'}
  {card: 2310023140038, phone: '+79183375771', mega: 'mega_ad'}
  {card: 2310023140053, phone: '+79186418363', mega: 'mega_ad'}
  {card: 2310023140095, phone: '+79189906971', mega: 'mega_ad'}
  {card: 2310023140129, phone: '+79189232912', mega: 'mega_ad'}
  {card: 2310023140145, phone: '+79615815086', mega: 'mega_ad'}
  {card: 2310023140160, phone: '+79184469570', mega: 'mega_ad'}
  {card: 2310023140194, phone: '+79002571947', mega: 'mega_ad'}
  {card: 2310023140210, phone: '+79183436467', mega: 'mega_ad'}
  {card: 2310023140236, phone: '+79182224480', mega: 'mega_ad'}
  {card: 2310023140251, phone: '+79288445408', mega: 'mega_ad'}
  {card: 2310023140277, phone: '+79385505877', mega: 'mega_ad'}
  {card: 2310023140285, phone: '+79181336401', mega: 'mega_ad'}
  {card: 2310023140301, phone: '+79284027595', mega: 'mega_ad'}
  {card: 2310023140327, phone: '+79282711110', mega: 'mega_ad'}
  {card: 2310023140343, phone: '+79181409394', mega: 'mega_ad'}
  {card: 2310023140368, phone: '+79184557768', mega: 'mega_ad'}
  {card: 2310023140392, phone: '+79186870405', mega: 'mega_ad'}
  {card: 2310023140418, phone: '+79024083554', mega: 'mega_ad'}
  {card: 2310023140442, phone: '+79649021738', mega: 'mega_ad'}
  {card: 2310023140467, phone: '+79034564082', mega: 'mega_ad'}
  {card: 2310023140483, phone: '+79034491119', mega: 'mega_ad'}
  {card: 2310023140491, phone: '+79531143985', mega: 'mega_ad'}
  {card: 2310023140517, phone: '+79180349003', mega: 'mega_ad'}
  {card: 2310023140541, phone: '+79094554763', mega: 'mega_ad'}
  {card: 2310023140574, phone: '+79180879681', mega: 'mega_ad'}
  {card: 2310023140608, phone: '+79298546904', mega: 'mega_ad'}
  {card: 2310023140632, phone: '+79385022253', mega: 'mega_ad'}
  {card: 2310023140616, phone: '+79385330780', mega: 'mega_ad'}
  {card: 2310023140699, phone: '+79181200339', mega: 'mega_ad'}
  {card: 2310023140707, phone: '+79628591971', mega: 'mega_ad'}
  {card: 2310023140749, phone: '+79529858850', mega: 'mega_ad'}
  {card: 2310023140756, phone: '+79183475981', mega: 'mega_ad'}
  {card: 2310023140772, phone: '+79182739618', mega: 'mega_ad'}
  {card: 2310023140830, phone: '+79184993168', mega: 'mega_ad'}
  {card: 2310023140848, phone: '+79002961701', mega: 'mega_ad'}
  {card: 2310023140871, phone: '+79182244226', mega: 'mega_ad'}
  {card: 2310023140939, phone: '+79094614946', mega: 'mega_ad'}
  {card: 2310023140905, phone: '+79064342437', mega: 'mega_ad'}
  {card: 2310023140962, phone: '+79385286141', mega: 'mega_ad'}
  {card: 2310023140954, phone: '+79385112610', mega: 'mega_ad'}
  {card: 2310023140988, phone: '+79184333260', mega: 'mega_ad'}
  {card: 2310023141010, phone: '+79884771228', mega: 'mega_ad'}
  {card: 2310023141036, phone: '+79673165995', mega: 'mega_ad'}
  {card: 2310023141044, phone: '+79880829397', mega: 'mega_ad'}
  {card: 2310023141069, phone: '+79887972021', mega: 'mega_ad'}
  {card: 2310023141093, phone: '+79182438333', mega: 'mega_ad'}
  {card: 2310023141101, phone: '+79180806818', mega: 'mega_ad'}
  {card: 2310023141135, phone: '+79183707709', mega: 'mega_ad'}
  {card: 2310023141150, phone: '+79604794730', mega: 'mega_ad'}
  {card: 2310023141168, phone: '+79604866803', mega: 'mega_ad'}
  {card: 2310023141192, phone: '+79000070012', mega: 'mega_ad'}
  {card: 2310023141226, phone: '+79885263858', mega: 'mega_ad'}
  {card: 2310023141242, phone: '+79000070014', mega: 'mega_ad'}
  {card: 2310023141267, phone: '+79182109088', mega: 'mega_ad'}
  {card: 2310023141291, phone: '+79094519878', mega: 'mega_ad'}
  {card: 2310023141317, phone: '+79094440560', mega: 'mega_ad'}
  {card: 2310023141341, phone: '+79892107419', mega: 'mega_ad'}
  {card: 2310023141366, phone: '+79002520857', mega: 'mega_ad'}
  {card: 2310023141408, phone: '+79528326064', mega: 'mega_ad'}
  {card: 2310023141424, phone: '+79604784938', mega: 'mega_ad'}
  {card: 2310023141440, phone: '+79186350499', mega: 'mega_ad'}
  {card: 2310023141465, phone: '+79183670084', mega: 'mega_ad'}
  {card: 2310023141499, phone: '+79184920747', mega: 'mega_ad'}
  {card: 2310023141515, phone: '+79184191562', mega: 'mega_ad'}
  {card: 2310023141531, phone: '+79184427287', mega: 'mega_ad'}
  {card: 2310023141598, phone: '+79183209278', mega: 'mega_ad'}
  {card: 2310023141614, phone: '+79528680125', mega: 'mega_ad'}
  {card: 2310023141648, phone: '+79094465530', mega: 'mega_ad'}
  {card: 2310023141663, phone: '+79183330327', mega: 'mega_ad'}
  {card: 2310023141671, phone: '+79284093126', mega: 'mega_ad'}
  {card: 2310023141697, phone: '+79184474401', mega: 'mega_ad'}
  {card: 2310023141747, phone: '+79002564134', mega: 'mega_ad'}
  {card: 2310023141762, phone: '+79531123892', mega: 'mega_ad'}
  {card: 2310023141788, phone: '+79284185080', mega: 'mega_ad'}
  {card: 2310023141805, phone: '+79184659585', mega: 'mega_ad'}
  {card: 2310023141820, phone: '+79189308421', mega: 'mega_ad'}
  {card: 2310023141846, phone: '+79184965248', mega: 'mega_ad'}
  {card: 2310023141861, phone: '+79298239933', mega: 'mega_ad'}
  {card: 2310023141895, phone: '+79054020168', mega: 'mega_ad'}
  {card: 2310023141911, phone: '+79284278667', mega: 'mega_ad'}
  {card: 2310023141937, phone: '+79183524320', mega: 'mega_ad'}
  {card: 2310023143115, phone: '+79183457239', mega: 'mega_ad'}
  {card: 2310023143123, phone: '+79649198275', mega: 'mega_ad'}
  {card: 2310023143164, phone: '+79181611113', mega: 'mega_ad'}
  {card: 2310023143172, phone: '+79883673538', mega: 'mega_ad'}
  {card: 2310023143198, phone: '+79184689508', mega: 'mega_ad'}
  {card: 2310023143214, phone: '+79182513141', mega: 'mega_ad'}
  {card: 2310023143248, phone: '+79286615366', mega: 'mega_ad'}
  {card: 231002314325, phone: '+79528299171', mega: 'mega_ad'}
  {card: 2310023143271, phone: '+79183104040', mega: 'mega_ad'}
  {card: 2310023143297, phone: '+79002520183', mega: 'mega_ad'}
  {card: 2310023143313, phone: '+79181392954', mega: 'mega_ad'}
  {card: 2310023143347, phone: '+79883867646', mega: 'mega_ad'}
  {card: 2310023143362, phone: '+79189880242', mega: 'mega_ad'}
  {card: 2310023143396, phone: '+79183216891', mega: 'mega_ad'}
  {card: 2310023143404, phone: '+79183333597', mega: 'mega_ad'}
  {card: 2310023143420, phone: '+79282015541', mega: 'mega_ad'}
  {card: 2310023143446, phone: '+79282018231', mega: 'mega_ad'}
  {card: 2310023143479, phone: '+79186750879', mega: 'mega_ad'}
  {card: 2310023143503, phone: '+79189550669', mega: 'mega_ad'}
  {card: 2310023143537, phone: '+79284421506', mega: 'mega_ad'}
  {card: 2310023143545, phone: '+79182591375', mega: 'mega_ad'}
  {card: 2310023143578, phone: '+79180872162', mega: 'mega_ad'}
  {card: 2310023142596, phone: '+79618271052', mega: 'mega_ad'}
  {card: 2310023142612, phone: '+79618270842', mega: 'mega_ad'}
  {card: 2310023142646, phone: '+79649382001', mega: 'mega_ad'}
  {card: 2310023142653, phone: '+79531072191', mega: 'mega_ad'}
  {card: 2310023142687, phone: '+79627633801', mega: 'mega_ad'}
  {card: 2310023142703, phone: '+79054041448', mega: 'mega_ad'}
  {card: 2310023142729, phone: '+79649383939', mega: 'mega_ad'}
  {card: 2310023142745, phone: '+79094630723', mega: 'mega_ad'}
  {card: 2310023142760, phone: '+79615881058', mega: 'mega_ad'}
  {card: 2310023142786, phone: '+79615274457', mega: 'mega_ad'}
  {card: 2310023142802, phone: '+79604896389', mega: 'mega_ad'}
  {card: 2310023142836, phone: '+79615389793', mega: 'mega_ad'}
  {card: 2310023142869, phone: '+79189530464', mega: 'mega_ad'}
  {card: 2310023142885, phone: '+79649033714', mega: 'mega_ad'}
  {card: 2310023142901, phone: '+79184688824', mega: 'mega_ad'}
  {card: 2310023142927, phone: '+79182177030', mega: 'mega_ad'}
  {card: 2310023142943, phone: '+79189624427', mega: 'mega_ad'}
  {card: 2310023142976, phone: '+79181644430', mega: 'mega_ad'}
  {card: 2310023142992, phone: '+79183953881', mega: 'mega_ad'}
  {card: 2310023143016, phone: '+79034544941', mega: 'mega_ad'}
  {card: 2310023143040, phone: '+79618520783', mega: 'mega_ad'}
  {card: 2310023143065, phone: '+79530728403', mega: 'mega_ad'}
  {card: 2310023143073, phone: '+79181477077', mega: 'mega_ad'}
  {card: 2310023143644, phone: '+79898320238', mega: 'mega_ad'}
  {card: 2310023140673, phone: '+79181200339', mega: 'mega_ad'}
  {card: 2310023141549, phone: '+79183209278', mega: 'mega_ad'}
  {card: 2310023140681, phone: '+79181200339', mega: 'mega_ad'}
  {card: 2310023141580, phone: '+79183209278', mega: 'mega_ad'}
  {card: 2310023141572, phone: '+79183209278', mega: 'mega_ad'}
  {card: 2310023141564, phone: '+79183209278', mega: 'mega_ad'}
  {card: 2310023141556, phone: '+79183209278', mega: 'mega_ad'}
]


###{card: , phone: "+7", mega: "mega_om"}###



# database connection
mongoose.connect(config.db.path + config.db.name)
db = mongoose.connection

db.on 'error', (err)->
  console.log "Error connection to database: ", err
db.once 'open', ()->
  console.log "Connected to db!"

  # Schemas loading
  PreRegisterModel = require('./schemas/preregister.coffee').get mongoose
  CardModel = require('./schemas/cards.coffee').get mongoose
  TransactionsModel = require('./schemas/transactions.coffee').get mongoose

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

  createTransactions = (message, user_id, card_number, sum, whos, cb)->
    model = new TransactionsModel
      owner: user_id
      sum: sum
      card_number: card_number
      mega: getMega whos
      whos: whos
      created_at: new Date()
    model.save (err, m)->
      message += "Successfully created transaction " + user_id + " " + card_number + " record! "
      cb(message, m, model)

  getPreregister = (message, phone, cb)->
    PreRegisterModel.findOne {phone: phone}, (err, pr)->
      if !pr
        console.log message + "User " + phone + " is not found!" + "\n"
      else
        message += "User " + phone + " is found! "
        cb message, pr, pr

  getCard = (message, number, prereg, cb)->
      CardModel.findOne {number: number}, (err, f_card)->
        if !f_card
          console.log message + "Card " + number + " is not found!" + "\n"
        else        
          if f_card.is_active
            message += "Card " + number + " is found and active! "

            real_balance = prereg.balance
            real_balance -= t.sum for t in prereg.transactions  
            if real_balance >= (if f_card.owner > 500 then 500 else 250)
              message += "Balance of user " + prereg.phone + " is enough! Balance before transaction is: " + real_balance + " "
              f_card.is_active = false
              f_card.recipient = prereg._id
              f_card.save ()->
                message += "Card " + number + " is found and not active now! Recipient " + prereg._id + " "
                cb message, f_card, f_card, false
            else
              console.log message + "Balance of user " + prereg.phone + " is not enough! Balance is: " + real_balance + " need " + (if f_card.owner > 500 then 500 else 250) + "\n"
          else
            message += "Card " + number + " is found and not active! "
            cb message, f_card, f_card, true
  users_iterator = (user)->
    phone = user.phone
    card = user.card
    mega = user.mega
    message = ""
    getPreregister message, phone, (message, p, prereg)->
      getCard message, card, prereg, (message, card_data, card_model, was_active)->
        if !was_active
          createTransactions message, prereg._id, card_model.number, (if card_model.owner > 500 then 500 else 250), mega, (message, tr_data)->
            prereg.transactions.push tr_data
            prereg.save (err)->
              console.log message + "Successfully add transaction " + card_model.number + " to " + prereg.fname + " " + prereg.lname + " record!" + "\n"
        else
          console.log message + "Card " + card + " already linked to user " + phone + "\n"

  for user in data
    users_iterator user