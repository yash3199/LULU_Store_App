import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../../base/base_page_view_model.dart';

class PhysicalInventoryViewModel extends BasePageViewModel {
  final List<String> items = ['001', '002', '003'];
  final BehaviorSubject<String> _selectedValueProgress =
      BehaviorSubject.seeded('001');

  String get selectedProgressValue => _selectedValueProgress.value;

  Stream<String> get selectedValueProgress => _selectedValueProgress.stream;
  final TextEditingController refNoController = TextEditingController();
  final TextEditingController slocController = TextEditingController();
  final TextEditingController zoneController = TextEditingController();
  final TextEditingController subZoneController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();

  void changeSelectedValue(String value) {
    _selectedValueProgress.add(value);
  }
}
