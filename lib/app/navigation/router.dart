import 'package:flutter/cupertino.dart';
import 'package:lulu_store_app/app/navigation/routes.dart';
import 'package:lulu_store_app/presentation/screens/inStoreOperation/store_operation.dart';
import 'package:lulu_store_app/presentation/screens/login/login_view.dart';
import 'package:lulu_store_app/presentation/screens/settings/settings_view.dart';
import '../../presentation/screens/articleEnquiry/article_enquiry.dart';
import '../../presentation/screens/deliveryCreation/delivery_creation.dart';
import '../../presentation/screens/freshFoodPo/fresh_food.dart';
import '../../presentation/screens/goodsRecordLocalPo/goods_record_local.dart';
import '../../presentation/screens/home/home.dart';
import '../../presentation/screens/labelPrint/label_print.dart';
import '../../presentation/screens/labelPrintItemList/label_print_item_list.dart';
import '../../presentation/screens/labelPrintResult/label_print_result.dart';
import '../../presentation/screens/login/login.dart';
import '../../presentation/screens/physicalInventory/physical_inventory.dart';
import '../../presentation/screens/productionOrder/production_order.dart';
import '../../presentation/screens/reservation/reservation.dart';
import '../../presentation/screens/returnPo/return_po.dart';
import '../../presentation/screens/stockTransportOrder/stock_transport_order.dart';
import '../../presentation/screens/wastage/wastage.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.loginView:
        return CupertinoPageRoute(
            builder: (context) => LoginView(),
            settings: RouteSettings(name: RoutePaths.loginView));

      case RoutePaths.homeView:
        return CupertinoPageRoute(
            builder: (context) => HomeView(),
            settings: RouteSettings(name: RoutePaths.homeView));

      case RoutePaths.settingView:
        return CupertinoPageRoute(
            builder: (context) => SettingsView(),
            settings: RouteSettings(name: RoutePaths.settingView));

      case RoutePaths.wastage:
        return CupertinoPageRoute(
            builder: (context) => WastageView(),
          settings: RouteSettings(name: RoutePaths.wastage)

        );

      case RoutePaths.articleEnquiry:
        final args = settings.arguments as String;
        return CupertinoPageRoute(
            builder: (context) => ArticleEnquiryView(data:args),
            settings: RouteSettings(name: RoutePaths.articleEnquiry));

      case RoutePaths.storeOperation:
        return CupertinoPageRoute(
            builder: (context) => StoreOperationView(),
            settings: RouteSettings(name: RoutePaths.storeOperation));

      case RoutePaths.physicalInventory:
        return CupertinoPageRoute(
            builder: (context) => PhysicalInventoryView(),
            settings: RouteSettings(name: RoutePaths.physicalInventory));
      case RoutePaths.deliveryCreation:
        return CupertinoPageRoute(
            builder: (context) => DeliveryCreationView(),
            settings: RouteSettings(name: RoutePaths.deliveryCreation));
      case RoutePaths.goodsRecordLocal:
        return CupertinoPageRoute(
            builder: (context) => GoodsRecordLocalView(),
            settings: RouteSettings(name: RoutePaths.goodsRecordLocal));
      case RoutePaths.stockTransportOrder:
        return CupertinoPageRoute(
            builder: (context) => StockTransportLocalView(),
            settings: RouteSettings(name: RoutePaths.stockTransportOrder));
      case RoutePaths.freshFood:
        return CupertinoPageRoute(
            builder: (context) => FreshFoodView(),
            settings: RouteSettings(name: RoutePaths.freshFood));
      case RoutePaths.returnPo:
        return CupertinoPageRoute(
            builder: (context) => ReturnPoView(),
            settings: RouteSettings(name: RoutePaths.returnPo));
      case RoutePaths.labelPrint:
        return CupertinoPageRoute(
            builder: (context) => LabelPrintView(),
            settings: RouteSettings(name: RoutePaths.labelPrint));
      case RoutePaths.labelPrintItemList:
        return CupertinoPageRoute(
            builder: (context) => LabelPrintItemListView(),
            settings: RouteSettings(name: RoutePaths.labelPrintItemList));
      case RoutePaths.labelPrintResult:
        return CupertinoPageRoute(
            builder: (context) => LabelPrintResultView(),
            settings: RouteSettings(name: RoutePaths.labelPrintResult));
      case RoutePaths.reservation:
        return CupertinoPageRoute(
            builder: (context) => ReservationView(),
            settings: RouteSettings(name: RoutePaths.reservation));
      case RoutePaths.productionOrder:
        return CupertinoPageRoute(
            builder: (context) => ProductionOrderView(),
            settings: RouteSettings(name: RoutePaths.productionOrder));
      default:
        return CupertinoPageRoute(
          builder: (context) {
            return Center(child: Text("Page not found"));
          },
        );
    }
  }
}
