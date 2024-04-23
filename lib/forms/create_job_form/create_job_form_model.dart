import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_job_form_widget.dart' show CreateJobFormWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateJobFormModel extends FlutterFlowModel<CreateJobFormWidget> {
  ///  Local state fields for this page.

  List<String> equipmentItems = ['Item one here..'];
  void addToEquipmentItems(String item) => equipmentItems.add(item);
  void removeFromEquipmentItems(String item) => equipmentItems.remove(item);
  void removeAtIndexFromEquipmentItems(int index) =>
      equipmentItems.removeAt(index);
  void insertAtIndexInEquipmentItems(int index, String item) =>
      equipmentItems.insert(index, item);
  void updateEquipmentItemsAtIndex(int index, Function(String) updateFn) =>
      equipmentItems[index] = updateFn(equipmentItems[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
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
  // State field(s) for itemshere widget.
  FocusNode? itemshereFocusNode;
  TextEditingController? itemshereTextController;
  String? Function(BuildContext, String?)? itemshereTextControllerValidator;
  String? _itemshereTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController6;
  final textFieldMask5 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;

  @override
  void initState(BuildContext context) {
    itemshereTextControllerValidator = _itemshereTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    itemshereFocusNode?.dispose();
    itemshereTextController?.dispose();

    textFieldFocusNode4?.dispose();
    textController5?.dispose();

    textFieldFocusNode5?.dispose();
    textController6?.dispose();

    textFieldFocusNode6?.dispose();
    textController7?.dispose();
  }
}
