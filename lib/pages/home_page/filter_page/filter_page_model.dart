import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/home_page/filter_page/filter_page_widget.dart';
import '/index.dart';
import 'filter_page_widget.dart' show FilterPageWidget;
import 'package:flutter/material.dart';

class FilterPageModel extends FlutterFlowModel<FilterPageWidget> {
  ///  Local state fields for this page.

  bool? clearAll = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
