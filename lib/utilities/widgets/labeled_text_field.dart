import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:habot_connect_test/utilities/theme/app_color.dart';
import 'package:habot_connect_test/utilities/widgets/common_text.dart';
import 'package:habot_connect_test/utilities/widgets/common_text_field.dart';
import 'package:habot_connect_test/utilities/widgets/form_field_label.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String description;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final bool isReadOnly;
  final bool isRequired;
  final Color? bgColor;
  final TextCapitalization textCapitalization;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.description,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.onTap,
    this.isReadOnly = false,
    this.isRequired = false,
    this.bgColor,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormFieldLabel(label: label,isRequired: isRequired),
        CommonTextField(
          controller: controller,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          hintText: hintText,
          validator: validator,
          onChanged: onChanged,
          suffixIcon: suffixIcon,
          prefix: SizedBox(width: 8.w),
          bgColor:bgColor?? lightColorScheme.primaryFixedDim.withValues(alpha: 0.15),
          onTap: onTap,
          isReadOnly: isReadOnly,
        ),
        SizedBox(height: 4.h),
        CommonText.regular(
          description,
          size: 9.sp,
          fontWeight: FontWeight.w400,
          color:  lightColorScheme.onSurface,
        ),
      ],
    );
  }
}
