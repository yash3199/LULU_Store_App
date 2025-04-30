import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class BaseViewModel extends ChangeNotifier {
  //final PublishSubject<AppError?> _error = PublishSubject<AppError?>();
  final PublishSubject<String> _toast = PublishSubject<String>();
  // final UserLocalDataService sharedPreferences =
  //     GetIt.I<UserLocalDataService>();

  final ValueNotifier<String> balance = ValueNotifier("-");

  //Stream<AppError?> get error => _error.stream;

  // void showToastWithError(AppError? error) {
  //   try {
  //     _error.sink.add(error);
  //   } catch (exception) {
  //     debugPrint(exception.toString());
  //   }
  // }

  Stream<String> get toast => _toast.stream;

  void showToastWithString(String message) {
    _toast.sink.add(message);
  }

  void getBalance() {
    //print("envTypeEnum ${NetworkProperties.envTypeEnum}");
   // print("getEnvName ${getEnvName()}");
   // balance.value = "${getAmountPrefix()} ${sharedPreferences.balance} ${getEnvName()}";
  }

  //String getAmountPrefix() => sharedPreferences.amountPrefix ?? "";

   // String getEnvName() {
   //   switch (NetworkProperties.envTypeEnum) {
   //     case EnvTypeEnum.dev:
   //       return '(QA)';
   //     case EnvTypeEnum.prod:
   //     default:
   //       return '';
	 //     }
   // }

  @override
  void dispose() {
   // _error.close();
    _toast.close();
    super.dispose();
  }
}
