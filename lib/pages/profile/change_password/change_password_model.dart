import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for resetpass widget.
  FocusNode? resetpassFocusNode;
  TextEditingController? resetpassTextController;
  String? Function(BuildContext, String?)? resetpassTextControllerValidator;
  // Stores action output result for [Custom Action - changeUserPassword] action in saveButton widget.
  SupabaseAuthResponseMessageStruct? newpass;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    resetpassFocusNode?.dispose();
    resetpassTextController?.dispose();
  }
}
