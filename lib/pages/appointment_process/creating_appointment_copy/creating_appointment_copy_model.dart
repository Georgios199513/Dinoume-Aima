import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'creating_appointment_copy_widget.dart'
    show CreatingAppointmentCopyWidget;
import 'package:flutter/material.dart';

class CreatingAppointmentCopyModel
    extends FlutterFlowModel<CreatingAppointmentCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in CreatingAppointmentCopy widget.
  List<TextsRecord>? texts;
  // Stores action output result for [Backend Call - Read Document] action in CreatingAppointmentCopy widget.
  EventsRecord? currentEvent;
  // Stores action output result for [Backend Call - API (Send Appointment Confirmation)] action in CreatingAppointmentCopy widget.
  ApiCallResponse? appointmentConfirmationEmail;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
