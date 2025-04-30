
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/AppStreamBuilder.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/commonWidget/common_elevated_button.dart';
import '../../../core/utils/commonWidget/common_line_items_widget.dart';
import '../../../core/utils/commonWidget/common_text_field.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/image_constants.dart';
import '../../../core/utils/strings.dart';
import '../../screens/articleEnquiry/article_enquiry_view_model.dart';

class DeliveryCreationMolecule extends StatelessWidget {
  final ArticleEnquiryViewModel model;
  const DeliveryCreationMolecule({required this.model,super.key});

  @override
  Widget build(BuildContext context) {
    model.ea.text="EA";
    model.ea1.text="1EA";
    return AppStreamBuilder<bool>(
        initialData: model.itemAddedValue,
        stream: model.itemAddedStream,
        dataBuilder: (context, snapshot) {
          return snapshot==false?
          CommonLineItemsWidget(
            index: '1',
            idNumber: '82',
            oneEa: 'EA',
            itemName: 'Aashirvaad Atta 5kg', onPressed: () {
            model.changeItemAdded(true);
          },
            forthText: "1.0",
          ):
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
                    child: Text("DELIVERY NUMBER",style: TextStyle(
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
                            Text("0084043559",style: TextStyle(
                              color: AppColors.backGroundColorLight,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.notoSans().fontFamily,
                            )),
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
          );
        }
    );
  }
}
