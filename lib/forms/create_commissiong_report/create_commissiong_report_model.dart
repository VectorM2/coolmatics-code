import '/flutter_flow/flutter_flow_util.dart';
import 'create_commissiong_report_widget.dart'
    show CreateCommissiongReportWidget;
import 'package:flutter/material.dart';

class CreateCommissiongReportModel
    extends FlutterFlowModel<CreateCommissiongReportWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for projectURL widget.
  FocusNode? projectURLFocusNode1;
  TextEditingController? projectURLTextController1;
  String? Function(BuildContext, String?)? projectURLTextController1Validator;
  // State field(s) for projectURL widget.
  FocusNode? projectURLFocusNode2;
  TextEditingController? projectURLTextController2;
  String? Function(BuildContext, String?)? projectURLTextController2Validator;
  // State field(s) for projectURL widget.
  FocusNode? projectURLFocusNode3;
  TextEditingController? projectURLTextController3;
  String? Function(BuildContext, String?)? projectURLTextController3Validator;
  // State field(s) for projectURL widget.
  FocusNode? projectURLFocusNode4;
  TextEditingController? projectURLTextController4;
  String? Function(BuildContext, String?)? projectURLTextController4Validator;
  // State field(s) for projectURL widget.
  FocusNode? projectURLFocusNode5;
  TextEditingController? projectURLTextController5;
  String? Function(BuildContext, String?)? projectURLTextController5Validator;
  // State field(s) for projectURL widget.
  FocusNode? projectURLFocusNode6;
  TextEditingController? projectURLTextController6;
  String? Function(BuildContext, String?)? projectURLTextController6Validator;
  // State field(s) for projectURL widget.
  FocusNode? projectURLFocusNode7;
  TextEditingController? projectURLTextController7;
  String? Function(BuildContext, String?)? projectURLTextController7Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    projectURLFocusNode1?.dispose();
    projectURLTextController1?.dispose();

    projectURLFocusNode2?.dispose();
    projectURLTextController2?.dispose();

    projectURLFocusNode3?.dispose();
    projectURLTextController3?.dispose();

    projectURLFocusNode4?.dispose();
    projectURLTextController4?.dispose();

    projectURLFocusNode5?.dispose();
    projectURLTextController5?.dispose();

    projectURLFocusNode6?.dispose();
    projectURLTextController6?.dispose();

    projectURLFocusNode7?.dispose();
    projectURLTextController7?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
