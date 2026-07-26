import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_time_slot_model.dart';
export 'change_time_slot_model.dart';

class ChangeTimeSlotWidget extends StatefulWidget {
  const ChangeTimeSlotWidget({
    super.key,
    this.eventRef,
    this.appointmentRef,
    this.isAppointmentCreated,
    this.timeOfAppointment,
  });

  final EventsRecord? eventRef;
  final DocumentReference? appointmentRef;
  final bool? isAppointmentCreated;
  final DocumentReference? timeOfAppointment;

  static String routeName = 'ChangeTimeSlot';
  static String routePath = '/changeTimeSlot';

  @override
  State<ChangeTimeSlotWidget> createState() => _ChangeTimeSlotWidgetState();
}

class _ChangeTimeSlotWidgetState extends State<ChangeTimeSlotWidget> {
  late ChangeTimeSlotModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangeTimeSlotModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ChangeTimeSlot'});
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

    return StreamBuilder<BloodAppointmentRecord>(
      stream: BloodAppointmentRecord.getDocument(widget.appointmentRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
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

        final changeTimeSlotBloodAppointmentRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'CHANGE_TIME_SLOT_PAGE___BTN_ON_TAP');
                          Navigator.pop(context);
                        },
                        text: 'Διαθέσιμα ωράρια',
                        icon: Icon(
                          Icons.chevron_left,
                          size: 35.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconColor: FlutterFlowTheme.of(context).black600,
                          color: Colors.transparent,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                font: GoogleFonts.roboto(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).black600,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: StreamBuilder<List<BloodAppointmentRecord>>(
                        stream: queryBloodAppointmentRecord(
                          queryBuilder: (bloodAppointmentRecord) =>
                              bloodAppointmentRecord.where(
                            'RelatedEvent',
                            isEqualTo: widget.eventRef?.reference,
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
                              bloodAppointmentsBloodAppointmentRecordList =
                              snapshot.data!;

                          return Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              width: 325.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 30.0, 25.0, 15.0),
                                child: StreamBuilder<EventsRecord>(
                                  stream: EventsRecord.getDocument(
                                      widget.eventRef!.reference),
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

                                    final selectedEventEventsRecord =
                                        snapshot.data!;

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: StreamBuilder<
                                              List<TimeChunksChoicesRecord>>(
                                            stream:
                                                queryTimeChunksChoicesRecord(
                                              queryBuilder:
                                                  (timeChunksChoicesRecord) =>
                                                      timeChunksChoicesRecord
                                                          .where(
                                                            'Order',
                                                            isLessThanOrEqualTo:
                                                                selectedEventEventsRecord
                                                                    .timeRange
                                                                    .to,
                                                          )
                                                          .where(
                                                            'Order',
                                                            isGreaterThanOrEqualTo:
                                                                selectedEventEventsRecord
                                                                    .timeRange
                                                                    .from,
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
                                                itemBuilder:
                                                    (context, timeslotIndex) {
                                                  final timeslotTimeChunksChoicesRecord =
                                                      timeslotTimeChunksChoicesRecordList[
                                                          timeslotIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 15.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if ((FFAppState()
                                                                    .selectedTimeChunk ==
                                                                timeslotTimeChunksChoicesRecord
                                                                    .reference) &&
                                                            (functions.isSeatsFull(bloodAppointmentsBloodAppointmentRecordList.where((e) => (e.relatedEvent == selectedEventEventsRecord.reference) && (e.timeOfAppointment == timeslotTimeChunksChoicesRecord.reference) && ((e.appointmentState == 'pending') || (e.appointmentState == 'completed')) && ((e.appointmentState == 'underCreation') && (e.createdTime! < functions.addTime(getCurrentTimestamp, 0, 30)!))).toList().length, selectedEventEventsRecord.seatsTotalPerTimeChunk) ==
                                                                false)) {
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'CHANGE_TIME_SLOT_PAGE_Selected_ON_TAP');
                                                              FFAppState()
                                                                      .selectedTimeForAppointment =
                                                                  timeslotTimeChunksChoicesRecord
                                                                      .timeChunks
                                                                      .from;
                                                              FFAppState()
                                                                      .selectedTimeChunk =
                                                                  timeslotTimeChunksChoicesRecord
                                                                      .reference;
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 0.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 55.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFFFD5CC),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 2.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 3,
                                                                        child:
                                                                            Text(
                                                                          timeslotTimeChunksChoicesRecord
                                                                              .timeChunks
                                                                              .from,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.roboto(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 22.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 3,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 30.0,
                                                                                    height: 30.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(5.0),
                                                                                      child: Image.asset(
                                                                                        'assets/images/gynecology.png',
                                                                                        width: 20.0,
                                                                                        height: 25.0,
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                    child: Text(
                                                                                      '${bloodAppointmentsBloodAppointmentRecordList.where((e) => (e.relatedEvent == selectedEventEventsRecord.reference) && (e.timeOfAppointment == timeslotTimeChunksChoicesRecord.reference) && ((((e.appointmentState == 'pending') || (e.appointmentState == 'completed')) || ((e.appointmentState == 'underCreation') && (functions.addTime(e.createdTime, 0, FFAppConstants.WaitTimeForAppointment)! >= getCurrentTimestamp))) || ((e.appointmentState == 'underCreation') && (functions.addTime(e.createdTime, 0, FFAppConstants.WaitTimeForAppointment)! >= getCurrentTimestamp)))).toList().length.toString()}/${selectedEventEventsRecord.seatsTotalPerTimeChunk.toString()}',
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            7.5,
                                                                            0.0,
                                                                            7.5,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .navigate_next_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              20.0,
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
                                                                    .where((e) =>
                                                                        (e.relatedEvent == selectedEventEventsRecord.reference) &&
                                                                        (e.timeOfAppointment ==
                                                                            timeslotTimeChunksChoicesRecord
                                                                                .reference) &&
                                                                        (((e.appointmentState == 'pending') || (e.appointmentState == 'completed')) ||
                                                                            ((e.appointmentState == 'underCreation') &&
                                                                                (functions.addTime(e.createdTime, 0, 30)! >=
                                                                                    getCurrentTimestamp))))
                                                                    .toList()
                                                                    .length,
                                                                selectedEventEventsRecord
                                                                    .seatsTotalPerTimeChunk) &&
                                                            (FFAppState()
                                                                    .selectedTimeChunk !=
                                                                timeslotTimeChunksChoicesRecord
                                                                    .reference)) {
                                                          return Opacity(
                                                            opacity: 0.3,
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 0.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 55.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFFFD5CC),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          40.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          timeslotTimeChunksChoicesRecord
                                                                              .timeChunks
                                                                              .from,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.roboto(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 22.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 30.0,
                                                                                    height: 30.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(5.0),
                                                                                      child: Image.asset(
                                                                                        'assets/images/gynecology.png',
                                                                                        width: 20.0,
                                                                                        height: 25.0,
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                    child: Text(
                                                                                      '${bloodAppointmentsBloodAppointmentRecordList.where((e) => (e.relatedEvent == selectedEventEventsRecord.reference) && (e.timeOfAppointment == timeslotTimeChunksChoicesRecord.reference) && ((((e.appointmentState == 'pending') || (e.appointmentState == 'completed')) || ((e.appointmentState == 'underCreation') && (functions.addTime(e.createdTime, 0, FFAppConstants.WaitTimeForAppointment)! >= getCurrentTimestamp))) || ((e.appointmentState == 'underCreation') && (functions.addTime(e.createdTime, 0, FFAppConstants.WaitTimeForAppointment)! >= getCurrentTimestamp)))).toList().length.toString()}/${selectedEventEventsRecord.seatsTotalPerTimeChunk.toString()}',
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'CHANGE_TIME_SLOT_PAGE_Available_ON_TAP');
                                                              FFAppState()
                                                                      .selectedTimeForAppointment =
                                                                  timeslotTimeChunksChoicesRecord
                                                                      .timeChunks
                                                                      .from;
                                                              FFAppState()
                                                                      .selectedTimeChunk =
                                                                  timeslotTimeChunksChoicesRecord
                                                                      .reference;
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              _model.currentBloodAppointment =
                                                                  await BloodAppointmentRecord
                                                                      .getDocumentOnce(
                                                                          widget
                                                                              .appointmentRef!);

                                                              await changeTimeSlotBloodAppointmentRecord
                                                                  .reference
                                                                  .update(
                                                                      createBloodAppointmentRecordData(
                                                                timeOfAppointment:
                                                                    timeslotTimeChunksChoicesRecord
                                                                        .reference,
                                                              ));
                                                              Navigator.pop(
                                                                  context);

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 0.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 55.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFFFD5CC),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 3,
                                                                        child:
                                                                            Text(
                                                                          timeslotTimeChunksChoicesRecord
                                                                              .timeChunks
                                                                              .from,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.roboto(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 22.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 3,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 30.0,
                                                                                    height: 30.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(5.0),
                                                                                      child: Image.asset(
                                                                                        'assets/images/gynecology.png',
                                                                                        width: 20.0,
                                                                                        height: 25.0,
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                    child: Text(
                                                                                      '${bloodAppointmentsBloodAppointmentRecordList.where((e) => (e.relatedEvent == selectedEventEventsRecord.reference) && (e.timeOfAppointment == timeslotTimeChunksChoicesRecord.reference) && ((((e.appointmentState == 'pending') || (e.appointmentState == 'completed')) || ((e.appointmentState == 'underCreation') && (functions.addTime(e.createdTime, 0, FFAppConstants.WaitTimeForAppointment)! >= getCurrentTimestamp))) || ((e.appointmentState == 'underCreation') && (functions.addTime(e.createdTime, 0, FFAppConstants.WaitTimeForAppointment)! >= getCurrentTimestamp)))).toList().length.toString()}/${selectedEventEventsRecord.seatsTotalPerTimeChunk.toString()}',
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            7.5,
                                                                            0.0,
                                                                            7.5,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .navigate_next_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              20.0,
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
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
