import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'success_change_emaill_widget.dart' show SuccessChangeEmaillWidget;
import 'package:flutter/material.dart';

class SuccessChangeEmaillModel
    extends FlutterFlowModel<SuccessChangeEmaillWidget> {
  ///  Local state fields for this page.

  String? progress;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for Password widget.
  late FocusNode passwordPasswordVisibilityFocusNode;
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Custom Action - authFlutterFire] action in CreateAccount widget.
  String? returnAuth;

  @override
  void initState(BuildContext context) {
    passwordPasswordVisibilityFocusNode = FocusNode();
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
    passwordPasswordVisibilityFocusNode.dispose();
  }
}
