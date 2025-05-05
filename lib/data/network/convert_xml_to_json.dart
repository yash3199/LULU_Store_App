import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:xml/xml.dart';

Future<Map<String, dynamic>> parseXmlToJson() async {
  final xmlString = await rootBundle.loadString('assets/xml/article_response.xml');
  final document = XmlDocument.parse(xmlString);

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

  return {
    'ArticleDetails': articleMap,
    'Return': returnMap,
  };
}
