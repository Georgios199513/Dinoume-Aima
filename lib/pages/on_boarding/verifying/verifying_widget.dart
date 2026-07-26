import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/pop_up_message/pop_up_message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/on_boarding/welcome/welcome_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verifying_model.dart';
export 'verifying_model.dart';

class VerifyingWidget extends StatefulWidget {
  const VerifyingWidget({super.key});

  static String routeName = 'Verifying';
  static String routePath = '/verifying';

  @override
  State<VerifyingWidget> createState() => _VerifyingWidgetState();
}

class _VerifyingWidgetState extends State<VerifyingWidget> {
  late VerifyingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyingModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Verifying'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VERIFYING_PAGE_Verifying_ON_INIT_STATE');
      await authManager.refreshUser();
      if ((FFAppState().VerifyingTimes == 5) &&
          (currentUserEmailVerified == true)) {
        _model.welcomeEmail = await SendWelcomeEmailCall.call(
          to: currentUserEmail,
          subject: 'Καλώς ήρθατε στo Δίνουμε Αίμα!',
          name: currentUserDisplayName,
        );

        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 300),
            reverseDuration: Duration(milliseconds: 300),
            child: WelcomeWidget(),
          ),
        );
        return;
      } else if ((FFAppState().VerifyingTimes < 5) &&
          (currentUserEmailVerified != true)) {
        await Future.delayed(
          Duration(
            milliseconds: 1000,
          ),
        );
        FFAppState().VerifyingTimes = FFAppState().VerifyingTimes + 1;
        safeSetState(() {});
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
            reverseDuration: Duration(milliseconds: 0),
            child: VerifyingWidget(),
          ),
        );
      } else {
        if ((FFAppState().VerifyingTimes == 5) &&
            (currentUserEmailVerified == false)) {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            barrierColor: Color(0x00000000),
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
                    message: 'Ο λογαριασμός σου δεν έχει επιβεβαιωθεί.',
                    description:
                        'Έχεις λάβει έναν σύνδεσμο επιβεβαίωσης στο email σου. Αν έχεις ήδη πατήσει τον σύνδεσμο που σου στέιλαμε προσπάθησε να ξανά πατήσεις το κουμπί ¨Ενεργοποίησα τον λογαριασμό μου\".',
                    button1Text: 'Ok',
                    actionName: 'verifyAccount',
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        } else {
          await Future.delayed(
            Duration(
              milliseconds: 1000,
            ),
          );
          FFAppState().VerifyingTimes = FFAppState().VerifyingTimes + 1;
          safeSetState(() {});
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
              reverseDuration: Duration(milliseconds: 0),
              child: VerifyingWidget(),
            ),
          );
        }
      }
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
              image: Image.asset(
                'assets/images/back__02_min.png',
              ).image,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -0.1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Banner-64.png',
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'Ελέγχουμε τον λογαριασμό σου…',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 1.0),
                child: Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Image.asset(
                      'assets/images/EKEA_LOGO.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
