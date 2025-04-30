import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lulu_store_app/core/utils/is_zebra_device.dart';
import 'package:lulu_store_app/core/utils/strings.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/AppStreamBuilder.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/image_constants.dart';
import '../../../core/utils/commonWidget/common_button.dart';
import '../../../core/utils/commonWidget/common_dropdown.dart';
import '../../../core/utils/commonWidget/common_elevated_button.dart';
import '../../../core/utils/commonWidget/common_text_field.dart';
import 'fresh_food_view_model.dart';

class FreshFoodWidget extends BasePageViewWidget<FreshFoodViewModel> {
  const FreshFoodWidget(ProviderBase<FreshFoodViewModel> model, {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, FreshFoodViewModel model) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            children: [
              FutureBuilder<bool>(
                future: IsZebraDevice.isZebraDevice(),
                builder: (context, isZebra) {
                  return SizedBox(
                    height: isZebra.data==true? 0.09.sh: 0.06.sh,
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
                  );
                }
              ),
              SizedBox(
                height: 6.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                          hintText: "Vendor ID",
                          controller: model.vendorIdController)),
                  SizedBox(
                    width: 5.w,
                  ),
                  FutureBuilder<bool>(
                    future: IsZebraDevice.isZebraDevice(),
                    builder: (context, snapshot) {
                      return Expanded(
                          child: SizedBox(
                        height: snapshot.data==true? 0.09.sh: 0.08.sh,
                        child: AppStreamBuilder<String>(
                            stream: model.selectedPGrp,
                            initialData: model.selectedPGrpValue,
                            dataBuilder: (context, snapshot) {
                              return CommonDropdownWidget(
                                value: snapshot ?? "100",
                                items: model.pGrpItems,
                                onChanged: (String? value) {
                                  model.changeSelectedPGrpItems(value ?? "");
                                },
                                prefix:Text(
                                  "P.Grp",
                                  style: TextStyle(fontSize: AppDimensions.fontSmall),
                                ),
                              );
                            }),
                      ));
                    }
                  ),
                ],
              ),
              SizedBox(
                height: 6.h,
              ),
              CustomTextField(hintText: "", controller: model.textController),
              SizedBox(
                height: 6.h,
              ),
              CustomTextField(
                  hintText: "Invoice Number",
                  controller: model.invoiceNumberController),
              SizedBox(
                height: 6.h,
              ),
              CustomTextField(hintText: "Note", controller: model.noteController),
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
