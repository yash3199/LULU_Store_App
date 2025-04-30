import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lulu_store_app/base/base_page.dart';
import 'package:lulu_store_app/core/utils/is_zebra_device.dart';
import 'package:lulu_store_app/core/utils/strings.dart';
import 'package:lulu_store_app/presentation/screens/physicalInventory/physical_inventory_view_model.dart';

import '../../../app/navigation/routes.dart';
import '../../../core/utils/AppStreamBuilder.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/image_constants.dart';
import '../../../core/utils/commonWidget/common_button.dart';
import '../../../core/utils/commonWidget/common_dropdown.dart';
import '../../../core/utils/commonWidget/common_elevated_button.dart';
import '../../../core/utils/commonWidget/common_text_field.dart';

class PhysicalInventoryWidget
    extends BasePageViewWidget<PhysicalInventoryViewModel> {
  const PhysicalInventoryWidget(ProviderBase<PhysicalInventoryViewModel> model,
      {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, PhysicalInventoryViewModel model) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    hintText: "Ref.No.",
                    controller: model.refNoController,
                    icon: null,
                  )),
                  SizedBox(
                    width: 5.w,
                  ),
                  FutureBuilder<bool>(
                    future: IsZebraDevice.isZebraDevice(),
                    builder: (context, snapshot) {
                      return Expanded(
                          child: AppStreamBuilder<String>(
                              initialData: model.selectedProgressValue,
                              stream: model.selectedValueProgress,
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
                                    ],
                                  ),
                                );
                              }));
                    }
                  ),
                ],
              ),
              SizedBox(
                height: 6.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    hintText: "Zone",
                    controller: model.zoneController,
                    icon: null,
                  )),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                      child: CustomTextField(
                    hintText: "SubZone",
                    controller: model.subZoneController,
                    icon: null,
                  )),
                ],
              ),
              SizedBox(
                height: 6.h,
              ),
              CustomTextField(
                hintText: "Comments",
                controller: model.commentsController,
                icon: Icons.comment_outlined,
              ),
              SizedBox(
                height: 15.h,
              ),
              CommonElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutePaths.articleEnquiry,
                      arguments: "physicalInventory");
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
