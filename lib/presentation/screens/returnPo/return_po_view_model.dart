import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import '../../../base/base_page_view_model.dart';

class ReturnPoViewModel extends BasePageViewModel {
  final List<String> POTypeItems = ['ZL01-TGNon taxable'];

  final BehaviorSubject<String> _selectedPoType =
      BehaviorSubject.seeded('ZL01-TGNon taxable');

  Stream<String> get selectedPoType => _selectedPoType.stream;

  String get selectedPoTypeValue => _selectedPoType.value;


  final TextEditingController purchasingGroupController =
      TextEditingController();
  final TextEditingController poTypeController = TextEditingController();
  final TextEditingController invoiceNumberController = TextEditingController();
  final TextEditingController reasonReturnController = TextEditingController();

  void changeSelectedPoValue(String value) {
    _selectedPoType.add(value);
  }
}
