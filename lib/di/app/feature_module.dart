import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lulu_store_app/presentation/screens/goodsRecordLocalPo/goods_record_local_view_model.dart';
import 'package:lulu_store_app/presentation/screens/labelPrint/label_print_view_model.dart';
import 'package:lulu_store_app/presentation/screens/labelPrintItemList/label_print_item_list_view_model.dart';
import '../../app/profile_settings_page_model.dart';
import '../../core/theme/theme_view_model.dart';
import '../../presentation/screens/articleEnquiry/article_enquiry_view_model.dart';
import '../../presentation/screens/deliveryCreation/delivery_creation_view_model.dart';
import '../../presentation/screens/freshFoodPo/fresh_food_view_model.dart';
import '../../presentation/screens/home/home_view_model.dart';
import '../../presentation/screens/inStoreOperation/store_operation_view_model.dart';
import '../../presentation/screens/labelPrintResult/label_print_result_view_model.dart';
import '../../presentation/screens/login/login_view_model.dart';
import '../../presentation/screens/physicalInventory/physical_inventory_view_model.dart';
import '../../presentation/screens/productionOrder/production_order_view_model.dart';
import '../../presentation/screens/reservation/reservation_view_model.dart';
import '../../presentation/screens/returnPo/return_po_view_model.dart';
import '../../presentation/screens/stockTransportOrder/stock_transport_order_view_model.dart';
import '../../presentation/screens/wastage/wastage_view_model.dart';

final themeViewModelProvider =
    ChangeNotifierProvider.autoDispose<ThemeViewModel>(
  (ref) {
    return ThemeViewModel();
  },
);

final articleViewModelProvider =
    ChangeNotifierProvider.autoDispose<ArticleEnquiryViewModel>(
  (ref) {
    return ArticleEnquiryViewModel();
  },
);

final storeViewModelProvider =
    ChangeNotifierProvider.autoDispose<StoreOperationViewModel>((ref) {
  return StoreOperationViewModel();
});

final physicalInventoryProvider =
    ChangeNotifierProvider.autoDispose<PhysicalInventoryViewModel>((ref) {
  return PhysicalInventoryViewModel();
});

final deliveryCreationProvider =
    ChangeNotifierProvider.autoDispose<DeliveryCreationViewModel>((ref) {
  return DeliveryCreationViewModel();
});

final goodsRecordLocalProvider =
    ChangeNotifierProvider.autoDispose<GoodsRecordLocalViewModel>((ref) {
  return GoodsRecordLocalViewModel();
});

final stockTransportLocalProvider =
    ChangeNotifierProvider.autoDispose<StockTransportOrderViewModel>((ref) {
  return StockTransportOrderViewModel();
});

final freshFoodProvider =
    ChangeNotifierProvider.autoDispose<FreshFoodViewModel>((ref) {
  return FreshFoodViewModel();
});

final returnPoProvider =
    ChangeNotifierProvider.autoDispose<ReturnPoViewModel>((ref) {
  return ReturnPoViewModel();
});

final labelPrintProvider = ChangeNotifierProvider.autoDispose<LabelPrintViewModel>((ref) {
  return LabelPrintViewModel();
});

final labelPrintItemListProvider = ChangeNotifierProvider.autoDispose<LabelPrintItemListViewModel>((ref) {
  return LabelPrintItemListViewModel();
});

final labelPrintResultProvider = ChangeNotifierProvider.autoDispose<LabelPrintResultViewModel>((ref) {
  return LabelPrintResultViewModel();
});

final reservationProvider = ChangeNotifierProvider.autoDispose<ReservationViewModel>((ref) {
  return ReservationViewModel();
});


final homeProvider = ChangeNotifierProvider.autoDispose<HomeViewModel>((ref) {
  return HomeViewModel();
});

final productionOrderProvider = ChangeNotifierProvider.autoDispose<ProductionOrderViewModel>((ref) {
  return ProductionOrderViewModel();
});

final wastageProvider = ChangeNotifierProvider.autoDispose<WastageViewModel>((ref) {
  return WastageViewModel();
});

final profileSettingsViewModelProvider =
    ChangeNotifierProvider.autoDispose<ProfileSettingsViewModel>((ref) {
  return ProfileSettingsViewModel();
});

final loginViewModelProvider =
ChangeNotifierProvider.autoDispose<LoginViewModel>((ref) {
  return LoginViewModel();
});
