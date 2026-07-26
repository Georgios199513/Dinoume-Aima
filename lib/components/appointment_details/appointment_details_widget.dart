import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/pop_up_message/pop_up_message_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'appointment_details_model.dart';
export 'appointment_details_model.dart';

class AppointmentDetailsWidget extends StatefulWidget {
  const AppointmentDetailsWidget({
    super.key,
    this.selectedEvent,
    this.lastAppointmentState,
    this.lastEventDate,
  });

  final EventsRecord? selectedEvent;
  final String? lastAppointmentState;
  final DateTime? lastEventDate;

  @override
  State<AppointmentDetailsWidget> createState() =>
      _AppointmentDetailsWidgetState();
}

class _AppointmentDetailsWidgetState extends State<AppointmentDetailsWidget> {
  late AppointmentDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppointmentDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        StreamBuilder<List<BloodAppointmentRecord>>(
          stream: queryBloodAppointmentRecord(
            queryBuilder: (bloodAppointmentRecord) =>
                bloodAppointmentRecord.where(
              'RelatedEvent',
              isEqualTo: widget.selectedEvent?.reference,
            ),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 18.0,
                  height: 18.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            List<BloodAppointmentRecord> phoneBloodAppointmentRecordList =
                snapshot.data!;

            return Container(
              constraints: BoxConstraints(
                maxWidth: 500.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0),
                ),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.0),
                      topRight: Radius.circular(18.0),
                    ),
                    child: CachedNetworkImage(
                      fadeInDuration: Duration(milliseconds: 500),
                      fadeOutDuration: Duration(milliseconds: 500),
                      imageUrl:
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-6o5lnp/assets/1pmvb7vustk9/AppointmentHeader.png',
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: Icon(
                                Icons.cancel,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                size: 25.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'APPOINTMENT_DETAILS_cancel_ICN_ON_TAP');
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 55.0, 25.0, 25.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Text(
                                    widget.selectedEvent!.nameOfEvent,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.roboto(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 25.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Material(
                                        color: Colors.transparent,
                                        elevation: 5.0,
                                        shape: const CircleBorder(),
                                        child: Container(
                                          width: 35.0,
                                          height: 35.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFF7E67),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.person,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            size: 19.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 5.0),
                                                child: Text(
                                                  'Διοργανωτής',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 11.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              StreamBuilder<
                                                  HospitalCreatedRecord>(
                                                stream: HospitalCreatedRecord
                                                    .getDocument(widget
                                                        .selectedEvent!
                                                        .eventHospitalPlanner!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 18.0,
                                                        height: 18.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }

                                                  final hospitalHospitalCreatedRecord =
                                                      snapshot.data!;

                                                  return Text(
                                                    hospitalHospitalCreatedRecord
                                                        .shortName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .roboto(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'APPOINTMENT_DETAILS_COMP_Address_ON_TAP');
                                      await launchMap(
                                        location:
                                            widget.selectedEvent?.location,
                                        title:
                                            widget.selectedEvent!.nameOfEvent,
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 5.0,
                                          shape: const CircleBorder(),
                                          child: Container(
                                            width: 35.0,
                                            height: 35.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFF7E67),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.near_me,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              size: 19.0,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: Text(
                                                    'Διεύθυνση αιμοδοσίας',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .roboto(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '${widget.selectedEvent?.address.streetAndNumber}, ${widget.selectedEvent?.address.city} ${widget.selectedEvent?.address.postalCode}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.navigate_next_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 22.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 45.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 90.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFCE5E3),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            'Ημερομηνία αιμοδοσίας',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          dateTimeFormat(
                                            "d/M/y",
                                            widget.selectedEvent!.eventDate!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.roboto(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 28.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 25.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .transparent,
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    if ((widget.selectedEvent!
                                                .bloodAppointmentList.length +
                                            phoneBloodAppointmentRecordList
                                                .unique(
                                                    (e) => e.parentReference)
                                                .where((e) =>
                                                    (e.appointmentState ==
                                                        'underCreation') &&
                                                    (getCurrentTimestamp <=
                                                        functions.addTime(
                                                            e.createdTime,
                                                            0,
                                                            FFAppConstants
                                                                .WaitTimeForAppointment)!) &&
                                                    (e.parentReference !=
                                                        currentUserReference))
                                                .toList()
                                                .length) ==
                                        widget.selectedEvent!.seatsMax) {
                                      return FFButtonWidget(
                                        onPressed: () {
                                          print('NoSeats pressed ...');
                                        },
                                        text: 'Δεν υπάρχουν διαθέσιμες θέσεις',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF9E9E9E),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      );
                                    } else if ((valueOrDefault(
                                                currentUserDocument
                                                    ?.inAppointment,
                                                '') ==
                                            'true') &&
                                        (loggedIn == true)) {
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'APPOINTMENT_DETAILS_AlreadyBooked_ON_TAP');
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              reverseDuration:
                                                  Duration(milliseconds: 300),
                                              child: MyAppointmentWidget(),
                                            ),
                                          );
                                        },
                                        text: 'Έχεις ήδη ένα ραντεβού',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .transparent,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      );
                                    } else {
                                      return Builder(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'APPOINTMENT_DETAILS_COMP_Book_ON_TAP');
                                            var _shouldSetState = false;
                                            if (loggedIn == true) {
                                              if (phoneBloodAppointmentRecordList
                                                      .where((e) =>
                                                          (e.appointmentState ==
                                                              'underCreation') &&
                                                          (e.parentReference ==
                                                              currentUserReference))
                                                      .toList()
                                                      .length >
                                                  0) {
                                                _model.numberUserAppointment =
                                                    phoneBloodAppointmentRecordList
                                                        .where((e) =>
                                                            (e.appointmentState ==
                                                                'underCreation') &&
                                                            (e.parentReference ==
                                                                currentUserReference))
                                                        .toList()
                                                        .length;
                                                _model.test = [];
                                                _model.currentUserAppointments =
                                                    0;
                                                safeSetState(() {});
                                                while (_model
                                                        .currentUserAppointments! <
                                                    _model
                                                        .numberUserAppointment) {
                                                  _model.addToTest(phoneBloodAppointmentRecordList
                                                      .where((e) =>
                                                          (e.appointmentState ==
                                                              'underCreation') &&
                                                          (e.parentReference ==
                                                              currentUserReference))
                                                      .toList()
                                                      .elementAtOrNull(_model
                                                          .currentUserAppointments!)!
                                                      .reference);
                                                  _model.currentUserAppointments =
                                                      _model.currentUserAppointments! +
                                                          1;
                                                  safeSetState(() {});
                                                }
                                                _model.currentUserAppointments =
                                                    _model.numberUserAppointment >
                                                            1
                                                        ? -1
                                                        : 0;
                                                safeSetState(() {});
                                                while (_model
                                                        .currentUserAppointments! >
                                                    -1) {
                                                  await _model.test.firstOrNull!
                                                      .delete();
                                                  _model.currentUserAppointments =
                                                      _model.currentUserAppointments! +
                                                          -1;
                                                  safeSetState(() {});
                                                }
                                              }
                                              if (widget.lastAppointmentState ==
                                                      null ||
                                                  widget.lastAppointmentState ==
                                                      '') {
                                                await currentUserReference!
                                                    .update(
                                                        createUsersRecordData(
                                                  inAppointment:
                                                      'first_appointment',
                                                ));
                                              }
                                              if (valueOrDefault(
                                                      currentUserDocument
                                                          ?.inAppointment,
                                                      '') ==
                                                  'first_appointment') {
                                              } else if (valueOrDefault(
                                                      currentUserDocument
                                                          ?.inAppointment,
                                                      '') ==
                                                  'true') {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: PopUpMessageWidget(
                                                        message:
                                                            'Είσαι σίγουρος;',
                                                        description:
                                                            'Έχεις ήδη κλείσει ένα ραντεβού. Έισαι σίγουρος πως θέλεις να το ακυρώσεις και να κλείσεις ένα καινούργιο;',
                                                        button1Text: 'Ναι',
                                                        button2Text: 'Οχι',
                                                        actionName:
                                                            'replaceAppointment',
                                                      ),
                                                    );
                                                  },
                                                );

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              } else if (valueOrDefault(
                                                      currentUserDocument
                                                          ?.inAppointment,
                                                      '') ==
                                                  'false') {
                                                if (functions.is90DaysPassed(
                                                        widget.lastEventDate!,
                                                        functions
                                                            .getTodayDate()) &&
                                                    (widget.lastAppointmentState ==
                                                        'completed')) {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .popUpBackground,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            PopUpMessageWidget(
                                                          message: 'Προσοχή',
                                                          description:
                                                              'Δεν έχεις ακόμη συμπληρώσει τον απαιτούμενο χρόνο, 90 μέρες, από το τελευταίο ραντεβού σου. Εάν προχωρήσεις, θα ξεκινήσει η διαδικασία δημιουργίας νέου ραντεβού, αλλά να έχεις υπόψη σου ότι μπορεί να μην σε αφήσουν να δώσεις αίμα.',
                                                          button1Text: 'ΟΚ',
                                                          button2Text: 'Πίσω',
                                                          actionName:
                                                              'forceContinue',
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                }
                                              } else {
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }

                                              _model.countBloodAppointments =
                                                  await queryBloodAppointmentRecordCount(
                                                queryBuilder:
                                                    (bloodAppointmentRecord) =>
                                                        bloodAppointmentRecord
                                                            .where(
                                                  'appointmentState',
                                                  isNotEqualTo: 'underCreation',
                                                ),
                                              );
                                              _shouldSetState = true;

                                              var bloodAppointmentRecordReference =
                                                  BloodAppointmentRecord
                                                      .createDoc(
                                                          currentUserReference!);
                                              await bloodAppointmentRecordReference
                                                  .set(
                                                      createBloodAppointmentRecordData(
                                                relatedEvent: widget
                                                    .selectedEvent?.reference,
                                                createdTime:
                                                    getCurrentTimestamp,
                                                appointmentState:
                                                    'underCreation',
                                                appointmentCode: (_model
                                                        .countBloodAppointments!) +
                                                    1,
                                                counterTime: 15,
                                              ));
                                              _model.inProgressAppointment2 =
                                                  BloodAppointmentRecord
                                                      .getDocumentFromData(
                                                          createBloodAppointmentRecordData(
                                                            relatedEvent: widget
                                                                .selectedEvent
                                                                ?.reference,
                                                            createdTime:
                                                                getCurrentTimestamp,
                                                            appointmentState:
                                                                'underCreation',
                                                            appointmentCode:
                                                                (_model.countBloodAppointments!) +
                                                                    1,
                                                            counterTime: 15,
                                                          ),
                                                          bloodAppointmentRecordReference);
                                              _shouldSetState = true;
                                              FFAppState()
                                                      .inCreationBloodAppointment =
                                                  _model.inProgressAppointment2
                                                      ?.reference;
                                              FFAppState().selectedTimeChunk =
                                                  null;
                                              FFAppState()
                                                  .Timer = FFAppConstants
                                                      .WaitTimeForAppointment *
                                                  60000;
                                              FFAppState().update(() {});
                                              Navigator.pushReplacement(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  reverseDuration: Duration(
                                                      milliseconds: 300),
                                                  child:
                                                      TimeSlotSelectionWidget(),
                                                ),
                                              );
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            } else {
                                              Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType
                                                      .bottomToTop,
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  reverseDuration: Duration(
                                                      milliseconds: 300),
                                                  child: LoginScreenWidget(),
                                                ),
                                              );
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                          },
                                          text: 'Κλείνω ραντεβού',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFF04D35C),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
