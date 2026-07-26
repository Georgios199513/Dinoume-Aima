import '/components/cancel_appointment/cancel_appointment_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'rejection_message_widget.dart' show RejectionMessageWidget;
import 'package:flutter/material.dart';

class RejectionMessageModel extends FlutterFlowModel<RejectionMessageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CancelAppointment component.
  late CancelAppointmentModel cancelAppointmentModel;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {
    cancelAppointmentModel =
        createModel(context, () => CancelAppointmentModel());
  }

  @override
  void dispose() {
    cancelAppointmentModel.dispose();
    timerController.dispose();
  }
}
