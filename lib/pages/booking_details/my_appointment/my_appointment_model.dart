import '/components/footer/footer_widget.dart';
import '/empty_list_widgets/no_booking_yet/no_booking_yet_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_appointment_widget.dart' show MyAppointmentWidget;
import 'package:flutter/material.dart';

class MyAppointmentModel extends FlutterFlowModel<MyAppointmentWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - CheckPendingAppointmentAfter5Days] action in MyAppointment widget.
  List<DocumentReference>? pendingAppointment;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? numberOfBloodAppointment;
  // Model for NoBookingYet component.
  late NoBookingYetModel noBookingYetModel;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    noBookingYetModel = createModel(context, () => NoBookingYetModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    noBookingYetModel.dispose();
    footerModel.dispose();
  }
}
