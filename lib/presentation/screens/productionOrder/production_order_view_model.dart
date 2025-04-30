

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../../base/base_page_view_model.dart';

class ProductionOrderViewModel extends BasePageViewModel {
  final List<String> movementTypeItems = ['501'];
  final List<String> slocItems = ['0001'];
  final List<String> recDeptItems = ['010'];
  final List<String> deptItems = ['In-House Kitchen Production (Hot/Cold)'];

  final BehaviorSubject<String> _movementType =
  BehaviorSubject.seeded('501');

  String get movementTypeValue => _movementType.value;

  Stream<String> get selectedMovementType => _movementType.stream;


  final BehaviorSubject<String> _sloc = BehaviorSubject.seeded('0001');

  String get selectedSlocValue => _sloc.value;

  Stream<String> get selectedSloc => _sloc.stream;

  final BehaviorSubject<String> _recDept = BehaviorSubject.seeded('010');

  String get recDeptValue => _recDept.value;

  Stream<String> get selectedRecDept => _recDept.stream;

  final BehaviorSubject<String> _dept = BehaviorSubject.seeded('In-House Kitchen Production (Hot/Cold)');

  String get deptValue => _dept.value;

  Stream<String> get selectDept => _dept.stream;

  final TextEditingController noteController = TextEditingController();

  void changeSelectedMovementTypeValue(String value) {
    _movementType.add(value);
  }

  void changeSlocItems(String value) {
    _sloc.add(value);
  }

  void changeRecDeptItems(String value){
    _recDept.add(value);
  }

  void changeDeptItems(String value){
    _dept.add(value);
  }
}
