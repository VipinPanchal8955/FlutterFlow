// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class JarvisResponseStruct extends FFFirebaseStruct {
  JarvisResponseStruct({
    String? message,
    String? callAgent,
    String? followupPrompt,
    String? language,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _message = message,
        _callAgent = callAgent,
        _followupPrompt = followupPrompt,
        _language = language,
        super(firestoreUtilData);

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "call_agent" field.
  String? _callAgent;
  String get callAgent => _callAgent ?? '';
  set callAgent(String? val) => _callAgent = val;

  bool hasCallAgent() => _callAgent != null;

  // "followup_prompt" field.
  String? _followupPrompt;
  String get followupPrompt => _followupPrompt ?? '';
  set followupPrompt(String? val) => _followupPrompt = val;

  bool hasFollowupPrompt() => _followupPrompt != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  set language(String? val) => _language = val;

  bool hasLanguage() => _language != null;

  static JarvisResponseStruct fromMap(Map<String, dynamic> data) =>
      JarvisResponseStruct(
        message: data['message'] as String?,
        callAgent: data['call_agent'] as String?,
        followupPrompt: data['followup_prompt'] as String?,
        language: data['language'] as String?,
      );

  static JarvisResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? JarvisResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'call_agent': _callAgent,
        'followup_prompt': _followupPrompt,
        'language': _language,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'call_agent': serializeParam(
          _callAgent,
          ParamType.String,
        ),
        'followup_prompt': serializeParam(
          _followupPrompt,
          ParamType.String,
        ),
        'language': serializeParam(
          _language,
          ParamType.String,
        ),
      }.withoutNulls;

  static JarvisResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      JarvisResponseStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        callAgent: deserializeParam(
          data['call_agent'],
          ParamType.String,
          false,
        ),
        followupPrompt: deserializeParam(
          data['followup_prompt'],
          ParamType.String,
          false,
        ),
        language: deserializeParam(
          data['language'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'JarvisResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is JarvisResponseStruct &&
        message == other.message &&
        callAgent == other.callAgent &&
        followupPrompt == other.followupPrompt &&
        language == other.language;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([message, callAgent, followupPrompt, language]);
}

JarvisResponseStruct createJarvisResponseStruct({
  String? message,
  String? callAgent,
  String? followupPrompt,
  String? language,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    JarvisResponseStruct(
      message: message,
      callAgent: callAgent,
      followupPrompt: followupPrompt,
      language: language,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

JarvisResponseStruct? updateJarvisResponseStruct(
  JarvisResponseStruct? jarvisResponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    jarvisResponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addJarvisResponseStructData(
  Map<String, dynamic> firestoreData,
  JarvisResponseStruct? jarvisResponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (jarvisResponse == null) {
    return;
  }
  if (jarvisResponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && jarvisResponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final jarvisResponseData =
      getJarvisResponseFirestoreData(jarvisResponse, forFieldValue);
  final nestedData =
      jarvisResponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = jarvisResponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getJarvisResponseFirestoreData(
  JarvisResponseStruct? jarvisResponse, [
  bool forFieldValue = false,
]) {
  if (jarvisResponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(jarvisResponse.toMap());

  // Add any Firestore field values
  jarvisResponse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getJarvisResponseListFirestoreData(
  List<JarvisResponseStruct>? jarvisResponses,
) =>
    jarvisResponses
        ?.map((e) => getJarvisResponseFirestoreData(e, true))
        .toList() ??
    [];
