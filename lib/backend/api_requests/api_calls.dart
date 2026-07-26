import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SendWelcomeEmailCall {
  static Future<ApiCallResponse> call({
    String? to = 'grigoriadis.georges@gmail.com',
    String? name = 'Γιώργος',
    String? subject = 'Welcome',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Send Welcome Email',
      apiUrl: 'https://api.abracadalo.com/notification/send',
      callType: ApiCallType.GET,
      headers: {
        'api-key': 'BNpmrJGOjZHxFXXyqqVN',
      },
      params: {
        'to': to,
        'subject': subject,
        'templateID': "7BzUjbYlBiGRiPxau0Qd",
        'medium': "email",
        'name': name,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendAppointmentConfirmationCall {
  static Future<ApiCallResponse> call({
    String? to = 'grigoriadis.georges@gmail.com',
    String? subject = 'Welcome',
    String? textBody = '',
    String? nameEvent = '',
    String? addressEvent = '',
    String? dateEvent = '',
    String? timeEvent = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Send Appointment Confirmation',
      apiUrl: 'https://api.abracadalo.com/notification/send',
      callType: ApiCallType.GET,
      headers: {
        'api-key': 'BNpmrJGOjZHxFXXyqqVN',
      },
      params: {
        'to': to,
        'subject': subject,
        'templateID': "x2Yukx8duWffC7qSOWuc",
        'medium': "email",
        'textBody': textBody,
        'nameEvent': nameEvent,
        'addressEvent': addressEvent,
        'dateEvent': dateEvent,
        'timeEvent': timeEvent,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendScheduledAppointmentReminderCall {
  static Future<ApiCallResponse> call({
    String? to = 'grigoriadis.georges@gmail.com',
    String? subject = 'Welcome',
    String? date = '2023-06-09 01:00:00.000',
    String? textBody = '',
    String? nameEvent = '',
    String? addressEvent = '',
    String? dateEvent = '',
    String? timeEvent = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Send Scheduled Appointment Reminder',
      apiUrl: 'https://api.abracadalo.com/notification/send',
      callType: ApiCallType.GET,
      headers: {
        'api-key': 'BNpmrJGOjZHxFXXyqqVN',
      },
      params: {
        'to': to,
        'subject': subject,
        'templateID': "h7l1LfgU918Emnv0InRN",
        'medium': "email",
        'date': date,
        'textBody': textBody,
        'nameEvent': nameEvent,
        'addressEvent': addressEvent,
        'dateEvent': dateEvent,
        'timeEvent': timeEvent,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class CancelScheduledEmailCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Cancel Scheduled Email',
      apiUrl: 'https://api.abracadalo.com/notification/cancel',
      callType: ApiCallType.GET,
      headers: {
        'api-key': 'BNpmrJGOjZHxFXXyqqVN',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendAppointmentCancellationCall {
  static Future<ApiCallResponse> call({
    String? to = 'grigoriadis.georges@gmail.com',
    String? subject = 'Welcome',
    String? textBody = '',
    String? nameEvent = '',
    String? addressEvent = '',
    String? dateEvent = '',
    String? timeEvent = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Send Appointment Cancellation',
      apiUrl: 'https://api.abracadalo.com/notification/send',
      callType: ApiCallType.GET,
      headers: {
        'api-key': 'BNpmrJGOjZHxFXXyqqVN',
      },
      params: {
        'to': to,
        'subject': subject,
        'templateID': "tbtYojbq4ndlXMQeiZHe",
        'medium': "email",
        'textBody': textBody,
        'nameEvent': nameEvent,
        'addressEvent': addressEvent,
        'dateEvent': dateEvent,
        'timeEvent': timeEvent,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
