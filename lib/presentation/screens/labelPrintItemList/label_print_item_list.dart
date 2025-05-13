import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datawedge/flutter_datawedge.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulu_store_app/core/utils/colors.dart';
import '../../../base/base_page.dart';
import '../../../core/utils/commonWidget/QR-Scanner/QR_scan_widget.dart';
import '../../../core/utils/commonWidget/common_scanner_class_singleton.dart';
import '../../../core/utils/commonWidget/common_text_field.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/is_zebra_device.dart';
import '../../../core/utils/strings.dart';
import '../../../di/app/feature_module.dart';
import '../../molecules/articleEnquiry/option_button.dart';
import 'label_print_item_list_view.dart';
import 'label_print_item_list_view_model.dart';

class LabelPrintItemListView extends BasePage<LabelPrintItemListViewModel> {
  const LabelPrintItemListView({
    super.key,
  });

  @override
  State<LabelPrintItemListView> createState() => _LabelPrintItemListViewState();
}

class _LabelPrintItemListViewState extends BaseStatefulPage<
    LabelPrintItemListViewModel, LabelPrintItemListView> {

  final scanner = ScannerService();
  final TextEditingController _scannerController = TextEditingController();
  final FocusNode _scannerFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    scanner.initScanner(_handleScanResult);
  }


  void _handleScanResult(String scannedData) {
    print("Callback received scanned data: $scannedData");
      _scannerController.text = scannedData;
  }




  @override
  PreferredSizeWidget buildAppbar() {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      leading: IconButton(
        icon: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 5.0),
          child: Icon(
            Icons.arrow_back_ios,
            size: AppDimensions.iconMedium,
            color: Theme.of(context).focusColor,
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          AppStrings.labelPrint.tr(),
          style: TextStyle(
              color: Theme.of(context).focusColor,
              fontSize: AppDimensions.fontLarge,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.notoSans().fontFamily),
        ),
      ),
      elevation: 2,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: FutureBuilder<bool>(
          future: IsZebraDevice.isZebraDevice(),
          builder: (context, snapshot) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: snapshot.data==false? AppDimensions.paddingSmall:2.0,
                  vertical: AppDimensions.paddingSmall),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  OptionButton(
                    label: "E",
                    isSelected: true,
                    onPressed: () => {},
                  ),
                  SizedBox(
                    width: 5.5.w,
                  ),
                  SizedBox(
                    width: 0.5.sw,
                    child: Padding(
                        padding: EdgeInsets.only(top: AppDimensions.paddingMedium),
                        child: TextField(
                          focusNode: _scannerFocusNode,
                          controller: _scannerController,
                          // onTap: () => scanner.openScanner(context, _handleScanResult),
                          decoration: InputDecoration(
                            prefixIcon: GestureDetector(
                                onTap: (){
                                  FocusScope.of(context).unfocus();
                                  scanner.openScanner(context, _handleScanResult);
                                },
                                child: Icon(Icons.qr_code_scanner_outlined)),
                            hintText: "Scan Barcode",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Theme.of(context).dividerColor)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Theme.of(context).dividerColor)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Theme.of(context).dividerColor)),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8.0),
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 5.5.w,
                  ),
                  SizedBox(
                    height:snapshot.data==true? 0.079.sh:  0.052.sh,
                    width: 0.21.sw,
                    child: CustomTextField(
                      hintText: "Qty",
                      controller: getViewModel().qtyController,
                      icon: null,
                    ),
                  ),
                  SizedBox(
                    width: 0.01.sw,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(top: AppDimensions.paddingMedium),
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                        child: Icon(
                          Icons.add,
                          color: AppColors.backGroundColorLight,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }

  @override
  Widget buildView(BuildContext context, LabelPrintItemListViewModel model) {
    return LabelPrintItemListWidget(provideBase());
  }

  @override
  ProviderBase<LabelPrintItemListViewModel> provideBase() {
    return labelPrintItemListProvider;
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
