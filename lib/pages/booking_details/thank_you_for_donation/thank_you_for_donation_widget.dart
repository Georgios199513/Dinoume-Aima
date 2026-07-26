import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'thank_you_for_donation_model.dart';
export 'thank_you_for_donation_model.dart';

class ThankYouForDonationWidget extends StatefulWidget {
  const ThankYouForDonationWidget({
    super.key,
    this.bloodAppointment,
    required this.fromMyAppointment,
  });

  final DocumentReference? bloodAppointment;
  final bool? fromMyAppointment;

  static String routeName = 'ThankYouForDonation';
  static String routePath = '/thankYouForDonation';

  @override
  State<ThankYouForDonationWidget> createState() =>
      _ThankYouForDonationWidgetState();
}

class _ThankYouForDonationWidgetState extends State<ThankYouForDonationWidget> {
  late ThankYouForDonationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThankYouForDonationModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ThankYouForDonation'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Image.asset(
                    'assets/images/NewAppointment.png',
                    width: 170.0,
                    height: 170.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 35.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Text(
                      () {
                        if (valueOrDefault(
                                currentUserDocument?.inAppointment, '') ==
                            'justCompleted') {
                          return 'Σε ευχαριστούμε για την προσφορά σας !';
                        } else if (valueOrDefault<bool>(
                                currentUserDocument?.eventCanceled, false) ==
                            true) {
                          return 'Θέλουμε να σε ευχαριστήσουμε για τη συμμετοχή σου. Δυστυχώς, λόγω ανωτέρας βίας, η εξόρμηση πρέπει να ακυρωθεί. Ωστόσο, αν επιθυμείς να δωρίσεις αίμα, μπορείς να βρεις μια άλλη εξόρμηση πατώντας το κουμπί \"Συνέχεια\". Ευχαριστούμε ξανά για το ενδιαφέρον σου!';
                        } else if (valueOrDefault<bool>(
                                currentUserDocument?.eventChanged, false) ==
                            true) {
                          return 'Τα στοιχεία της εξόρμηση που συμμετέχετε έχουν αλλάξει.';
                        } else {
                          return 'Σε ευχαριστούμε για την προσφορά σας !';
                        }
                      }(),
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
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'THANK_YOU_FOR_DONATION_ButtonAction_ON_T');
                    FFAppState().CurrentRegion =
                        valueOrDefault(currentUserDocument?.region, '');
                    FFAppState().startDate = functions.getTodayDate();
                    FFAppState().endDate =
                        functions.addDaysToDate(30, functions.getTodayDate());
                    safeSetState(() {});
                    if (widget.fromMyAppointment!) {
                      _model.pendingAppointment1 = await action_blocks
                          .checkPendingAppointmentAfter5Days(context);

                      await currentUserReference!.update(createUsersRecordData(
                        eventCanceled: false,
                        eventChanged: false,
                        inAppointment: 'false',
                      ));
                      Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: MyAppointmentWidget(),
                        ),
                        (r) => false,
                      );
                    } else {
                      _model.pendingAppointment2 = await action_blocks
                          .checkPendingAppointmentAfter5Days(context);
                      Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: ProfileScreenWidget(),
                        ),
                        (r) => false,
                      );
                    }

                    safeSetState(() {});
                  },
                  text: 'Συνέχεια',
                  icon: FaIcon(
                    FontAwesomeIcons.arrowRight,
                    size: 20.0,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding: EdgeInsets.all(0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    iconColor: FlutterFlowTheme.of(context).primary,
                    color: Color(0x00E94B3C),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
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
