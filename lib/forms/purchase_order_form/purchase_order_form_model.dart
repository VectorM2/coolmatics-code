import '/flutter_flow/flutter_flow_util.dart';
import 'purchase_order_form_widget.dart' show PurchaseOrderFormWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:signature/signature.dart';

class PurchaseOrderFormModel extends FlutterFlowModel<PurchaseOrderFormWidget> {
  ///  Local state fields for this page.

  List<String> orderedItem = [
    'Item Name: Air Conditioning Unit, Part Number: AC-X-1234, Quantity: 1'
  ];
  void addToOrderedItem(String item) => orderedItem.add(item);
  void removeFromOrderedItem(String item) => orderedItem.remove(item);
  void removeAtIndexFromOrderedItem(int index) => orderedItem.removeAt(index);
  void insertAtIndexInOrderedItem(int index, String item) =>
      orderedItem.insert(index, item);
  void updateOrderedItemAtIndex(int index, Function(String) updateFn) =>
      orderedItem[index] = updateFn(orderedItem[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController8;
  final textFieldMask8 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for Signature widget.
  SignatureController? signatureController1;
  // State field(s) for Signature widget.
  SignatureController? signatureController2;
  String uploadedSignatureUrl = '';
  // Stores action output result for [Custom Action - orderpdfNewPath] action in Button widget.
  String? oderpdf;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();

    textFieldFocusNode7?.dispose();
    textController7?.dispose();

    textFieldFocusNode8?.dispose();
    textController8?.dispose();

    textFieldFocusNode9?.dispose();
    textController9?.dispose();

    signatureController1?.dispose();
    signatureController2?.dispose();
  }
}
