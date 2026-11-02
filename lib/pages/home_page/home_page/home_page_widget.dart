import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/appointment_details/appointment_details_widget.dart';
import '/components/footer/footer_widget.dart';
import '/components/new_update_available_copy/new_update_available_copy_widget.dart';
import '/components/pop_up_message/pop_up_message_widget.dart';
import '/empty_list_widgets/no_events/no_events_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/home_page/filter_page/filter_page_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
    bool? fromFilter,
    this.updatedlater2,
  }) : this.fromFilter = fromFilter ?? false;

  final bool fromFilter;
  final bool? updatedlater2;

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_INIT_STATE');
      FFAppState().progressBarValue = 0;
      FFAppState().progressBarDescription = 'Ξεκινάμε...';
      safeSetState(() {});
      if (loggedIn) {
        await action_blocks.checkBloodAppointmentNumber(context);
        if (valueOrDefault(currentUserDocument?.inAppointment, '') !=
            'first_appointment') {
          await action_blocks.checkLastAppointmentEvent(context);
          safeSetState(() {});
          _model.recheckPendingAppointment =
              await action_blocks.checkPendingAppointmentAfter5Days(context);
        }
      } else {
        _model.appPackageVersion1 = await actions.appPackageInfo();
        if ((isiOS
                ? ((int appPackageVersion, int firebaseLastVersion) {
                    return appPackageVersion >= firebaseLastVersion;
                  }(
                    functions.convertStringToInt(_model.appPackageVersion1)!,
                    functions.convertStringToInt(
                        getRemoteConfigString('StoresAppVersion'))!))
                : ((int appPackageVersion, int firebaseLastVersion) {
                    return appPackageVersion >= firebaseLastVersion;
                  }(
                    functions.convertStringToInt(_model.appPackageVersion1)!,
                    functions.convertStringToInt(
                        getRemoteConfigString('PlayStoreAppVersion'))!))) ||
            (FFAppState().updateLater == true)) {
          FFAppState().startDate = functions.getTodayDate();
          FFAppState().endDate =
              functions.addDaysToDate(30, functions.getTodayDate());
          FFAppState().initialValueForHomePage = 'Λίστα';
          FFAppState().IsEventsInRegion = true;
          FFAppState().SearchStateMyAppointment = 'searching';
          FFAppState().progressBarValue = 0;
          FFAppState().progressBarDescription = 'Ξεκινάμε...';
          FFAppState().update(() {});
        } else {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: FlutterFlowTheme.of(context).popUpBackground,
            barrierColor: Color(0x00000000),
            enableDrag: false,
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: NewUpdateAvailableCopyWidget(
                    fromPage: 'homePage',
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));

          return;
        }
      }
    });

    _model.textController ??= TextEditingController();

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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0.0,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 60.0, 15.0, 15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).transparent,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Εξορμήσεις',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              font: GoogleFonts.roboto(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontStyle,
                                              ),
                                              fontSize: 28.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(6.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  EventsRecord>>(
                                                            stream:
                                                                queryEventsRecord(
                                                              queryBuilder:
                                                                  (eventsRecord) =>
                                                                      eventsRecord
                                                                          .orderBy(
                                                                              'EventDate'),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 18.0,
                                                                    height:
                                                                        18.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<EventsRecord>
                                                                  textFieldEventsRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return Autocomplete<
                                                                  String>(
                                                                initialValue:
                                                                    TextEditingValue(),
                                                                optionsBuilder:
                                                                    (textEditingValue) {
                                                                  if (textEditingValue
                                                                          .text ==
                                                                      '') {
                                                                    return const Iterable<
                                                                        String>.empty();
                                                                  }
                                                                  return textFieldEventsRecordList
                                                                      .where((e) =>
                                                                          functions.showSearchResult(
                                                                              FFAppState()
                                                                                  .CurrentRegion,
                                                                              e.address
                                                                                  .region) &&
                                                                          (e.eventDate! >=
                                                                              FFAppState()
                                                                                  .startDate!) &&
                                                                          (e.eventDate! <=
                                                                              FFAppState()
                                                                                  .endDate!))
                                                                      .toList()
                                                                      .map((e) => e
                                                                          .nameOfEvent)
                                                                      .toList()
                                                                      .where(
                                                                          (option) {
                                                                    final lowercaseOption =
                                                                        option
                                                                            .toLowerCase();
                                                                    return lowercaseOption.contains(
                                                                        textEditingValue
                                                                            .text
                                                                            .toLowerCase());
                                                                  });
                                                                },
                                                                optionsViewBuilder:
                                                                    (context,
                                                                        onSelected,
                                                                        options) {
                                                                  return AutocompleteOptionsList(
                                                                    textFieldKey:
                                                                        _model
                                                                            .textFieldKey,
                                                                    textController:
                                                                        _model
                                                                            .textController!,
                                                                    options: options
                                                                        .toList(),
                                                                    onSelected:
                                                                        onSelected,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.roboto(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    textHighlightStyle:
                                                                        TextStyle(),
                                                                    elevation:
                                                                        4.0,
                                                                    optionBackgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    optionHighlightColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    maxHeight:
                                                                        200.0,
                                                                  );
                                                                },
                                                                onSelected: (String
                                                                    selection) {
                                                                  safeSetState(() =>
                                                                      _model.textFieldSelectedOption =
                                                                          selection);
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus();
                                                                },
                                                                fieldViewBuilder:
                                                                    (
                                                                  context,
                                                                  textEditingController,
                                                                  focusNode,
                                                                  onEditingComplete,
                                                                ) {
                                                                  _model.textFieldFocusNode =
                                                                      focusNode;

                                                                  _model.textController =
                                                                      textEditingController;
                                                                  return TextFormField(
                                                                    key: _model
                                                                        .textFieldKey,
                                                                    controller:
                                                                        textEditingController,
                                                                    focusNode:
                                                                        focusNode,
                                                                    onEditingComplete:
                                                                        onEditingComplete,
                                                                    onChanged: (_) =>
                                                                        EasyDebounce
                                                                            .debounce(
                                                                      '_model.textController',
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                      () => safeSetState(
                                                                          () {}),
                                                                    ),
                                                                    autofocus:
                                                                        false,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      hintText:
                                                                          '\'Ονομα αιμοδοσίας',
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.roboto(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      prefixIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .search,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.roboto(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    cursorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                    validator: _model
                                                                        .textControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 0.0,
                                                        buttonSize: 38.0,
                                                        fillColor:
                                                            Color(0xFFF7ECEA),
                                                        icon: FaIcon(
                                                          FaIconData(const IconData(
                                                              /* slidersH */ 0xf1de,
                                                              fontFamily:
                                                                  'FontAwesomeSolid',
                                                              fontPackage:
                                                                  'font_awesome_flutter')),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 15.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'HOME_PAGE_PAGE_slidersH_ICN_ON_TAP');
                                                          Navigator.push(
                                                            context,
                                                            PageTransition(
                                                              type: PageTransitionType
                                                                  .bottomToTop,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      300),
                                                              reverseDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          300),
                                                              child:
                                                                  FilterPageWidget(
                                                                fromMap: _model
                                                                            .choiceChipsValue ==
                                                                        'Χάρτης'
                                                                    ? true
                                                                    : false,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  if ((FFAppState()
                                                                  .CurrentRegion !=
                                                              '') ||
                                                      ((FFAppState()
                                                                  .startDate !=
                                                              null) &&
                                                          (FFAppState()
                                                                  .endDate !=
                                                              null)))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  6.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Divider(
                                                            height: 0.0,
                                                            thickness: 1.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: InkWell(
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
                                                                    'HOME_PAGE_PAGE_Filters_ON_TAP');
                                                                Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                    type: PageTransitionType
                                                                        .bottomToTop,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            300),
                                                                    reverseDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                300),
                                                                    child:
                                                                        FilterPageWidget(),
                                                                  ),
                                                                );
                                                              },
                                                              child:
                                                                  SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    if (FFAppState().CurrentRegion !=
                                                                            '')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(5.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.location_on,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 20.0,
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      FFAppState().CurrentRegion,
                                                                                      style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                            font: GoogleFonts.roboto(
                                                                                              fontWeight: FlutterFlowTheme.of(context).displaySmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                                            ),
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).displaySmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if ((FFAppState().startDate !=
                                                                            null) &&
                                                                        (FFAppState().endDate !=
                                                                            null))
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(5.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.date_range,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 20.0,
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                child: RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: dateTimeFormat(
                                                                                          "d/M/y",
                                                                                          FFAppState().startDate,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        style: TextStyle(),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: ' - ',
                                                                                        style: TextStyle(),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: dateTimeFormat(
                                                                                          "d/M/y",
                                                                                          FFAppState().endDate,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        style: TextStyle(),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.roboto(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                  maxLines: 1,
                                                                                ),
                                                                              ),
                                                                            ],
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
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
              ],
            ),
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional(0.0, -1.0),
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Builder(
                      builder: (context) {
                        if (_model.choiceChipsValue == 'Λίστα') {
                          return StreamBuilder<List<EventsRecord>>(
                            stream: queryEventsRecord(
                              queryBuilder: (eventsRecord) => eventsRecord
                                  .where(
                                    'EventDate',
                                    isGreaterThanOrEqualTo:
                                        FFAppState().startDate != null
                                            ? FFAppState().startDate
                                            : functions.getTodayDate(),
                                  )
                                  .where(
                                    'EventDate',
                                    isLessThanOrEqualTo: FFAppState().endDate,
                                  )
                                  .orderBy('EventDate', descending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<EventsRecord> listEventsRecordList =
                                  snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).transparent,
                                ),
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 140.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Builder(
                                      builder: (context) {
                                        final events = listEventsRecordList
                                            .where((e) => valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.isDeveloper,
                                                    false)
                                                ? (functions.showSearchResult(
                                                        _model.textController
                                                            .text,
                                                        e.nameOfEvent) &&
                                                    functions.showSearchResult(
                                                        FFAppState()
                                                            .CurrentRegion,
                                                        e.address.region))
                                                : (functions.showSearchResult(
                                                        _model.textController
                                                            .text,
                                                        e.nameOfEvent) &&
                                                    functions.showSearchResult(
                                                        FFAppState().CurrentRegion, e.address.region) &&
                                                    (e.developerMode == false) &&
                                                    (e.eventState == 'active')))
                                            .toList();
                                        if (events.isEmpty) {
                                          return Center(
                                            child: NoEventsWidget(),
                                          );
                                        }

                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: List.generate(
                                                events.length, (eventsIndex) {
                                              final eventsItem =
                                                  events[eventsIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'HOME_PAGE_PAGE_Event_ON_TAP');
                                                  FFAppState().selectedEvent =
                                                      eventsItem.reference;
                                                  FFAppState().update(() {});
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .popUpBackground,
                                                    barrierColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .popUpBackground,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              AppointmentDetailsWidget(
                                                            selectedEvent:
                                                                eventsItem,
                                                            lastAppointmentState:
                                                                FFAppState()
                                                                    .LastAppointmentState,
                                                            lastEventDate:
                                                                FFAppState()
                                                                    .LastEventDate,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Stack(
                                                  key: ValueKey('Event_wmmk'),
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  10.0),
                                                      child: StreamBuilder<
                                                          List<
                                                              BloodAppointmentRecord>>(
                                                        stream:
                                                            queryBloodAppointmentRecord(
                                                          queryBuilder:
                                                              (bloodAppointmentRecord) =>
                                                                  bloodAppointmentRecord
                                                                      .where(
                                                            'RelatedEvent',
                                                            isEqualTo:
                                                                eventsItem
                                                                    .reference,
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<BloodAppointmentRecord>
                                                              eventCardBloodAppointmentRecordList =
                                                              snapshot.data!;

                                                          return Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: double
                                                                  .infinity,
                                                              maxHeight: double
                                                                  .infinity,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          20.0,
                                                                          10.0,
                                                                          20.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            58.0,
                                                                        height:
                                                                            58.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x33F79E8F),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(3.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.3,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).width * 0.3,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                CachedNetworkImage(
                                                                              fadeInDuration: Duration(milliseconds: 500),
                                                                              fadeOutDuration: Duration(milliseconds: 500),
                                                                              imageUrl: 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-6o5lnp/assets/51y2498f5q1o/Dinoume_Aima_App_LOGO.png',
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              15.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                child: RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: valueOrDefault<String>(
                                                                                          functions.translateDayToGreek(eventsItem.eventDate),
                                                                                          '-',
                                                                                        ),
                                                                                        style: TextStyle(),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: ' ',
                                                                                        style: TextStyle(),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: dateTimeFormat(
                                                                                          "yMd",
                                                                                          eventsItem.eventDate!,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        style: TextStyle(),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.roboto(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Flexible(
                                                                                    child: Text(
                                                                                      eventsItem.nameOfEvent,
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                            font: GoogleFonts.roboto(
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                                            ),
                                                                                            fontSize: 20.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  if (eventsItem.developerMode == true)
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                      child: FaIcon(
                                                                                        FaIconData(const IconData(/* code */ 0xf121, fontFamily: 'FontAwesomeSolid', fontPackage: 'font_awesome_flutter')),
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 16.0,
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  '${eventsItem.address.streetAndNumber}, ${eventsItem.address.city} ${eventsItem.address.postalCode}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.roboto(
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).grayIcon,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).transparent,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                          child: LinearPercentIndicator(
                                                                                            percent: functions.convertToPercentage(
                                                                                                valueOrDefault<double>(
                                                                                                  (eventCardBloodAppointmentRecordList.where((e) => (e.appointmentState == 'pending') || (e.appointmentState == 'completed')).toList().unique((e) => e.parentReference).length + eventCardBloodAppointmentRecordList.unique((e) => e.parentReference).where((e) => (e.appointmentState == 'underCreation') && (getCurrentTimestamp <= functions.addTime(e.createdTime, 0, FFAppConstants.WaitTimeForAppointment)!)).toList().length).toDouble(),
                                                                                                  0.0,
                                                                                                ),
                                                                                                eventsItem.seatsMax.toDouble()),
                                                                                            width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                            lineHeight: 12.0,
                                                                                            animation: true,
                                                                                            animateFromLastPercent: true,
                                                                                            progressColor: FlutterFlowTheme.of(context).primary,
                                                                                            backgroundColor: Color(0xFFF2F2F2),
                                                                                            barRadius: Radius.circular(20.0),
                                                                                            padding: EdgeInsets.zero,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: RichText(
                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: valueOrDefault<String>(
                                                                                                  (eventCardBloodAppointmentRecordList.where((e) => (e.appointmentState == 'pending') || (e.appointmentState == 'completed')).toList().unique((e) => e.parentReference).length + eventCardBloodAppointmentRecordList.where((e) => (e.appointmentState == 'underCreation') && (getCurrentTimestamp <= functions.addTime(e.createdTime, 0, FFAppConstants.WaitTimeForAppointment)!)).toList().unique((e) => e.parentReference).length).toString(),
                                                                                                  '0',
                                                                                                ),
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: '/',
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: eventsItem.seatsMax.toString(),
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: ' θέσεις',
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).black600,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                            style: TextStyle(
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontSize: 12.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .chevron_right_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            28.0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        BloodAppointmentRecord>>(
                                                                  stream:
                                                                      queryBloodAppointmentRecord(
                                                                    parent:
                                                                        currentUserReference,
                                                                    queryBuilder: (bloodAppointmentRecord) =>
                                                                        bloodAppointmentRecord
                                                                            .where(
                                                                              'appointmentState',
                                                                              isEqualTo: 'underCreation',
                                                                            )
                                                                            .where(
                                                                              'RelatedEvent',
                                                                              isEqualTo: eventsItem.reference,
                                                                            ),
                                                                    singleRecord:
                                                                        true,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              18.0,
                                                                          height:
                                                                              18.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<BloodAppointmentRecord>
                                                                        rowBloodAppointmentRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    // Return an empty Container when the item does not exist.
                                                                    if (snapshot
                                                                        .data!
                                                                        .isEmpty) {
                                                                      return Container();
                                                                    }
                                                                    final rowBloodAppointmentRecord = rowBloodAppointmentRecordList
                                                                            .isNotEmpty
                                                                        ? rowBloodAppointmentRecordList
                                                                            .first
                                                                        : null;

                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if ((functions.compare2dates(functions.addTime(rowBloodAppointmentRecord?.createdTime, 0, rowBloodAppointmentRecord?.counterTime)!, getCurrentTimestamp) ==
                                                                                true) &&
                                                                            (rowBloodAppointmentRecord?.appointmentState ==
                                                                                'underCreation'))
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x59F48C7C),
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(15.0),
                                                                                  bottomRight: Radius.circular(15.0),
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 5.0, 5.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 6,
                                                                                      child: RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: 'Έχεις 1 κλειδωμένη θέση μέχρι της ',
                                                                                              style: TextStyle(),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: dateTimeFormat(
                                                                                                "Hm",
                                                                                                functions.addTime(rowBloodAppointmentRecord?.createdTime, 0, rowBloodAppointmentRecord?.counterTime),
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              ),
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.roboto(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        textAlign: TextAlign.center,
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 2,
                                                                                      child: FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          logFirebaseEvent('HOME_PAGE_PAGE__BTN_ON_TAP');
                                                                                          FFAppState().selectedEvent = eventsItem.reference;
                                                                                          safeSetState(() {});
                                                                                          await showModalBottomSheet(
                                                                                            isScrollControlled: true,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            enableDrag: false,
                                                                                            context: context,
                                                                                            builder: (context) {
                                                                                              return GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(context).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: Padding(
                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                  child: PopUpMessageWidget(
                                                                                                    message: 'Ελευθέρωση θέσης',
                                                                                                    button1Text: 'Ναι',
                                                                                                    button2Text: 'Οχι',
                                                                                                    description: 'Είσαι σίγουρος πως θέλεις να ελευθερώσεις τη θέση σου;',
                                                                                                    actionName: 'deleteLockedSeat',
                                                                                                    appointment: rowBloodAppointmentRecord?.reference,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ).then((value) => safeSetState(() {}));
                                                                                        },
                                                                                        text: 'Διαγραφή',
                                                                                        options: FFButtonOptions(
                                                                                          height: 20.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: Colors.transparent,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                font: GoogleFonts.roboto(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (((valueOrDefault(
                                        currentUserDocument?.inAppointment,
                                        '') !=
                                    'first_appointment') &&
                                ((currentUserDocument?.eventsPaticipated
                                                .toList() ??
                                            [])
                                        .length >=
                                    1)) &&
                            ((FFAppState()
                                        .LastEventDate
                                        ?.microsecondsSinceEpoch ==
                                    null) &&
                                (FFAppState().LastAppointmentState == '') &&
                                (FFAppState().LastAppointmentRef?.id == null ||
                                    FFAppState().LastAppointmentRef?.id ==
                                        ''))) {
                          return Lottie.asset(
                            'assets/jsons/Loading....json',
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 130.0,
                            fit: BoxFit.cover,
                            animate: true,
                          );
                        } else {
                          return StreamBuilder<List<EventsRecord>>(
                            stream: queryEventsRecord(
                              queryBuilder: (eventsRecord) => eventsRecord
                                  .where(
                                    'eventState',
                                    isEqualTo: 'active',
                                  )
                                  .where(
                                    'EventDate',
                                    isGreaterThanOrEqualTo:
                                        FFAppState().startDate != null
                                            ? FFAppState().startDate
                                            : functions.getTodayDate(),
                                  )
                                  .where(
                                    'EventDate',
                                    isLessThanOrEqualTo: FFAppState().endDate,
                                  )
                                  .where(
                                    'DeveloperMode',
                                    isEqualTo: false,
                                  )
                                  .orderBy('EventDate'),
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
                              List<EventsRecord> googleMapEventsRecordList =
                                  snapshot.data!;

                              return FlutterFlowGoogleMap(
                                controller: _model.googleMapsController,
                                onCameraIdle: (latLng) => safeSetState(
                                    () => _model.googleMapsCenter = latLng),
                                initialLocation: _model.googleMapsCenter ??=
                                    LatLng(37.96541, 23.72466),
                                markers: googleMapEventsRecordList
                                    .where((e) =>
                                        functions.showSearchResult(
                                            _model.textController.text,
                                            e.nameOfEvent) &&
                                        functions.showSearchResult(
                                            FFAppState().CurrentRegion,
                                            e.address.region))
                                    .toList()
                                    .map(
                                      (marker) => FlutterFlowMarker(
                                        marker.reference.path,
                                        marker.location!,
                                        () async {
                                          logFirebaseEvent(
                                              'HOME_GoogleMap_a35tds12_ON_MARKER_TAP');
                                          FFAppState().selectedEvent =
                                              marker.reference;
                                          FFAppState().update(() {});
                                          _model.countBloodAppointmenMap =
                                              await queryBloodAppointmentRecordCount(
                                            parent: currentUserReference,
                                          );
                                          if (_model.countBloodAppointmenMap! >
                                              0) {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .popUpBackground,
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .popUpBackground,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        AppointmentDetailsWidget(
                                                      selectedEvent: marker,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          } else {
                                            _model.appointmentStateMap =
                                                await actions
                                                    .eventDateOfLastAppointment(
                                              currentUserUid,
                                            );
                                            _model.lastEventDateMap =
                                                await actions
                                                    .eventDateOfLastAppointment(
                                              currentUserUid,
                                            );
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .popUpBackground,
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .popUpBackground,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        AppointmentDetailsWidget(
                                                      selectedEvent: marker,
                                                      lastAppointmentState: _model
                                                          .appointmentStateMap
                                                          ?.toString(),
                                                      lastEventDate: _model
                                                          .lastEventDateMap,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }

                                          safeSetState(() {});
                                        },
                                      ),
                                    )
                                    .toList(),
                                markerColor: GoogleMarkerColor.red,
                                mapType: MapType.normal,
                                style: GoogleMapStyle.standard,
                                initialZoom: 14.0,
                                allowInteraction: true,
                                allowZoom: true,
                                showZoomControls: false,
                                showLocation: true,
                                showCompass: false,
                                showMapToolbar: false,
                                showTraffic: false,
                                centerMapOnMarkerTap: true,
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: PointerInterceptor(
                      intercepting: isWeb,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 15.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 13.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: FlutterFlowChoiceChips(
                                            options: [
                                              ChipData(
                                                  'Λίστα',
                                                  const IconData(
                                                      /* alignJustify */ 0xf039,
                                                      fontFamily:
                                                          'FontAwesomeSolid',
                                                      fontPackage:
                                                          'font_awesome_flutter')),
                                              ChipData(
                                                  'Χάρτης',
                                                  const IconData(
                                                      /* map */ 0xf279,
                                                      fontFamily:
                                                          'FontAwesomeRegular',
                                                      fontPackage:
                                                          'font_awesome_flutter'))
                                            ],
                                            onChanged: (val) => safeSetState(
                                                () => _model.choiceChipsValue =
                                                    val?.firstOrNull),
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
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
                                                        color: Colors.white,
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
                                              iconColor: Colors.white,
                                              iconSize: 10.0,
                                              labelPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 10.0, 2.0),
                                              elevation: 4.0,
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor: Colors.white,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    font: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF323B45),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontStyle,
                                                  ),
                                              iconColor: Color(0xFF323B45),
                                              iconSize: 13.0,
                                              elevation: 0.0,
                                            ),
                                            chipSpacing: 8.0,
                                            rowSpacing: 12.0,
                                            multiselect: false,
                                            initialized:
                                                _model.choiceChipsValue != null,
                                            alignment: WrapAlignment.center,
                                            controller: _model
                                                    .choiceChipsValueController ??=
                                                FormFieldController<
                                                    List<String>>(
                                              [
                                                valueOrDefault<String>(
                                                  FFAppState()
                                                      .initialValueForHomePage,
                                                  'Λίστα',
                                                )
                                              ],
                                            ),
                                            wrapped: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.footerModel,
                              updateCallback: () => safeSetState(() {}),
                              child: FooterWidget(
                                oneBackColor: Color(0x33FF7E67),
                                twoIcon:
                                    FlutterFlowTheme.of(context).secondaryText,
                                twoBackColor:
                                    FlutterFlowTheme.of(context).transparent,
                                threeIcon:
                                    FlutterFlowTheme.of(context).secondaryText,
                                threeBackColor:
                                    FlutterFlowTheme.of(context).transparent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
