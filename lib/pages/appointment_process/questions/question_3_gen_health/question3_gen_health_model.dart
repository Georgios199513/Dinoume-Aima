import '/components/cancel_appointment/cancel_appointment_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'question3_gen_health_widget.dart' show Question3GenHealthWidget;
import 'package:flutter/material.dart';

class Question3GenHealthModel
    extends FlutterFlowModel<Question3GenHealthWidget> {
  ///  State fields for stateful widgets in this page.

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

  // Model for CancelAppointment component.
  late CancelAppointmentModel cancelAppointmentModel;

  @override
  void initState(BuildContext context) {
    cancelAppointmentModel =
        createModel(context, () => CancelAppointmentModel());
  }

  @override
  void dispose() {
    timerController.dispose();
    cancelAppointmentModel.dispose();
  }
}
