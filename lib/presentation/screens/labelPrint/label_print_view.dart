import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app/navigation/routes.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/AppStreamBuilder.dart';
import '../../../core/utils/commonWidget/common_dropdown.dart';
import '../../../core/utils/commonWidget/common_elevated_button.dart';
import '../../../core/utils/commonWidget/common_text_field.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/image_constants.dart';
import '../../../core/utils/strings.dart';
import 'label_print_view_model.dart';

class LabelPrintWidget extends BasePageViewWidget<LabelPrintViewModel> {
  const LabelPrintWidget(ProviderBase<LabelPrintViewModel> model, {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, LabelPrintViewModel model) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            children: [
              CustomTextField(
                hintText: "Enter Hand Held No.",
                controller: model.handHeldController,
                icon: null,
              ),
              SizedBox(
                height: 6.h,
              ),
              SizedBox(
                height: 0.06.sh,
                child: AppStreamBuilder<String>(
                    stream: model.selectedLabel,
                    initialData: model.selectedLabelValue,
                    dataBuilder: (context, snapshot) {
                      return CommonDropdownWidget(
                        value: snapshot ?? "BARCODE WITH PRICE",
                        items: model.labelItems,
                        onChanged: (String? value) {
                          model.changeSelectedPoValue(value ?? "");
                        },
                        prefix: Text(
                          "Label",
                          style: TextStyle(fontSize: AppDimensions.fontSmall),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 6.h,
              ),
              SizedBox(
                height: 0.06.sh,
                child: AppStreamBuilder<String>(
                    stream: model.selectedPrinter,
                    initialData: model.selectedPrinterValue,
                    dataBuilder: (context, snapshot) {
                      return CommonDropdownWidget(
                        value: snapshot ?? "BARCODE WITH PRICE",
                        items: model.printerItems,
                        onChanged: (String? value) {
                          model.changeSelectedPoValue(value ?? "");
                        },
                        prefix:  Text(
                          "Printer",
                          style: TextStyle(fontSize: AppDimensions.fontSmall),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 15.h,
              ),
              CommonElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, RoutePaths.labelPrintItemList);
                },
                text: AppStrings.submit.tr(),
              ),
            ],
          ),
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
