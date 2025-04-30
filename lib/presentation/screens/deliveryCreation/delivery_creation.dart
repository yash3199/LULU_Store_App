import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/strings.dart';
import '../../../di/app/feature_module.dart';
import 'delivery_creation_view.dart';
import 'delivery_creation_view_model.dart';

class DeliveryCreationView extends BasePage<DeliveryCreationViewModel> {
  const DeliveryCreationView({super.key});

  @override
  State<DeliveryCreationView> createState() => _DeliveryCreationViewState();
}

class _DeliveryCreationViewState
    extends BaseStatefulPage<DeliveryCreationViewModel, DeliveryCreationView> {
  @override
  Widget buildView(BuildContext context, DeliveryCreationViewModel model) {
    return DeliveryCreationWidget(provideBase());
  }

  @override
  ProviderBase<DeliveryCreationViewModel> provideBase() {
    return deliveryCreationProvider;
  }

  @override
  String headText() {
    return AppStrings.deliveryCreation.tr();
  }

  @override
  bool showBackButton() {
    return false;
  }
}
