import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'ticket_details_widget.dart' show TicketDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TicketDetailsModel extends FlutterFlowModel<TicketDetailsWidget> {
  ///  Local state fields for this page.

  double? amntNum;

  ///  State fields for stateful widgets in this page.

  Stream<List<TicketsMenuRow>>? columnSupabaseStream;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // Stores action output result for [Backend Call - Update Row(s)] action in saveButton widget.
  List<CheckoutRow>? currCheckout;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
