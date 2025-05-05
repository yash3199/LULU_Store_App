
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://pslieqpai.lulugroupindia.local:8079")
abstract class ArticleEnquiryApiService {
  factory ArticleEnquiryApiService(Dio dio, {String baseUrl}) = _ArticleEnquiryApiService;

  @POST("/sap/bc/srt/rfc/sap/zai_article_enquiry/750/zai_article_enquiry/zai_article_enquiry")
  // @Headers({
  //   "Content-Type": "application/soap+xml",
  // })
  Future<HttpResponse> getArticleEnquiry(
      @Body() String soapBody,
      );
}


