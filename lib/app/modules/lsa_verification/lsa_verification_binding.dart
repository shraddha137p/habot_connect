import 'package:get/get.dart';
import 'package:habot_connect_test/app/data/repositories/verification_repository.dart';
import 'package:habot_connect_test/app/data/services/api_service.dart';

import 'lsa_verification_controller.dart';

class LsaVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(
          () => ApiService(),
    );

    Get.lazyPut<VerificationRepository>(
          () => VerificationRepository(
        Get.find<ApiService>(),
      ),
    );

    Get.lazyPut<LsaVerificationController>(
          () => LsaVerificationController(
        Get.find<VerificationRepository>(),
      ),
    );
  }
}
