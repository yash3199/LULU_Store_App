

import 'package:dartz/dartz.dart';

import '../../../data/entity/articleEnquiry/article_response_entity.dart';
import '../base_usecases.dart';

class FetchArticleEnquiryUseCase extends BaseUseCase<BaseError,
    FetchArticleEnquiryUseCaseParams, ArticleResponseEntity> {
  final NewsRepository _repository;

  FetchArticleEnquiryUseCase(this._repository);

  @override
  Future<Either<BaseError, ArticleResponseEntity>> execute(
      {required FetchArticleEnquiryUseCaseParams params}) {
    return _repository.fetchNewsList();
  }
}

class FetchArticleEnquiryUseCaseParams extends Params {
  @override
  Either<BaseError, bool> verify() {
    return const Right(true);
  }
}