import '/flutter_flow/flutter_flow_util.dart';
import 'expences_page_widget.dart' show ExpencesPageWidget;
import 'package:flutter/material.dart';

class ExpencesPageModel extends FlutterFlowModel<ExpencesPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
