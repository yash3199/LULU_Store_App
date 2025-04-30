

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/strings.dart';
import '../../../di/app/feature_module.dart';
import 'label_print_result_view.dart';
import 'label_print_result_view_model.dart';

class LabelPrintResultView extends BasePage<LabelPrintResultViewModel> {
  const LabelPrintResultView({super.key});

  @override
  State<LabelPrintResultView> createState() => _LabelPrintResultViewState();
}

class _LabelPrintResultViewState
    extends BaseStatefulPage<LabelPrintResultViewModel, LabelPrintResultView> {
  @override
  Widget buildView(BuildContext context, LabelPrintResultViewModel model) {
    return LabelPrintResultWidget(provideBase());
  }

  @override
  ProviderBase<LabelPrintResultViewModel> provideBase() {
    return labelPrintResultProvider;
  }

  @override
  String headText() {
    return AppStrings.labelPrint.tr();
  }

  @override
  bool showBackButton() {
    return false;
  }
}