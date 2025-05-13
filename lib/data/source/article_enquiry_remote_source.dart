import 'package:xml/xml.dart';

import '../entity/articleEnquiry/article_response_entity.dart';
import '../network/api_service.dart';


abstract class ArticleEnquiryRemoteSource {
  Future<ArticleResponseEntity> getArticleEnquiry(String ean);
}

class ArticleEnquiryRemoteDataSourceImpl extends ArticleEnquiryRemoteSource {
  final ArticleEnquiryApiService _service;

  ArticleEnquiryRemoteDataSourceImpl(this._service);

  @override
  Future<ArticleResponseEntity> getArticleEnquiry(String ean) async {
    final soapBody = _generateSoapBody(ean);

    // Call the API and get raw XML string
    final response = await _service.getArticleEnquiry(soapBody);

    // Parse the XML string
    final document = XmlDocument.parse(response.data);

    final article = document.findAllElements('ArticleDetails').first;
    final returnItem = document.findAllElements('item').first;

    final articleMap = <String, dynamic>{};
    for (final node in article.children.whereType<XmlElement>()) {
      articleMap[node.name.local] = node.text;
    }

    final returnMap = <String, dynamic>{};
    for (final node in returnItem.children.whereType<XmlElement>()) {
      returnMap[node.name.local] = node.text;
    }

    final json = {
      'ArticleDetails': articleMap,
      'Return': returnMap,
    };

    return ArticleResponseEntity.fromJson(json);
  }

  String _generateSoapBody(String ean) {
    return '''
<soapenv:Envelope xmlns:soapenv="http://www.w3.org/2003/05/soap-envelope" xmlns:urn="urn:sap-com:document:sap:soap:functions:mc-style">
    <soapenv:Header/>
    <soapenv:Body>
        <urn:ZaiArticleEnquiry>
            <Customer></Customer>
            <Ean11>$ean</Ean11>
            <IsDelv></IsDelv>
            <IsPo></IsPo>
            <IsSto></IsSto>
            <Lgort></Lgort>
            <Matnr></Matnr>
            <Meins></Meins>
            <Plu></Plu>
            <Return>
                <item>
                    <Type></Type>
                    <Code></Code>
                    <Message></Message>
                    <LogNo></LogNo>
                    <LogMsgNo></LogMsgNo>
                    <MessageV1></MessageV1>
                    <MessageV2></MessageV2>
                    <MessageV3></MessageV3>
                    <MessageV4></MessageV4>
                </item>
            </Return>
            <SpFlg></SpFlg>
            <StkFlg></StkFlg>
            <Swerks></Swerks>
            <Vendor></Vendor>
            <VndrFlg></VndrFlg>
            <Werks></Werks>
            <WhStkFlg></WhStkFlg>
        </urn:ZaiArticleEnquiry>
    </soapenv:Body>
</soapenv:Envelope>
''';
  }
}






