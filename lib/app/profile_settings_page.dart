import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lulu_store_app/app/profile_settings_page_model.dart';
import 'package:lulu_store_app/app/profile_settings_page_view.dart';

import '../base/base_page.dart';
import '../core/utils/colors.dart';
import '../di/app/feature_module.dart';

class ProfileSettingsPage extends BasePage<ProfileSettingsViewModel> {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  ProfileSettingsPageState createState() => ProfileSettingsPageState();
}

class ProfileSettingsPageState
    extends BaseStatefulPage<ProfileSettingsViewModel, ProfileSettingsPage> {
  @override
  ProviderBase<ProfileSettingsViewModel> provideBase() {
    return profileSettingsViewModelProvider;
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return AppBar(
      backgroundColor: AppColors.backGroundColorLight,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.blackTextLight),
      title: ValueListenableBuilder<String>(
        valueListenable: getViewModel().balance,
        builder: (context, value, child) {
          return Text(value,
              style: TextStyle(
                  color: AppColors.blackTextLight, fontWeight: FontWeight.bold));
        },
      ),
    );
  }

  @override
  Widget buildView(BuildContext context, ProfileSettingsViewModel model) {
    return ProfileSettingsPageView(provideBase());
  }

  @override
  String headText() {
    return "Profile Setting";
  }

  @override
  bool showBackButton() {
    return false;
  }
}
