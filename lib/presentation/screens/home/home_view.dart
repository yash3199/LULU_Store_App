import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lulu_store_app/app/navigation/routes.dart';
import 'package:lulu_store_app/presentation/molecules/home/home_catalog_options.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/dimensions.dart';
import 'home_view_model.dart';

class HomeWidget extends BasePageViewWidget<HomeViewModel> {
  const HomeWidget(ProviderBase<HomeViewModel> model, {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, HomeViewModel model) {

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
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 2 / 2,
            ),
            itemCount: model.options.length,
            itemBuilder: (context, index) {
              return AvailableHomeOptions(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.pushNamed(context, RoutePaths.articleEnquiry,arguments: "articleEnquiry");
                        break;
                      case 1:
                        Navigator.pushNamed(context, RoutePaths.storeOperation);
                        break;
                      case 2:
                        Navigator.pushNamed(context, RoutePaths.labelPrint);
                        break;
                      case 3:
                        Navigator.pushNamed(context, RoutePaths.deliveryCreation);
                        break;
                      case 4:
                        Navigator.pushNamed(
                            context, RoutePaths.goodsRecordLocal);
                        break;
                      case 5:
                        Navigator.pushNamed(
                            context, RoutePaths.stockTransportOrder);
                        break;
                      case 6:
                        Navigator.pushNamed(context, RoutePaths.reservation);
                        break;
                      case 7:
                        Navigator.pushNamed(context, RoutePaths.freshFood);
                        break;
                      case 8:
                        Navigator.pushNamed(context, RoutePaths.returnPo);
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
