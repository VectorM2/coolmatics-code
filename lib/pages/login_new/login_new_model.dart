import '/flutter_flow/flutter_flow_util.dart';
import 'login_new_widget.dart' show LoginNewWidget;
import 'package:flutter/material.dart';

class LoginNewModel extends FlutterFlowModel<LoginNewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for email widget.
  FocusNode? emailFocusNode1;
  TextEditingController? emailTextController1;
  String? Function(BuildContext, String?)? emailTextController1Validator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode1;
  TextEditingController? passwordTextController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? passwordTextController1Validator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for student_number widget.
  FocusNode? studentNumberFocusNode;
  TextEditingController? studentNumberTextController;
  String? Function(BuildContext, String?)? studentNumberTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode2;
  TextEditingController? emailTextController2;
  String? Function(BuildContext, String?)? emailTextController2Validator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode2;
  TextEditingController? passwordTextController2;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? passwordTextController2Validator;
  // State field(s) for confirm_password widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
    confirmPasswordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emailFocusNode1?.dispose();
    emailTextController1?.dispose();

    passwordFocusNode1?.dispose();
    passwordTextController1?.dispose();

    studentNumberFocusNode?.dispose();
    studentNumberTextController?.dispose();

    emailFocusNode2?.dispose();
    emailTextController2?.dispose();

    passwordFocusNode2?.dispose();
    passwordTextController2?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();
  }
}
