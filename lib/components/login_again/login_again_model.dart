import '/flutter_flow/flutter_flow_util.dart';
import 'login_again_widget.dart' show LoginAgainWidget;
import 'package:flutter/material.dart';

class LoginAgainModel extends FlutterFlowModel<LoginAgainWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Custom Action - updateEmail] action in CreateAccount widget.
  String? updateEmail;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
