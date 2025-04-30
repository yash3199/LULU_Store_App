import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lulu_store_app/app/profile_settings_page_model.dart';
import '../base/base_page.dart';
import '../core/utils/colors.dart';

class ProfileSettingsPageView
    extends BasePageViewWidget<ProfileSettingsViewModel> {
  const ProfileSettingsPageView(ProviderBase<ProfileSettingsViewModel> model,
      {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, model) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "myProfile",
                style: TextStyle(
                    fontSize: 18,
                    color: AppColors.blackTextLight,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
