mongoose     = require 'mongoose'
config       = require "./config.json"
moment       = require "moment"

data = [
  {card: 2310019864393, phone: '+79184623319­', mega: 'mega_ad'}
  {card: 2310019863015, phone: '+79184242735', mega: 'mega_ad'}
  {card: 2310019862991, phone: '+79182212225', mega: 'mega_ad'}
  {card: 2310019862934, phone: '+79184233370', mega: 'mega_ad'}
  {card: 2310019862207, phone: '+79034471337', mega: 'mega_ad'}
  {card: 2310019861571, phone: '+79054740646', mega: 'mega_ad'}
  {card: 2310019861530, phone: '+79530924674', mega: 'mega_ad'}
  {card: 2310019864385, phone: '+79184623319­', mega: 'mega_ad'}
  {card: 2310019863023, phone: '+79184242735', mega: 'mega_ad'}
  {card: 2310019862991, phone: '+79182212225', mega: 'mega_ad'}
  {card: 2310019862942, phone: '+79184233370', mega: 'mega_ad'}
  {card: 2310019862215, phone: '+79034471337', mega: 'mega_ad'}
  {card: 2310019861589, phone: '+79054740646', mega: 'mega_ad'}
  {card: 2310019861548, phone: '+79530924674', mega: 'mega_ad'}
  {card: 2310019864500, phone: '+79529837693', mega: 'mega_ad'}
  {card: 2310019864484, phone: '+79529830123', mega: 'mega_ad'}
  {card: 2310019864465, phone: '+79186610050', mega: 'mega_ad'}
  {card: 2310019864427, phone: '+79881886700', mega: 'mega_ad'}
  {card: 2310019864401, phone: '+79184623319­', mega: 'mega_ad'}
  {card: 2310019864336, phone: '+79183524843', mega: 'mega_ad'}
  {card: 2310019864294, phone: '+79180114606', mega: 'mega_ad'}
  {card: 2310019864286, phone: '+79189777629', mega: 'mega_ad'}
  {card: 2310019864260, phone: '+79883434097', mega: 'mega_ad'}
  {card: 2310019864237, phone: '+79181611372', mega: 'mega_ad'}
  {card: 2310019864153, phone: '+79180105335', mega: 'mega_ad'}
  {card: 2310019864138, phone: '+79182494627', mega: 'mega_ad'}
  {card: 2310019864104, phone: '+79528377872', mega: 'mega_ad'}
  {card: 2310019864096, phone: '+79673014205', mega: 'mega_ad'}
  {card: 2310019864070, phone: '+79615922247', mega: 'mega_ad'}
  {card: 2310019864047, phone: '+79282320245', mega: 'mega_ad'}
  {card: 2310019864021, phone: '+79615355773', mega: 'mega_ad'}
  {card: 2310019863999, phone: '+79885219505', mega: 'mega_ad'}
  {card: 2310019863973, phone: '+79182967692', mega: 'mega_ad'}
  {card: 2310019863965, phone: '+79183141316', mega: 'mega_ad'}
  {card: 2310019863932, phone: '+79604977407', mega: 'mega_ad'}
  {card: 2310019863916, phone: '+79604973494', mega: 'mega_ad'}
  {card: 2310019863890, phone: '+79184488496', mega: 'mega_ad'}
  {card: 2310019863874, phone: '+79184336000', mega: 'mega_ad'}
  {card: 2310019863841, phone: '+79280404149', mega: 'mega_ad'}
  {card: 2310019863825, phone: '+79528389915', mega: 'mega_ad'}
  {card: 2310019863817, phone: '+79186202898', mega: 'mega_ad'}
  {card: 2310019863775, phone: '+79628800864', mega: 'mega_ad'}
  {card: 2310019863734, phone: '+79182927788', mega: 'mega_ad'}
  {card: 2310019863718, phone: '+79182244226', mega: 'mega_ad'}
  {card: 2310019863684, phone: '+79182211735', mega: 'mega_ad'}
  {card: 2310019863676, phone: '+79615074674', mega: 'mega_ad'}
  {card: 2310019863650, phone: '+79064357844', mega: 'mega_ad'}
  {card: 2310019863627, phone: '+79184291086', mega: 'mega_ad'}
  {card: 2310019863601, phone: '+79181636920', mega: 'mega_ad'}
  {card: 2310019863585, phone: '+79181935048', mega: 'mega_ad'}
  {card: 2310019863569, phone: '+79184281230', mega: 'mega_ad'}
  {card: 2310019863544, phone: '+79054950625', mega: 'mega_ad'}
  {card: 2310019863502, phone: '+79385522868', mega: 'mega_ad'}
  {card: 2310019863494, phone: '+79184426768', mega: 'mega_ad'}
  {card: 2310019863437, phone: '+79182533791', mega: 'mega_ad'}
  {card: 2310019863403, phone: '+79649224537', mega: 'mega_ad'}
  {card: 2310019863338, phone: '+79892713707', mega: 'mega_ad'}
  {card: 2310019863312, phone: '+79284218039', mega: 'mega_ad'}
  {card: 2310019863296, phone: '+79183992955', mega: 'mega_ad'}
  {card: 2310019863270, phone: '+79184288241', mega: 'mega_ad'}
  {card: 2310019863262, phone: '+79528508035', mega: 'mega_ad'}
  {card: 2310019863247, phone: '+79615968823', mega: 'mega_ad'}
  {card: 2310019863221, phone: '+79676624736', mega: 'mega_ad'}
  {card: 2310019863205, phone: '+79528474912', mega: 'mega_ad'}
  {card: 2310019863163, phone: '+79183864678', mega: 'mega_ad'}
  {card: 2310019863130, phone: '+79183843240', mega: 'mega_ad'}
  {card: 2310019863114, phone: '+79182194593', mega: 'mega_ad'}
  {card: 2310019863106, phone: '+79627678693', mega: 'mega_ad'}
  {card: 2310019863072, phone: '+79384987889', mega: 'mega_ad'}
  {card: 2310019863031, phone: '+79184242735', mega: 'mega_ad'}
  {card: 2310019862991, phone: '+79182212225', mega: 'mega_ad'}
  {card: 2310019862959, phone: '+79184233370', mega: 'mega_ad'}
  {card: 2310019862918, phone: '+79615020189', mega: 'mega_ad'}
  {card: 2310019862892, phone: '+79615072047', mega: 'mega_ad'}
  {card: 2310019862876, phone: '+79181137890', mega: 'mega_ad'}
  {card: 2310019862850, phone: '+79184684920', mega: 'mega_ad'}
  {card: 2310019862835, phone: '+79180413947', mega: 'mega_ad'}
  {card: 2310019862801, phone: '+79384487840', mega: 'mega_ad'}
  {card: 2310019862777, phone: '+79898373611', mega: 'mega_ad'}
  {card: 2310019862751, phone: '+79898103208', mega: 'mega_ad'}
  {card: 2310019862744, phone: '+79184085094', mega: 'mega_ad'}
  {card: 2310019862710, phone: '+79086766509', mega: 'mega_ad'}
  {card: 2310019862694, phone: '+79284681604', mega: 'mega_ad'}
  {card: 2310019862678, phone: '+79180259002', mega: 'mega_ad'}
  {card: 2310019862652, phone: '+79180033760', mega: 'mega_ad'}
  {card: 2310019862645, phone: '+79615262756', mega: 'mega_ad'}
  {card: 2310019862611, phone: '+79184310177', mega: 'mega_ad'}
  {card: 2310019862595, phone: '+79184492486', mega: 'mega_ad'}
  {card: 2310019862579, phone: '+79186295967', mega: 'mega_ad'}
  {card: 2310019862553, phone: '+79002486191', mega: 'mega_ad'}
  {card: 2310019862538, phone: '+79180827817', mega: 'mega_ad'}
  {card: 2310019862512, phone: '+79184835749', mega: 'mega_ad'}
  {card: 2310019862496, phone: '+79649215842', mega: 'mega_ad'}
  {card: 2310019862488, phone: '+79181659448', mega: 'mega_ad'}
  {card: 2310019862462, phone: '+79183436467', mega: 'mega_ad'}
  {card: 2310019862447, phone: '+79184487041', mega: 'mega_ad'}
  {card: 2310019862421, phone: '+79284314412', mega: 'mega_ad'}
  {card: 2310019862397, phone: '+79184950287', mega: 'mega_ad'}
  {card: 2310019862389, phone: '+79182975530', mega: 'mega_ad'}
  {card: 2310019862348, phone: '+79181372273', mega: 'mega_ad'}
  {card: 2310019862322, phone: '+79183334914', mega: 'mega_ad'}
  {card: 2310019862306, phone: '+79024046659', mega: 'mega_ad'}
  {card: 2310019862280, phone: '+79186223284', mega: 'mega_ad'}
  {card: 2310019862264, phone: '+79183457239', mega: 'mega_ad'}
  {card: 2310019862249, phone: '+79604810877', mega: 'mega_ad'}
  {card: 2310019862223, phone: '+79034471337', mega: 'mega_ad'}
  {card: 2310019862181, phone: '+79628732482', mega: 'mega_ad'}
  {card: 2310019862157, phone: '+79615140782', mega: 'mega_ad'}
  {card: 2310019862132, phone: '+79184423469', mega: 'mega_ad'}
  {card: 2310019862116, phone: '+79180348738', mega: 'mega_ad'}
  {card: 2310019862090, phone: '+79604925126', mega: 'mega_ad'}
  {card: 2310019862058, phone: '+79094630723', mega: 'mega_ad'}
  {card: 2310019862041, phone: '+79654578123', mega: 'mega_ad'}
  {card: 2310019862025, phone: '+79615887788', mega: 'mega_ad'}
  {card: 2310019861993, phone: '+79604794730', mega: 'mega_ad'}
  {card: 2310019861977, phone: '+79184101803', mega: 'mega_ad'}
  {card: 2310019861951, phone: '+79604866803', mega: 'mega_ad'}
  {card: 2310019861936, phone: '+79184989835', mega: 'mega_ad'}
  {card: 2310019861910, phone: '+79184871835', mega: 'mega_ad'}
  {card: 2310019861886, phone: '+79898388624', mega: 'mega_ad'}
  {card: 2310019861860, phone: '+79180607708', mega: 'mega_ad'}
  {card: 2310019861829, phone: '+79184680629', mega: 'mega_ad'}
  {card: 2310019863387, phone: '+79182645400', mega: 'mega_ad'}
  {card: 2310019861803, phone: '+79182533793', mega: 'mega_ad'}
  {card: 2310019861787, phone: '+79284224987', mega: 'mega_ad'}
  {card: 2310019861761, phone: '+79054940067', mega: 'mega_ad'}
  {card: 2310019861696, phone: '+79282631566', mega: 'mega_ad'}
  {card: 2310019861662, phone: '+79615252444', mega: 'mega_ad'}
  {card: 2310019861654, phone: '+79183626867', mega: 'mega_ad'}
  {card: 2310019861621, phone: '+79284336739', mega: 'mega_ad'}
  {card: 2310019861597, phone: '+79054740646', mega: 'mega_ad'}
  {card: 2310019861555, phone: '+79530924674', mega: 'mega_ad'}
  {card: 2310019861522, phone: '+79182476278', mega: 'mega_ad'}
  {card: 2310019861506, phone: '+79094523446', mega: 'mega_ad'}
  {card: 2310019861480, phone: '+79618516967', mega: 'mega_ad'}
  {card: 2310019861464, phone: '+79164976563', mega: 'mega_ad'}
  {card: 2310019861449, phone: '+79183577244', mega: 'mega_ad'}
  {card: 2310019861415, phone: '+79615142910', mega: 'mega_ad'}
  {card: 2310019861399, phone: '+79528683404', mega: 'mega_ad'}
  {card: 2310019861373, phone: '+79615306818', mega: 'mega_ad'}
  {card: 2310019861365, phone: '+79530728403', mega: 'mega_ad'}
  {card: 2310019861340, phone: '+79054959433', mega: 'mega_ad'}
  {card: 2310019861308, phone: '+79189832806', mega: 'mega_ad'}
  {card: 2310019861290, phone: '+79181382793', mega: 'mega_ad'}
  {card: 2310019861258, phone: '+79232730373', mega: 'mega_ad'}
  {card: 2310019861209, phone: '+79615881058', mega: 'mega_ad'}
  {card: 2310019861159, phone: '+79615274457', mega: 'mega_ad'}
  {card: 2310019861167, phone: '+79086785050', mega: 'mega_ad'}
  {card: 2310019861134, phone: '+79086785088', mega: 'mega_ad'}
  {card: 2310019861100, phone: '+79086785011', mega: 'mega_ad'}
  {card: 2310019861092, phone: '+79184117896', mega: 'mega_ad'}
  {card: 2310019861076, phone: '+79186274619', mega: 'mega_ad'}
  {card: 2310019861043, phone: '+79182242722', mega: 'mega_ad'}
  {card: 2310019864591, phone: '+79183111148', mega: 'mega_ad'}
  {card: 2310019864609, phone: '+79183111148', mega: 'mega_ad'}
  {card: 2310019864575, phone: '+79182399865', mega: 'mega_ad'}
  {card: 2310019864583, phone: '+79182399865', mega: 'mega_ad'}
  {card: 2310019864559, phone: '+79183423421', mega: 'mega_ad'}
  {card: 2310019864567, phone: '+79183423421', mega: 'mega_ad'}
  {card: 2310019864534, phone: '+79676610763', mega: 'mega_ad'}
  {card: 2310019864542, phone: '+79676610763', mega: 'mega_ad'}
  {card: 2310019860979, phone: '+79180129312', mega: 'mega_ad'}
  {card: 2310019860987, phone: '+79180129312', mega: 'mega_ad'}
  {card: 2310019861001, phone: '+79615188530', mega: 'mega_ad'}
  {card: 2310019861019, phone: '+79615188530', mega: 'mega_ad'}
  {card: 2310019861027, phone: '+79180420298', mega: 'mega_ad'}
  {card: 2310019864369, phone: '+79184559208', mega: 'mega_ad'}
  {card: 2310019864351, phone: '+79184559208', mega: 'mega_ad'}
  {card: 2310019864344, phone: '+79184559208', mega: 'mega_ad'}
  {card: 2310019864377, phone: '+79184559208', mega: 'mega_ad'}
  {card: 2310019864385, phone: '+79184559208', mega: 'mega_ad'}
  {card: 2310019861233, phone: '+79086914186', mega: 'mega_ad'}
  {card: 2310019861241, phone: '+79086914186', mega: 'mega_ad'}
  {card: 2310019861225, phone: '+79086914186', mega: 'mega_ad'}
  {card: 2310019861217, phone: '+79086914186', mega: 'mega_ad'}
  {card: 2310019861738, phone: '+79183132264', mega: 'mega_ad'}
  {card: 2310019861720, phone: '+79183132264', mega: 'mega_ad'}
  {card: 2310019861746, phone: '+79183132264', mega: 'mega_ad'}
  {card: 2310019861712, phone: '+79183132264', mega: 'mega_ad'}
  {card: 2310019864518, phone: '+79094590372', mega: 'mega_ad'}
  {card: 2310019864492, phone: '+79529837693', mega: 'mega_ad'}
  {card: 2310019864476, phone: '+79529830123', mega: 'mega_ad'}
  {card: 2310019864468, phone: '+79654576620', mega: 'mega_ad'}
  {card: 2310019864443, phone: '+79186610050', mega: 'mega_ad'}
  {card: 2310019864435, phone: '+79881886700', mega: 'mega_ad'}
  {card: 2310019864419, phone: '+79184623319­', mega: 'mega_ad'}
  {card: 2310019864328, phone: '+79183524843', mega: 'mega_ad'}
  {card: 2310019864310, phone: '+79186218316', mega: 'mega_ad'}
  {card: 2310019864302, phone: '+79180114606', mega: 'mega_ad'}
  {card: 2310019864278, phone: '+79189777629', mega: 'mega_ad'}
  {card: 2310019864252, phone: '+79883434097', mega: 'mega_ad'}
  {card: 2310019864245, phone: '+79186894454', mega: 'mega_ad'}
  {card: 2310019864229, phone: '+79181611372', mega: 'mega_ad'}
  {card: 2310019864187, phone: '+79189710327', mega: 'mega_ad'}
  {card: 2310019864179, phone: '+77918153321', mega: 'mega_ad'}
  {card: 2310019864161, phone: '+79180105335', mega: 'mega_ad'}
  {card: 2310019864146, phone: '+79282614347', mega: 'mega_ad'}
  {card: 2310019864120, phone: '+79182494627', mega: 'mega_ad'}
  {card: 2310019864112, phone: '+79528377872', mega: 'mega_ad'}
  {card: 2310019864088, phone: '+79673014205', mega: 'mega_ad'}
  {card: 2310019864062, phone: '+79615922247', mega: 'mega_ad'}
  {card: 2310019864054, phone: '+79282320245', mega: 'mega_ad'}
  {card: 2310019864039, phone: '+79615355773', mega: 'mega_ad'}
  {card: 2310019864013, phone: '+79884795042', mega: 'mega_ad'}
  {card: 2310019864005, phone: '+79885219505', mega: 'mega_ad'}
  {card: 2310019863981, phone: '+79182967692', mega: 'mega_ad'}
  {card: 2310019863957, phone: '+79183141316', mega: 'mega_ad'}
  {card: 2310019863940, phone: '+79604977407', mega: 'mega_ad'}
  {card: 2310019863924, phone: '+79604973494', mega: 'mega_ad'}
  {card: 2310019863908, phone: '+79184488496', mega: 'mega_ad'}
  {card: 2310019863866, phone: '+79184336000', mega: 'mega_ad'}
  {card: 2310019863858, phone: '+79280404149', mega: 'mega_ad'}
  {card: 2310019863833, phone: '+79528389915', mega: 'mega_ad'}
  {card: 2310019863809, phone: '+79186202898', mega: 'mega_ad'}
  {card: 2310019863791, phone: '+79184958256', mega: 'mega_ad'}
  {card: 2310019863783, phone: '+79628800864', mega: 'mega_ad'}
  {card: 2310019863767, phone: '+79897716252', mega: 'mega_ad'}
  {card: 2310019863759, phone: '+79182927788', mega: 'mega_ad'}
  {card: 2310019863726, phone: '+79182244226', mega: 'mega_ad'}
  {card: 2310019863700, phone: '+79182211735', mega: 'mega_ad'}
  {card: 2310019863668, phone: '+79615074674', mega: 'mega_ad'}
  {card: 2310019863643, phone: '+79064357844', mega: 'mega_ad'}
  {card: 2310019863635, phone: '+79184291086', mega: 'mega_ad'}
  {card: 2310019863619, phone: '+79181636920', mega: 'mega_ad'}
  {card: 2310019863593, phone: '+79181935048', mega: 'mega_ad'}
  {card: 2310019863577, phone: '+79184281230', mega: 'mega_ad'}
  {card: 2310019863551, phone: '+79054950625', mega: 'mega_ad'}
  {card: 2310019863536, phone: '+79183457009', mega: 'mega_ad'}
  {card: 2310019863528, phone: '+79184739231', mega: 'mega_ad'}
  {card: 2310019863510, phone: '+79385522868', mega: 'mega_ad'}
  {card: 2310019863478, phone: '+79184426768', mega: 'mega_ad'}
  {card: 2310019863460, phone: '+79530723584', mega: 'mega_ad'}
  {card: 2310019863452, phone: '+79528350993', mega: 'mega_ad'}
  {card: 2310019863445, phone: '+79183423213', mega: 'mega_ad'}
  {card: 2310019863429, phone: '+79182533791', mega: 'mega_ad'}
  {card: 2310019863353, phone: '+79184833811', mega: 'mega_ad'}
  {card: 2310019863411, phone: '+79649224537', mega: 'mega_ad'}
  {card: 2310019863395, phone: '+79676542848', mega: 'mega_ad'}
  {card: 2310019863346, phone: '+79892713707', mega: 'mega_ad'}
  {card: 2310019863320, phone: '+79284218039', mega: 'mega_ad'}
  {card: 2310019863304, phone: '+79182532193', mega: 'mega_ad'}
  {card: 2310019863361, phone: '+79183992955', mega: 'mega_ad'}
  {card: 2310019863288, phone: '+79184288241', mega: 'mega_ad'}
  {card: 2310019863254, phone: '+79528508035', mega: 'mega_ad'}
  {card: 2310019863239, phone: '+79615968823', mega: 'mega_ad'}
  {card: 2310019863213, phone: '+79676624736', mega: 'mega_ad'}
  {card: 2310019863197, phone: '+79528474912', mega: 'mega_ad'}
  {card: 2310019863189, phone: '+79881619262', mega: 'mega_ad'}
  {card: 2310019863171, phone: '+79618502209', mega: 'mega_ad'}
  {card: 2310019863155, phone: '+79183864678', mega: 'mega_ad'}
  {card: 2310019863148, phone: '+79183843240', mega: 'mega_ad'}
  {card: 2310019863122, phone: '+79182194593', mega: 'mega_ad'}
  {card: 2310019863098, phone: '+79183172530', mega: 'mega_ad'}
  {card: 2310019863080, phone: '+79627678693', mega: 'mega_ad'}
  {card: 2310019863064, phone: '+79384987889', mega: 'mega_ad'}
  {card: 2310019863056, phone: '+79891407666', mega: 'mega_ad'}
  {card: 2310019863049, phone: '+79184242735', mega: 'mega_ad'}
  {card: 2310019863007, phone: '+79182212225', mega: 'mega_ad'}
  {card: 2310019862967, phone: '+79184233370', mega: 'mega_ad'}
  {card: 2310019862926, phone: '+79615020189', mega: 'mega_ad'}
  {card: 2310019862900, phone: '+79615072047', mega: 'mega_ad'}
  {card: 2310019862884, phone: '+79181137890', mega: 'mega_ad'}
  {card: 2310019862868, phone: '+79184684920', mega: 'mega_ad'}
  {card: 2310019862817, phone: '+79604880251', mega: 'mega_ad'}
  {card: 2310019862827, phone: '+79180413947', mega: 'mega_ad'}
  {card: 2310019862819, phone: '+79384487840', mega: 'mega_ad'}
  {card: 2310019862793, phone: '+79002848065', mega: 'mega_ad'}
  {card: 2310019862785, phone: '+79898373611', mega: 'mega_ad'}
  {card: 2310019862769, phone: '+79898103208', mega: 'mega_ad'}
  {card: 2310019862736, phone: '+79184085094', mega: 'mega_ad'}
  {card: 2310019862728, phone: '+79086766509', mega: 'mega_ad'}
  {card: 2310019862702, phone: '+79284681604', mega: 'mega_ad'}
  {card: 2310019862686, phone: '+79180259002', mega: 'mega_ad'}
  {card: 2310019862660, phone: '+79180033760', mega: 'mega_ad'}
  {card: 2310019862637, phone: '+79615262756', mega: 'mega_ad'}
  {card: 2310019862629, phone: '+79184310177', mega: 'mega_ad'}
  {card: 2310019862603, phone: '+79184492486', mega: 'mega_ad'}
  {card: 2310019862587, phone: '+79186295967', mega: 'mega_ad'}
  {card: 2310019862561, phone: '+79002486191', mega: 'mega_ad'}
  {card: 2310019862546, phone: '+79180827817', mega: 'mega_ad'}
  {card: 2310019862520, phone: '+79184835749', mega: 'mega_ad'}
  {card: 2310019862504, phone: '+79649215842', mega: 'mega_ad'}
  {card: 2310019862470, phone: '+79181659448', mega: 'mega_ad'}
  {card: 2310019862454, phone: '+79183436467', mega: 'mega_ad'}
  {card: 2310019862439, phone: '+79184487041', mega: 'mega_ad'}
  {card: 2310019862413, phone: '+79284314412', mega: 'mega_ad'}
  {card: 2310019862405, phone: '+79184950287', mega: 'mega_ad'}
  {card: 2310019862371, phone: '+79182975530', mega: 'mega_ad'}
  {card: 2310019862363, phone: '+79180202161', mega: 'mega_ad'}
  {card: 2310019862355, phone: '+79181372273', mega: 'mega_ad'}
  {card: 2310019862330, phone: '+79183334914', mega: 'mega_ad'}
  {card: 2310019862314, phone: '+79024046659', mega: 'mega_ad'}
  {card: 2310019862298, phone: '+79186223284', mega: 'mega_ad'}
  {card: 2310019862272, phone: '+79183457239', mega: 'mega_ad'}
  {card: 2310019862256, phone: '+79604810877', mega: 'mega_ad'}
  {card: 2310019862231, phone: '+79034471337', mega: 'mega_ad'}
  {card: 2310019862199, phone: '+79628732482', mega: 'mega_ad'}
  {card: 2310019862173, phone: '+79286663927', mega: 'mega_ad'}
  {card: 2310019862165, phone: '+79615140782', mega: 'mega_ad'}
  {card: 2310019862140, phone: '+79184423469', mega: 'mega_ad'}
  {card: 2310019862124, phone: '+79892661275', mega: 'mega_ad'}
  {card: 2310019862108, phone: '+79180348738', mega: 'mega_ad'}
  {card: 2310019862082, phone: '+79530858226', mega: 'mega_ad'}
  {card: 2310019862074, phone: '+79604925126', mega: 'mega_ad'}
  {card: 2310019862066, phone: '+79094630723', mega: 'mega_ad'}
  {card: 2310019862033, phone: '+79654578123', mega: 'mega_ad'}
  {card: 2310019862017, phone: '+79615887788', mega: 'mega_ad'}
  {card: 2310019862009, phone: '+79615330094', mega: 'mega_ad'}
  {card: 2310019861985, phone: '+79604794730', mega: 'mega_ad'}
  {card: 2310019861969, phone: '+79184101803', mega: 'mega_ad'}
  {card: 2310019861944, phone: '+79604866803', mega: 'mega_ad'}
  {card: 2310019861928, phone: '+79184989835', mega: 'mega_ad'}
  {card: 2310019861902, phone: '+79184871835', mega: 'mega_ad'}
  {card: 2310019861894, phone: '+79288445408', mega: 'mega_ad'}
  {card: 2310019861878, phone: '+79898388624', mega: 'mega_ad'}
  {card: 2310019861852, phone: '+79180607708', mega: 'mega_ad'}
  {card: 2310019861845, phone: '+79189232912', mega: 'mega_ad'}
  {card: 2310019861837, phone: '+79184680629', mega: 'mega_ad'}
  {card: 2310019863379, phone: '+79182645400', mega: 'mega_ad'}
  {card: 2310019861811, phone: '+79615364516', mega: 'mega_ad'}
  {card: 2310019861795, phone: '+79182533793', mega: 'mega_ad'}
  {card: 2310019861779, phone: '+79284224987', mega: 'mega_ad'}
  {card: 2310019861753, phone: '+79054940067', mega: 'mega_ad'}
  {card: 2310019861704, phone: '+79183990174', mega: 'mega_ad'}
  {card: 2310019861688, phone: '+79282631566', mega: 'mega_ad'}
  {card: 2310019861670, phone: '+79615252444', mega: 'mega_ad'}
  {card: 2310019861647, phone: '+79183626867', mega: 'mega_ad'}
  {card: 2310019861639, phone: '+79628539009', mega: 'mega_ad'}
  {card: 2310019861613, phone: '+79284336739', mega: 'mega_ad'}
  {card: 2310019861605, phone: '+79054740646', mega: 'mega_ad'}
  {card: 2310019861563, phone: '+79530924674', mega: 'mega_ad'}
  {card: 2310019861514, phone: '+79182476278', mega: 'mega_ad'}
  {card: 2310019861498, phone: '+79094523446', mega: 'mega_ad'}
  {card: 2310019861472, phone: '+79618516967', mega: 'mega_ad'}
  {card: 2310019861456, phone: '+79164976563', mega: 'mega_ad'}
  {card: 2310019861431, phone: '+79183577244', mega: 'mega_ad'}
  {card: 2310019861423, phone: '+79615142910', mega: 'mega_ad'}
  {card: 2310019861407, phone: '+79528683404', mega: 'mega_ad'}
  {card: 2310019861381, phone: '+79615306818', mega: 'mega_ad'}
  {card: 2310019861357, phone: '+79530728403', mega: 'mega_ad'}
  {card: 2310019861332, phone: '+79054959433', mega: 'mega_ad'}
  {card: 2310019861324, phone: '+79648968025', mega: 'mega_ad'}
  {card: 2310019861316, phone: '+79189832806', mega: 'mega_ad'}
  {card: 2310019861282, phone: '+79181382793', mega: 'mega_ad'}
  {card: 2310019861274, phone: '+79615908631', mega: 'mega_ad'}
  {card: 2310019861266, phone: '+79232730373', mega: 'mega_ad'}
  {card: 2310019861191, phone: '+79628596391', mega: 'mega_ad'}
  {card: 2310019861183, phone: '+79615881058', mega: 'mega_ad'}
  {card: 2310019861175, phone: '+79615274457', mega: 'mega_ad'}
  {card: 2310019861142, phone: '+79086785050', mega: 'mega_ad'}
  {card: 2310019861126, phone: '+79086785088', mega: 'mega_ad'}
  {card: 2310019861118, phone: '+79086785011', mega: 'mega_ad'}
  {card: 2310019861084, phone: '+79184117896', mega: 'mega_ad'}
  {card: 2310019861068, phone: '+79186274619', mega: 'mega_ad'}
  {card: 2310019861050, phone: '+79182681400', mega: 'mega_ad'}
  {card: 2310019861035, phone: '+79182242722', mega: 'mega_ad'}
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