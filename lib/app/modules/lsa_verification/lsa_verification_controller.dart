import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:habot_connect_test/app/data/repositories/verification_repository.dart';

enum VerificationStatus {
  idle,
  processing,
  success,
  quarantined,
}

class LineageException implements Exception {
  final String message;

  LineageException(this.message);

  @override
  String toString() => message;
}

class LsaVerificationController extends GetxController {
  final VerificationRepository repository;

  LsaVerificationController(this.repository);

  final lsaIdController = TextEditingController();
  final parentConsentCodeController = TextEditingController();
  final predecessorIdController = TextEditingController();

  final isLoading = false.obs;

  final verificationStatus =
      VerificationStatus.idle.obs;

  final isSubmissionLocked = false.obs;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();

    lsaIdController.text = 'LSA-7049';
    predecessorIdController.text = 'PRED-9982-XYZ';
  }

  Future<void> verifyLsa() async {
    if (isSubmissionLocked.value || isLoading.value) {
      return;
    }

    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    final lsaId = lsaIdController.text.trim();

    final parentConsentCode =
    parentConsentCodeController.text.trim();

    final predecessorId =
    predecessorIdController.text.trim();

    if (predecessorId.isEmpty) {
      await quarantineData(
        message: 'Data Quarantined – Missing predecessor ID',
        lockSubmission: true,
      );
      return;
    }

    try {
      isLoading.value = true;

      verificationStatus.value =
          VerificationStatus.processing;

      final response = await repository.verifyLsa(
        lsaId: lsaId,
        parentConsentCode: parentConsentCode,
        predecessorId: predecessorId,
      );

      final data = response.data;

      if (data == null ||
          data is! Map ||
          data['status'] == null) {
        await quarantineData(
          message:
          'Data Quarantined – Invalid compliance response',
          lockSubmission: true,
        );
        return;
      }

      verificationStatus.value =
          VerificationStatus.success;

      Get.snackbar(
        'Success',
        'LSA verified successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.shade700,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        duration: const Duration(seconds: 3),
        icon: const Icon(
          Icons.check_circle_outline,
          color: Colors.white,
        ),
      );
    } catch (e) {
      debugPrint(
        'Verification Error: $e',
      );

           await quarantineData(
        message:
        'Verification failed. Please try again.',
        lockSubmission: false,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> quarantineData({
    required String message,
    required bool lockSubmission,
  }) async {

    isSubmissionLocked.value = lockSubmission;

    verificationStatus.value =
        VerificationStatus.quarantined;


    parentConsentCodeController.clear();

    Get.snackbar(
      'Compliance Failure',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.shade700,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
      icon: const Icon(
        Icons.warning_amber_rounded,
        color: Colors.white,
      ),
    );
  }

  @override
  void onClose() {
    lsaIdController.dispose();
    parentConsentCodeController.dispose();
    predecessorIdController.dispose();

    super.onClose();
  }
}