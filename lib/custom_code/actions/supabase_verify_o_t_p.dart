// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:gotrue/src/types/auth_response.dart';
import 'package:gotrue/src/types/user.dart';
import 'package:gotrue/src/constants.dart';

Future<bool> supabaseVerifyOTP(
  String token,
  String emailAddress,
) async {
// verify the OTP token from supabase for an email address
  try {
    print('Starting OTP verification...');
    print('Token: $token');
    print('Email: $emailAddress');
    final supabase = SupaFlow.client;

    final AuthResponse response = await supabase.auth
        .verifyOTP(email: emailAddress, token: token, type: OtpType.magiclink);

    final User? user = response.user;
    if (user == null) {
      // OTP verification failed
      print('OTP verification failed for email: $emailAddress');
      return false;
    } else {
      // OTP verification succeeded
      print('OTP verified successfully for user: ${user.id}');
      return true;
    }
  } catch (e) {
    // Log the exception or handle it as needed
    print('Exception: $e');
    // Optionally, integrate your logging function here
    // logException(LogType.Authentication, 'supabaseVerifyOTP', e.toString(), null, emailAddress);

    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
