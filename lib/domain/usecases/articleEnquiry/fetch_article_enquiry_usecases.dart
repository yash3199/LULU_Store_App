

import 'package:dartz/dartz.dart';

import '../../../data/entity/articleEnquiry/article_response_entity.dart';
import '../../repositories/article_enquiry_repository.dart';
import '../base_usecases.dart';

class FetchArticleEnquiryUseCase extends BaseUseCase<
    BaseError, FetchArticleEnquiryUseCaseParams, ArticleResponseEntity> {
  final ArticleEnquiryRepository _repository;

  FetchArticleEnquiryUseCase(this._repository);

  @override
  Future<Either<BaseError, ArticleResponseEntity>> execute({
    required FetchArticleEnquiryUseCaseParams params,
  }) {
    print("coming in use cases execute !!!!!!!!!!!!!!");
    return _repository.getArticleEnquiry(params.ean);
  }
}

class FetchArticleEnquiryUseCaseParams extends Params {
  final String ean;

  FetchArticleEnquiryUseCaseParams(this.ean);

  @override
  Either<BaseError, bool> verify() {
    if (ean.isEmpty) {
      return Left(ValidationError(message: "EAN cannot be empty"));
    }
    return const Right(true);
  }
}
