import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/source/article_enquiry_remote_source.dart';
import '../network/network_module.dart';

final articleEnquiryRemoteDataProvider = Provider.family<ArticleEnquiryRemoteSource, (String username, String password)>(
      (ref, credentials) {
    // final (username, password) = credentials;
    return ArticleEnquiryRemoteDataSourceImpl(ref.read(apiServiceProvider(credentials)));
  },
);
