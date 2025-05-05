import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/app_view_model.dart';

final appViewModelProvider = Provider.autoDispose<AppViewModel>(
  (ref) {
    return AppViewModel();
  },
);
