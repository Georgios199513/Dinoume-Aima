import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/home_page/home_page/home_page_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cancel_appointment_model.dart';
export 'cancel_appointment_model.dart';

class CancelAppointmentWidget extends StatefulWidget {
  const CancelAppointmentWidget({
    super.key,
    String? buttonText,
    Color? textColor,
    required this.action,
  })  : this.buttonText = buttonText ?? 'Ακύρωση',
        this.textColor = textColor ?? Colors.white;

  final String buttonText;
  final Color textColor;
  final Future Function()? action;

  @override
  State<CancelAppointmentWidget> createState() =>
      _CancelAppointmentWidgetState();
}

class _CancelAppointmentWidgetState extends State<CancelAppointmentWidget> {
  late CancelAppointmentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CancelAppointmentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        logFirebaseEvent('CANCEL_APPOINTMENT_COMP_Cancel_ON_TAP');
        await action_blocks.cancelingCreationAppointment(context);
        safeSetState(() {});
        FFAppState().selectedTimeChunk = null;
        FFAppState().selectedEvent = null;
        safeSetState(() {});
        Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 300),
            reverseDuration: Duration(milliseconds: 300),
            child: HomePageWidget(),
          ),
          (r) => false,
        );
      },
      text: widget.buttonText,
      options: FFButtonOptions(
        width: double.infinity,
        height: 50.0,
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: Color(0x00FFFFFF),
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              font: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
              color: widget.textColor,
              fontSize: 13.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
