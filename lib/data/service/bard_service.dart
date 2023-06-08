import 'package:bardly_mobile_app/data/services/abstract_service.dart';
import 'package:bardly_mobile_app/models/bard_request_model.dart';

class BardService extends AbstractService {
  final String? customTag;
  BardService({
    this.customTag,
    String? path = "",
    String? tag = 'ai',
  }) : super(path, tag);

  Future<dynamic> askToBard(BardRequestModel question) async {
    try {
      final response = await postCustom(
        innerPath: 'ai/ask',
        data: question,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
