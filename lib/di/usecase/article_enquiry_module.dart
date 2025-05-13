import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/articleEnquiry/fetch_article_enquiry_usecases.dart';
import '../repository/repository_module.dart';

final fetchArticleEnquiryUseCaseProvider = Provider.autoDispose
    .family<FetchArticleEnquiryUseCase, (String username, String password)>(
      (ref, credentials) {
    final (username, password) = credentials;

    final repository = ref.read(articleEnquiryRepositoryProvider((username, password)));
    return FetchArticleEnquiryUseCase(repository);
  },
);
