import 'package:flutter/material.dart';
import 'package:medihabit/presentation/utils/app_sizes.dart';


final class AppButtons {
  static Widget loginButton({
    required VoidCallback onPressed,
    required Color backgroundColor,
    required Color textColor,
    required String text,
    required Widget icon,
  }) {
    return _LoginButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      textColor: textColor,
      text: text,
      icon: icon,
    );
  }
}

final class _LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Widget icon;

  final _buttonInsets = const EdgeInsets.symmetric(
      vertical: AppSizes.loginButtonVerticalInset,
      horizontal: AppSizes.loginButtonHorizontalInset);

  const _LoginButton({
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: _buttonInsets,
      ),
    );
  }
}
