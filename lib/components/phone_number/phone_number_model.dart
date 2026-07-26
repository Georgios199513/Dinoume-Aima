import '/flutter_flow/flutter_flow_util.dart';
import 'phone_number_widget.dart' show PhoneNumberWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneNumberModel extends FlutterFlowModel<PhoneNumberWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DialCode widget.
  FocusNode? dialCodeFocusNode;
  TextEditingController? dialCodeTextController;
  String? Function(BuildContext, String?)? dialCodeTextControllerValidator;
  // State field(s) for Number widget.
  FocusNode? numberFocusNode;
  TextEditingController? numberTextController;
  late MaskTextInputFormatter numberMask;
  String? Function(BuildContext, String?)? numberTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dialCodeFocusNode?.dispose();
    dialCodeTextController?.dispose();

    numberFocusNode?.dispose();
    numberTextController?.dispose();
  }
}
