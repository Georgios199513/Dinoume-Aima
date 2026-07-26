import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'appointment_details_widget.dart' show AppointmentDetailsWidget;
import 'package:flutter/material.dart';

class AppointmentDetailsModel
    extends FlutterFlowModel<AppointmentDetailsWidget> {
  ///  Local state fields for this component.

  int numberUserAppointment = 0;

  int? currentUserAppointments = 0;

  List<DocumentReference> test = [];
  void addToTest(DocumentReference item) => test.add(item);
  void removeFromTest(DocumentReference item) => test.remove(item);
  void removeAtIndexFromTest(int index) => test.removeAt(index);
  void insertAtIndexInTest(int index, DocumentReference item) =>
      test.insert(index, item);
  void updateTestAtIndex(int index, Function(DocumentReference) updateFn) =>
      test[index] = updateFn(test[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Book widget.
  int? countBloodAppointments;
  // Stores action output result for [Backend Call - Create Document] action in Book widget.
  BloodAppointmentRecord? inProgressAppointment2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
