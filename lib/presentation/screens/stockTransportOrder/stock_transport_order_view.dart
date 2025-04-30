import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lulu_store_app/core/utils/is_zebra_device.dart';
import 'package:lulu_store_app/core/utils/strings.dart';
import 'package:lulu_store_app/presentation/screens/stockTransportOrder/stock_transport_order_view_model.dart';

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

class StockTransportOrderWidget
    extends BasePageViewWidget<StockTransportOrderViewModel> {
  const StockTransportOrderWidget(
      ProviderBase<StockTransportOrderViewModel> model,
      {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, StockTransportOrderViewModel model) {
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
                    hintText: "Supply Site",
                    controller: model.supplySiteController,
                    icon: Icons.emoji_transportation,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: SizedBox(

                        child: AppStreamBuilder<String>(
                            stream: model.recSiteProgress,
                            initialData: model.recSiteProgressValue,
                            dataBuilder: (context, snapshot) {
                              return CommonDropdownWidget(
                                value: snapshot ?? "9420",
                                items: model.recSiteItems,
                                onChanged: (String? value) {
                                  model.changeRecSiteProgress(value ?? "");
                                },
                                prefix: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: AppDimensions.paddingSmall),
                                      child: Icon(
                                        Icons.article_outlined,
                                        color: Theme.of(context).highlightColor,
                                        size: 20,
                                      ),
                                    ),

                                    Text(
                                      "RecSite",
                                      style: TextStyle(fontSize: AppDimensions.fontSmall),
                                    ),

                                  ],
                                ),
                              );
                            }),
                      )),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: isZebra.data==true? 0.09.sh: 0.06.sh,
                        child: AppStreamBuilder<String>(
                            stream: model.selectedValueProgress,
                            initialData: model.selectedProgressValue,
                            dataBuilder: (context, snapshot) {
                              return CommonDropdownWidget(
                                value: snapshot ?? '001',
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
                                    Text(
                                      "SLoc",
                                      style: TextStyle(fontSize: AppDimensions.fontSmall),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                        height: isZebra.data==true? 0.09.sh: 0.06.sh,
                        child: AppStreamBuilder<String>(
                            stream: model.docTypeProgress,
                            initialData: model.docTypeProgressValue,
                            dataBuilder: (context, snapshot) {
                              return CommonDropdownWidget(
                                value: snapshot ?? "UB",
                                items: model.docTypeItems,
                                onChanged: (String? value) {
                                  model.changeDocTypeProgress(value ?? "");
                                },
                                prefix: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: AppDimensions.paddingSmall),
                                      child: Icon(
                                        Icons.print_outlined,
                                        color: Theme.of(context).highlightColor,
                                        size: 20,
                                      ),
                                    ),
                                    Text(
                                      "DocType",
                                      style: TextStyle(fontSize: AppDimensions.fontSmall),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      )),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                          child: SizedBox(
                        height:isZebra.data==true? 0.09.sh: 0.06.sh,
                        child: AppStreamBuilder<String>(
                            stream: model.time,
                            initialData: model.timeValue,
                            dataBuilder: (context, snapshot) {
                              return CommonDropdownWidget(
                                value: snapshot ?? "1:00",
                                items: model.times,
                                onChanged: (String? value) {
                                  model.changeTime(value ?? "");
                                },
                                prefix: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: AppDimensions.paddingSmall),
                                      child: Icon(
                                        Icons.timer_outlined,
                                        color: Theme.of(context).highlightColor,
                                        size: 20,
                                      ),
                                    ),
                                    Text(
                                      "Time",
                                      style: TextStyle(fontSize: AppDimensions.fontSmall),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomTextField(
                    hintText: "Comments",
                    controller: model.commentController,
                    icon: Icons.comment_outlined,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CommonElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutePaths.articleEnquiry,
                          arguments: "stockTransport");
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
