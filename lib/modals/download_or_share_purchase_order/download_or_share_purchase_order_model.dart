import '/flutter_flow/flutter_flow_util.dart';
import 'download_or_share_purchase_order_widget.dart'
    show DownloadOrSharePurchaseOrderWidget;
import 'package:flutter/material.dart';

class DownloadOrSharePurchaseOrderModel
    extends FlutterFlowModel<DownloadOrSharePurchaseOrderWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
