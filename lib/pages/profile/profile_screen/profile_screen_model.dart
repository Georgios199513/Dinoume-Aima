import '/components/footer/footer_widget.dart';
import '/components/toggle/toggle_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_screen_widget.dart' show ProfileScreenWidget;
import 'package:flutter/material.dart';

class ProfileScreenModel extends FlutterFlowModel<ProfileScreenWidget> {
  ///  Local state fields for this page.

  List<String> listOfOldPendingAppointments = [];
  void addToListOfOldPendingAppointments(String item) =>
      listOfOldPendingAppointments.add(item);
  void removeFromListOfOldPendingAppointments(String item) =>
      listOfOldPendingAppointments.remove(item);
  void removeAtIndexFromListOfOldPendingAppointments(int index) =>
      listOfOldPendingAppointments.removeAt(index);
  void insertAtIndexInListOfOldPendingAppointments(int index, String item) =>
      listOfOldPendingAppointments.insert(index, item);
  void updateListOfOldPendingAppointmentsAtIndex(
          int index, Function(String) updateFn) =>
      listOfOldPendingAppointments[index] =
          updateFn(listOfOldPendingAppointments[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - CheckPendingAppointmentAfter5Days] action in ProfileScreen widget.
  List<DocumentReference>? recheckPendingAppointment;
  // Model for Footer component.
  late FooterModel footerModel;
  // Stores action output result for [Custom Action - appPackageInfo] action in EditProfile widget.
  String? appVersion;
  // Model for Toggle component.
  late ToggleModel toggleModel;

  @override
  void initState(BuildContext context) {
    footerModel = createModel(context, () => FooterModel());
    toggleModel = createModel(context, () => ToggleModel());
  }

  @override
  void dispose() {
    footerModel.dispose();
    toggleModel.dispose();
  }
}
