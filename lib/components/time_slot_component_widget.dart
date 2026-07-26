import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/appointment_process/questions/intro_question/intro_question_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'time_slot_component_model.dart';
export 'time_slot_component_model.dart';

class TimeSlotComponentWidget extends StatefulWidget {
  const TimeSlotComponentWidget({
    super.key,
    this.currentEvent,
    this.timerTime,
    this.color,
    this.currentBloodAppointment,
    required this.forUpdate,
  });

  final DocumentReference? currentEvent;
  final int? timerTime;
  final Color? color;
  final DocumentReference? currentBloodAppointment;
  final bool? forUpdate;

  @override
  State<TimeSlotComponentWidget> createState() =>
      _TimeSlotComponentWidgetState();
}

class _TimeSlotComponentWidgetState extends State<TimeSlotComponentWidget> {
  late TimeSlotComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeSlotComponentModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: StreamBuilder<List<BloodAppointmentRecord>>(
            stream: queryBloodAppointmentRecord(
              queryBuilder: (bloodAppointmentRecord) =>
                  bloodAppointmentRecord.where(
                'RelatedEvent',
                isEqualTo: widget.currentEvent,
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
              List<BloodAppointmentRecord>
                  bloodAppointmentsBloodAppointmentRecordList = snapshot.data!;

              return Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  width: widget.forUpdate! ? double.infinity : 325.0,
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(25.0, 30.0, 25.0, 15.0),
                    child: StreamBuilder<EventsRecord>(
                      stream: EventsRecord.getDocument(widget.currentEvent!),
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

                        final columnEventsRecord = snapshot.data!;

                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child:
                                  StreamBuilder<List<TimeChunksChoicesRecord>>(
                                stream: queryTimeChunksChoicesRecord(
                                  queryBuilder: (timeChunksChoicesRecord) =>
                                      timeChunksChoicesRecord
                                          .where(
                                            'Order',
                                            isLessThanOrEqualTo:
                                                columnEventsRecord.timeRange.to,
                                          )
                                          .where(
                                            'Order',
                                            isGreaterThanOrEqualTo:
                                                columnEventsRecord
                                                    .timeRange.from,
                                          )
                                          .orderBy('Order'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 18.0,
                                        height: 18.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<TimeChunksChoicesRecord>
                                      timeslotTimeChunksChoicesRecordList =
                                      snapshot.data!;

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        timeslotTimeChunksChoicesRecordList
                                            .length,
                                    itemBuilder: (context, timeslotIndex) {
                                      final timeslotTimeChunksChoicesRecord =
                                          timeslotTimeChunksChoicesRecordList[
                                              timeslotIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 15.0),
                                        child: Builder(
                                          builder: (context) {
                                            if ((FFAppState().selectedTimeChunk ==
                                                    timeslotTimeChunksChoicesRecord
                                                        .reference) &&
                                                (functions.isSeatsFull(
                                                        bloodAppointmentsBloodAppointmentRecordList
                                                            .where((e) =>
                                                                (e.relatedEvent == columnEventsRecord.reference) &&
                                                                (e.timeOfAppointment ==
                                                                    timeslotTimeChunksChoicesRecord
                                                                        .reference) &&
                                                                (e.appointmentState ==
                                                                    'pending') &&
                                                                ((e.appointmentState == 'underCreation') &&
                                                                    (e.createdTime! <
                                                                        functions.addTime(
                                                                            getCurrentTimestamp, 0, 30)!)))
                                                            .toList()
                                                            .length,
                                                        columnEventsRecord
                                                            .seatsTotalPerTimeChunk) ==
                                                    false)) {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'TIME_SLOT_COMPONENT_COMP_Selected_ON_TAP');
                                                  FFAppState()
                                                          .selectedTimeForAppointment =
                                                      timeslotTimeChunksChoicesRecord
                                                          .timeChunks.from;
                                                  FFAppState()
                                                          .selectedTimeChunk =
                                                      timeslotTimeChunksChoicesRecord
                                                          .reference;
                                                  FFAppState().update(() {});
                                                  if (widget.forUpdate!) {
                                                    Navigator.pop(context);
                                                  } else {
                                                    Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        reverseDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    300),
                                                        child:
                                                            IntroQuestionWidget(),
                                                      ),
                                                    );
                                                  }
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 0.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 55.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFFD5CC),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            flex: 3,
                                                            child: Text(
                                                              timeslotTimeChunksChoicesRecord
                                                                  .timeChunks
                                                                  .from,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .roboto(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        22.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Container(
                                                                width: 100.0,
                                                                height: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            30.0,
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(5.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/gynecology.png',
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                25.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '${bloodAppointmentsBloodAppointmentRecordList.where((e) => (e.relatedEvent == columnEventsRecord.reference) && (e.timeOfAppointment == timeslotTimeChunksChoicesRecord.reference) && ((e.appointmentState == 'pending') || ((e.appointmentState == 'underCreation') && (functions.addTime(e.createdTime, 0, FFAppConstants.WaitTimeForAppointment)! >= getCurrentTimestamp)))).toList().length.toString()}/${columnEventsRecord.seatsTotalPerTimeChunk.toString()}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.roboto(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        7.5,
                                                                        0.0,
                                                                        7.5,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .navigate_next_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            } else if (functions.isSeatsFull(
                                                    bloodAppointmentsBloodAppointmentRecordList
                                                        .where((e) => (e.relatedEvent == columnEventsRecord.reference) && (e.timeOfAppointment == timeslotTimeChunksChoicesRecord.reference) && ((e.appointmentState == 'pending') || ((e.appointmentState == 'underCreation') && (functions.addTime(e.createdTime, 0, 30)! >= getCurrentTimestamp))))
                                                        .toList()
                                                        .length,
                                                    columnEventsRecord.seatsTotalPerTimeChunk) &&
                                                (FFAppState().selectedTimeChunk != timeslotTimeChunksChoicesRecord.reference)) {
                                              return Opacity(
                                                opacity: 0.3,
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 0.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 55.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFFD5CC),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  40.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              timeslotTimeChunksChoicesRecord
                                                                  .timeChunks
                                                                  .from,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .roboto(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        22.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Container(
                                                                width: 100.0,
                                                                height: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            30.0,
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(5.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/gynecology.png',
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                25.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '${bloodAppointmentsBloodAppointmentRecordList.where((e) => (e.relatedEvent == columnEventsRecord.reference) && (e.timeOfAppointment == timeslotTimeChunksChoicesRecord.reference) && ((e.appointmentState == 'pending') || ((e.appointmentState == 'underCreation') && (functions.addTime(e.createdTime, 0, FFAppConstants.WaitTimeForAppointment)! >= getCurrentTimestamp)))).toList().length.toString()}/${columnEventsRecord.seatsTotalPerTimeChunk.toString()}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.roboto(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'TIME_SLOT_COMPONENT_Available_ON_TAP');
                                                  FFAppState()
                                                          .selectedTimeForAppointment =
                                                      timeslotTimeChunksChoicesRecord
                                                          .timeChunks.from;
                                                  FFAppState()
                                                          .selectedTimeChunk =
                                                      timeslotTimeChunksChoicesRecord
                                                          .reference;
                                                  FFAppState().update(() {});
                                                  if (widget.forUpdate!) {
                                                    _model.currentBloodAppointment =
                                                        await BloodAppointmentRecord
                                                            .getDocumentOnce(widget
                                                                .currentBloodAppointment!);

                                                    await _model
                                                        .currentBloodAppointment!
                                                        .reference
                                                        .update(
                                                            createBloodAppointmentRecordData(
                                                      timeOfAppointment:
                                                          timeslotTimeChunksChoicesRecord
                                                              .reference,
                                                    ));
                                                    Navigator.pop(context);
                                                  } else {
                                                    FFAppState().Timer =
                                                        widget.timerTime!;
                                                    safeSetState(() {});

                                                    await FFAppState()
                                                        .inCreationBloodAppointment!
                                                        .update(
                                                            createBloodAppointmentRecordData(
                                                          timeOfAppointment:
                                                              timeslotTimeChunksChoicesRecord
                                                                  .reference,
                                                        ));
                                                    Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        reverseDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    300),
                                                        child:
                                                            IntroQuestionWidget(),
                                                      ),
                                                    );
                                                  }

                                                  safeSetState(() {});
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 0.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 55.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFFD5CC),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            flex: 3,
                                                            child: Text(
                                                              timeslotTimeChunksChoicesRecord
                                                                  .timeChunks
                                                                  .from,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .roboto(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        22.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Container(
                                                                width: 100.0,
                                                                height: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            30.0,
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(5.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/gynecology.png',
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                25.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '${bloodAppointmentsBloodAppointmentRecordList.where((e) => (e.relatedEvent == columnEventsRecord.reference) && (e.timeOfAppointment == timeslotTimeChunksChoicesRecord.reference) && ((e.appointmentState == 'pending') || ((e.appointmentState == 'underCreation') && (functions.addTime(e.createdTime, 0, FFAppConstants.WaitTimeForAppointment)! >= getCurrentTimestamp)))).toList().length.toString()}/${columnEventsRecord.seatsTotalPerTimeChunk.toString()}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.roboto(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        7.5,
                                                                        0.0,
                                                                        7.5,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .navigate_next_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
