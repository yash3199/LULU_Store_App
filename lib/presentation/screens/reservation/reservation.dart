
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lulu_store_app/presentation/screens/reservation/reservation_view.dart';
import 'package:lulu_store_app/presentation/screens/reservation/reservation_view_model.dart';

import '../../../base/base_page.dart';
import '../../../core/utils/strings.dart';
import '../../../di/app/feature_module.dart';

class ReservationView extends BasePage<ReservationViewModel> {
  const ReservationView({super.key});

  @override
  State<ReservationView> createState() => _ReservationViewState();
}

class _ReservationViewState extends BaseStatefulPage<ReservationViewModel, ReservationView> {
  @override
  Widget buildView(BuildContext context, ReservationViewModel model) {
    return ReservationWidget(provideBase());
  }

  @override
  ProviderBase<ReservationViewModel> provideBase() {
    return reservationProvider;
  }

  @override
  String headText() {
    return AppStrings.reservation.tr();
  }

  @override
  bool showBackButton() {
    return false;
  }



}