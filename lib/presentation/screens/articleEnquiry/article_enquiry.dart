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
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    scanner.initScanner(_handleScanResult);

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isInitialized) {
        scanner.initScanner(_handleScanResult);

        // Optional: Clear or reinit controller to force rebuild on revisit
        getViewModel().eanNoController.text = '';

        _isInitialized = true;
      }

    });
  }




  void _handleScanResult(String scannedData) {
    print("Scanned data: $scannedData");

    if (!mounted) return; // Prevent calling setState on disposed widget

      print("coming here !!!!!!!!1");
      getViewModel().eanNoController.text = "data";
      print("text after scaniing is============> ${getViewModel().eanNoController.text}");
    
  }





   // @override
   // void dispose() {
   //   getViewModel().eanNoController.dispose();
   //   super.dispose();
   // }

  @override
  PreferredSizeWidget buildAppbar() {
    return CommonBarcodeScannerAppBar(
      type: widget.data ?? "ArticleEnquiry",
      getViewModel: getViewModel,
      scannerController: getViewModel().eanNoController,
      // openScanner: ()=>{getViewModel().eanNoController.text = "data",
      //   print("text after scaniing is============> ${getViewModel().eanNoController.text}")},
      //openScanner: () => scanner.openScanner(context, _handleScanResult), // Pass the callback when opening scanner
        openScanner: () {
          scanner.openScanner(context, (scannedText) async {
            await Future.delayed(Duration(milliseconds: 100)); // allow async scanner response

            if (!context.mounted) return;

            WidgetsBinding.instance.addPostFrameCallback((_) {
              getViewModel().eanNoController.text = scannedText;
              print("Scanned text after scanning is => ${getViewModel().eanNoController.text}");
            });
          });
        }

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

