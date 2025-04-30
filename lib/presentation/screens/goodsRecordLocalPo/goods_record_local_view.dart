import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lulu_store_app/core/utils/AppStreamBuilder.dart';
import 'package:lulu_store_app/core/utils/strings.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/image_constants.dart';
import '../../../core/utils/commonWidget/common_button.dart';
import '../../../core/utils/commonWidget/common_elevated_button.dart';
import '../../../core/utils/commonWidget/common_text_field.dart';
import '../../molecules/goodReceipt/good_receipt_molecule.dart';
import 'goods_record_local_view_model.dart';

class GoodsRecordLocalWidget
    extends BasePageViewWidget<GoodsRecordLocalViewModel> {
  const GoodsRecordLocalWidget(ProviderBase<GoodsRecordLocalViewModel> model,
      {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, GoodsRecordLocalViewModel model) {
    return  AppStreamBuilder<bool>(
      initialData: model.poNumberAddedValue,
      stream: model.poNumberAdded,
      dataBuilder: (context, submit) {
        return submit==false? Column(
          children: [
            Padding(
              padding: EdgeInsets.all(AppDimensions.paddingMedium),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextField(
                        hintText: "PO No",
                        controller: model.pONumberController,
                        icon: null,
                      )),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                          child: CustomTextField(
                        hintText: "Inv No",
                        controller: model.invNumberController,
                        icon: null,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomTextField(
                      hintText: "Header Text", controller: model.commentsController),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomTextField(
                      hintText: "Comments", controller: model.commentsController),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CommonElevatedButton(
                          onPressed: () {
                          },
                          text: "Cancel",
                          isCancel: true,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: CommonElevatedButton(
                          onPressed: () {
                            model.changePoNumberAdded(true);
                          },
                          text: AppStrings.submit.tr(),
                        ),
                      ),
                    ],
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
        ):
        GoodReceiptMolecule(model:model);
      }
    );
  }
}
