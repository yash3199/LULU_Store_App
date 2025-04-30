import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulu_store_app/core/utils/colors.dart';

import '../dimensions.dart';

class CommonElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color borderColor;
  final Color iconColor;
  final Color backgroundColor;
  final IconData icon;
  final String text;
  final bool isCancel;
  final bool isSave;

  const CommonElevatedButton(
      {Key? key,
      required this.onPressed,
      this.borderColor = Colors.blue,
      this.iconColor = Colors.blue,
      this.backgroundColor = Colors.white,
      this.icon = Icons.arrow_forward_ios,
      required this.text,
      this.isCancel = false,
      this.isSave = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isSave == true
              ? [AppColors.greenGradientShade1, AppColors.greenGradientShade2]
              : isCancel == false
                  ? [
                      AppColors.bodyBackGroundColorGradient1,
                      AppColors.bodyBackGroundColorGradient2
                    ]
                  : [AppColors.redGradientShade1, AppColors.redGradientShade2],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: AppDimensions.fontSmall,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.notoSans().fontFamily,
                      color: AppColors.backGroundColorLight),
                ),
              ),
              Icon(
                icon,
                color: AppColors.backGroundColorLight,
                size: AppDimensions.iconSmall,
              ),
            ],
          )),
    );
  }
}
