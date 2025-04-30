

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lulu_store_app/presentation/screens/wastage/wastage_view.dart';
import 'package:lulu_store_app/presentation/screens/wastage/wastage_view_model.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/strings.dart';
import '../../../di/app/feature_module.dart';

class WastageView extends BasePage<WastageViewModel> {
  const WastageView({super.key});

  @override
  State<WastageView> createState() => _WastageViewState();
}

class _WastageViewState
    extends BaseStatefulPage<WastageViewModel, WastageView> {
  @override
  Widget buildView(BuildContext context, WastageViewModel model) {
    return WastageWidget(provideBase());
  }

  @override
  ProviderBase<WastageViewModel> provideBase() {
    return wastageProvider;
  }

  @override
  String headText() {
    return AppStrings.wastage.tr();
  }

  @override
  bool showBackButton() {
    return false;
  }
}