import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'menu_list_selection_model.dart';
export 'menu_list_selection_model.dart';

class MenuListSelectionWidget extends StatefulWidget {
  const MenuListSelectionWidget({
    super.key,
    required this.text,
    int? fontSize,
    required this.leftIcon,
    int? diameter,
    required this.rigthIcon,
  })  : this.fontSize = fontSize ?? 16,
        this.diameter = diameter ?? 40;

  final String? text;
  final int fontSize;
  final Widget? leftIcon;
  final int diameter;
  final Widget? rigthIcon;

  @override
  State<MenuListSelectionWidget> createState() =>
      _MenuListSelectionWidgetState();
}

class _MenuListSelectionWidgetState extends State<MenuListSelectionWidget> {
  late MenuListSelectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuListSelectionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).transparent,
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional(0.0, 0.0),
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 5.0,
                  shape: const CircleBorder(),
                  child: Container(
                    width: widget.diameter.toDouble(),
                    height: widget.diameter.toDouble(),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                widget.leftIcon!,
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                child: Text(
                  widget.text!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.roboto(
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: widget.fontSize.toDouble(),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
            ),
            widget.rigthIcon!,
          ],
        ),
      ),
    );
  }
}
