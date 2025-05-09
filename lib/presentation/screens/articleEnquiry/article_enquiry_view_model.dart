import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import '../../../base/base_page_view_model.dart';

class ArticleEnquiryViewModel extends BasePageViewModel {
  final FetchNewsListUseCase _articleEnquiryUseCase;
  final BehaviorSubject<String> _selectedOption = BehaviorSubject.seeded("E");

  final PublishSubject<FetchNewsListUseCaseParams> _articleEnquiryRequest =
  PublishSubject();

  final PublishSubject<List<NewsArticleEntity>> _articleEnquiryResponse =
  PublishSubject();

  Stream<List<NewsArticleEntity>> get articleEnquiryStream => _articleEnquiryResponse.stream;

  NewsListViewModel(this._newsListUseCase) {
    _newsListRequest.listen((value) {
      _newsListUseCase.execute(params: value).asStream().listen((event) {
        event.fold((l) => null, (r) => _newsListResponse.add(r));
      });
    });
  }


  Stream<String> get selectedOptionStream => _selectedOption.stream;

  String get selectedOption => _selectedOption.value;


  final TextEditingController qty = TextEditingController();

  final TextEditingController ea = TextEditingController();

  final TextEditingController ea1 = TextEditingController();

  final TextEditingController eanNoController  = TextEditingController();


  final BehaviorSubject<bool> _itemAdded = BehaviorSubject.seeded(false);

  Stream<bool> get itemAddedStream => _itemAdded.stream;

  bool get itemAddedValue => _itemAdded.value;




  final BehaviorSubject<bool> _saveItem = BehaviorSubject.seeded(false);

  Stream<bool> get saveItemStream => _saveItem.stream;

  bool get saveItemValue => _saveItem.value;




  void selectOption(String option) {
    _selectedOption.add(option);
  }

  void changeItemAdded(bool val){
    _itemAdded.add(val);
  }

  void changeSaveItem(bool val){
    _saveItem.add(val);
  }


  @override
  void dispose() {
    super.dispose();
    _selectedOption.close();
  }
}
