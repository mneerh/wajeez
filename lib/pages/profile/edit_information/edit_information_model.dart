import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_information_widget.dart' show EditInformationWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditInformationModel extends FlutterFlowModel<EditInformationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for fName-Edit widget.
  FocusNode? fNameEditFocusNode;
  TextEditingController? fNameEditTextController;
  String? Function(BuildContext, String?)? fNameEditTextControllerValidator;
  // State field(s) for lName-Edit widget.
  FocusNode? lNameEditFocusNode;
  TextEditingController? lNameEditTextController;
  String? Function(BuildContext, String?)? lNameEditTextControllerValidator;
  // State field(s) for username-Edit widget.
  FocusNode? usernameEditFocusNode;
  TextEditingController? usernameEditTextController;
  String? Function(BuildContext, String?)? usernameEditTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fNameEditFocusNode?.dispose();
    fNameEditTextController?.dispose();

    lNameEditFocusNode?.dispose();
    lNameEditTextController?.dispose();

    usernameEditFocusNode?.dispose();
    usernameEditTextController?.dispose();
  }
}
