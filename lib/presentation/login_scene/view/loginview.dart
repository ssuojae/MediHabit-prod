import 'package:flutter/material.dart';
import 'package:medihabit/presentation/login_scene/viewmodel/login_viewmodel.dart';
import 'package:medihabit/presentation/utils/ui_utils.dart';


final class LoginView extends StatelessWidget {
  final LoginViewModel loginViewModel;

  const LoginView({super.key, required this.loginViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: AppSizes.topSectionHeight,
            child: _TopSection(),
          ),
          SizedBox(
            height: AppSizes.bottomSectionHeight,
            child: _BottomSection(loginViewModel: loginViewModel),
          ),
        ],
      ),
    );
  }
}

final class _TopSection extends StatelessWidget {
  static const _headerText = Text(
    AppStrings.headerText,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: AppSizes.headerFontSize,
      fontWeight: FontWeight.bold,
    ),
  );

  static const _titleText = Text(
    AppStrings.titleText,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: AppSizes.titleFontSize,
      fontWeight: FontWeight.bold,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _headerText,
          SizedBox(height: AppSizes.spacerHeight),
          _titleText,
        ],
      ),
    );
  }
}

final class _BottomSection extends StatelessWidget {
  final LoginViewModel loginViewModel;

  const _BottomSection({required this.loginViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: AppSizes.paddingBottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButtons.loginButton(
            onPressed: loginViewModel.authenticateWithGoogle,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            text: AppStrings.googleLogin,
            icon: const ImageIcon(
              AssetImage(AppImages.googleIcon),
            ),
          ),
        ],
      ),
    );
  }
}
