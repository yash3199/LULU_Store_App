
import 'package:flutter/cupertino.dart';

import '../../../base/base_page_view_model.dart';

class RegistrationViewModel extends BasePageViewModel {
  final TextEditingController siteIdController = TextEditingController();
  final TextEditingController companyCodeController = TextEditingController();
  bool isLoading = false;
}

