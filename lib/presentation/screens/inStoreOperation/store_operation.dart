import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lulu_store_app/base/base_page.dart';
import 'package:lulu_store_app/presentation/screens/inStoreOperation/store_operation_view.dart';
import 'package:lulu_store_app/presentation/screens/inStoreOperation/store_operation_view_model.dart';
import 'package:riverpod/src/framework.dart';
import '../../../core/utils/strings.dart';
import '../../../di/app/feature_module.dart';

class StoreOperationView extends BasePage<StoreOperationViewModel> {
  const StoreOperationView({super.key});

  @override
  State<StoreOperationView> createState() => _StoreOperationViewState();
}

class _StoreOperationViewState
    extends BaseStatefulPage<StoreOperationViewModel, StoreOperationView> {
  @override
  Widget buildView(BuildContext context, StoreOperationViewModel model) {
    return StoreOperationWidget(provideBase());
  }

  @override
  ProviderBase<StoreOperationViewModel> provideBase() {
    return storeViewModelProvider;
  }

  @override
  String headText() {
    return AppStrings.storeOperation.tr();
  }

  @override
  bool showBackButton() {
    return false;
  }
}
