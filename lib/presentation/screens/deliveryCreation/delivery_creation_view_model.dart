import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../../base/base_page_view_model.dart';

class DeliveryCreationViewModel extends BasePageViewModel {
  final List<String> items = ['001', '002', '003'];
  final List<String> options = ['Delivery Stock Transfer-UL', 'Return Stock Transfer-ZRUL'];


  final BehaviorSubject<String> _selectedValueProgress =
      BehaviorSubject.seeded('001');

  Stream<String> get selectedValueProgress => _selectedValueProgress.stream;

  String get selectedProgressValue => _selectedValueProgress.value;

  final BehaviorSubject<String> _selectedOption =
  BehaviorSubject.seeded('Delivery Stock Transfer-UL');

  Stream<String> get selectedOption => _selectedOption.stream;

  String get selectedOptionValue => _selectedOption.value;

  final TextEditingController sipToPartyController = TextEditingController();
  final TextEditingController slocController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();

  void changeSelectedValue(String value) {
    _selectedValueProgress.add(value);
  }

  void changeSelectedOption(String value){
    _selectedOption.add(value);
  }
}
