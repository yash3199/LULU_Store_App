import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lulu_store_app/presentation/screens/inStoreOperation/store_operation_view_model.dart';
import 'package:lulu_store_app/presentation/molecules/inStoreOperation/store_options.dart';
import '../../../app/navigation/routes.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/themes.dart';
import '../../../di/app/feature_module.dart';

class StoreOperationWidget extends BasePageViewWidget<StoreOperationViewModel> {
  const StoreOperationWidget(ProviderBase<StoreOperationViewModel> model,
      {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, StoreOperationViewModel model) {
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
              return StoreOptions(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.pushNamed(
                            context, RoutePaths.physicalInventory);
                        break;
                      case 1:
                        Navigator.pushNamed(context, RoutePaths.articleEnquiry);
                        break;
                    }
                  },
                  name: model.options[index]['name'],
                  icon: model.options[index]['icon']);
            },
          ),
        ),
      ),
    );
  }
}
