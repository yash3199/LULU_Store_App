import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'base_page_state.dart';
import 'base_page_view_model.dart';
import 'base_widget.dart';

/// Every Page/View should be inherited from this
abstract class BasePage<VM extends BasePageViewModel> extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);
}

abstract class BasePageState<VM extends BasePageViewModel,
    T extends BasePage<VM>> extends CoreBasePageState<VM, T> {
  /// Declare and initialization of viewModel for the page
  ProviderBase<VM> provideBase();
}

abstract class BaseStatefulPage<VM extends BasePageViewModel,
    B extends BasePage<VM>> extends BasePageState<VM, B> {
  @override
  void onBaseModelReady(VM model) {
    super.onBaseModelReady(model);
    // model.error.listen((event) {
    //   // if (event?.error.code == 11) {
    //   //   GeneralDialog.showFailureDialog(
    //   //     context,
    //   //     appError: event,
    //   //     onClose: () {
    //   //       model.sharedPreferences.sessionToken = "";
    //   //       Navigator.pushNamedAndRemoveUntil(context, RoutePaths.homeView,
    //   //           ModalRoute.withName(RoutePaths.loginView));
    //   //     },
    //   //   );
    //   // }
    //   // else if (event?.error.message.isEmpty ?? false) {
    //   //   showShortToast(
    //   //     ErrorParser.getLocalisedStringError(
    //   //       error: event,
    //   //       localisedHelper: S.of(context),
    //   //     ),
    //   //   );
    //   // }
    //   // else {
    //   //   GeneralDialog.showFailureDialog(
    //   //     context,
    //   //     appError: event,
    //   //     onClose: () {
    //   //       Navigator.pop(context);
    //   //     },
    //   //   );
    //   // }
    // });
    // model.toast.listen((message) {
    //   showShortToast(message);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<VM>(
        providerBase: provideBase(),
        onModelReady: onBaseModelReady,
        builder: (BuildContext context, VM? model, Widget? child) {
          return getLayout();
        });
  }
}

abstract class BasePageViewWidget<T extends BasePageViewModel> extends Widget {
  final ProviderBase<T> providerBase;

  const BasePageViewWidget(this.providerBase, {super.key});

  @protected
  Widget build(BuildContext context, T model);

  @override
  DataProviderElement<T> createElement() => DataProviderElement<T>(
        this,
        providerBase,
      );
}

class DataProviderElement<T extends BasePageViewModel>
    extends ComponentElement {
  final ProviderBase<T> providerBase;

  DataProviderElement(
    BasePageViewWidget<T> widget,
    this.providerBase,
  ) : super(widget);

  @override
  BasePageViewWidget<T> get widget => super.widget as BasePageViewWidget<T>;

  @override
  Widget build() {
    return BaseWidget<T>(
      providerBase: providerBase,
      builder: (context, model, child) {
        return widget.build(this, model!);
      },
    );
  }
}
