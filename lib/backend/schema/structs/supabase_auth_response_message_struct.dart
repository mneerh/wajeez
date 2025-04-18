// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SupabaseAuthResponseMessageStruct extends BaseStruct {
  SupabaseAuthResponseMessageStruct({
    bool? success,
    String? code,
    String? message,
    bool? showTouser,
    String? displayName,
  })  : _success = success,
        _code = code,
        _message = message,
        _showTouser = showTouser,
        _displayName = displayName;

  // "success" field.
  bool? _success;
  bool get success => _success ?? false;
  set success(bool? val) => _success = val;

  bool hasSuccess() => _success != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "showTouser" field.
  bool? _showTouser;
  bool get showTouser => _showTouser ?? false;
  set showTouser(bool? val) => _showTouser = val;

  bool hasShowTouser() => _showTouser != null;

  // "displayName" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;

  bool hasDisplayName() => _displayName != null;

  static SupabaseAuthResponseMessageStruct fromMap(Map<String, dynamic> data) =>
      SupabaseAuthResponseMessageStruct(
        success: data['success'] as bool?,
        code: data['code'] as String?,
        message: data['message'] as String?,
        showTouser: data['showTouser'] as bool?,
        displayName: data['displayName'] as String?,
      );

  static SupabaseAuthResponseMessageStruct? maybeFromMap(dynamic data) => data
          is Map
      ? SupabaseAuthResponseMessageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'success': _success,
        'code': _code,
        'message': _message,
        'showTouser': _showTouser,
        'displayName': _displayName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'success': serializeParam(
          _success,
          ParamType.bool,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'showTouser': serializeParam(
          _showTouser,
          ParamType.bool,
        ),
        'displayName': serializeParam(
          _displayName,
          ParamType.String,
        ),
      }.withoutNulls;

  static SupabaseAuthResponseMessageStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SupabaseAuthResponseMessageStruct(
        success: deserializeParam(
          data['success'],
          ParamType.bool,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        showTouser: deserializeParam(
          data['showTouser'],
          ParamType.bool,
          false,
        ),
        displayName: deserializeParam(
          data['displayName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SupabaseAuthResponseMessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SupabaseAuthResponseMessageStruct &&
        success == other.success &&
        code == other.code &&
        message == other.message &&
        showTouser == other.showTouser &&
        displayName == other.displayName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([success, code, message, showTouser, displayName]);
}

SupabaseAuthResponseMessageStruct createSupabaseAuthResponseMessageStruct({
  bool? success,
  String? code,
  String? message,
  bool? showTouser,
  String? displayName,
}) =>
    SupabaseAuthResponseMessageStruct(
      success: success,
      code: code,
      message: message,
      showTouser: showTouser,
      displayName: displayName,
    );
