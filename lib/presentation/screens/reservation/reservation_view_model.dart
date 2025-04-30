


import 'package:flutter/material.dart';

import '../../../base/base_page_view_model.dart';

class ReservationViewModel extends BasePageViewModel {
  final List<Map<String, dynamic>> options = [
    {
      "name": "Production Order",
      "number": "01",
      "icon": Icons.assessment_outlined,
    },
    {
      "name": "Wastage",
      "number": "02",
      "icon": Icons.delete
    },

  ];
}