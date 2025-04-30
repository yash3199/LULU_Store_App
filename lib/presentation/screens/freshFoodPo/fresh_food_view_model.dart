import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../../base/base_page_view_model.dart';

class FreshFoodViewModel extends BasePageViewModel {
  final List<String> POTypeItems = ['ZL01-TGNon taxable'];
  final List<String> pGrpItems = ['100', '200'];

  final BehaviorSubject<String> _selectedPoType =
      BehaviorSubject.seeded('ZL01-TGNon taxable');

  String get selectedPoTypeValue => _selectedPoType.value;

  Stream<String> get selectedPoType => _selectedPoType.stream;

  final BehaviorSubject<String> _selectedPGrp = BehaviorSubject.seeded('100');

  String get selectedPGrpValue => _selectedPGrp.value;

  Stream<String> get selectedPGrp => _selectedPGrp.stream;

  final TextEditingController poTypeController = TextEditingController();
  final TextEditingController vendorIdController = TextEditingController();
  final TextEditingController pGrpController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final TextEditingController invoiceNumberController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  void changeSelectedPoValue(String value) {
    _selectedPoType.add(value);
  }

  void changeSelectedPGrpItems(String value) {
    _selectedPGrp.add(value);
  }
}
