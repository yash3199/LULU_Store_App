import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lulu_store_app/presentation/screens/registration/registration_view.dart';
import 'package:lulu_store_app/presentation/screens/registration/registration_view_model.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/strings.dart';
import '../../../di/app/feature_module.dart';

class RegistrationView extends BasePage<RegistrationViewModel> {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _LoginViewState();
}

class _LoginViewState
    extends BaseStatefulPage<RegistrationViewModel, RegistrationView> {
  @override
  Widget buildView(BuildContext context, RegistrationViewModel model) {
    return RegistrationWidget(provideBase());
  }

  @override
  ProviderBase<RegistrationViewModel> provideBase() {
    return registerViewModelProvider;
  }

  @override
  String headText() {
    return AppStrings.register.tr();
  }

  @override
  bool showBackButton() {
    return false;
  }
}