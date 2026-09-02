import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../theme/app_color.dart';
import 'common_text.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? icon;
  final double? width;
  final double height;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double fontSize;
  final FontWeight fontWeight;
  final bool isLoading;
  final bool isEnabled;

  const CommonButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.width,
    this.height = 44,
    this.borderRadius = 8,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.isLoading = false,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool enabled = isEnabled && !isLoading;

    return SizedBox(
      width: width ?? double.infinity,
      height: height.h,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor:
          backgroundColor ?? lightColorScheme.primary,
          foregroundColor:
          foregroundColor ?? lightColorScheme.onPrimary,
          disabledBackgroundColor:
          lightColorScheme.primary.withValues(alpha: 0.12),
          disabledForegroundColor:
          lightColorScheme.primary.withValues(alpha: 0.6),
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            side: borderColor != null
                ? BorderSide(color: borderColor!)
                : BorderSide.none,
          ),
        ),
        child: isLoading
            ? SizedBox(
          height: 20.h,
          width: 20.w,
          child:  CircularProgressIndicator(
            strokeWidth: 2,
            color: lightColorScheme.onPrimary,
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              icon!,
              SizedBox(width: 8.w),
            ],
            CommonText.regular(
              text,
              size: fontSize.sp,
              fontWeight: fontWeight,
              color: foregroundColor ?? lightColorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}