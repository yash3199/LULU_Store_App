import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../../base/base_page_view_model.dart';

class StockTransportOrderViewModel extends BasePageViewModel {
  final List<String> items = ['001', '002', '003'];
  final List<String> recSiteItems = ['9420', '9421'];
  final List<String> docTypeItems = ['UB', 'PDF'];
  final List<String> times = ['1:00', '2:00'];

  final BehaviorSubject<String> _selectedValueProgress =
      BehaviorSubject.seeded('001');

  Stream<String> get selectedValueProgress => _selectedValueProgress.stream;

  String get selectedProgressValue => _selectedValueProgress.value;

  final BehaviorSubject<String> _recSiteProgress =
      BehaviorSubject.seeded('9420');

  Stream<String> get recSiteProgress => _recSiteProgress.stream;

  String get recSiteProgressValue => _recSiteProgress.value;

  final BehaviorSubject<String> _docTypeProgress = BehaviorSubject.seeded('UB');

  Stream<String> get docTypeProgress => _docTypeProgress.stream;

  String get docTypeProgressValue => _docTypeProgress.value;

  final BehaviorSubject<String> _time = BehaviorSubject.seeded('1:00');

  Stream<String> get time => _time.stream;

  String get timeValue => _time.value;

  final TextEditingController supplySiteController = TextEditingController();
  final TextEditingController recSiteController = TextEditingController();
  final TextEditingController slocController = TextEditingController();
  final TextEditingController docTypeController = TextEditingController();
  final TextEditingController selectTimeController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  void changeSelectedValue(String value) {
    _selectedValueProgress.add(value);
  }

  void changeRecSiteProgress(String value) {
    _recSiteProgress.add(value);
  }

  void changeDocTypeProgress(String value) {
    _docTypeProgress.add(value);
  }

  void changeTime(String value) {
    _time.add(value);
  }
}
