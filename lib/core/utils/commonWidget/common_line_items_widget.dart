import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';
import '../image_constants.dart';
import '../strings.dart';
import 'common_elevated_button.dart';

class CommonLineItemsWidget extends StatelessWidget {
  final String index;
  final String idNumber;
  final String oneEa;
  final String itemName;
  final VoidCallback onPressed;
  final String? forthText;
  final String? fifthText;
  const CommonLineItemsWidget({required this.index, required this. idNumber, required this.oneEa,
    required this.itemName, required this.onPressed, this.forthText, this.fifthText, super.key});

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(left: 13.0,top: 2.0),
              child: Text("LINE ITEMS",style: TextStyle(
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
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(index,style: TextStyle(
                        color: AppColors.backGroundColorLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.notoSans().fontFamily,
                      )),
                      Text(idNumber,style: TextStyle(
                        color: AppColors.backGroundColorLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.notoSans().fontFamily,
                      )),
                     forthText!=null? Text(forthText!,style: TextStyle(
                        color: AppColors.backGroundColorLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.notoSans().fontFamily,
                      )):SizedBox.shrink(),
                      Text(oneEa,style: TextStyle(
                        color: AppColors.backGroundColorLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.notoSans().fontFamily,
                      )),
                      fifthText!=null? Text(fifthText!,style: TextStyle(
                        color: AppColors.backGroundColorLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.notoSans().fontFamily,
                      )):SizedBox.shrink()
                    ],
                  ),
                  SizedBox(height: 0.01.sh,),
                  Text(itemName,style: TextStyle(
                    color: AppColors.backGroundColorLight,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.notoSans().fontFamily,
                  )),

                ],
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          CommonElevatedButton(
            onPressed: onPressed,
            text: AppStrings.save.tr(),
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
