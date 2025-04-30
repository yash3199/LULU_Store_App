import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulu_store_app/core/utils/strings.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/themes.dart';
import '../../../di/app/feature_module.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = ProviderScope.containerOf(context)
            .read(themeViewModelProvider)
            .currentTheme ==
        AppThemes.darkTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: 1.sw,
              height: 1.4.sh,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft, // Start position
                  end: Alignment.topRight, // End position
                  colors: [
                    AppColors.bodyBackGroundColorGradient1, // Deep Sky Blue
                    AppColors.bodyBackGroundColorGradient2, // Light Sky Blue
                  ],
                ),
              ),
              child: SafeArea(
                  child: Padding(
                padding: EdgeInsets.all(AppDimensions.paddingMedium),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0,right: 6.0,left: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.backGroundColorLight,
                          size: AppDimensions.iconMedium,
                        ),
                      ),
                    ),
                    Text(
                      AppStrings.settings.tr(),
                      style: TextStyle(
                          color: AppColors.backGroundColorLight,
                          fontSize: AppDimensions.fontLarge,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.notoSans().fontFamily),
                    ),

                  ],
                ),
              )),
            ),
            Positioned(
                top: 0.2.sh,
                bottom: 0,
                child: Container(
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Padding(
                    padding: EdgeInsets.all(AppDimensions.paddingMedium),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            isDark ? Icons.dark_mode : Icons.light_mode,
                            color: AppColors.primaryColorLight,
                          ),
                          title: Text(AppStrings.darkMode.tr()),
                          trailing: Switch(
                            value: isDark,
                            activeColor: AppColors.primaryColorLight,
                            activeTrackColor: Theme.of(context).focusColor,
                            inactiveThumbColor: AppColors.backGroundColorLight,
                            inactiveTrackColor: Theme.of(context).focusColor,
                            onChanged: (value) {
                              ProviderScope.containerOf(context)
                                  .read(themeViewModelProvider)
                                  .toggleTheme();
                            },
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.language,
                              color: AppColors.primaryColorLight),
                          title: Text(AppStrings.selectLanguage.tr()),
                          trailing: DropdownButton<Locale>(
                            value: context.locale,
                            items: [
                              DropdownMenuItem(
                                value: Locale('en', 'US'),
                                child: Text("English"),
                              ),
                              DropdownMenuItem(
                                value: Locale('ur', 'PK'),
                                child: Text("اردو (Urdu)"),
                              ),
                            ],
                            onChanged: (Locale? newLocale) {
                              if (newLocale != null) {
                                context.setLocale(newLocale);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
