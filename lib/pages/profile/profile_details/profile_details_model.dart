import '/components/menu_list_selection/menu_list_selection_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_details_widget.dart' show ProfileDetailsWidget;
import 'package:flutter/material.dart';

class ProfileDetailsModel extends FlutterFlowModel<ProfileDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EditAccount.
  late MenuListSelectionModel editAccountModel;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;

  @override
  void initState(BuildContext context) {
    editAccountModel = createModel(context, () => MenuListSelectionModel());
  }

  @override
  void dispose() {
    editAccountModel.dispose();
  }
}
