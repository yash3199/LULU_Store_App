
import 'package:dio/dio.dart';
import '../../../../data/network/dio_client.dart';


class ArticleApiService {
  final Dio _dio = DioClient.createDio();

  Future<Response> fetchArticleData(String ean, String dynamicPath) async {
    final soapBody = '''
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

    return await _dio.post<dynamic>(
      dynamicPath,
      data: soapBody,
    );
  }
}

