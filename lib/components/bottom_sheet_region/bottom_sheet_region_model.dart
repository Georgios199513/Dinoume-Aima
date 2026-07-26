import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'bottom_sheet_region_widget.dart' show BottomSheetRegionWidget;
import 'package:flutter/material.dart';

class BottomSheetRegionModel extends FlutterFlowModel<BottomSheetRegionWidget> {
  ///  Local state fields for this component.

  String? region;

  DateTime? startDate;

  DateTime? endDate;

  bool? clearRegion = false;

  ///  State fields for stateful widgets in this component.

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
