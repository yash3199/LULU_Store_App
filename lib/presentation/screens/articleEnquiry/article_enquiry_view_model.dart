import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import '../../../base/base_page_view_model.dart';

class ArticleEnquiryViewModel extends BasePageViewModel {
  final BehaviorSubject<String> _selectedOption = BehaviorSubject.seeded("E");

  Stream<String> get selectedOptionStream => _selectedOption.stream;

  String get selectedOption => _selectedOption.value;


  final TextEditingController qty = TextEditingController();

  final TextEditingController ea = TextEditingController();

  final TextEditingController ea1 = TextEditingController();

  final TextEditingController eanNoController  = TextEditingController();


  final BehaviorSubject<bool> _itemAdded = BehaviorSubject.seeded(false);

  Stream<bool> get itemAddedStream => _itemAdded.stream;

  bool get itemAddedValue => _itemAdded.value;




  final BehaviorSubject<bool> _saveItem = BehaviorSubject.seeded(false);

  Stream<bool> get saveItemStream => _saveItem.stream;

  bool get saveItemValue => _saveItem.value;




  void selectOption(String option) {
    _selectedOption.add(option);
  }

  void changeItemAdded(bool val){
    _itemAdded.add(val);
  }

  void changeSaveItem(bool val){
    _saveItem.add(val);
  }


  @override
  void dispose() {
    super.dispose();
    _selectedOption.close();
  }
}
