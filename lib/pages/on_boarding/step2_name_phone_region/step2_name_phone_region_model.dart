import '/components/phone_number/phone_number_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'step2_name_phone_region_widget.dart' show Step2NamePhoneRegionWidget;
import 'package:flutter/material.dart';

class Step2NamePhoneRegionModel
    extends FlutterFlowModel<Step2NamePhoneRegionWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Απαιτούμενο πεδίο';
    }

    return null;
  }

  // State field(s) for Regions widget.
  String? regionsValue;
  FormFieldController<String>? regionsValueController;
  // Model for PhoneNumber component.
  late PhoneNumberModel phoneNumberModel;
  // Stores action output result for [Custom Action - updateUserInfo] action in CreateAccount widget.
  String? updateUser;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    phoneNumberModel = createModel(context, () => PhoneNumberModel());
    phoneNumberModel.dialCodeTextControllerValidator = _formTextFieldValidator1;
    phoneNumberModel.numberTextControllerValidator = _formTextFieldValidator2;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    phoneNumberModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Απαιτούμενο πεδίο';
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Απαιτούμενο πεδίο';
    }

    return null;
  }
}
