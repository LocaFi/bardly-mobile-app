import 'package:bardly_mobile_app/data/service/bard_service.dart';
import 'package:bardly_mobile_app/models/bard_request_model.dart';
import 'package:bardly_mobile_app/models/bard_response_model.dart';

class BardRepository {
  final BardService _bardServce = BardService();

  Future<BardResponseModel> askToBard(BardRequestModel question) async {
    try {
      final response = await _bardServce.askToBard(question);

      return BardResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
