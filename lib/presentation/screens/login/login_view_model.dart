import 'package:flutter/cupertino.dart';

import '../../../base/base_page_view_model.dart';

class LoginViewModel extends BasePageViewModel {
  final TextEditingController sapIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
}
