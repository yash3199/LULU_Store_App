
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lulu_store_app/presentation/screens/productionOrder/production_order_view.dart';
import 'package:lulu_store_app/presentation/screens/productionOrder/production_order_view_model.dart';

import '../../../base/base_page.dart';
import '../../../core/utils/strings.dart';
import '../../../di/app/feature_module.dart';

class ProductionOrderView extends BasePage<ProductionOrderViewModel> {
  const ProductionOrderView({super.key});

  @override
  State<ProductionOrderView> createState() => _ProductionOrderViewState();
}

class _ProductionOrderViewState
    extends BaseStatefulPage<ProductionOrderViewModel, ProductionOrderView> {
  @override
  Widget buildView(BuildContext context, ProductionOrderViewModel model) {
    return ProductionOrderWidget(provideBase());
  }

  @override
  ProviderBase<ProductionOrderViewModel> provideBase() {
    return productionOrderProvider;
  }

  @override
  String headText() {
    return AppStrings.productionOrder.tr();
  }

  @override
  bool showBackButton() {
    return false;
  }
}