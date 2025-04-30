import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lulu_store_app/core/utils/strings.dart';

import '../../../base/base_page_view_model.dart';

class StoreOperationViewModel extends BasePageViewModel {
  final List<Map<String, dynamic>> options = [
    {
      "name": AppStrings.physicalInventory.tr(),
      "icon": Icons.inventory,
    },
    {"name": AppStrings.articleReplenishment.tr(), "icon": Icons.article},
    {"name": AppStrings.annualPhysicalInventory.tr(), "icon": Icons.inventory},
  ];
}
