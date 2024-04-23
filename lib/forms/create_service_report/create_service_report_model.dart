import '/flutter_flow/flutter_flow_util.dart';
import 'create_service_report_widget.dart' show CreateServiceReportWidget;
import 'package:flutter/material.dart';

class CreateServiceReportModel
    extends FlutterFlowModel<CreateServiceReportWidget> {
  ///  Local state fields for this page.

  List<String> equipmentItems = ['Item One here', 'Item Two here'];
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
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for projectURL widget.
  FocusNode? projectURLFocusNode1;
  TextEditingController? projectURLTextController1;
  String? Function(BuildContext, String?)? projectURLTextController1Validator;
  // State field(s) for projectURL widget.
  FocusNode? projectURLFocusNode2;
  TextEditingController? projectURLTextController2;
  String? Function(BuildContext, String?)? projectURLTextController2Validator;
  // State field(s) for contactPerson widget.
  FocusNode? contactPersonFocusNode;
  TextEditingController? contactPersonTextController;
  String? Function(BuildContext, String?)? contactPersonTextControllerValidator;
  // State field(s) for projectURL widget.
  FocusNode? projectURLFocusNode3;
  TextEditingController? projectURLTextController3;
  String? Function(BuildContext, String?)? projectURLTextController3Validator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for siteArea widget.
  FocusNode? siteAreaFocusNode;
  TextEditingController? siteAreaTextController;
  String? Function(BuildContext, String?)? siteAreaTextControllerValidator;
  // State field(s) for projectURL widget.
  FocusNode? projectURLFocusNode4;
  TextEditingController? projectURLTextController4;
  String? Function(BuildContext, String?)? projectURLTextController4Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode1;
  TextEditingController? descriptionTextController1;
  String? Function(BuildContext, String?)? descriptionTextController1Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode2;
  TextEditingController? descriptionTextController2;
  String? Function(BuildContext, String?)? descriptionTextController2Validator;
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

  // State field(s) for clonableURL widget.
  FocusNode? clonableURLFocusNode1;
  TextEditingController? clonableURLTextController1;
  String? Function(BuildContext, String?)? clonableURLTextController1Validator;
  // State field(s) for clonableURL widget.
  FocusNode? clonableURLFocusNode2;
  TextEditingController? clonableURLTextController2;
  String? Function(BuildContext, String?)? clonableURLTextController2Validator;
  // State field(s) for date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateTextController;
  String? Function(BuildContext, String?)? dateTextControllerValidator;
  // State field(s) for clonableURL widget.
  FocusNode? clonableURLFocusNode3;
  TextEditingController? clonableURLTextController3;
  String? Function(BuildContext, String?)? clonableURLTextController3Validator;
  // State field(s) for clonableURL widget.
  FocusNode? clonableURLFocusNode4;
  TextEditingController? clonableURLTextController4;
  String? Function(BuildContext, String?)? clonableURLTextController4Validator;
  // State field(s) for clonableURL widget.
  FocusNode? clonableURLFocusNode5;
  TextEditingController? clonableURLTextController5;
  String? Function(BuildContext, String?)? clonableURLTextController5Validator;
  // Stores action output result for [Custom Action - createServiceReportPDF] action in Button widget.
  String? pdf;

  @override
  void initState(BuildContext context) {
    itemshereTextControllerValidator = _itemshereTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    projectURLFocusNode1?.dispose();
    projectURLTextController1?.dispose();

    projectURLFocusNode2?.dispose();
    projectURLTextController2?.dispose();

    contactPersonFocusNode?.dispose();
    contactPersonTextController?.dispose();

    projectURLFocusNode3?.dispose();
    projectURLTextController3?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    siteAreaFocusNode?.dispose();
    siteAreaTextController?.dispose();

    projectURLFocusNode4?.dispose();
    projectURLTextController4?.dispose();

    descriptionFocusNode1?.dispose();
    descriptionTextController1?.dispose();

    descriptionFocusNode2?.dispose();
    descriptionTextController2?.dispose();

    itemshereFocusNode?.dispose();
    itemshereTextController?.dispose();

    clonableURLFocusNode1?.dispose();
    clonableURLTextController1?.dispose();

    clonableURLFocusNode2?.dispose();
    clonableURLTextController2?.dispose();

    dateFocusNode?.dispose();
    dateTextController?.dispose();

    clonableURLFocusNode3?.dispose();
    clonableURLTextController3?.dispose();

    clonableURLFocusNode4?.dispose();
    clonableURLTextController4?.dispose();

    clonableURLFocusNode5?.dispose();
    clonableURLTextController5?.dispose();
  }
}
