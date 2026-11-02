import '/flutter_flow/flutter_flow_util.dart';
import 'log_in_bottom_sheet_copy_widget.dart' show LogInBottomSheetCopyWidget;
import 'package:flutter/material.dart';

class LogInBottomSheetCopyModel
    extends FlutterFlowModel<LogInBottomSheetCopyWidget> {
  ///  Local state fields for this component.

  bool? isLogIn = false;

  ///  State fields for stateful widgets in this component.

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
  // Stores action output result for [Custom Action - authFlutterFire] action in Button widget.
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
