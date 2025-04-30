import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../base/base_page.dart';
import '../../../core/utils/strings.dart';
import '../../../di/app/feature_module.dart';
import 'login_view.dart';
import 'login_view_model.dart';
import 'package:flutter/material.dart';

class LoginView extends BasePage<LoginViewModel> {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState
    extends BaseStatefulPage<LoginViewModel, LoginView> {
  @override
  Widget buildView(BuildContext context, LoginViewModel model) {
    return LoginWidget(provideBase());
  }

  @override
  ProviderBase<LoginViewModel> provideBase() {
    return loginViewModelProvider;
  }

  @override
  String headText() {
    return AppStrings.lulu.tr();
  }

  @override
  bool showBackButton() {
    return false;
  }
}