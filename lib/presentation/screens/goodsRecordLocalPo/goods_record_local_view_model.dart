import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../../base/base_page_view_model.dart';

class GoodsRecordLocalViewModel extends BasePageViewModel {
  final TextEditingController pONumberController = TextEditingController();
  final TextEditingController invNumberController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();


  final BehaviorSubject<bool> _poNumberAdded = BehaviorSubject.seeded(false);

  Stream<bool> get poNumberAdded => _poNumberAdded.stream;

  bool get poNumberAddedValue => _poNumberAdded.value;



  void changePoNumberAdded(bool val){
    _poNumberAdded.add(val);
  }


}
