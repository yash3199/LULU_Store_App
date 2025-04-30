import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulu_store_app/core/utils/image_constants.dart';
import 'package:lulu_store_app/core/utils/is_zebra_device.dart';
import 'package:lulu_store_app/core/utils/strings.dart';
import '../../../app/navigation/routes.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/AppStreamBuilder.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/commonWidget/common_button.dart';
import '../../../core/utils/commonWidget/common_dropdown.dart';
import '../../../core/utils/commonWidget/common_elevated_button.dart';
import '../../../core/utils/commonWidget/common_text_field.dart';
import 'delivery_creation_view_model.dart';

class DeliveryCreationWidget
    extends BasePageViewWidget<DeliveryCreationViewModel> {
  const DeliveryCreationWidget(ProviderBase<DeliveryCreationViewModel> model,
      {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, DeliveryCreationViewModel model) {


    return Column(
      children: [
        AppStreamBuilder<String>(
          initialData: model.selectedOptionValue,
          stream: model.selectedOption,
          dataBuilder: (context, snapshot) {
            return Column(
              children: model.options.map((option) {
                return Padding(
                  padding:  EdgeInsets.only(top: 5,left: 8,right: 8),
                  child: RadioListTile(
                    activeColor: AppColors.bodyBackGroundColorGradient2,
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text(option),
                    value: option,
                    groupValue: snapshot,
                    onChanged: (value) {
                      model.changeSelectedOption(value!);
                    },
                  ),
                );
              }).toList(),
            );
          }
        ),
        Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            children: [

              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    hintText: "Ship to party",
                    controller: model.sipToPartyController,
                    icon: null,
                  )),
                  SizedBox(
                    width: 5.w,
                  ),
                  FutureBuilder<bool>(
                    future: IsZebraDevice.isZebraDevice(),
                    builder: (context, snapshot) {
                      return Expanded(
                          child: SizedBox(
                        child: AppStreamBuilder<String>(
                            stream: model.selectedValueProgress,
                            initialData: model.selectedProgressValue,
                            dataBuilder: (context, snapshot) {
                              return CommonDropdownWidget(
                                value: snapshot ?? "001",
                                items: model.items,
                                onChanged: (String? value) {
                                  model.changeSelectedValue(value ?? "");
                                },
                                prefix: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: AppDimensions.paddingSmall),
                                    child: Icon(
                                      Icons.numbers_outlined,
                                      color: Theme.of(context).highlightColor,
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text(
                                    "SLoc",
                                    style: TextStyle(fontSize: AppDimensions.fontSmall),
                                  ),
                                ],),
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
              CustomTextField(hintText: null, controller: model.commentsController),
              SizedBox(
                height: 6.h,
              ),
              CustomTextField(
                  hintText: "Comments", controller: model.commentsController),
              SizedBox(
                height: 15.h,
              ),
              CommonElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutePaths.articleEnquiry,
                      arguments: "deliveryCreation");
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
