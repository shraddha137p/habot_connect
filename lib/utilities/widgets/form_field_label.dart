import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:habot_connect_test/utilities/widgets/common_text.dart';
import 'package:habot_connect_test/utilities/widgets/extensions.dart';

import '../theme/app_color.dart';

class FormFieldLabel extends StatelessWidget {
  final String label;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final bool isRequired;

  const FormFieldLabel({
    super.key,
    required this.label,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.color,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonText.regular(
              label,
              size: fontSize.sp,
              fontWeight: fontWeight,
              color: color ?? context.colorScheme.onSurface,
            ),
            SizedBox(width: 4.w),

            // Fixed space for *
            if (isRequired) ...[
              SizedBox(width: 4.w),
              CommonText.regular(
                '*',
                size: fontSize.sp,
                fontWeight: FontWeight.w600,
                color: lightColorScheme.error,
              ),
            ],

            SizedBox(width: 6.w),
            Icon(Icons.info_outline,size: 16,color: lightColorScheme.scrim.withValues
              (alpha: 0.4),)
          ],
        ),
        SizedBox(height:4.h),

      ],
    );
  }
}
