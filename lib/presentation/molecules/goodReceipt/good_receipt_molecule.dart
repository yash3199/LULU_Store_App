import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/commonWidget/common_alert_dialog.dart';
import '../../../core/utils/commonWidget/common_elevated_button.dart';
import '../../../core/utils/commonWidget/common_text_field.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/image_constants.dart';
import '../../../core/utils/strings.dart';
import '../../screens/goodsRecordLocalPo/goods_record_local_view_model.dart';

class GoodReceiptMolecule extends StatelessWidget {
  final GoodsRecordLocalViewModel model;

  const GoodReceiptMolecule({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(AppDimensions.paddingMedium),
                child: Column(
                  children: [
                    Text(
                      "World Line Gourmet Private Limited",
                      style: TextStyle(
                        fontSize: AppDimensions.fontMedium,
                        fontWeight: FontWeight.w800,
                        fontFamily: GoogleFonts.notoSans().fontFamily,

                      ),
                    ),
                    SizedBox(height: 0.01.sh,),
                    Text(
                      "INVOICE LEVEL INFO",
                      style: TextStyle(
                        fontSize: AppDimensions.fontSmall,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.notoSans().fontFamily,
                          color: AppColors.bodyBackGroundColorGradient1
                      ),
                    ),
                    SizedBox(height: 0.03.sh,),
                    SizedBox(height: 0.01.sh,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Cost",
                          style: TextStyle(
                              fontSize: AppDimensions.fontSmall,
                              fontWeight: FontWeight.bold,
                              fontFamily:
                              GoogleFonts.notoSans().fontFamily,
                              color: Theme.of(context).canvasColor),
                        ),
                        Text(
                          "9625.00",
                          style: TextStyle(
                            fontSize: AppDimensions.fontSmall,
                            fontWeight: FontWeight.bold,
                            fontFamily:
                            GoogleFonts.notoSans().fontFamily,
                          ),
                        ),
                        Text(
                          "INR",
                          style: TextStyle(
                              fontSize: AppDimensions.fontSmall,
                              fontWeight: FontWeight.bold,
                              fontFamily:
                              GoogleFonts.notoSans().fontFamily,
                              color: Theme.of(context).canvasColor),
                        ),
                      ],
                    ),
                    Divider(
                      color: AppColors.bodyBackGroundColorGradient1,
                      thickness: 0.5,
                    ),
                    SizedBox(
                      height: 0.01.sh,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "WAT",
                          style: TextStyle(
                              fontSize: AppDimensions.fontSmall,
                              fontWeight: FontWeight.bold,
                              fontFamily:
                              GoogleFonts.notoSans().fontFamily,
                              color: Theme.of(context).canvasColor),
                        ),
                        Text(
                          "0.00",
                          style: TextStyle(
                            fontSize: AppDimensions.fontSmall,
                            fontWeight: FontWeight.bold,
                            fontFamily:
                            GoogleFonts.notoSans().fontFamily,
                          ),
                        ),
                        Text(
                          "INR",
                          style: TextStyle(
                              fontSize: AppDimensions.fontSmall,
                              fontWeight: FontWeight.bold,
                              fontFamily:
                              GoogleFonts.notoSans().fontFamily,
                              color: Theme.of(context).canvasColor),
                        ),
                      ],
                    ),
                    Divider(
                      color: AppColors.bodyBackGroundColorGradient1,
                      thickness: 0.5,
                    ),
                    SizedBox(
                      height: 0.01.sh,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TOTAL",
                          style: TextStyle(
                              fontSize: AppDimensions.fontSmall,
                              fontWeight: FontWeight.bold,
                              fontFamily:
                              GoogleFonts.notoSans().fontFamily,
                              color: Theme.of(context).canvasColor),
                        ),
                        Text(
                          "9625.00",
                          style: TextStyle(
                            fontSize: AppDimensions.fontSmall,
                            fontWeight: FontWeight.bold,
                            fontFamily:
                            GoogleFonts.notoSans().fontFamily,
                          ),
                        ),
                        Text(
                          "INR",
                          style: TextStyle(
                              fontSize: AppDimensions.fontSmall,
                              fontWeight: FontWeight.bold,
                              fontFamily:
                              GoogleFonts.notoSans().fontFamily,
                              color: Theme.of(context).canvasColor),
                        ),
                      ],
                    ),
                    Divider(
                      color: AppColors.bodyBackGroundColorGradient1,
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 0.01.sh,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CustomTextField(
                              hintText: "PO No",
                              controller: model.pONumberController,
                              icon: null,
                            )),
                        SizedBox(
                          width: 10.w,
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
                      height: 15.h,
                    ),
                    CommonElevatedButton(
                      onPressed: () {
                        showCommonAlertDialog(
                          context: context,
                          title: 'Goods Receipt No',
                          message: '5002668172',
                          prefixIcon: Icons.check_circle,
                          iconColor: Colors.green,
                          showCancel: false,
                          onConfirm: () {

                          },
                          onCancel: () {
                            // Cancel logic
                          },
                        );
                      },
                      text: AppStrings.submit.tr(),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset(
                    AppImageStrings.warehouseManagementFooter,
                    fit: BoxFit.contain),
              ),
            ],
          );
  }
}
