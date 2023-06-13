import 'dart:io';

import 'package:bardly_mobile_app/core/constants/app_config.dart';
import 'package:bardly_mobile_app/data/service/bard_service.dart';
import 'package:bardly_mobile_app/models/bard_request_model.dart';
import 'package:bardly_mobile_app/models/bard_response_model.dart';
import 'package:bardly_mobile_app/models/get_system_variables_response_model.dart';
import 'package:package_info_plus/package_info_plus.dart';

class BardRepository {
  BardRepository() {
    setAppInformationList();
  }

  final BardService _bardServce = BardService();

  Future<BardResponseModel> askToBard(BardRequestModel question) async {
    try {
      final response = await _bardServce.askToBard(question);

      return BardResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GetSystemVariables> getSystemVariables() async {
    try {
      final response = await _bardServce.getSystemVariables();

      return GetSystemVariables.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setAppInformationList() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    AppConfig.appVersion = packageInfo.version;
    AppConfig.buildNumber = packageInfo.buildNumber;
    AppConfig.packageName = packageInfo.packageName;
    AppConfig.platform = Platform.operatingSystem;
  }
}
