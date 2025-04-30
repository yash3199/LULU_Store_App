import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/strings.dart';
import '../../../di/app/feature_module.dart';
import 'goods_record_local_view.dart';
import 'goods_record_local_view_model.dart';

class GoodsRecordLocalView extends BasePage<GoodsRecordLocalViewModel> {
  const GoodsRecordLocalView({super.key});

  @override
  State<GoodsRecordLocalView> createState() => _GoodsRecordLocalViewState();
}

class _GoodsRecordLocalViewState
    extends BaseStatefulPage<GoodsRecordLocalViewModel, GoodsRecordLocalView> {
  @override
  Widget buildView(BuildContext context, GoodsRecordLocalViewModel model) {
    return GoodsRecordLocalWidget(provideBase());
  }

  @override
  ProviderBase<GoodsRecordLocalViewModel> provideBase() {
    return goodsRecordLocalProvider;
  }

  @override
  String headText() {
    return AppStrings.goodsRecordLocal.tr();
  }

  @override
  bool showBackButton() {
    return false;
  }
}
