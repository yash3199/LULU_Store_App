import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../base/base_page.dart';
import '../../../core/utils/strings.dart';
import '../../../di/app/feature_module.dart';
import 'fresh_food_view.dart';
import 'fresh_food_view_model.dart';

class FreshFoodView extends BasePage<FreshFoodViewModel> {
  const FreshFoodView({super.key});

  @override
  State<FreshFoodView> createState() => _FreshFoodViewState();
}

class _FreshFoodViewState
    extends BaseStatefulPage<FreshFoodViewModel, FreshFoodView> {
  @override
  Widget buildView(BuildContext context, FreshFoodViewModel model) {
    return FreshFoodWidget(provideBase());
  }

  @override
  ProviderBase<FreshFoodViewModel> provideBase() {
    return freshFoodProvider;
  }

  @override
  String headText() {
    return AppStrings.freshFoodPo.tr();
  }

  @override
  bool showBackButton() {
    return false;
  }
}
