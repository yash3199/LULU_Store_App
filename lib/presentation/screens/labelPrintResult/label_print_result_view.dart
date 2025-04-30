


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/commonWidget/common_alert_dialog.dart';
import '../../../core/utils/commonWidget/common_elevated_button.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/image_constants.dart';
import '../../../core/utils/is_zebra_device.dart';
import '../../../core/utils/strings.dart';
import 'label_print_result_view_model.dart';

class LabelPrintResultWidget extends BasePageViewWidget<LabelPrintResultViewModel> {
  const LabelPrintResultWidget(ProviderBase<LabelPrintResultViewModel> model, {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, LabelPrintResultViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 0.04.sh,
            width: 0.9.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
              gradient: LinearGradient(
                begin: Alignment.topLeft, // Start position
                end: Alignment.topRight, // End position
                colors: [
                  AppColors.bodyBackGroundColorGradient1, // Deep Sky Blue
                  AppColors.bodyBackGroundColorGradient2, // Light Sky Blue
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 13.0,top: 4.0),
              child: Text("RESULT",style: TextStyle(
                color: AppColors.backGroundColorLight,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.notoSans().fontFamily,
              ),),
            ),
          ),
          Container(
            width: 0.9.sw,
            decoration: BoxDecoration(
              color: AppColors.bodyBackGroundColorGradient2,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text("Batch Number",style: TextStyle(
                          color: AppColors.backGroundColorLight,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.notoSans().fontFamily,
                        )),
                      ),
                      Expanded(
                        child: Text("5405",style: TextStyle(
                          color: AppColors.backGroundColorLight,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.notoSans().fontFamily,
                        )),
                      ),

                    ],
                  ),
                  Divider(color: AppColors.homeOptionsBackgroundLight,thickness: 0.5,),
                  Row(
                    children: [
                      Expanded(
                        child: Text("Label Type",style: TextStyle(
                          color: AppColors.backGroundColorLight,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.notoSans().fontFamily,
                        )),
                      ),
                      Expanded(
                        child: Text("01",style: TextStyle(
                          color: AppColors.backGroundColorLight,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.notoSans().fontFamily,
                        )),
                      ),

                    ],
                  ),
                  Divider(color: AppColors.homeOptionsBackgroundLight,thickness: 0.5,),
                  Row(
                    children: [
                      Expanded(
                        child: Text("Hand Held Number",style: TextStyle(
                          color: AppColors.backGroundColorLight,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.notoSans().fontFamily,
                        )),
                      ),
                      Expanded(
                        child: Text("7",style: TextStyle(
                          color: AppColors.backGroundColorLight,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.notoSans().fontFamily,
                        )),
                      ),

                    ],
                  ),
                  Divider(color: AppColors.homeOptionsBackgroundLight,thickness: 0.5,),
                ],
              ),
            ),
          ),
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
                  text: "Save to SAP",
                  isSave: true,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: FutureBuilder<bool>(
                  future: IsZebraDevice.isZebraDevice(),
                  builder: (context, snapshot) {
                    return SizedBox(
                      height: 0.114.sh,
                      child: CommonElevatedButton(
                        onPressed: () {
                          showCommonAlertDialog(
                            context: context,
                            title: 'PRINT',
                            message: 'Print Success!',
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
                        text: "Print",
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(AppImageStrings.warehouseManagementFooter,fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
