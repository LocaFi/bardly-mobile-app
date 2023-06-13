import 'package:bardly_mobile_app/core/constants/app_config.dart';
import 'package:bardly_mobile_app/core/constants/project_enums.dart';
import 'package:bardly_mobile_app/models/get_system_variables_response_model.dart';
import 'package:get/get.dart';

class ProjectController extends GetxController {
  RxBool updateScrolling = false.obs;
  RxBool isAdsAllowed = false.obs;

  void setSystemVariables(GetSystemVariables model) async {
    if (model.data != null) {
      for (var i = 0; i < model.data!.length; i++) {
        if (model.data![i].code == SystemVariablesEnums.MOBILE_ANDRIOD_MARKET_ID.value) {
          AppConfig.MOBILE_ANDRIOD_MARKET_ID = model.data![i].value;
        } else if (model.data![i].code == SystemVariablesEnums.MOBILE_IOS_MARKET_ID.value) {
          AppConfig.MOBILE_IOS_MARKET_ID = model.data![i].value;
        } else if (model.data![i].code == SystemVariablesEnums.MOBILE_SHOW_ADVERTISE.value) {
          AppConfig.MOBILE_SHOW_ADVERTISE = model.data![i].value;
        }
      }
    }
  }
}
