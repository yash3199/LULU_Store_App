import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lulu_store_app/presentation/screens/articleEnquiry/article_enquiry_view_model.dart';
import 'package:flutter/material.dart';
import '../../../base/base_page.dart';
import '../../../data/entity/articleEnquiry/article_response_entity.dart';
import '../../../data/network/convert_xml_to_json.dart';
import '../../molecules/articleEnquiry/article_enquiry_first_screen.dart';
import '../../molecules/deliveryCreation/delivery_creation_molecule.dart';
import '../../molecules/physicalInventory/physical_inventory_molecule.dart';
import '../../molecules/productionOrder/production_order_view.dart';
import '../../molecules/stockTransportOrder/stock_transport_molecule.dart';
import '../../molecules/wastage/wastage_molecule.dart';

class ArticleEnquiryWidget extends BasePageViewWidget<ArticleEnquiryViewModel> {
  final String data;
  const ArticleEnquiryWidget(ProviderBase<ArticleEnquiryViewModel> model,this.data,
      {super.key})
      : super(model);

 // ArticleEnquiryFirstScreen(model: model,)

  @override
  Widget build(BuildContext context, ArticleEnquiryViewModel model) {
    model.ea.text="EA";
    model.ea1.text="1EA";
    return data=="articleEnquiry"? SizedBox.shrink():
    data=="productionOrder"? ProductionOrderMolecule(model: model,)
        : data=="wastage"? WastageMolecule(model:model):
        data=="physicalInventory"?PhysicalInventoryMolecule(model: model,) :
        data=="deliveryCreation"?DeliveryCreationMolecule(model:model):
        data=="stockTransport"?StockTransportMolecule(model:model):
        SizedBox.shrink()
    ;
  }
}
