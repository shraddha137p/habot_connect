import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:habot_connect_test/utilities/theme/app_color.dart';

import '../../../utilities/widgets/common_text.dart';

class LsaHeader extends StatelessWidget implements PreferredSizeWidget {
  const LsaHeader({super.key});

  @override
  Size get preferredSize => Size.fromHeight(85.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            lightColorScheme.onPrimaryFixed,
            lightColorScheme.onPrimaryContainer,
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14.r),
          bottomRight: Radius.circular(14.r),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 8.w,
            top: 0,
            bottom: 0,
            child: Center(
              child: IconButton(
                onPressed: () {
                  // Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: lightColorScheme.onPrimary,
                  size: 18.sp,
                ),
              ),
            ),
          ),

          // Title + Subtitle
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText.regular(
                  'LSA Onboarding Gate',
                  size: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: lightColorScheme.onPrimary,
                ),
                SizedBox(height: 3.h),
                CommonText.regular(
                  'HabotConnect Data Compliance',
                  size: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: lightColorScheme.onPrimary.withValues(alpha: 0.75),
                ),
              ],
            ),
          ),

          Positioned(
            right: 14.w,
            top: 0,
            bottom: 0,
            child: Center(
              child: Icon(
                Icons.shield_outlined,
                color: lightColorScheme.onPrimary,
                size: 22.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
