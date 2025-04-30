import 'package:easy_localization/easy_localization.dart';
import 'package:lulu_store_app/presentation/screens/physicalInventory/physical_inventory_view.dart';
import 'package:lulu_store_app/presentation/screens/physicalInventory/physical_inventory_view_model.dart';
import 'package:riverpod/src/framework.dart';
import '../../../base/base_page.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/strings.dart';
import '../../../di/app/feature_module.dart';

class PhysicalInventoryView extends BasePage<PhysicalInventoryViewModel> {
  const PhysicalInventoryView({super.key});

  @override
  State<PhysicalInventoryView> createState() => _PhysicalInventoryViewState();
}

class _PhysicalInventoryViewState extends BaseStatefulPage<
    PhysicalInventoryViewModel, PhysicalInventoryView> {
  @override
  Widget buildView(BuildContext context, PhysicalInventoryViewModel model) {
    return PhysicalInventoryWidget(provideBase());
  }

  @override
  ProviderBase<PhysicalInventoryViewModel> provideBase() {
    return physicalInventoryProvider;
  }

  @override
  String headText() {
    return AppStrings.physicalInventory.tr();
  }

  @override
  bool showBackButton() {
    return true;
  }
}
