import 'package:get/get.dart';


import '../modules/lsa_verification/lsa_verification_binding.dart';
import '../modules/lsa_verification/lsa_verification_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LSA_VERIFICATION;

  static final routes = [
    GetPage(
      name: _Paths.LSA_VERIFICATION,
      page: () => const LsaVerificationView(),
      binding: LsaVerificationBinding(),
    ),
  ];
}
