import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../theme/app_color.dart';
import 'common_text.dart';
import 'extensions.dart';

class AppCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String description;

  const AppCard({
    super.key,
    required this.iconData,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: lightColorScheme.primaryFixedDim.withValues(alpha: 0.1),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(
          color: lightColorScheme.scrim.withValues(alpha: 0.1),
          width: 1.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 42.w,
              height: 42.w,
              decoration: BoxDecoration(
                color: lightColorScheme.primaryFixedDim,
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: lightColorScheme.primary,
                size: 24.sp,
              ),
            ),

            SizedBox(width: 14.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText.regular(
                    title,
                    size: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: context.colorScheme.onPrimaryFixedVariant,
                    maxLines: null,
                    textAlign: TextAlign.left,
                  ),

                  CommonText.regular(
                    description,
                    size: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.onSurface,
                    maxLines: null,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}