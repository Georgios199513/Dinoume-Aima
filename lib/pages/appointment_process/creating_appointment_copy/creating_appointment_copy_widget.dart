import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/appointment_process/invite_friend/invite_friend_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'creating_appointment_copy_model.dart';
export 'creating_appointment_copy_model.dart';

class CreatingAppointmentCopyWidget extends StatefulWidget {
  const CreatingAppointmentCopyWidget({
    super.key,
    this.selectedEvent,
  });

  final EventsRecord? selectedEvent;

  static String routeName = 'CreatingAppointmentCopy';
  static String routePath = '/creatingAppointmentCopy';

  @override
  State<CreatingAppointmentCopyWidget> createState() =>
      _CreatingAppointmentCopyWidgetState();
}

class _CreatingAppointmentCopyWidgetState
    extends State<CreatingAppointmentCopyWidget> {
  late CreatingAppointmentCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatingAppointmentCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CreatingAppointmentCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CREATING_APPOINTMENT_COPY_CreatingAppoin');
      FFAppState().progressBarValue = 1;
      FFAppState().progressBarDescription =
          'Προγραμματίζουμε το ραντεβού σου...';
      safeSetState(() {});
      _model.texts = await queryTextsRecordOnce();
      _model.currentEvent =
          await EventsRecord.getDocumentOnce(widget.selectedEvent!.reference);

      await FFAppState()
          .inCreationBloodAppointment!
          .update(createBloodAppointmentRecordData(
            appointmentState: 'pending',
          ));
      FFAppState().progressBarValue = 20;
      FFAppState().progressBarDescription = 'Επιβεβαίωση ραντεβού...';
      safeSetState(() {});

      await currentUserReference!.update({
        ...createUsersRecordData(
          inAppointment: 'true',
        ),
        ...mapToFirestore(
          {
            'eventsPaticipated':
                FieldValue.arrayUnion([widget.selectedEvent?.reference]),
          },
        ),
      });
      // Προς εξέταση

      await widget.selectedEvent!.eventHospitalPlanner!.update({
        ...mapToFirestore(
          {
            'Donors': FieldValue.arrayUnion([currentUserReference]),
          },
        ),
      });
      FFAppState().progressBarValue = 40;
      FFAppState().progressBarDescription = 'Λίγο ακόμη...';
      safeSetState(() {});
      // Find a way to delete "EmailList"

      await widget.selectedEvent!.reference.update({
        ...mapToFirestore(
          {
            'UsersParticipated': FieldValue.arrayUnion([currentUserReference]),
            'UsersParticipatedEmailsList':
                FieldValue.arrayUnion([currentUserEmail]),
            'bloodAppointmentList': FieldValue.arrayUnion(
                [FFAppState().inCreationBloodAppointment]),
          },
        ),
      });
      FFAppState().progressBarValue = 70;
      FFAppState().progressBarDescription =
          'Σου στέλνουμε επιβεβαίωση του ραντεβού...';
      safeSetState(() {});
      _model.appointmentConfirmationEmail =
          await SendAppointmentConfirmationCall.call(
        to: currentUserEmail,
        subject: _model.texts
            ?.where((e) => e.tags == 'confirmationEmail')
            .toList()
            .firstOrNull
            ?.title,
        textBody:
            (currentUserDocument?.eventsPaticipated.toList() ?? []).length <= 1
                ? _model.texts
                    ?.where((e) => e.tags == 'confirmationEmailFirst')
                    .toList()
                    .firstOrNull
                    ?.text
                : _model.texts
                    ?.where((e) => e.tags == 'confirmationEmail')
                    .toList()
                    .firstOrNull
                    ?.text,
        nameEvent: widget.selectedEvent?.nameOfEvent,
        addressEvent:
            '${widget.selectedEvent?.address.streetAndNumber}, ${widget.selectedEvent?.address.city} ${widget.selectedEvent?.address.postalCode}',
        dateEvent: dateTimeFormat(
          "d/M/y",
          widget.selectedEvent?.eventDate,
          locale: FFLocalizations.of(context).languageCode,
        ),
        timeEvent: FFAppState().selectedTimeForAppointment,
      );

      if (_model.currentEvent?.eventDate != functions.getTodayDate()) {
        triggerPushNotification(
          notificationTitle: _model.texts!
              .where((e) => e.tags == 'reminderPushNotification')
              .toList()
              .firstOrNull!
              .title,
          notificationText: _model.texts!
              .where((e) => e.tags == 'reminderPushNotification')
              .toList()
              .firstOrNull!
              .text,
          scheduledTime: functions.substructTime(
              widget.selectedEvent?.eventDate, 0, 0, 0, 1)!,
          notificationSound: 'default',
          userRefs: [currentUserReference!],
          initialPageName: 'MyAppointment',
          parameterData: {},
        );
      }
      FFAppState().progressBarValue = 100;
      FFAppState().progressBarDescription = 'Επιτυχία!';
      FFAppState().SearchStateMyAppointment = 'searching';
      safeSetState(() {});
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 300),
          reverseDuration: Duration(milliseconds: 300),
          child: InviteFriendWidget(
            event: FFAppState().selectedEvent,
          ),
        ),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<EventsRecord>(
      stream: EventsRecord.getDocument(FFAppState().selectedEvent!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: Center(
              child: SizedBox(
                width: 18.0,
                height: 18.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final creatingAppointmentCopyEventsRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primary,
              body: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/back__02_min.png',
                    ).image,
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            children: [
                              Container(
                                width: 130.0,
                                height: 130.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    fadeInDuration: Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        Duration(milliseconds: 500),
                                    imageUrl:
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-6o5lnp/assets/51y2498f5q1o/Dinoume_Aima_App_LOGO.png',
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              CircularPercentIndicator(
                                percent: valueOrDefault<double>(
                                  FFAppState().progressBarValue / 100,
                                  0.0,
                                ),
                                radius: 100.0,
                                lineWidth: 18.0,
                                animation: true,
                                animateFromLastPercent: true,
                                progressColor:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                backgroundColor: Color(0x43EEEEEE),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 20.0, 30.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFAppState().progressBarDescription,
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 19.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 12.0, 25.0, 0.0),
                              child: Text(
                                'Μην βγείς από την εφαρμογή μεχρι να ολοκληρωθεί η δημιουργία. Σε ευχαριστούμε πολύ για την αναμονή.',
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                      lineHeight: 1.25,
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
          ),
        );
      },
    );
  }
}
