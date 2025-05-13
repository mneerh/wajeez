// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:gotrue/src/types/user_attributes.dart';
import 'package:gotrue/src/types/user.dart';
import 'package:gotrue/src/types/auth_response.dart';
import 'package:gotrue/src/gotrue_client.dart';
import 'package:gotrue/src/types/auth_exception.dart';

Future<SupabaseAuthResponseMessageStruct> changeUserPassword(
    String newPassword) async {
  var returnVal = new SupabaseAuthResponseMessageStruct();
  try {
// Get the current user
    final supabase = SupaFlow.client;
    UserAttributes attrs = new UserAttributes(password: newPassword);
// Update the user's email address
    final res = await supabase.auth.updateUser(attrs);
    final User? updatedUser = res.user;
    if (updatedUser == null) {
//print('Error Setting User Password');
      returnVal.message = 'Error Setting User Password';
      returnVal.success = false;
      returnVal.showTouser = false;
      return returnVal;
    }
  } on AuthException catch (e) {
    returnVal.code = e.statusCode;
    returnVal.message = e.message;
    returnVal.success = false;
    returnVal.showTouser = true;
//logException( Log Type. Authentication, 'changeUserPassword', e.toString), null, null); return return Val;
  } catch (e) {
//print('Unknown Exception:$e');
    returnVal.message = 'Unknown Exception:$e';
    returnVal.success = false;
    returnVal.showTouser = false;
//logException(LogType.Authentication, 'changeUserPassword', e.toString0, null, null);
    return returnVal;
  }
//print('Ok Setting User Password');
  returnVal.message = 'Ok Setting User Password';
  returnVal.success = true;
  returnVal.showTouser = true;
  return returnVal;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
