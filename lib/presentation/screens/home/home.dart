import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/strings.dart';
import '../../../di/app/feature_module.dart';
import 'home_view.dart';
import 'home_view_model.dart';

class HomeView extends BasePage<HomeViewModel> {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseStatefulPage<HomeViewModel, HomeView> {
  @override
  Widget buildView(BuildContext context, HomeViewModel model) {
    return HomeWidget(provideBase());
  }



  @override
  ProviderBase<HomeViewModel> provideBase() {
    return homeProvider;
  }

  @override
  String headText() {
    return AppStrings.welcome.tr();
  }

  @override
  bool showBackButton() {
    return false;
  }



}
