import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lulu_store_app/presentation/screens/returnPo/return_po_view.dart';
import 'package:lulu_store_app/presentation/screens/returnPo/return_po_view_model.dart';

import '../../../base/base_page.dart';
import '../../../core/utils/strings.dart';
import '../../../di/app/feature_module.dart';

class ReturnPoView extends BasePage<ReturnPoViewModel> {
  const ReturnPoView({super.key});

  @override
  State<ReturnPoView> createState() => _ReturnPoViewState();
}

class _ReturnPoViewState
    extends BaseStatefulPage<ReturnPoViewModel, ReturnPoView> {
  @override
  Widget buildView(BuildContext context, ReturnPoViewModel model) {
    return ReturnPoWidget(provideBase());
  }

  @override
  ProviderBase<ReturnPoViewModel> provideBase() {
    return returnPoProvider;
  }

  @override
  String headText() {
    return AppStrings.returnPo.tr();
  }

  @override
  bool showBackButton() {
    return false;
  }
}
