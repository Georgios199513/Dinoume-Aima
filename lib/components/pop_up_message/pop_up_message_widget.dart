import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'pop_up_message_model.dart';
export 'pop_up_message_model.dart';

class PopUpMessageWidget extends StatefulWidget {
  const PopUpMessageWidget({
    super.key,
    this.message,
    this.button1Text,
    this.button2Text,
    this.button1IconVisibility,
    this.button2IconVisibility,
    this.actionName,
    this.description,
    this.appointment,
    this.hospitalCreatedPlanner,
    this.appointmentIDnotification,
  });

  final String? message;
  final String? button1Text;
  final String? button2Text;
  final Widget? button1IconVisibility;
  final Widget? button2IconVisibility;
  final String? actionName;
  final String? description;
  final DocumentReference? appointment;
  final DocumentReference? hospitalCreatedPlanner;
  final String? appointmentIDnotification;

  @override
  State<PopUpMessageWidget> createState() => _PopUpMessageWidgetState();
}

class _PopUpMessageWidgetState extends State<PopUpMessageWidget> {
  late PopUpMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopUpMessageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.85,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25.0, 30.0, 25.0, 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
                      child: Text(
                        widget.message!,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    if (widget.description != null &&
                        widget.description != '')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: SelectionArea(
                            child: Text(
                          valueOrDefault<String>(
                            widget.description,
                            'desciption',
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.roboto(
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                                lineHeight: 1.2,
                              ),
                        )),
                      ),
                  ],
                ),
                if (FFAppState().progressBarValue == 0)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (widget.button1Text != null &&
                            widget.button1Text != '')
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'POP_UP_MESSAGE_COMP_Action1_ON_TAP');
                                  var _shouldSetState = false;
                                  _model.textsNotifications =
                                      await queryTextsRecordOnce();
                                  _shouldSetState = true;
                                  FFAppState().PopUpMessageOutput = true;
                                  safeSetState(() {});
                                  if (widget.actionName == 'delete') {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.bottomToTop,
                                        duration: Duration(milliseconds: 300),
                                        reverseDuration:
                                            Duration(milliseconds: 300),
                                        child: DeleteAccountWidget(),
                                      ),
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else if ((widget.actionName ==
                                          'pauseAccount') ||
                                      (widget.actionName == 'logout')) {
                                    await authManager.signOut();
                                    FFAppState().CurrentRegion = valueOrDefault(
                                        currentUserDocument?.region, '');
                                    FFAppState().startDate =
                                        functions.getTodayDate();
                                    FFAppState().endDate =
                                        functions.addDaysToDate(
                                            30, functions.getTodayDate());
                                    FFAppState().pendingAppointment = false;
                                    safeSetState(() {});
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                        reverseDuration:
                                            Duration(milliseconds: 0),
                                        child: HomePageWidget(),
                                      ),
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else if (widget.actionName ==
                                      'deleteAppointment') {
                                    FFAppState().progressBarValue = 1;
                                    FFAppState().progressBarDescription =
                                        'Ακυρώνεται το ραντεβού σου...';
                                    safeSetState(() {});

                                    await FFAppState().selectedEvent!.update({
                                      ...mapToFirestore(
                                        {
                                          'UsersParticipatedEmailsList':
                                              FieldValue.arrayRemove(
                                                  [currentUserEmail]),
                                          'UsersParticipated':
                                              FieldValue.arrayRemove(
                                                  [currentUserReference]),
                                          'bloodAppointmentList':
                                              FieldValue.arrayRemove(
                                                  [widget.appointment]),
                                        },
                                      ),
                                    });
                                    _model.correspondingEvent =
                                        await EventsRecord.getDocumentOnce(
                                            FFAppState().selectedEvent!);
                                    _shouldSetState = true;
                                    _model.curentAppointment =
                                        await BloodAppointmentRecord
                                            .getDocumentOnce(
                                                widget.appointment!);
                                    _shouldSetState = true;
                                    _model.currentAppointmetnTimeChunk =
                                        await TimeChunksChoicesRecord
                                            .getDocumentOnce(_model
                                                .curentAppointment!
                                                .timeOfAppointment!);
                                    _shouldSetState = true;
                                    FFAppState().progressBarValue = 20;
                                    FFAppState().progressBarDescription =
                                        'Λίγο ακόμη...';
                                    safeSetState(() {});
                                    _model.deleteScheduledPushNotification =
                                        await actions
                                            .deleteScheduledPushNotification(
                                      currentUserReference,
                                      functions.substructTime(
                                          _model.correspondingEvent?.eventDate,
                                          0,
                                          0,
                                          0,
                                          1),
                                    );
                                    _shouldSetState = true;
                                    _model.deletedScheduledEmailNotification =
                                        await CancelScheduledEmailCall.call(
                                      id: _model.curentAppointment
                                          ?.abracadaloScheduledEmailId,
                                    );

                                    _shouldSetState = true;
                                    await SendAppointmentCancellationCall.call(
                                      to: currentUserEmail,
                                      subject: _model.textsNotifications
                                          ?.where((e) =>
                                              e.tags == 'cancelAppointment')
                                          .toList()
                                          .firstOrNull
                                          ?.title,
                                      textBody: _model.textsNotifications
                                          ?.where((e) =>
                                              e.tags == 'cancelAppointment')
                                          .toList()
                                          .firstOrNull
                                          ?.text,
                                      nameEvent: _model
                                          .correspondingEvent?.nameOfEvent,
                                      addressEvent:
                                          '${_model.correspondingEvent?.address.streetAndNumber}, ${_model.correspondingEvent?.address.city} ${_model.correspondingEvent?.address.postalCode}',
                                      dateEvent: dateTimeFormat(
                                        "d/M/y",
                                        _model.correspondingEvent?.eventDate,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      timeEvent: _model
                                          .currentAppointmetnTimeChunk
                                          ?.timeChunks
                                          .from,
                                    );

                                    FFAppState().progressBarValue = 40;
                                    FFAppState().progressBarDescription =
                                        'Σχεδόν τελειώσαμε...';
                                    safeSetState(() {});
                                    _model.numberOfBloodAppointments =
                                        await queryBloodAppointmentRecordCount(
                                      parent: currentUserReference,
                                    );
                                    _shouldSetState = true;

                                    await currentUserReference!.update({
                                      ...createUsersRecordData(
                                        inAppointment:
                                            _model.numberOfBloodAppointments! >
                                                    0
                                                ? 'false'
                                                : 'first_appointment',
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'eventsPaticipated':
                                              FieldValue.arrayRemove(
                                                  [FFAppState().selectedEvent]),
                                        },
                                      ),
                                    });

                                    await FFAppState()
                                        .inCreationBloodAppointment!
                                        .update(
                                            createBloodAppointmentRecordData(
                                          appointmentState: 'canceled',
                                        ));
                                    FFAppState().progressBarValue = 80;
                                    FFAppState().progressBarDescription =
                                        'Μόνο λίγο ακόμη ...';
                                    safeSetState(() {});

                                    await widget.hospitalCreatedPlanner!
                                        .update({
                                      ...mapToFirestore(
                                        {
                                          'Donors': FieldValue.arrayRemove(
                                              [currentUserReference]),
                                        },
                                      ),
                                    });
                                    _model.pendingAfter5Days =
                                        await action_blocks
                                            .checkPendingAppointmentAfter5Days(
                                                context);
                                    _shouldSetState = true;
                                    FFAppState().progressBarValue = 100;
                                    FFAppState().progressBarDescription =
                                        'Η ακύρωση ολοκληρώθηκε..';
                                    FFAppState().selectedEvent = null;
                                    safeSetState(() {});
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                        reverseDuration:
                                            Duration(milliseconds: 0),
                                        child: HomePageWidget(),
                                      ),
                                      (r) => false,
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else if (widget.actionName ==
                                      'verifyAccount') {
                                    FFAppState().VerifyingTimes = 0;
                                    safeSetState(() {});
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 300),
                                        reverseDuration:
                                            Duration(milliseconds: 300),
                                        child: Step4VerifyEmailWidget(),
                                      ),
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else if (widget.actionName ==
                                      'replaceAppointment') {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 300),
                                        reverseDuration:
                                            Duration(milliseconds: 300),
                                        child: MyAppointmentWidget(),
                                      ),
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else if (widget.actionName ==
                                      'forceContinue') {
                                    Navigator.pop(context);
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else if (widget.actionName ==
                                      'continueAccountCreation') {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 300),
                                        reverseDuration:
                                            Duration(milliseconds: 300),
                                        child: Step2NamePhoneRegionWidget(),
                                      ),
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else if (widget.actionName ==
                                      'continueAppointment') {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 300),
                                        reverseDuration:
                                            Duration(milliseconds: 300),
                                        child: TimeSlotSelectionWidget(),
                                      ),
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else if (widget.actionName == 'timesUp') {
                                    await action_blocks
                                        .cancelingCreationAppointment(context);
                                    safeSetState(() {});
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else if (widget.actionName ==
                                      'noConnection') {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 300),
                                        reverseDuration:
                                            Duration(milliseconds: 300),
                                        child: LoadingScreenWidget(),
                                      ),
                                    );
                                  } else if (widget.actionName ==
                                      'deleteLockedSeat') {
                                    await action_blocks
                                        .deleteAppointmentGeneral(
                                      context,
                                      event: FFAppState().selectedEvent,
                                      bloodappointment: widget.appointment,
                                    );
                                    Navigator.pop(context);
                                  } else {
                                    Navigator.pop(context);
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                                text: widget.button1Text!,
                                icon: widget.button1IconVisibility,
                                options: FFButtonOptions(
                                  height: 50.0,
                                  padding: EdgeInsets.all(16.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                            ),
                          ),
                        if (widget.button2Text != null &&
                            widget.button2Text != '')
                          Expanded(
                            flex: 1,
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'POP_UP_MESSAGE_COMP_Action2_ON_TAP');
                                FFAppState().PopUpMessageOutput = false;
                                safeSetState(() {});
                                if (widget.actionName ==
                                    'continueAppointment') {
                                  await widget.appointment!.delete();
                                }
                                Navigator.pop(context);
                              },
                              text: widget.button2Text!,
                              icon: widget.button2IconVisibility,
                              options: FFButtonOptions(
                                height: 50.0,
                                padding: EdgeInsets.all(16.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                if (FFAppState().progressBarValue > 0)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        LinearPercentIndicator(
                          percent: valueOrDefault<double>(
                            FFAppState().progressBarValue / 100,
                            0.0,
                          ),
                          lineHeight: 15.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: FlutterFlowTheme.of(context).primary,
                          backgroundColor: FlutterFlowTheme.of(context).accent4,
                          barRadius: Radius.circular(8.0),
                          padding: EdgeInsets.zero,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Text(
                            FFAppState().progressBarDescription,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.roboto(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
