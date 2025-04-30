import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'transfer_ticket_widget.dart' show TransferTicketWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransferTicketModel extends FlutterFlowModel<TransferTicketWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bh0i6kf9' /* Your email address... is requi... */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - Query Rows] action in Button-Login widget.
  List<ProfileRow>? rowsToCheck;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button-Login widget.
  List<TicketRow>? update;

  @override
  void initState(BuildContext context) {
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
