import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'developer_list_widget.dart' show DeveloperListWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DeveloperListModel extends FlutterFlowModel<DeveloperListWidget> {
  ///  Local state fields for this page.

  String? value;

  ///  State fields for stateful widgets in this page.

  // State field(s) for EventsList widget.

  PagingController<DocumentSnapshot?, EventsRecord>? eventsListPagingController;
  Query? eventsListPagingQuery;

  // Stores action output result for [Firestore Query - Query a collection] action in Event widget.
  BloodAppointmentRecord? bloodAppointment;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    eventsListPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, EventsRecord> setEventsListController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    eventsListPagingController ??= _createEventsListController(query, parent);
    if (eventsListPagingQuery != query) {
      eventsListPagingQuery = query;
      eventsListPagingController?.refresh();
    }
    return eventsListPagingController!;
  }

  PagingController<DocumentSnapshot?, EventsRecord> _createEventsListController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EventsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEventsRecordPage(
          queryBuilder: (_) => eventsListPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 25,
          isStream: false,
        ),
      );
  }
}
