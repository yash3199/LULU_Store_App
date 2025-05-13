import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import '../../../base/base_page_view_model.dart';
import '../../../data/entity/articleEnquiry/article_response_entity.dart';
import '../../../domain/usecases/articleEnquiry/fetch_article_enquiry_usecases.dart';

class ArticleEnquiryViewModel extends BasePageViewModel {

  final FetchArticleEnquiryUseCase _articleEnquiryUseCase;

  final BehaviorSubject<String> _selectedOption = BehaviorSubject.seeded("E");

  final PublishSubject<FetchArticleEnquiryUseCaseParams> _articleEnquiryRequest =
  PublishSubject();

  final PublishSubject<ArticleResponseEntity> _articleEnquiryResponse =
  PublishSubject();

  Stream<ArticleResponseEntity> get articleEnquiryStream => _articleEnquiryResponse.stream;

  ArticleEnquiryViewModel(this._articleEnquiryUseCase) {
    _articleEnquiryRequest.listen((value) {
      _articleEnquiryUseCase.execute(params: value).asStream().listen((event) {
        event.fold((l) => null, (r) => _articleEnquiryResponse.add(r));
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


  void getArticleDetail(String ean) {
    print("coming here");
    _articleEnquiryRequest.add(FetchArticleEnquiryUseCaseParams(ean));
  }



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
