import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/article_enquiry_repository_impl.dart';
import '../../domain/repositories/article_enquiry_repository.dart';
import '../source/data_source_module.dart';

final articleEnquiryRepositoryProvider = Provider.family<ArticleEnquiryRepository, (String username, String password)>(
      (ref, credentials) {
    final remoteDataSource = ref.read(articleEnquiryRemoteDataProvider(credentials));
    return ArticleEnquiryRepositoryImpl(remoteDataSource);
  },
);
