import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/themes.dart';
import '../../../di/app/feature_module.dart';

class StoreOptions extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  final IconData icon;

  const StoreOptions(
      {required this.onTap, required this.name, required this.icon, super.key});

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
            borderRadius: BorderRadius.circular(10),
            color: isDark
                ? AppColors.textColorLight
                : AppColors.homeOptionsBackgroundLight,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 0.7.h,
              ),
              Center(
                child: Icon(
                  icon,
                  color: AppColors.iconColor,
                  size: AppDimensions.iconMedium,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(AppDimensions.paddingMedium),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: AppDimensions.fontSmall,
                    fontFamily: GoogleFonts.notoSans().fontFamily,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
