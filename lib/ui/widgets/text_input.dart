import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/ui/utils/ui_helpers.dart';
import 'package:music_app/ui/widgets/csvg.dart';

class CustomTextInput extends StatefulWidget {
  const CustomTextInput({
    super.key,
    required this.hint,
    this.textEditingController,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.sentences,
    this.customBackground,
    this.customPadding,
    this.customTextStyle,
    this.hintStyle,
    this.textInputType = TextInputType.text,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.onChange,
    this.autoFocus = false,
    this.enabled = true,
    this.onSubmit,
    this.borderColor,
    this.icon,
    this.customBorderRadius,
    this.isPassword = false,
    this.suffix,
    this.validator,
  });

  final String hint;
  final TextEditingController? textEditingController;
  final TextAlign textAlign;
  final Color? customBackground;
  final EdgeInsets? customPadding;
  final TextStyle? customTextStyle;
  final BorderRadius? customBorderRadius;
  final TextStyle? hintStyle;
  final TextCapitalization textCapitalization;
  final TextInputType textInputType;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final void Function(String v)? onChange;
  final void Function(String v)? onSubmit;
  final bool autoFocus;
  final bool enabled;
  final Color? borderColor;
  final dynamic icon;
  final Widget? suffix;
  final bool isPassword;
  final String? Function(String?)? validator;

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  bool _obscureText = true;
  String? _errorText; // Store error message
  bool isMultiLine() {
    return (widget.minLines ?? 0) > 1;
  }

  double getRadius() {
    return isMultiLine() ? horizontalSpacing : 1.sw;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: widget.customPadding ??
      //     EdgeInsets.symmetric(
      //       vertical: verticalSpacing,
      //       horizontal: horizontalSpacing,
      //     ),
      //clipBehavior: Clip.hardEdge,
      // decoration: BoxDecoration(
      //   //  color: widget.customBackground ?? AppColors.shapeBackground,
      //   borderRadius: widget.customBorderRadius ??
      //       BorderRadius.circular(
      //         1.sw,
      //       ),
      //   border: Border.all(
      //     color: widget.borderColor ?? (Colors.transparent),
      //     width: widget.borderColor == null ? 0 : 1,
      //   ),
      // ),
      alignment: AlignmentDirectional.center,
      child: TextFormField(
        onTapOutside: (event) {
          hideKeyboard();
        },
        onChanged: (v) {
          setState(() {
            _errorText = widget.validator?.call(v); // Validate on change
          });
          widget.onChange?.call(v);
        },
        keyboardType: widget.isPassword
            ? TextInputType.visiblePassword
            : isMultiLine()
                ? TextInputType.multiline
                : widget.textInputType,
        textCapitalization: widget.textCapitalization,
        controller: widget.textEditingController,
        textAlign: widget.textAlign,
        validator: widget.validator,
        // onSubmitted: (value) {
        //   setState(() {
        //     _errorText = widget.validator?.call(value);
        //   });
        //   if (_errorText == null) {
        //     widget.onSubmit?.call(value);
        //   }
        // },
        autofocus: widget.autoFocus,
        style: widget.customTextStyle,
        enabled: widget.enabled,
        textInputAction:
            isMultiLine() ? TextInputAction.newline : TextInputAction.done,
        scrollPadding: EdgeInsets.zero,
        maxLines: widget.maxLines ?? widget.minLines ?? 1,
        minLines: widget.minLines,
        maxLength: widget.maxLength,
        textAlignVertical: TextAlignVertical.center,
        obscureText: widget.isPassword ? _obscureText : false,
        obscuringCharacter: '*',
        inputFormatters: [
          if (widget.textInputType == TextInputType.number)
            FilteringTextInputFormatter.allow(
              RegExp('[0-9.]'),
            )
        ],
        decoration: InputDecoration(
          hintText: widget.hint,
          prefixIcon: (widget.icon == null || widget.icon is Widget)
              ? widget.icon
              : widget.icon is IconData
                  ? Icon(widget.icon)
                  : MySvg(widget.icon),
          fillColor: widget.customBackground ?? AppColors.shapeBackground,
          filled: true,
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.red,
            ),
            borderRadius: BorderRadius.circular(getRadius()),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.red,
            ),
            borderRadius: BorderRadius.circular(getRadius()),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(
              getRadius(),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              style: BorderStyle.none,
              //    color: AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(
              getRadius(),
            ),
          ),
          suffixIcon: widget.isPassword
              ? CupertinoButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                    color: AppColors.grey,
                    size: 24,
                  ),
                )
              : widget.suffix,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: widget.hintStyle ??
              tStyles['grey16']
                  ?.copyWith(color: AppColors.grey.withOpacity(0.4)),
          counterText: '',
          border: InputBorder.none,
          isDense: true,
          errorText: _errorText,
          contentPadding: widget.customPadding ??
              EdgeInsets.symmetric(
                vertical: verticalSpacing,
                horizontal: horizontalSpacing,
              ),
        ),
      ),
    );
  }
}

class CTextInputWithTitle extends StatelessWidget {
  const CTextInputWithTitle({
    super.key,
    required this.title,
    required this.hint,
    this.isPassword = false,
    this.icon,
    this.controller,
    this.onChange,
    this.validator,
    this.backgroundColor,
    this.minLines,
    this.maxLines,
    this.maxLength,
  });
  final String title;
  final String hint;
  final bool isPassword;
  final String? icon;
  final TextEditingController? controller;
  final Function(String v)? onChange;
  final String? Function(String?)? validator;
  final Color? backgroundColor;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalSpacing / 2,
          ),
          child: Text(
            title,
            style: tStyles['black14'],
          ),
        ),
        CustomTextInput(
          minLines: minLines,
          maxLines: maxLines,
          maxLength: maxLength,
          customBackground: backgroundColor,
          validator: validator,
          onChange: onChange,
          isPassword: isPassword,
          textCapitalization: TextCapitalization.none,
          textEditingController: controller,
          hint: hint,
          icon: icon != null
              ? SizedBox(
                  width: horizontalSpacing * 2.5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                            horizontal: horizontalSpacing * 0.5)
                        .copyWith(
                      left: horizontalSpacing,
                    ),
                    child: MySvg(
                      icon!,
                      color: AppColors.grey,
                    ),
                  ),
                )
              : null,
        )
      ],
    );
  }
}
