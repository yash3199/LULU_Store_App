import 'package:dartz/dartz.dart';
import '../../data/entity/articleEnquiry/article_response_entity.dart';
import '../usecases/base_usecases.dart';

abstract class ArticleEnquiryRepository {
  Future<Either<BaseError, ArticleResponseEntity>> fetchNewsList();
}