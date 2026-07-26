import '/components/menu_list_selection/menu_list_selection_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'step4_verify_email_widget.dart' show Step4VerifyEmailWidget;
import 'package:flutter/material.dart';

class Step4VerifyEmailModel extends FlutterFlowModel<Step4VerifyEmailWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for VerificationLink.
  late MenuListSelectionModel verificationLinkModel;
  // Model for ModifyEmail.
  late MenuListSelectionModel modifyEmailModel;

  @override
  void initState(BuildContext context) {
    verificationLinkModel =
        createModel(context, () => MenuListSelectionModel());
    modifyEmailModel = createModel(context, () => MenuListSelectionModel());
  }

  @override
  void dispose() {
    verificationLinkModel.dispose();
    modifyEmailModel.dispose();
  }
}
