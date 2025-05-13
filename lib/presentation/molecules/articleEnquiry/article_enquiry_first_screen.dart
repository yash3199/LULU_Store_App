import 'package:flutter/material.dart';
import 'package:lulu_store_app/base/base_widget.dart';
import '../../../data/entity/articleEnquiry/article_response_entity.dart';
import '../../../di/app/feature_module.dart';
import '../../screens/articleEnquiry/article_enquiry_view_model.dart';

class ArticleEnquiryFirstScreen extends StatelessWidget {
  final ArticleEnquiryViewModel model;
  const ArticleEnquiryFirstScreen({required this.model,super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ArticleEnquiryViewModel>(
        providerBase: articleViewModelProvider,
        builder: (context,model,child){
          return StreamBuilder<ArticleResponseEntity>(
              stream: model?.articleEnquiryStream,
              builder: (context,snapshot){
                print("snapshot data ============ ${snapshot.data}");
                if (snapshot.hasData) {

                  if (snapshot.data !=null ?? false) {
                    return Center(child: Text(
                      snapshot.data!.ArticleDetails.Extmatlgrp
                    ),);
                  } else {
                    Text("No data found");
                  }
                }
                return Center(child: Text("common error"));
              }
          );
        },

    );
  }
}
