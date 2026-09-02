import 'package:dio/dio.dart';
import 'package:habot_connect_test/app/data/services/api_service.dart';
import 'package:habot_connect_test/utilities/api_constants.dart';

class VerificationRepository {
  final ApiService apiService;

  VerificationRepository(this.apiService);

  Future<Response> verifyLsa({
    required String lsaId,
    required String parentConsentCode,
    required String predecessorId,
  }) {
    return apiService.post(
      ApiConstants.verifyLsa,
      data: {
        'predecessor_id': predecessorId,
        'lsa_id': lsaId,
        'parent_consent_code': parentConsentCode,
        'timestamp_utc': DateTime.now()
            .toUtc()
            .toIso8601String(),
      },
    );
  }
}