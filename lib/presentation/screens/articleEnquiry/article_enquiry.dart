import 'dart:async';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datawedge/flutter_datawedge.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart' hide Trans;
import 'package:lulu_store_app/base/base_page.dart';
import '../../../core/utils/commonWidget/QR-Scanner/QR_scan_widget.dart';
import '../../../core/utils/commonWidget/common_barcode_scanner_app_bar.dart';
import '../../../core/utils/commonWidget/common_scanner_class_singleton.dart';
import '../../../core/utils/is_zebra_device.dart';
import '../../../core/utils/strings.dart';
import '../../../di/app/feature_module.dart';
import 'api_temporary/api_service_article.dart';
import 'article_enquiry_view.dart';
import 'article_enquiry_view_model.dart';

class ArticleEnquiryView extends BasePage<ArticleEnquiryViewModel> {
  final String? data;

  const ArticleEnquiryView({super.key, this.data = "articleEnquiry"});

  @override
  State<ArticleEnquiryView> createState() => _ArticleEnquiryViewState();
}

class _ArticleEnquiryViewState extends BaseStatefulPage<ArticleEnquiryViewModel, ArticleEnquiryView> {
  final scanner = ScannerService();
  final ArticleApiService _articleService = ArticleApiService();

  @override
  void initState() {
    super.initState();
    scanner.initScanner(_handleScanResult); // Pass the callback when initializing scanner
  }

  // void _handleScanResult(String scannedData) {
  //   print("Callback received scanned data: $scannedData");
  //    setState(() {
  //     print("coming here in changing eannocontroller text");
  //   if (getViewModel().eanNoController.text != scannedData) {
  //       getViewModel().eanNoController.text = scannedData;
  //   }
  //     //getViewModel().eanNoController.clear();
  //     //getViewModel().eanNoController.text=scannedData;
  //   // getViewModel().eanNoController.value = TextEditingValue(
  //   //   text: scannedData,
  //   //   selection: TextSelection.collapsed(offset: scannedData.length),
  //   // );
  //    });
  // }

  void _handleScanResult(String scannedData) async {
    print("Callback received scanned data: $scannedData");

    setState(() {
      getViewModel().eanNoController.text = scannedData;
    });


    const dynamicPath =
        '/sap/bc/srt/rfc/sap/zai_article_enquiry/750/zai_article_enquiry/zai_article_enquiry';

    try {
      final response = await _articleService.fetchArticleData(scannedData, dynamicPath);

      print("Status Code: ${response.statusCode}");
      print("SOAP Response: ${response.data}");

      // TODO: Parse or show response in UI
    } catch (e) {
      print("API Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to fetch article data")),
      );
    }


  }





  // @override
  // void dispose() {
  //   getViewModel().eanNoController.dispose();
  //   super.dispose();
  // }

  @override
  PreferredSizeWidget buildAppbar() {
    print('ddd ${getViewModel().eanNoController}');
    return CommonBarcodeScannerAppBar(
      type: widget.data ?? "ArticleEnquiry",
      getViewModel: getViewModel,
      scannerController: getViewModel().eanNoController,
      openScanner: () => scanner.openScanner(context, _handleScanResult), // Pass the callback when opening scanner
    );
  }

  @override
  Widget buildView(BuildContext context, ArticleEnquiryViewModel model) {
    return ArticleEnquiryWidget(provideBase(), widget.data ?? "articleEnquiry");
  }

  @override
  ProviderBase<ArticleEnquiryViewModel> provideBase() {
    return articleViewModelProvider;
  }

  @override
  String headText() {
    return AppStrings.articleEnquiry.tr();
  }

  @override
  bool showBackButton() {
    return true;
  }
}

