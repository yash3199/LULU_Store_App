

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../../base/base_page_view_model.dart';

class LabelPrintViewModel extends BasePageViewModel {
  final List<String> labelItems = ['BARCODE WITH PRICE'];
  final List<String> printerItems = ['9411_BARCODE'];

  final BehaviorSubject<String> _selectedLabel =
  BehaviorSubject.seeded('BARCODE WITH PRICE');

  Stream<String> get selectedLabel => _selectedLabel.stream;

  String get selectedLabelValue => _selectedLabel.value;

  final BehaviorSubject<String> _selectedPrinter =
  BehaviorSubject.seeded('9411_BARCODE');

  Stream<String> get selectedPrinter => _selectedPrinter.stream;

  String get selectedPrinterValue => _selectedPrinter.value;


   final TextEditingController handHeldController = TextEditingController();


  void changeSelectedPoValue(String value) {
    _selectedLabel.add(value);
  }
}