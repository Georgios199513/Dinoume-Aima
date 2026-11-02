import 'dart:async';

import 'serialization_util.dart';

import '/backend/backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    await _handlePushNotificationData(message.data);
  }

  Future _handlePushNotificationData(Map<String, dynamic> messageData) async {
    safeSetState(() => _loading = true);
    try {
      final initialPageName = messageData['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(messageData);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Slpashscreen.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'ThankYouForDonation': (data) async => ThankYouForDonationWidget(
        bloodAppointment: getParameter(data, 'bloodAppointment'),
        fromMyAppointment: getParameter(data, 'fromMyAppointment'),
      ),
  'ShareTheApp': (data) async => ShareTheAppWidget(),
  'MyAppointment': (data) async => MyAppointmentWidget(),
  'EditProfile': (data) async => EditProfileWidget(),
  'Step1_AccountCreation': (data) async => Step1AccountCreationWidget(),
  'HomePage': (data) async => HomePageWidget(
        fromFilter: getParameter(data, 'fromFilter'),
        updatedlater2: getParameter(data, 'updatedlater2'),
      ),
  'Step2_NamePhoneRegion': (data) async => Step2NamePhoneRegionWidget(),
  'ProfileScreen': (data) async => ProfileScreenWidget(),
  'ProfileDetails_LawThings': (data) async => ProfileDetailsLawThingsWidget(),
  'ProfileDetails': (data) async => ProfileDetailsWidget(),
  'TimeSlotSelection': (data) async => TimeSlotSelectionWidget(),
  'ChangeTimeSlot': (data) async => ChangeTimeSlotWidget(
        eventRef: await getDocumentParameter(
            data, 'eventRef', EventsRecord.fromSnapshot),
        appointmentRef: getParameter(data, 'appointmentRef'),
        isAppointmentCreated: getParameter(data, 'isAppointmentCreated'),
        timeOfAppointment: getParameter(data, 'timeOfAppointment'),
      ),
  'Step3_BirthdaySexe': (data) async => Step3BirthdaySexeWidget(),
  'Step4_VerifyEmail': (data) async => Step4VerifyEmailWidget(),
  'IntroQuestion': (data) async => IntroQuestionWidget(),
  'Question_1_Age': (data) async => Question1AgeWidget(),
  'Question_2_Weigth': (data) async => Question2WeigthWidget(),
  'Question_3_GenHealth': (data) async => Question3GenHealthWidget(),
  'Question_4_GenHealth': (data) async => Question4GenHealthWidget(),
  'Question_5_Surgery': (data) async => Question5SurgeryWidget(),
  'Question_6_Tattoo': (data) async => Question6TattooWidget(),
  'Question_7_LastDonation': (data) async => Question7LastDonationWidget(),
  'CreatingAppointment': (data) async => CreatingAppointmentWidget(
        selectedEvent: await getDocumentParameter(
            data, 'selectedEvent', EventsRecord.fromSnapshot),
      ),
  'PreviewAppointment': (data) async => PreviewAppointmentWidget(),
  'RejectionMessage': (data) async => RejectionMessageWidget(),
  'InviteFriend': (data) async => InviteFriendWidget(
        event: getParameter(data, 'event'),
        appointment: await getDocumentParameter(
            data, 'appointment', AppointmentsRecord.fromSnapshot),
      ),
  'Remind': (data) async => RemindWidget(),
  'ThankYouPage': (data) async => ThankYouPageWidget(),
  'ForgotPassword': (data) async => ForgotPasswordWidget(),
  'Welcome': (data) async => WelcomeWidget(),
  'DeleteAccount': (data) async => DeleteAccountWidget(),
  'LoginScreen': (data) async => LoginScreenWidget(),
  'FilterPage': (data) async => FilterPageWidget(
        fromMap: getParameter(data, 'fromMap'),
      ),
  'Verifying': (data) async => VerifyingWidget(),
  'LogIn': (data) async => LogInWidget(),
  'DeveloperList': (data) async => DeveloperListWidget(
        fromFilter: getParameter(data, 'fromFilter'),
      ),
  'ChangeEmail': (data) async => ChangeEmailWidget(),
  'SuccessChangeEmaill': (data) async => SuccessChangeEmaillWidget(),
  'TestPage': (data) async => TestPageWidget(),
  'UpdatingUser': (data) async => UpdatingUserWidget(),
  'CreatingAppointmentCopy': (data) async => CreatingAppointmentCopyWidget(
        selectedEvent: await getDocumentParameter(
            data, 'selectedEvent', EventsRecord.fromSnapshot),
      ),
  'VisitorLoading': (data) async => VisitorLoadingWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
