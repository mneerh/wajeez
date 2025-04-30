import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'checking_out_widget.dart' show CheckingOutWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckingOutModel extends FlutterFlowModel<CheckingOutWidget> {
  ///  Local state fields for this page.

  bool showDis = false;

  double? totalLocal;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Promo widget.
  FocusNode? promoFocusNode;
  TextEditingController? promoTextController;
  String? Function(BuildContext, String?)? promoTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PromocodeRow>? pCode;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<CheckoutRow>? currCheckoutt;
  // Stores action output result for [Backend Call - Update Row(s)] action in Pay widget.
  List<CheckoutRow>? checkouttP;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    promoFocusNode?.dispose();
    promoTextController?.dispose();
  }
}
