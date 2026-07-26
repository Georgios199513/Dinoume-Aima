import '/flutter_flow/flutter_flow_util.dart';
import 'bottom_sheet_region_archive_widget.dart'
    show BottomSheetRegionArchiveWidget;
import 'package:flutter/material.dart';

class BottomSheetRegionArchiveModel
    extends FlutterFlowModel<BottomSheetRegionArchiveWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SearchField widget.
  final searchFieldKey = GlobalKey();
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? searchFieldSelectedOption;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
  }
}
