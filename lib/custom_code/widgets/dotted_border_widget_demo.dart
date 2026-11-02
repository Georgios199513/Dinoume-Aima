// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dotted_border/dotted_border.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class DottedBorderWidgetDemo extends StatefulWidget {
  const DottedBorderWidgetDemo({
    Key? key,
    this.width,
    this.height,
    required this.strokeWidth,
    this.action,
    this.text,
    this.radio,
    this.textColor,
    this.borderColor,
    this.buttonColor,
    this.lengthDash,
    this.lengthSpace,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double strokeWidth;
  final Future<dynamic> Function()? action;
  final String? text;
  final double? radio;
  final Color? borderColor;
  final Color? buttonColor;
  final Color? textColor;
  final double? lengthDash;
  final double? lengthSpace;

  @override
  _DottedBorderWidgetDemoState createState() => _DottedBorderWidgetDemoState();
}

class _DottedBorderWidgetDemoState extends State<DottedBorderWidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
        dashPattern: [widget.lengthDash ?? 4.0, widget.lengthSpace ?? 4.0],
        borderType: BorderType.RRect,
        radius: Radius.circular(widget.radio ?? 0.0),
        color: widget.borderColor ?? FlutterFlowTheme.of(context).primaryText,
        strokeWidth: widget.strokeWidth,
        child: FFButtonWidget(
          onPressed: () async {
            await widget.action?.call();
          },
          text: widget.text ?? 'Button',
          options: FFButtonOptions(
            width: widget.width,
            height: widget.height,
            color:
                widget.buttonColor ?? FlutterFlowTheme.of(context).primaryColor,
            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: 'Poppins',
                  color: widget.textColor ??
                      FlutterFlowTheme.of(context).primaryBtnText,
                ),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(widget.radio ?? 0.0),
          ),
        ));
  }
}
