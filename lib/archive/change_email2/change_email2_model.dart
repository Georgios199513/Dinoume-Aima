import '/flutter_flow/flutter_flow_util.dart';
import 'change_email2_widget.dart' show ChangeEmail2Widget;
import 'package:flutter/material.dart';

class ChangeEmail2Model extends FlutterFlowModel<ChangeEmail2Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // Stores action output result for [Custom Action - updateEmail] action in IconButton widget.
  String? updateEmail;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }
}
