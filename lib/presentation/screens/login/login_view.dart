import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulu_store_app/app/navigation/routes.dart';
import 'package:lulu_store_app/core/utils/colors.dart';
import 'package:lulu_store_app/core/utils/dimensions.dart';
import 'package:lulu_store_app/core/utils/strings.dart';
import 'package:lulu_store_app/di/app/feature_module.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/image_constants.dart';
import '../../../core/utils/themes.dart';
import '../../../core/utils/commonWidget/common_button.dart';
import '../../../core/utils/commonWidget/common_elevated_button.dart';
import '../../../core/utils/commonWidget/common_text_field.dart';
import 'login_view_model.dart';


class LoginWidget extends BasePageViewWidget<LoginViewModel> {
  const LoginWidget(ProviderBase<LoginViewModel> model,
      {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.12.sh,
              ),
              CustomTextField(
                hintText: AppStrings.enterSapId.tr(),
                controller: model.sapIdController,
                icon: Icons.person,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 25.h),
              CustomTextField(
                hintText: AppStrings.enterPass.tr(),
                controller: model.passwordController,
                isPassword: true,
                icon: Icons.lock,
              ),
              SizedBox(height: 60.h),
              CommonElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutePaths.homeView);
                },
                text: AppStrings.signIn.tr(),
              )
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset(AppImageStrings.warehouseManagementFooter,fit: BoxFit.contain),
        ),
      ],
    );
  }
}



