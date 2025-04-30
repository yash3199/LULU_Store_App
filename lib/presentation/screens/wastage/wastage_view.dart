

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lulu_store_app/presentation/screens/wastage/wastage_view_model.dart';
import 'package:flutter/material.dart';
import '../../../app/navigation/routes.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/AppStreamBuilder.dart';
import '../../../core/utils/commonWidget/common_dropdown.dart';
import '../../../core/utils/commonWidget/common_elevated_button.dart';
import '../../../core/utils/commonWidget/common_text_field.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/image_constants.dart';
import '../../../core/utils/is_zebra_device.dart';
import '../../../core/utils/strings.dart';

class WastageWidget
    extends BasePageViewWidget<WastageViewModel> {
  const WastageWidget(super.model, {super.key});

  @override
  Widget build(BuildContext context, WastageViewModel model) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            children: [
              AppStreamBuilder<String>(
                  stream: model.selectedMovementType,
                  initialData: model.movementTypeValue,
                  dataBuilder: (context, snapshot) {
                    return CommonDropdownWidget(
                      value: snapshot ?? "551",
                      items: model.movementTypeItems,
                      onChanged: (String? value) {
                        model
                            .changeSelectedMovementTypeValue(value ?? "");
                      },
                      prefix: Text(
                        "Movement Type",
                        style: TextStyle(fontSize: AppDimensions.fontSmall),
                      ),
                    );
                  }),
              SizedBox(
                height: 6.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: AppStreamBuilder<String>(
                          stream: model.selectedSloc,
                          initialData: model.selectedSlocValue,
                          dataBuilder: (context, snapshot) {
                            return CommonDropdownWidget(
                              value: snapshot ?? "0001",
                              items: model.slocItems,
                              onChanged: (String? value) {
                                model.changeSlocItems(value ?? "");
                              },
                              prefix: Text(
                                "Sloc",
                                style: TextStyle(
                                    fontSize: AppDimensions.fontSmall),
                              ),
                            );
                          })),
                  SizedBox(
                    width: 5.w,
                  ),
                  FutureBuilder<bool>(
                      future: IsZebraDevice.isZebraDevice(),
                      builder: (context, snapshot) {
                        return Expanded(
                          child: AppStreamBuilder<String>(
                            stream: model.selectedRecDept,
                            initialData: model.recDeptValue,
                            dataBuilder: (context, snapshot) {
                              return CommonDropdownWidget(
                                value: snapshot ?? "010",
                                items: model.recDeptItems,
                                onChanged: (String? value) {
                                  model.changeRecDeptItems(value ?? "");
                                },
                                prefix: Text(
                                  "Rec.Dept",
                                  style: TextStyle(
                                      fontSize: AppDimensions.fontSmall),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                ],
              ),
              SizedBox(
                height: 6.h,
              ),
              AppStreamBuilder<String>(
                  stream: model.selectDept,
                  initialData: model.deptValue,
                  dataBuilder: (context, snapshot) {
                    return CommonDropdownWidget(
                      value: snapshot ?? "In-House Kitchen Production (Hot/Cold)",
                      items: model.deptItems,
                      onChanged: (String? value) {
                        model.changeDeptItems(value ?? "");
                      },
                      prefix: Text(
                        "Dept.",
                        style: TextStyle(fontSize: AppDimensions.fontSmall),
                      ),
                    );
                  }),
              SizedBox(
                height: 6.h,
              ),
              CustomTextField(
                hintText: "Comments", controller: model.noteController,icon: Icons.comment_outlined,),
              SizedBox(
                height: 15.h,
              ),
              CommonElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutePaths.articleEnquiry,
                      arguments: "wastage");
                },
                text: AppStrings.submit.tr(),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset(AppImageStrings.warehouseManagementFooter,
              fit: BoxFit.contain),
        ),
      ],
    );
  }
}