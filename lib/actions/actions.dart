import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future cancelingCreationAppointment(BuildContext context) async {
  await FFAppState().selectedEvent!.update({
    ...mapToFirestore(
      {
        'bloodAppointmentList':
            FieldValue.arrayRemove([FFAppState().inCreationBloodAppointment]),
      },
    ),
  });

  await currentUserReference!.update({
    ...mapToFirestore(
      {
        'eventsPaticipated':
            FieldValue.arrayRemove([FFAppState().selectedEvent]),
      },
    ),
  });
  await FFAppState().inCreationBloodAppointment!.delete();
  FFAppState().selectedEvent = null;
  FFAppState().selectedTimeChunk = null;
  FFAppState().update(() {});
  Navigator.push(
    context,
    PageTransition(
      type: PageTransitionType.fade,
      duration: Duration(milliseconds: 300),
      reverseDuration: Duration(milliseconds: 300),
      child: HomePageWidget(
        fromFilter: false,
      ),
    ),
  );
}

Future<List<DocumentReference>?> checkPendingAppointmentAfter5Days(
    BuildContext context) async {
  List<DocumentReference>? oldPendingAppointments;
  List<DocumentReference>? sortedAppointment;

  oldPendingAppointments = await actions.listOfPendingAppointments3(
    currentUserUid,
  );
  sortedAppointment = await actions.sortList(
    oldPendingAppointments!.toList(),
  );
  if (oldPendingAppointments.length > 0) {
    FFAppState().pendingAppointment = true;
    FFAppState().oldPendingAppointment =
        sortedAppointment!.toList().cast<DocumentReference>();
    FFAppState().oldPendingAppointmentUpdateTime = getCurrentTimestamp;
    FFAppState().update(() {});
  } else {
    FFAppState().pendingAppointment = false;
    FFAppState().oldPendingAppointment = [];
    FFAppState().oldPendingAppointmentUpdateTime = getCurrentTimestamp;
    FFAppState().update(() {});
  }

  return null;
}

Future checkLastAppointmentEvent(BuildContext context) async {
  DocumentReference? lastAppointmentRef;
  int? numberOfAppointments;
  String? lastAppointmentState;
  BloodAppointmentRecord? lastAppointmentRefdoc;
  EventsRecord? lastAppointmentEvent;

  lastAppointmentRef = await actions.newestAppointmentDoc(
    currentUserUid,
  );
  if (lastAppointmentRef == null) {
    numberOfAppointments = await queryBloodAppointmentRecordCount(
      parent: currentUserReference,
    );

    await currentUserReference!.update(createUsersRecordData(
      inAppointment: numberOfAppointments > 0 ? 'false' : 'first_appointment',
    ));
  }
  lastAppointmentState = await actions.checkNewestAppointmentState(
    currentUserUid,
  );
  FFAppState().SearchStateMyAppointment = () {
    if (lastAppointmentRef?.id == null || lastAppointmentRef?.id == '') {
      return 'empty';
    } else if (lastAppointmentRef != null) {
      return 'found';
    } else {
      return 'searching';
    }
  }();
  FFAppState().LastAppointmentRef = lastAppointmentRef;
  FFAppState().update(() {});
  lastAppointmentRefdoc =
      await BloodAppointmentRecord.getDocumentOnce(lastAppointmentRef!);
  lastAppointmentEvent =
      await EventsRecord.getDocumentOnce(lastAppointmentRefdoc.relatedEvent!);
  if (lastAppointmentEvent.eventDate! < functions.getTodayDate()) {
    await currentUserReference!.update(createUsersRecordData(
      inAppointment: 'false',
    ));
  }
  FFAppState().LastEventDate = lastAppointmentEvent.eventDate;
  FFAppState().LastAppointmentState = lastAppointmentState!;
  FFAppState().lastEventAppStateUpdate = getCurrentTimestamp;
  FFAppState().lastEventRef = lastAppointmentRefdoc.relatedEvent;
  FFAppState().update(() {});
}

Future checkBloodAppointmentNumber(BuildContext context) async {
  int? bloodAppointmentNumber;

  bloodAppointmentNumber = await queryBloodAppointmentRecordCount(
    parent: currentUserReference,
  );
  if (bloodAppointmentNumber == 0) {
    await currentUserReference!.update(createUsersRecordData(
      inAppointment: 'first_appointment',
    ));
  }
}

Future createAppointment(
  BuildContext context, {
  DocumentReference? selectedEvent,
  DocumentReference? inCreationBloodAppointemnt,
}) async {
  List<TextsRecord>? texts;
  EventsRecord? currentEvent;
  ApiCallResponse? appointmentConfirmationEmail;
  ApiCallResponse? appointmentReminder;

  FFAppState().progressBarValue = 1;
  FFAppState().progressBarDescription = 'Προγραμματίζουμε το ραντεβού σου...';
  FFAppState().update(() {});
  texts = await queryTextsRecordOnce();
  currentEvent = await EventsRecord.getDocumentOnce(selectedEvent!);

  await inCreationBloodAppointemnt!.update(createBloodAppointmentRecordData(
    appointmentState: 'pending',
  ));
  FFAppState().progressBarValue = 20;
  FFAppState().progressBarDescription = 'Επιβεβαίωση ραντεβού...';

  await currentUserReference!.update({
    ...createUsersRecordData(
      inAppointment: 'true',
    ),
    ...mapToFirestore(
      {
        'eventsPaticipated': FieldValue.arrayUnion([selectedEvent]),
      },
    ),
  });
  // Προς εξέταση

  await currentEvent.eventHospitalPlanner!.update({
    ...mapToFirestore(
      {
        'Donors': FieldValue.arrayUnion([currentUserReference]),
      },
    ),
  });
  FFAppState().progressBarValue = 40;
  FFAppState().progressBarDescription = 'Λίγο ακόμη...';
  FFAppState().update(() {});
  // Find a way to delete "EmailList"

  await selectedEvent.update({
    ...mapToFirestore(
      {
        'UsersParticipated': FieldValue.arrayUnion([currentUserReference]),
        'UsersParticipatedEmailsList':
            FieldValue.arrayUnion([currentUserEmail]),
        'bloodAppointmentList':
            FieldValue.arrayUnion([FFAppState().inCreationBloodAppointment]),
      },
    ),
  });
  FFAppState().progressBarValue = 70;
  FFAppState().progressBarDescription =
      'Σου στέλνουμε επιβεβαίωση του ραντεβού...';
  FFAppState().update(() {});
  appointmentConfirmationEmail = await SendAppointmentConfirmationCall.call(
    to: currentUserEmail,
    subject: texts
        .where((e) => e.tags == 'confirmationEmail')
        .toList()
        .firstOrNull
        ?.title,
    textBody:
        (currentUserDocument?.eventsPaticipated.toList() ?? []).length <= 1
            ? texts
                .where((e) => e.tags == 'confirmationEmailFirst')
                .toList()
                .firstOrNull
                ?.text
            : texts
                .where((e) => e.tags == 'confirmationEmail')
                .toList()
                .firstOrNull
                ?.text,
    nameEvent: currentEvent.nameOfEvent,
    addressEvent:
        '${currentEvent.address.streetAndNumber}, ${currentEvent.address.city} ${currentEvent.address.postalCode}',
    dateEvent: dateTimeFormat(
      "d/M/y",
      currentEvent.eventDate,
      locale: FFLocalizations.of(context).languageCode,
    ),
    timeEvent: FFAppState().selectedTimeForAppointment,
  );

  if (currentEvent.eventDate != functions.getTodayDate()) {
    appointmentReminder = await SendScheduledAppointmentReminderCall.call(
      to: currentUserEmail,
      subject: texts
          .where((e) => e.tags == 'reminderEmail')
          .toList()
          .firstOrNull
          ?.title,
      textBody: texts
          .where((e) => e.tags == 'reminderEmail')
          .toList()
          .firstOrNull
          ?.text,
      nameEvent: currentEvent.nameOfEvent,
      dateEvent: dateTimeFormat(
        "d/M/y",
        currentEvent.eventDate,
        locale: FFLocalizations.of(context).languageCode,
      ),
      timeEvent: FFAppState().selectedTimeForAppointment,
      addressEvent:
          '${currentEvent.address.streetAndNumber}, ${currentEvent.address.city} ${currentEvent.address.postalCode}',
      date: currentEvent.eventDate ==
              functions.addTime(functions.getTodayDate(), 24, 0)
          ? currentEvent.eventDate?.toString()
          : functions
              .substructTime(
                  functions.addTime(currentEvent.eventDate, 1, 0), 0, 0, 0, 1)
              ?.toString(),
    );

    await inCreationBloodAppointemnt.update(createBloodAppointmentRecordData(
      abracadaloScheduledEmailId: SendScheduledAppointmentReminderCall.id(
        (appointmentReminder.jsonBody ?? ''),
      ),
    ));
    triggerPushNotification(
      notificationTitle: texts
          .where((e) => e.tags == 'reminderPushNotification')
          .toList()
          .firstOrNull!
          .title,
      notificationText: texts
          .where((e) => e.tags == 'reminderPushNotification')
          .toList()
          .firstOrNull!
          .text,
      scheduledTime:
          functions.substructTime(currentEvent.eventDate, 0, 0, 0, 1)!,
      notificationSound: 'default',
      userRefs: [currentUserReference!],
      initialPageName: 'MyAppointment',
      parameterData: {},
    );
  }
  FFAppState().progressBarValue = 100;
  FFAppState().progressBarDescription = 'Επιτυχία!';
  FFAppState().SearchStateMyAppointment = 'searching';
  FFAppState().update(() {});
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
}

Future deleteAppointmentGeneral(
  BuildContext context, {
  required DocumentReference? event,
  required DocumentReference? bloodappointment,
}) async {
  await event!.update({
    ...mapToFirestore(
      {
        'bloodAppointmentList': FieldValue.arrayRemove([bloodappointment]),
      },
    ),
  });

  await currentUserReference!.update({
    ...mapToFirestore(
      {
        'eventsPaticipated': FieldValue.arrayRemove([event]),
      },
    ),
  });
  await bloodappointment!.delete();
  FFAppState().selectedEvent = null;
  FFAppState().selectedTimeChunk = null;
  FFAppState().update(() {});
}
