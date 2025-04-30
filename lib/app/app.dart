import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lulu_store_app/app/navigation/router.dart';
import 'package:lulu_store_app/core/theme/theme_view_model.dart';
import 'package:lulu_store_app/core/utils/themes.dart';

import '../base/base_widget.dart';
import '../core/utils/AppStreamBuilder.dart';
import '../di/app/app_module.dart';
import '../di/app/feature_module.dart';
import 'app_view_model.dart';
import 'navigation/routes.dart';

GlobalKey<NavigatorState> appLevelKey = GlobalKey(debugLabel: 'app-key');

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseWidget<AppViewModel>(
      providerBase: appViewModelProvider,
      builder: (context, model, child) {
        return BaseWidget<ThemeViewModel>(
          providerBase: themeViewModelProvider,
          builder: (context,model,child){
            return AppStreamBuilder<bool>(
              initialData: model!.isDarkModeValue,
              stream: model.isDarkModeStream,
              dataBuilder: (context, snapshot) {
                return MaterialApp(
                  navigatorKey: appLevelKey,
                  supportedLocales: context.supportedLocales,
                  onGenerateTitle: (context) => 'LULU Store App',
                  localizationsDelegates: context.localizationDelegates,
                  locale: context.locale,
                  debugShowCheckedModeBanner: false,
                  theme: snapshot==true? AppThemes.darkTheme: AppThemes.lightTheme,
                  initialRoute: RoutePaths.loginView,
                  onGenerateRoute: AppRouter.onGenerateRoute,
                );
              }
            );
          },

        );
      },
    );
  }
}