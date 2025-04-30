import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lulu_store_app/presentation/screens/reservation/reservation_view_model.dart';

import '../../../app/navigation/routes.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/dimensions.dart';
import '../../molecules/home/home_catalog_options.dart';

class ReservationWidget extends BasePageViewWidget<ReservationViewModel> {
  const ReservationWidget(ProviderBase<ReservationViewModel> model, {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, ReservationViewModel model) {

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingMedium),
        child: SizedBox(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two items in a row
              crossAxisSpacing: 11,
              mainAxisSpacing: 15,
            ),
            itemCount: model.options.length,
            itemBuilder: (context, index) {
              return AvailableHomeOptions(
                  onTap: () {
                    switch (index) {
                      case 0:
                         Navigator.pushNamed(context, RoutePaths.productionOrder);
                        break;
                      case 1:
                         Navigator.pushNamed(context, RoutePaths.wastage);
                        break;
                    }
                  },
                  name: model.options[index]['name'],
                  number: model.options[index]['number'],
                  icon: model.options[index]['icon']);
            },
          ),
        ),
      ),
    );
  }
}
