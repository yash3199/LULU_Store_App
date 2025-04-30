import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../base/base_page_view_model.dart';
import '../../../core/utils/strings.dart';

class HomeViewModel extends BasePageViewModel {
  final List<Map<String, dynamic>> options = [
    {
      "name": AppStrings.articleEnquiry.tr(),
      "number": "01",
      "icon": Icons.article_outlined,
    },
    {
      "name": AppStrings.storeOperation.tr(),
      "number": "02",
      "icon": Icons.store_outlined
    },
    {"name": AppStrings.labelPrint.tr(), "number": "03", "icon": Icons.print_outlined},
    {
      "name": AppStrings.deliveryCreation.tr(),
      "number": "04",
      "icon": Icons.delivery_dining_outlined
    },
    {
      "name": AppStrings.goodsRecordLocal.tr(),
      "number": "05",
      "icon": Icons.record_voice_over_outlined
    },
    {
      "name": AppStrings.stockTransportOrder.tr(),
      "number": "06",
      "icon": Icons.track_changes_outlined
    },
    {
      "name": AppStrings.reservation.tr(),
      "number": "07",
      "icon": Icons.home_repair_service_outlined
    },
    {
      "name": AppStrings.freshFoodPo.tr(),
      "number": "08",
      "icon": Icons.food_bank_outlined
    },
    {
      "name": AppStrings.returnPo.tr(),
      "number": "09",
      "icon": Icons.assignment_return_outlined
    },
  ];
}