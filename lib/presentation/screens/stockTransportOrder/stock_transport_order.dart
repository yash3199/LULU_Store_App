import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lulu_store_app/presentation/screens/stockTransportOrder/stock_transport_order_view.dart';
import 'package:lulu_store_app/presentation/screens/stockTransportOrder/stock_transport_order_view_model.dart';
import '../../../base/base_page.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/strings.dart';
import '../../../di/app/feature_module.dart';

class StockTransportLocalView extends BasePage<StockTransportOrderViewModel> {
  const StockTransportLocalView({super.key});

  @override
  State<StockTransportLocalView> createState() =>
      _StockTransportLocalViewState();
}

class _StockTransportLocalViewState extends BaseStatefulPage<
    StockTransportOrderViewModel, StockTransportLocalView> {
  @override
  Widget buildView(BuildContext context, StockTransportOrderViewModel model) {
    return StockTransportOrderWidget(provideBase());
  }

  @override
  ProviderBase<StockTransportOrderViewModel> provideBase() {
    return stockTransportLocalProvider;
  }

  @override
  String headText() {
    return AppStrings.stockTransportOrder.tr();
  }

  @override
  bool showBackButton() {
    return false;
  }
}
