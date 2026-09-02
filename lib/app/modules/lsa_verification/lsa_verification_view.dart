import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import 'package:get/get.dart';
import 'package:habot_connect_test/app/modules/widgets/header.dart';
import 'package:habot_connect_test/utilities/theme/app_color.dart';
import 'package:habot_connect_test/utilities/widgets/app_card.dart';
import 'package:habot_connect_test/utilities/widgets/common_button.dart';
import 'package:habot_connect_test/utilities/widgets/labeled_text_field.dart';

import '../../../utilities/widgets/common_text.dart';
import '../../../utilities/widgets/extensions.dart';
import 'lsa_verification_controller.dart';

class LsaVerificationView extends GetView<LsaVerificationController> {
  const LsaVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: lightColorScheme.surface,
        appBar: LsaHeader(),
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                AppCard(
                  iconData: Icons.watch_later_outlined,
                  title: 'System Status',
                  description:
                      'Current system state and compliance verification status',
                ),
            
                SizedBox(height: 20.h),
                LabeledTextField(
                  hintText: '',
                  label: 'LSA ID',
                  description: 'Unique LSA Identifier (Read-only)',
                  controller: controller.lsaIdController,
                  isRequired: false,
                  keyboardType: TextInputType.emailAddress,
                  isReadOnly: true,
                  onChanged: (value) {},
                  suffixIcon: Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 10.h),
                LabeledTextField(
                  hintText: 'Enter parent consent code',
                  label: 'Parent Consent Code',
                  description: 'Enter the consent code from parent/guardian',
                  controller: controller.parentConsentCodeController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Parent consent code is required';
                    }
            
                    return null;
                  },

                  suffixIcon: Icon(
                    Icons.keyboard_rounded,
                    size: 18,
                    color: lightColorScheme.scrim.withValues(alpha: 0.4),
                  ),

                  isRequired: true,
                  bgColor: lightColorScheme.onPrimary,
                  onChanged: (value) {},
                ),
                SizedBox(height: 10.h),
                LabeledTextField(
                  hintText: '',
                  label: 'Predecessor ID',
                  isRequired: false,
                  description:
                      'System generated predecessor identifier '
                      '(Read-only)',
                  controller: controller.predecessorIdController,
                  keyboardType: TextInputType.emailAddress,
                  isReadOnly: true,
                  suffixIcon: Icon(
                    Icons.lock,
                    size: 18,
                    color: lightColorScheme.scrim.withValues(alpha: 0.4),
                  ),
                  onChanged: (value) {},
                ),
                SizedBox(height: 20.h),
                Obx(
                  () => CommonButton(
                    text: controller.isLoading.value
                        ? 'Processing...'
                        : 'Verify & Submit',
                    onPressed:
                        controller.isSubmissionLocked.value ||
                            controller.isLoading.value
                        ? null
                        : controller.verifyLsa,
                    icon: Icon(
                      Icons.verified_user_outlined,
                      size: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
            
                AppCard(
                  iconData: Icons.info_outline,
                  title: 'Compliance Note',
                  description:
                      'All submissions are validated against data lineage and compliance rules. '
                      'Invalid or orphaned data will be quarantined automatically.',
                ),
              ],
            ).paddingAll(16.r),
          ),
        ),
      ),
    );
  }
}
