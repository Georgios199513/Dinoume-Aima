import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pop_up_message_widget.dart' show PopUpMessageWidget;
import 'package:flutter/material.dart';

class PopUpMessageModel extends FlutterFlowModel<PopUpMessageWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Action1 widget.
  List<TextsRecord>? textsNotifications;
  // Stores action output result for [Backend Call - Read Document] action in Action1 widget.
  EventsRecord? correspondingEvent;
  // Stores action output result for [Backend Call - Read Document] action in Action1 widget.
  BloodAppointmentRecord? curentAppointment;
  // Stores action output result for [Backend Call - Read Document] action in Action1 widget.
  TimeChunksChoicesRecord? currentAppointmetnTimeChunk;
  // Stores action output result for [Custom Action - deleteScheduledPushNotification] action in Action1 widget.
  bool? deleteScheduledPushNotification;
  // Stores action output result for [Backend Call - API (Cancel Scheduled Email)] action in Action1 widget.
  ApiCallResponse? deletedScheduledEmailNotification;
  // Stores action output result for [Firestore Query - Query a collection] action in Action1 widget.
  int? numberOfBloodAppointments;
  // Stores action output result for [Action Block - CheckPendingAppointmentAfter5Days] action in Action1 widget.
  List<DocumentReference>? pendingAfter5Days;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
