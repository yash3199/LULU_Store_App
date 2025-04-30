import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Trans;
import 'package:easy_localization/easy_localization.dart';
import 'package:lulu_store_app/core/utils/is_zebra_device.dart';

import 'package:lulu_store_app/core/utils/strings.dart';
import 'package:lulu_store_app/presentation/screens/returnPo/return_po_view_model.dart';
import '../../../app/navigation/routes.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/AppStreamBuilder.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/image_constants.dart';
import '../../../core/utils/commonWidget/common_button.dart';
import '../../../core/utils/commonWidget/common_dropdown.dart';
import '../../../core/utils/commonWidget/common_elevated_button.dart';
import '../../../core/utils/commonWidget/common_text_field.dart';

class ReturnPoWidget extends BasePageViewWidget<ReturnPoViewModel> {
  const ReturnPoWidget(ProviderBase<ReturnPoViewModel> model, {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, ReturnPoViewModel model) {
    return Column(
      children: [
        FutureBuilder<bool>(
          future: IsZebraDevice.isZebraDevice(),
          builder: (context, isZebra) {
            return Padding(
              padding: EdgeInsets.all(AppDimensions.paddingMedium),
              child: Column(
                children: [
                  CustomTextField(
                    hintText: "Purchasing Group",
                    controller: model.purchasingGroupController,
                    icon: null,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Container(
                    height: isZebra.data==true? 0.09.sh: 0.06.sh,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Theme.of(context).dividerColor, width: 1.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: AppStreamBuilder<String>(
                        stream: model.selectedPoType,
                         initialData: model.selectedPoTypeValue,
                         dataBuilder: (context, snapshot) {
                          return CommonDropdownWidget(
                          value: snapshot ?? "ZL01-TGNon taxable",
                          items: model.POTypeItems,
                          onChanged: (String? value) {
                          model.changeSelectedPoValue(value ?? "");
                          },
                          prefix: Text(
                          "PO Type",
                          style: TextStyle(fontSize: AppDimensions.fontSmall),
                          ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomTextField(
                      hintText: "Invoice Number",
                      controller: model.invoiceNumberController),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomTextField(
                      hintText: "Reason Return",
                      controller: model.reasonReturnController),
                  SizedBox(
                    height: 15.h,
                  ),
                  CommonElevatedButton(
                    onPressed: () {
                    },
                    text: AppStrings.submit.tr(),
                  ),
                ],
              ),
            );
          }
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset(AppImageStrings.warehouseManagementFooter,fit: BoxFit.contain),
        ),
      ],
    );
  }
}
