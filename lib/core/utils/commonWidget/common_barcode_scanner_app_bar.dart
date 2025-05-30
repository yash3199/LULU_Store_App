import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../di/app/feature_module.dart';
import '../../../presentation/molecules/articleEnquiry/option_button.dart';
import '../AppStreamBuilder.dart';
import '../dimensions.dart';
import '../strings.dart';
import 'common_scanner_class_singleton.dart';

// class CommonBarcodeScannerAppBar extends ConsumerWidget
//     implements PreferredSizeWidget {
//   final String type; // e.g., "articleEnquiry"
//   final Function getViewModel;
//   final TextEditingController scannerController;
//   final VoidCallback openScanner;
//   final bool? testString;
//   CommonBarcodeScannerAppBar({
//     Key? key,
//     required this.type,
//     required this.getViewModel,
//     required this.scannerController,
//     required this.openScanner,
//     this.testString,
//   }) : super(key: key);
//
//   final FocusNode _scannerFocusNode = FocusNode();
//
//   String _getSearchHint(String selectedOption) {
//     switch (selectedOption) {
//       case "E":
//         return "Scan Barcode";
//       case "A":
//         return "Enter Article";
//       case "P":
//         return "Enter Plu";
//       default:
//         return "Enter Article";
//     }
//   }
//
//   void openScannerAndHandle(BuildContext context) {
//     FocusScope.of(context).unfocus();
//     openScanner();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("forming the app bar------------------");
//     return AppBar(
//       backgroundColor: Theme.of(context).primaryColor,
//       leading: IconButton(
//         icon: Padding(
//           padding: const EdgeInsets.only(left: 10.0, top: 2.0),
//           child: Icon(
//             Icons.arrow_back_ios,
//             size: AppDimensions.iconMedium,
//             color: Theme.of(context).focusColor,
//           ),
//         ),
//         onPressed: () {
//           Navigator.pop(context);
//         },
//       ),
//       title: Padding(
//         padding: const EdgeInsets.only(top: 5.0),
//         child: Text(
//           type == "articleEnquiry"
//               ? AppStrings.articleEnquiry.tr()
//               : type == "wastage"
//               ? AppStrings.wastage.tr()
//               : type == "productionOrder"
//               ? AppStrings.productionOrder.tr()
//               : type == "physicalInventory"
//               ? AppStrings.physicalInventory.tr()
//               : type == "deliveryCreation"
//               ? AppStrings.deliveryCreation.tr()
//               : type == "stockTransport"
//               ? AppStrings.stockTransportOrder.tr()
//               : "",
//           style: TextStyle(
//             color: Theme.of(context).focusColor,
//             fontSize: AppDimensions.fontLarge,
//             fontWeight: FontWeight.bold,
//             fontFamily: GoogleFonts.notoSans().fontFamily,
//           ),
//         ),
//       ),
//       elevation: 2,
//       bottom: PreferredSize(
//         preferredSize: Size.fromHeight(60.h),
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: AppDimensions.paddingSmall,
//               vertical: AppDimensions.paddingSmall),
//           child: AppStreamBuilder<String>(
//             stream: getViewModel().selectedOptionStream,
//             initialData: getViewModel().selectedOption,
//             dataBuilder: (context, snapshot) {
//               print("again forming the row of e a p ---------");
//               return Row(
//                 children: [
//                   OptionButton(
//                     label: "E",
//                     isSelected: snapshot == "E",
//                     onPressed: () => getViewModel().selectOption("E"),
//                   ),
//                   SizedBox(width: 2.5.w),
//                   OptionButton(
//                     label: "A",
//                     isSelected: snapshot == "A",
//                     onPressed: () => getViewModel().selectOption("A"),
//                   ),
//                   SizedBox(width: 2.5.w),
//                   OptionButton(
//                     label: "P",
//                     isSelected: snapshot == "P",
//                     onPressed: () => getViewModel().selectOption("P"),
//                   ),
//                   SizedBox(width: 3.5.w),
//                   AppStreamBuilder<bool>(
//                       stream: getViewModel().barcodePressedStream,
//                       initialData: getViewModel().barcodePressedValue,
//                       dataBuilder: (context, barcode) {
//                         print("barcode value is --------------> ${barcode}");
//                         return barcode==true? Expanded(
//                           child: Padding(
//                             padding:
//                             EdgeInsets.only(top: AppDimensions.paddingMedium),
//                             child: AbsorbPointer(
//                               absorbing: false,
//                               child: StatefulBuilder(builder: (context, setState) {
//                                 Future.delayed(const Duration(milliseconds: 500), () {
//                                   print(
//                                       "forming the textfield for ------------${getViewModel().eanNoController.text}");
//                                   print("test string is ----------------->>>>>>>>>>>>>>> ${getViewModel().barcodePressedValue}");
//                                 });
//
//                                 return TextField(
//                                   key: ValueKey(scannerController.text),
//                                   focusNode: _scannerFocusNode,
//                                   controller: scannerController,
//                                   decoration: InputDecoration(
//                                     hintText: _getSearchHint(snapshot ?? "E"),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(12),
//                                         borderSide: BorderSide(
//                                             color: Theme.of(context).dividerColor)),
//                                     enabledBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(12),
//                                         borderSide: BorderSide(
//                                             color: Theme.of(context).dividerColor)),
//                                     border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(12),
//                                         borderSide: BorderSide(
//                                             color: Theme.of(context).dividerColor)),
//                                     prefixIcon: GestureDetector(
//                                         onTap: () {
//                                           //scannerController.clear();
//                                           openScannerAndHandle(context);
//                                         },
//                                         child: Icon(Icons.qr_code_scanner_outlined)),
//                                     contentPadding:
//                                     EdgeInsets.symmetric(vertical: 10),
//                                   ),
//                                 );
//                               }),
//                             ),
//                           ),
//                         ): Expanded(
//                           child: Padding(
//                             padding:
//                             EdgeInsets.only(top: AppDimensions.paddingMedium),
//                             child: AbsorbPointer(
//                               absorbing: false,
//                               child: StatefulBuilder(builder: (context, setState) {
//                                 Future.delayed(const Duration(milliseconds: 500), () {
//                                   print(
//                                       "forming the textfield for ------------${getViewModel().eanNoController.text}");
//                                   print("test string is ----------------->>>>>>>>>>>>>>> ${testString}");
//                                 });
//
//                                 return TextField(
//                                   key: ValueKey(scannerController.text),
//                                   focusNode: _scannerFocusNode,
//                                   controller: scannerController,
//                                   decoration: InputDecoration(
//                                     hintText: _getSearchHint(snapshot ?? "E"),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(12),
//                                         borderSide: BorderSide(
//                                             color: Theme.of(context).dividerColor)),
//                                     enabledBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(12),
//                                         borderSide: BorderSide(
//                                             color: Theme.of(context).dividerColor)),
//                                     border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(12),
//                                         borderSide: BorderSide(
//                                             color: Theme.of(context).dividerColor)),
//                                     prefixIcon: GestureDetector(
//                                         onTap: () {
//                                           //scannerController.clear();
//                                           openScannerAndHandle(context);
//                                         },
//                                         child: Icon(Icons.qr_code_scanner_outlined)),
//                                     contentPadding:
//                                     EdgeInsets.symmetric(vertical: 10),
//                                   ),
//                                 );
//                               }),
//                             ),
//                           ),
//                         );
//                       }
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(110.h);
// }

class CommonBarcodeScannerAppBar extends ConsumerWidget
    implements PreferredSizeWidget {
  final String type;

  CommonBarcodeScannerAppBar({
    required this.type,
    super.key,
  });

  final FocusNode _scannerFocusNode = FocusNode();

  String _getSearchHint(String selectedOption) {
    switch (selectedOption) {
      case "E":
        return "Scan Barcode";
      case "A":
        return "Enter Article";
      case "P":
        return "Enter Plu";
      default:
        return "Enter Article";
    }
  }

  void openScannerAndHandle(BuildContext context,var viewModel) async{
    FocusScope.of(context).unfocus();
    final result = await ScannerService().scan(context);
    print("result getting is ____________________________________${result}");
    viewModel.eanNoController.text=result;
    viewModel.changeBarcodeSelection(!viewModel.barcodePressedValue);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(articleViewModelProvider);

    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      leading: IconButton(
        icon: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 2.0),
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
          type == "articleEnquiry"
              ? AppStrings.articleEnquiry.tr()
              : type == "wastage"
              ? AppStrings.wastage.tr()
              : type == "productionOrder"
              ? AppStrings.productionOrder.tr()
              : type == "physicalInventory"
              ? AppStrings.physicalInventory.tr()
              : type == "deliveryCreation"
              ? AppStrings.deliveryCreation.tr()
              : type == "stockTransport"
              ? AppStrings.stockTransportOrder.tr()
              : "",
          style: TextStyle(
            color: Theme.of(context).focusColor,
            fontSize: AppDimensions.fontLarge,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
        ),
      ),
      elevation: 2,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingSmall,
              vertical: AppDimensions.paddingSmall),
          child: AppStreamBuilder<String>(
            stream: viewModel.selectedOptionStream,
            initialData: viewModel.selectedOption,
            dataBuilder: (context, snapshot) {
              print("again forming the row of e a p ---------selected is ${viewModel.selectedOption}");
              return Row(
                children: [
                  OptionButton(
                    label: "E",
                    isSelected: snapshot == "E",
                    onPressed: () => viewModel.selectOption("E"),
                  ),
                  SizedBox(width: 2.5.w),
                  OptionButton(
                    label: "A",
                    isSelected: snapshot == "A",
                    onPressed: () => viewModel.selectOption("A"),
                  ),
                  SizedBox(width: 2.5.w),
                  OptionButton(
                    label: "P",
                    isSelected: snapshot == "P",
                    onPressed: () => viewModel.selectOption("P"),
                  ),
                  SizedBox(width: 3.5.w),
                  AppStreamBuilder<bool>(
                      stream: viewModel.barcodePressedStream,
                      initialData: viewModel.barcodePressedValue,
                      dataBuilder: (context, barcode) {
                        print("barcode value is --------------> ${barcode}");
                        return barcode==true? Expanded(
                          child: Padding(
                            padding:
                            EdgeInsets.only(top: AppDimensions.paddingMedium),
                            child: AbsorbPointer(
                              absorbing: false,
                              child: StatefulBuilder(builder: (context, setState) {
                                Future.delayed(const Duration(milliseconds: 500), () {
                                  print(
                                      "forming the textfield for ------------${viewModel.eanNoController.text}");
                                  print("test string is ----------------->>>>>>>>>>>>>>> ${viewModel.barcodePressedValue}");
                                });

                                return TextField(
                                  key: ValueKey(viewModel.eanNoController.text),
                                  focusNode: _scannerFocusNode,
                                  controller: viewModel.eanNoController,
                                  decoration: InputDecoration(
                                    hintText: _getSearchHint(snapshot ?? "E"),
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
                                    prefixIcon: GestureDetector(
                                        onTap: () {
                                          //scannerController.clear();
                                          openScannerAndHandle(context,viewModel);
                                        },
                                        child: Icon(Icons.qr_code_scanner_outlined)),
                                    contentPadding:
                                    EdgeInsets.symmetric(vertical: 10),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ): Expanded(
                          child: Padding(
                            padding:
                            EdgeInsets.only(top: AppDimensions.paddingMedium),
                            child: AbsorbPointer(
                              absorbing: false,
                              child: StatefulBuilder(builder: (context, setState) {
                                Future.delayed(const Duration(milliseconds: 500), () {
                                  print(
                                      "forming the textfield for ------------${viewModel.eanNoController.text}");
                                  print("test string is ----------------->>>>>>>>>>>>>>> ${viewModel.barcodePressedValue}");
                                });

                                return TextField(
                                  key: ValueKey(viewModel.eanNoController.text),
                                  focusNode: _scannerFocusNode,
                                  controller: viewModel.eanNoController,
                                  decoration: InputDecoration(
                                    hintText: _getSearchHint(snapshot ?? "E"),
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
                                    prefixIcon: GestureDetector(
                                        onTap: () {
                                          //scannerController.clear();
                                          openScannerAndHandle(context,viewModel);
                                        },
                                        child: Icon(Icons.qr_code_scanner_outlined)),
                                    contentPadding:
                                    EdgeInsets.symmetric(vertical: 10),
                                  ),
                                );
                              }),
                            ),
                          ),
                        );
                      }
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}

