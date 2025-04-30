import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulu_store_app/core/utils/dimensions.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/themes.dart';
import '../../../di/app/feature_module.dart';

class AvailableHomeOptions extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  final String number;
  final IconData icon;

  const AvailableHomeOptions(
      {required this.onTap,
      required this.name,
      required this.number,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = ProviderScope.containerOf(context)
            .read(themeViewModelProvider)
            .currentTheme ==
        AppThemes.darkTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).dividerColor, width: 0.5),
            borderRadius: BorderRadius.circular(15),
            color: isDark
                ? AppColors.textColorLight
                : AppColors.homeOptionsBackgroundLight,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.5.h,
              ),
              Padding(
                padding: EdgeInsets.all(AppDimensions.paddingSmall),
                child: Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primaryColorLight,
                    child: Text(
                      number,
                      style: TextStyle(color: AppColors.backGroundColorLight),
                    ),
                  ),
                ),
              ),
              Center(
                  child: Padding(
                padding: EdgeInsets.all(AppDimensions.paddingSmall),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: AppDimensions.fontSmall,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.notoSans().fontFamily,
                  ),
                ),
              )),
              SizedBox(height: 7.h,),
              Center(
                child: Icon(
                  icon,
                  color: AppColors.iconColor,
                  size: AppDimensions.iconLarge,
                ),
              )
            ],
          )),
    );
  }
}
