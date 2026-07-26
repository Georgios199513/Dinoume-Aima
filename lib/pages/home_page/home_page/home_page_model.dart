import '/components/footer/footer_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - CheckPendingAppointmentAfter5Days] action in HomePage widget.
  List<DocumentReference>? recheckPendingAppointment;
  // Stores action output result for [Custom Action - appPackageInfo] action in HomePage widget.
  String? appPackageVersion1;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Firestore Query - Query a collection] action in GoogleMap widget.
  int? countBloodAppointmenMap;
  // Stores action output result for [Custom Action - eventDateOfLastAppointment] action in GoogleMap widget.
  DateTime? appointmentStateMap;
  // Stores action output result for [Custom Action - eventDateOfLastAppointment] action in GoogleMap widget.
  DateTime? lastEventDateMap;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();

    footerModel.dispose();
  }
}
