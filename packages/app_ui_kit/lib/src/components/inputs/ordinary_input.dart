import 'package:flutter/material.dart';

import '../../../ui_kit.dart';

class OrdinaryInput extends StatefulWidget {
  const OrdinaryInput({
    required this.focusNode,
    required this.controller,
    super.key,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.contentColor,
    this.inputFocusedStyle,
    this.inputUnfocusedStyle,
    this.inputErrorStyle,
    this.autofocus = false,
    this.margin = const EdgeInsets.all(12),
    this.maxLength,
    this.hintText,
    this.hintStyle,
    this.height,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
  });

  final FocusNode focusNode;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final Color? contentColor;
  final TextStyle? inputFocusedStyle;
  final TextStyle? inputUnfocusedStyle;
  final TextStyle? inputErrorStyle;
  final EdgeInsetsGeometry margin;
  final bool autofocus;
  final EdgeInsets? contentPadding;
  final int? maxLength;
  final String? hintText;
  final TextStyle? hintStyle;
  final double? height;

  @override
  State<StatefulWidget> createState() => OrdinaryInputState();
}

class OrdinaryInputState<T extends OrdinaryInput> extends State<T> {
  FocusNode get focusNode => widget.focusNode;

  TextEditingController get controller => widget.controller;

  final _formFieldKey = GlobalKey<FormFieldState<String>>();

  @override
  void dispose() {
    super.dispose();
  }

  TextStyle getInputStyle(String? errorText) {
    if (errorText != null) {
      return widget.inputErrorStyle ?? AppTypography.errorText;
    }
    if (focusNode.hasFocus) {
      return widget.inputFocusedStyle ?? AppTypography.text;
    }
    return widget.inputUnfocusedStyle ?? AppTypography.text;
  }

  TextStyle? getLabelStyle(String? errorText) {
    if (errorText != null) {
      return AppTypography.errorText;
    }
    return AppTypography.text;
  }

  TextStyle? getHintStyle() {
    if (!focusNode.hasFocus) {
      return AppTypography.text;
    }
    return widget.hintStyle ?? AppTypography.secondaryText;
  }

  String? getHintText() {
    final hintText = widget.hintText;
    if (hintText != null) {
      return ' $hintText';
    }
    return null;
  }

  InputBorder getInputBorder(String? errorText) {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(12),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      key: _formFieldKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (FormFieldState<String> field) {
        final errorText = field.errorText;
        return Container(
          margin: widget.margin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: widget.height ?? 58,
                decoration: BoxDecoration(
                  color: widget.contentColor ?? AppColors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  autofocus: widget.autofocus,
                  keyboardType: widget.keyboardType,
                  textCapitalization: widget.textCapitalization,
                  cursorWidth: 2,
                  cursorHeight: 20,
                  maxLines: 1,
                  maxLength: widget.maxLength,
                  style: getInputStyle(errorText),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
