import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/new_update_available_copy/new_update_available_copy_widget.dart';
import '/components/pop_up_message/pop_up_message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'loading_screen_model.dart';
export 'loading_screen_model.dart';

class LoadingScreenWidget extends StatefulWidget {
  const LoadingScreenWidget({super.key});

  static String routeName = 'LoadingScreen';
  static String routePath = '/loadingScreen';

  @override
  State<LoadingScreenWidget> createState() => _LoadingScreenWidgetState();
}

class _LoadingScreenWidgetState extends State<LoadingScreenWidget> {
  late LoadingScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LoadingScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOADING_SCREEN_LoadingScreen_ON_INIT_STA');
      await authManager.refreshUser();
      _model.internetSpeed = await actions.checkInternet10Mbps();
      if (FFAppState().internetConnection) {
        await Future.delayed(
          Duration(
            milliseconds: 2000,
          ),
        );
        FFAppState().CurrentRegion =
            valueOrDefault(currentUserDocument?.region, '');
        FFAppState().startDate = functions.getTodayDate();
        FFAppState().endDate =
            functions.addDaysToDate(30, functions.getTodayDate());
        FFAppState().initialValueForHomePage = 'Λίστα';
        FFAppState().IsEventsInRegion = true;
        FFAppState().SearchStateMyAppointment = 'searching';
        FFAppState().progressBarValue = 0;
        FFAppState().progressBarDescription = 'Ξεκινάμε...';
        safeSetState(() {});
        _model.appPackageVersion = await actions.appPackageInfo();
        if ((isiOS
                ? ((int appPackageVersion, int firebaseLastVersion) {
                    return appPackageVersion >= firebaseLastVersion;
                  }(
                    functions.convertStringToInt(_model.appPackageVersion)!,
                    functions.convertStringToInt(
                        getRemoteConfigString('StoresAppVersion'))!))
                : ((int appPackageVersion, int firebaseLastVersion) {
                    return appPackageVersion >= firebaseLastVersion;
                  }(
                    functions.convertStringToInt(_model.appPackageVersion)!,
                    functions.convertStringToInt(
                        getRemoteConfigString('PlayStoreAppVersion'))!))) ||
            (FFAppState().updateLater == true)) {
          if (loggedIn) {
            if (valueOrDefault(currentUserDocument?.accountStatus, '') ==
                'completed') {
              if (currentUserEmailVerified) {
                await action_blocks.checkBloodAppointmentNumber(context);
                safeSetState(() {});
                _model.bloodAppointmentNumber =
                    await queryBloodAppointmentRecordCount(
                  parent: currentUserReference,
                );
                if ((valueOrDefault(currentUserDocument?.inAppointment, '') ==
                        'justCompleted') ||
                    (valueOrDefault<bool>(
                            currentUserDocument?.eventCanceled, false) ==
                        true) ||
                    (valueOrDefault<bool>(
                            currentUserDocument?.eventChanged, false) ==
                        true)) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),
                      reverseDuration: Duration(milliseconds: 300),
                      child: ThankYouForDonationWidget(
                        fromMyAppointment: true,
                      ),
                    ),
                    (r) => false,
                  );
                  return;
                } else {
                  if (valueOrDefault(currentUserDocument?.inAppointment, '') ==
                      'first_appointment') {
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
                    return;
                  } else {
                    if (valueOrDefault(
                            currentUserDocument?.inAppointment, '') ==
                        'true') {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: MyAppointmentWidget(),
                        ),
                      );
                      return;
                    } else {
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
                      return;
                    }
                  }
                }
              } else {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.bottomToTop,
                    duration: Duration(milliseconds: 300),
                    reverseDuration: Duration(milliseconds: 300),
                    child: Step4VerifyEmailWidget(),
                  ),
                );
                return;
              }
            } else if (valueOrDefault(currentUserDocument?.accountStatus, '') ==
                'underCreation') {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: FlutterFlowTheme.of(context).popUpBackground,
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
                        message: 'Ουπς!',
                        description:
                            'Απ ότι φαίνεται δεν ολοκλήρωσες την δημιουργία του λογαριασμού σου.',
                        button1Text: 'Συνέχεια γαι ολοκλήρωση',
                        actionName: 'continueAccountCreation',
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));

              return;
            } else {
              FFAppState().totalToUpdate = 1;
              FFAppState().progressBarValue = 0;
              safeSetState(() {});
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  duration: Duration(milliseconds: 300),
                  reverseDuration: Duration(milliseconds: 300),
                  child: UpdatingUserWidget(),
                ),
              );
              return;
            }
          } else {
            FFAppState().CurrentRegion =
                valueOrDefault(currentUserDocument?.region, '');
            FFAppState().startDate = functions.getTodayDate();
            FFAppState().endDate =
                functions.addDaysToDate(30, functions.getTodayDate());
            FFAppState().initialValueForHomePage = 'Λίστα';
            FFAppState().IsEventsInRegion = true;
            FFAppState().SearchStateMyAppointment = 'searching';
            safeSetState(() {});
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 300),
                reverseDuration: Duration(milliseconds: 300),
                child: HomePageWidget(),
              ),
            );
            return;
          }
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
                    fromPage: 'loadingScreen',
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));

          return;
        }
      } else {
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
                  message: 'Δεν υπάρχει σύνδεση!',
                  button1Text: 'Προσπάθησε ξανά',
                  description:
                      'Παρακαλώ προσπάθησε να συνδεθείς σε ένα πιο γρήγορο δίκτυο για να μπορέσεις να χρησιμοποιήσεις την εφαρμογή.',
                  actionName: 'noConnection',
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
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
                    Lottie.asset(
                      'assets/jsons/DinoumeAimaLogo.json',
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 180.0,
                      fit: BoxFit.cover,
                      animate: true,
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
