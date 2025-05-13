

import 'package:dartz/dartz.dart';

import '../../domain/repositories/article_enquiry_repository.dart';
import '../../domain/usecases/base_usecases.dart';
import '../entity/articleEnquiry/article_response_entity.dart';
import '../source/article_enquiry_remote_source.dart';

class ArticleEnquiryRepositoryImpl extends ArticleEnquiryRepository {
  final ArticleEnquiryRemoteSource _remoteDs;

  ArticleEnquiryRepositoryImpl(this._remoteDs);

  @override
  Future<Either<BaseError, ArticleResponseEntity>> getArticleEnquiry(String ean) async {
    print("coming here in repository impleme <=========================");
    try {
      final result = await _remoteDs.getArticleEnquiry(ean);
      print("result getting is $result");
      return Right(result);
    } catch (e) {
      print("there is an eror in repository impl $e");
      return Left(NetworkError(cause: Exception("Something went wrong: $e")));
    }
  }
}
