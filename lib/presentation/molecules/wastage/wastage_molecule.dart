


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulu_store_app/core/utils/commonWidget/common_line_items_widget.dart';

import '../../../core/utils/AppStreamBuilder.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/commonWidget/common_elevated_button.dart';
import '../../../core/utils/commonWidget/common_text_field.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/image_constants.dart';
import '../../../core/utils/strings.dart';
import '../../screens/articleEnquiry/article_enquiry_view_model.dart';

class WastageMolecule extends StatelessWidget {
  final ArticleEnquiryViewModel model;
  const WastageMolecule({required this.model,super.key});

  @override
  Widget build(BuildContext context) {
    model.ea.text="EA";
    model.ea1.text="1EA";
    return AppStreamBuilder<bool>(
        initialData: model.itemAddedValue,
        stream: model.itemAddedStream,
        dataBuilder: (context, snapshot) {
          return snapshot==false? Column(
            children: [
              Padding(
                padding:  EdgeInsets.all(AppDimensions.paddingMedium),
                child: Column(
                  children: [
                    Text("Aloo Bhaji/Puri",style: TextStyle(
                      fontSize: AppDimensions.fontLarge,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.notoSans().fontFamily,

                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "9066",
                            style: TextStyle(
                              color: AppColors.bodyBackGroundColorGradient1,
                              fontSize: AppDimensions.fontMedium,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.notoSans().fontFamily,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Site Stock ",style: TextStyle(

                              fontSize: AppDimensions.fontSmall,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.notoSans().fontFamily,
                            ),),
                            Text("3",style: TextStyle(
                              fontSize: AppDimensions.fontSmall,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.notoSans().fontFamily,
                            ),),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Sales Value ",style: TextStyle(
                              fontSize: AppDimensions.fontSmall,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.notoSans().fontFamily,
                            )),
                            Text("60.00 INR",style: TextStyle(
                              fontSize: AppDimensions.fontSmall,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.notoSans().fontFamily,
                            ),)
                          ],
                        )
                      ],
                    ),
                    Divider(
                      color: AppColors.bodyBackGroundColorGradient1,
                      thickness: 0.5,
                    ),
                    SizedBox(height: 0.01.sh,),
                    Row(
                      children: [
                        Expanded(
                            child: CustomTextField(
                              hintText: "Qty",
                              controller: model.qty,
                              icon: null,
                            )),
                        SizedBox(width: 5.h,),
                        Expanded(
                            child: CustomTextField(
                              hintText: "",
                              controller: model.ea,
                              icon: null,
                            )),
                        Text("="),
                        Expanded(
                            child: CustomTextField(
                              hintText: "",
                              controller: model.ea1,
                              icon: null,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CommonElevatedButton(
                      onPressed: () {
                        model.changeItemAdded(true);
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
          ):
          AppStreamBuilder<bool>(
              initialData: model.saveItemValue,
              stream: model.saveItemStream,
              dataBuilder: (context, snapshot) {
                return snapshot==false?
                    CommonLineItemsWidget(index: '1', idNumber: '9066', oneEa: '1EA', itemName: 'Aloo Bhaji/Puri', onPressed: () {
                      model.changeSaveItem(true);
                    },):
                Padding(
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
                          child: Text("RESERVATION NUMBER",style: TextStyle(
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
                                  Text("354019",style: TextStyle(
                                    color: AppColors.backGroundColorLight,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.notoSans().fontFamily,
                                  )),
                                  Text("13/11/2022",style: TextStyle(
                                    color: AppColors.backGroundColorLight,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.notoSans().fontFamily,
                                  ))
                                ],
                              ),
                              SizedBox(height: 0.01.sh,),


                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CommonElevatedButton(
                        isCancel: true,
                        onPressed: () {
                        },
                        text: AppStrings.exit.tr(),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Image.asset(AppImageStrings.warehouseManagementFooter,fit: BoxFit.contain),
                      ),
                    ],
                  ),
                )
                ;
              }
          )


          ;
        }
    );
  }
}
