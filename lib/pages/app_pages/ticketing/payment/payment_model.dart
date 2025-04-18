import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'payment_widget.dart' show PaymentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PaymentModel extends FlutterFlowModel<PaymentWidget> {
  ///  Local state fields for this page.

  int? numbOfTickets;

  int? loopCounter = 1;

  ///  State fields for stateful widgets in this page.

  // State field(s) for cardNum widget.
  FocusNode? cardNumFocusNode;
  TextEditingController? cardNumTextController;
  String? Function(BuildContext, String?)? cardNumTextControllerValidator;
  // State field(s) for cardholder widget.
  FocusNode? cardholderFocusNode;
  TextEditingController? cardholderTextController;
  String? Function(BuildContext, String?)? cardholderTextControllerValidator;
  // State field(s) for cardExp widget.
  FocusNode? cardExpFocusNode;
  TextEditingController? cardExpTextController;
  final cardExpMask = MaskTextInputFormatter(mask: '##/##');
  String? Function(BuildContext, String?)? cardExpTextControllerValidator;
  // State field(s) for cvv widget.
  FocusNode? cvvFocusNode;
  TextEditingController? cvvTextController;
  final cvvMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? cvvTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Pay widget.
  List<CheckoutRow>? check;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cardNumFocusNode?.dispose();
    cardNumTextController?.dispose();

    cardholderFocusNode?.dispose();
    cardholderTextController?.dispose();

    cardExpFocusNode?.dispose();
    cardExpTextController?.dispose();

    cvvFocusNode?.dispose();
    cvvTextController?.dispose();
  }
}
