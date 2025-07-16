// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AIAgentStruct extends FFFirebaseStruct {
  AIAgentStruct({
    ChatRole? chatRole,
    String? message,
    String? callAgent,
    String? followupPrompt,
    String? language,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _chatRole = chatRole,
        _message = message,
        _callAgent = callAgent,
        _followupPrompt = followupPrompt,
        _language = language,
        super(firestoreUtilData);

  // "Chat_Role" field.
  ChatRole? _chatRole;
  ChatRole? get chatRole => _chatRole;
  set chatRole(ChatRole? val) => _chatRole = val;

  bool hasChatRole() => _chatRole != null;

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

  static AIAgentStruct fromMap(Map<String, dynamic> data) => AIAgentStruct(
        chatRole: data['Chat_Role'] is ChatRole
            ? data['Chat_Role']
            : deserializeEnum<ChatRole>(data['Chat_Role']),
        message: data['message'] as String?,
        callAgent: data['call_agent'] as String?,
        followupPrompt: data['followup_prompt'] as String?,
        language: data['language'] as String?,
      );

  static AIAgentStruct? maybeFromMap(dynamic data) =>
      data is Map ? AIAgentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Chat_Role': _chatRole?.serialize(),
        'message': _message,
        'call_agent': _callAgent,
        'followup_prompt': _followupPrompt,
        'language': _language,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Chat_Role': serializeParam(
          _chatRole,
          ParamType.Enum,
        ),
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

  static AIAgentStruct fromSerializableMap(Map<String, dynamic> data) =>
      AIAgentStruct(
        chatRole: deserializeParam<ChatRole>(
          data['Chat_Role'],
          ParamType.Enum,
          false,
        ),
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
  String toString() => 'AIAgentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AIAgentStruct &&
        chatRole == other.chatRole &&
        message == other.message &&
        callAgent == other.callAgent &&
        followupPrompt == other.followupPrompt &&
        language == other.language;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([chatRole, message, callAgent, followupPrompt, language]);
}

AIAgentStruct createAIAgentStruct({
  ChatRole? chatRole,
  String? message,
  String? callAgent,
  String? followupPrompt,
  String? language,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AIAgentStruct(
      chatRole: chatRole,
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

AIAgentStruct? updateAIAgentStruct(
  AIAgentStruct? aIAgent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    aIAgent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAIAgentStructData(
  Map<String, dynamic> firestoreData,
  AIAgentStruct? aIAgent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (aIAgent == null) {
    return;
  }
  if (aIAgent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && aIAgent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final aIAgentData = getAIAgentFirestoreData(aIAgent, forFieldValue);
  final nestedData = aIAgentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = aIAgent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAIAgentFirestoreData(
  AIAgentStruct? aIAgent, [
  bool forFieldValue = false,
]) {
  if (aIAgent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(aIAgent.toMap());

  // Add any Firestore field values
  aIAgent.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAIAgentListFirestoreData(
  List<AIAgentStruct>? aIAgents,
) =>
    aIAgents?.map((e) => getAIAgentFirestoreData(e, true)).toList() ?? [];
