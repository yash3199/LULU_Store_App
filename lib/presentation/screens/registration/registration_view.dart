import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lulu_store_app/presentation/screens/registration/registration_view_model.dart';
import '../../../app/navigation/routes.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/commonWidget/common_elevated_button.dart';
import '../../../core/utils/commonWidget/common_text_field.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/image_constants.dart';
import '../../../core/utils/strings.dart';

class RegistrationWidget extends BasePageViewWidget<RegistrationViewModel> {
  const RegistrationWidget(ProviderBase<RegistrationViewModel> model,
      {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, RegistrationViewModel model) {
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
                hintText: AppStrings.enterSiteId.tr(),
                controller: model.siteIdController,
                icon: Icons.person,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 25.h),
              CustomTextField(
                hintText: AppStrings.enterCompanyCode.tr(),
                controller: model.companyCodeController,
                isPassword: true,
                icon: Icons.lock,
              ),
              SizedBox(height: 60.h),
              CommonElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutePaths.loginView);
                },
                text: AppStrings.register.tr(),
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
