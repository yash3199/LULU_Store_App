import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulu_store_app/core/utils/colors.dart';
import 'package:lulu_store_app/core/utils/commonWidget/common_line_items_widget.dart';
import '../../../app/navigation/routes.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/commonWidget/common_elevated_button.dart';
import '../../../core/utils/image_constants.dart';
import '../../../core/utils/strings.dart';
import 'label_print_item_list_view_model.dart';

class LabelPrintItemListWidget extends BasePageViewWidget<LabelPrintItemListViewModel> {
  const LabelPrintItemListWidget(ProviderBase<LabelPrintItemListViewModel> model,
      {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, LabelPrintItemListViewModel model) {
    return CommonLineItemsWidget(index: '1', idNumber: '8901725121181', oneEa: 'EA', itemName: 'Aashirwaad Atta 5kg', onPressed: () {
      Navigator.pushNamed(
          context, RoutePaths.labelPrintResult);
    },);
  }
}
