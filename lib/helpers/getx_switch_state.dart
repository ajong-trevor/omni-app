import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetXSwitchState extends GetxController {
  var isSwitched = false;
  var isFreeTrialOver = false;
  final switchdataController = GetStorage();
  final traildataController = GetStorage();

  GetXSwitchState() {
    if (switchdataController.read('getXIsSwitched') != null) {
      isSwitched = switchdataController.read('getXIsSwitched');
      update();
    }

    if (traildataController.read('getXIsFreeTrial') != null) {
      isFreeTrialOver = traildataController.read('getXIsFreeTrial');
      update();
    }
  }

  changeSwitchState(bool value) {
    isSwitched = value;
    switchdataController.write('getXIsSwitched', isSwitched);
    update();
  }

  changeTrailState(bool value) {
    isFreeTrialOver = value;
    traildataController.write('getXIsFreeTrial', isFreeTrialOver);
    update();
  }
}
