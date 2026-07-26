import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home_page/home_page/home_page_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'visitor_loading_model.dart';
export 'visitor_loading_model.dart';

class VisitorLoadingWidget extends StatefulWidget {
  const VisitorLoadingWidget({super.key});

  static String routeName = 'VisitorLoading';
  static String routePath = '/visitorLoading';

  @override
  State<VisitorLoadingWidget> createState() => _VisitorLoadingWidgetState();
}

class _VisitorLoadingWidgetState extends State<VisitorLoadingWidget> {
  late VisitorLoadingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VisitorLoadingModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VisitorLoading'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VISITOR_LOADING_VisitorLoading_ON_INIT_S');
      FFAppState().CurrentRegion = '';
      FFAppState().startDate = functions.getTodayDate();
      FFAppState().endDate =
          functions.addDaysToDate(30, functions.getTodayDate());
      FFAppState().initialValueForHomePage = 'Λίστα';
      FFAppState().IsEventsInRegion = true;
      FFAppState().SearchStateMyAppointment = 'searching';
      FFAppState().progressBarValue = 0;
      FFAppState().progressBarDescription = 'Ξεκινάμε...';
      FFAppState().update(() {});
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 300),
          reverseDuration: Duration(milliseconds: 300),
          child: HomePageWidget(),
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
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
              image: Image.network(
                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-6o5lnp/assets/o9p0nmab3o3s/Slpashscreen.png',
              ).image,
            ),
          ),
        ),
      ),
    );
  }
}
