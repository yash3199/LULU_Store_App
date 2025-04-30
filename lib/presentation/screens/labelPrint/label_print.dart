
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/strings.dart';
import '../../../di/app/feature_module.dart';
import 'label_print_view.dart';
import 'label_print_view_model.dart';

class LabelPrintView extends BasePage<LabelPrintViewModel> {
  const LabelPrintView({super.key});

  @override
  State<LabelPrintView> createState() => _ReturnPoViewState();
}

class _ReturnPoViewState
    extends BaseStatefulPage<LabelPrintViewModel, LabelPrintView> {
  @override
  Widget buildView(BuildContext context, LabelPrintViewModel model) {
    return LabelPrintWidget(provideBase());
  }

  @override
  ProviderBase<LabelPrintViewModel> provideBase() {
    return labelPrintProvider;
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