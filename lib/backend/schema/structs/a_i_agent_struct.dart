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
    AIAgentAction? aIAgentAction,
    AIAgentActionConfirmation? aIAgentActionConfirmation,
    String? userName,
    String? userNumber,
    String? userGender,
    String? userRoleInCompany,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _chatRole = chatRole,
        _message = message,
        _callAgent = callAgent,
        _followupPrompt = followupPrompt,
        _language = language,
        _aIAgentAction = aIAgentAction,
        _aIAgentActionConfirmation = aIAgentActionConfirmation,
        _userName = userName,
        _userNumber = userNumber,
        _userGender = userGender,
        _userRoleInCompany = userRoleInCompany,
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

  // "AI_Agent_Action" field.
  AIAgentAction? _aIAgentAction;
  AIAgentAction? get aIAgentAction => _aIAgentAction;
  set aIAgentAction(AIAgentAction? val) => _aIAgentAction = val;

  bool hasAIAgentAction() => _aIAgentAction != null;

  // "AI_Agent_Action_Confirmation" field.
  AIAgentActionConfirmation? _aIAgentActionConfirmation;
  AIAgentActionConfirmation? get aIAgentActionConfirmation =>
      _aIAgentActionConfirmation;
  set aIAgentActionConfirmation(AIAgentActionConfirmation? val) =>
      _aIAgentActionConfirmation = val;

  bool hasAIAgentActionConfirmation() => _aIAgentActionConfirmation != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "user_number" field.
  String? _userNumber;
  String get userNumber => _userNumber ?? '';
  set userNumber(String? val) => _userNumber = val;

  bool hasUserNumber() => _userNumber != null;

  // "user_gender" field.
  String? _userGender;
  String get userGender => _userGender ?? '';
  set userGender(String? val) => _userGender = val;

  bool hasUserGender() => _userGender != null;

  // "user_role_in_company" field.
  String? _userRoleInCompany;
  String get userRoleInCompany => _userRoleInCompany ?? '';
  set userRoleInCompany(String? val) => _userRoleInCompany = val;

  bool hasUserRoleInCompany() => _userRoleInCompany != null;

  static AIAgentStruct fromMap(Map<String, dynamic> data) => AIAgentStruct(
        chatRole: data['Chat_Role'] is ChatRole
            ? data['Chat_Role']
            : deserializeEnum<ChatRole>(data['Chat_Role']),
        message: data['message'] as String?,
        callAgent: data['call_agent'] as String?,
        followupPrompt: data['followup_prompt'] as String?,
        language: data['language'] as String?,
        aIAgentAction: data['AI_Agent_Action'] is AIAgentAction
            ? data['AI_Agent_Action']
            : deserializeEnum<AIAgentAction>(data['AI_Agent_Action']),
        aIAgentActionConfirmation:
            data['AI_Agent_Action_Confirmation'] is AIAgentActionConfirmation
                ? data['AI_Agent_Action_Confirmation']
                : deserializeEnum<AIAgentActionConfirmation>(
                    data['AI_Agent_Action_Confirmation']),
        userName: data['user_name'] as String?,
        userNumber: data['user_number'] as String?,
        userGender: data['user_gender'] as String?,
        userRoleInCompany: data['user_role_in_company'] as String?,
      );

  static AIAgentStruct? maybeFromMap(dynamic data) =>
      data is Map ? AIAgentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Chat_Role': _chatRole?.serialize(),
        'message': _message,
        'call_agent': _callAgent,
        'followup_prompt': _followupPrompt,
        'language': _language,
        'AI_Agent_Action': _aIAgentAction?.serialize(),
        'AI_Agent_Action_Confirmation': _aIAgentActionConfirmation?.serialize(),
        'user_name': _userName,
        'user_number': _userNumber,
        'user_gender': _userGender,
        'user_role_in_company': _userRoleInCompany,
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
        'AI_Agent_Action': serializeParam(
          _aIAgentAction,
          ParamType.Enum,
        ),
        'AI_Agent_Action_Confirmation': serializeParam(
          _aIAgentActionConfirmation,
          ParamType.Enum,
        ),
        'user_name': serializeParam(
          _userName,
          ParamType.String,
        ),
        'user_number': serializeParam(
          _userNumber,
          ParamType.String,
        ),
        'user_gender': serializeParam(
          _userGender,
          ParamType.String,
        ),
        'user_role_in_company': serializeParam(
          _userRoleInCompany,
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
        aIAgentAction: deserializeParam<AIAgentAction>(
          data['AI_Agent_Action'],
          ParamType.Enum,
          false,
        ),
        aIAgentActionConfirmation: deserializeParam<AIAgentActionConfirmation>(
          data['AI_Agent_Action_Confirmation'],
          ParamType.Enum,
          false,
        ),
        userName: deserializeParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        userNumber: deserializeParam(
          data['user_number'],
          ParamType.String,
          false,
        ),
        userGender: deserializeParam(
          data['user_gender'],
          ParamType.String,
          false,
        ),
        userRoleInCompany: deserializeParam(
          data['user_role_in_company'],
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
        language == other.language &&
        aIAgentAction == other.aIAgentAction &&
        aIAgentActionConfirmation == other.aIAgentActionConfirmation &&
        userName == other.userName &&
        userNumber == other.userNumber &&
        userGender == other.userGender &&
        userRoleInCompany == other.userRoleInCompany;
  }

  @override
  int get hashCode => const ListEquality().hash([
        chatRole,
        message,
        callAgent,
        followupPrompt,
        language,
        aIAgentAction,
        aIAgentActionConfirmation,
        userName,
        userNumber,
        userGender,
        userRoleInCompany
      ]);
}

AIAgentStruct createAIAgentStruct({
  ChatRole? chatRole,
  String? message,
  String? callAgent,
  String? followupPrompt,
  String? language,
  AIAgentAction? aIAgentAction,
  AIAgentActionConfirmation? aIAgentActionConfirmation,
  String? userName,
  String? userNumber,
  String? userGender,
  String? userRoleInCompany,
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
      aIAgentAction: aIAgentAction,
      aIAgentActionConfirmation: aIAgentActionConfirmation,
      userName: userName,
      userNumber: userNumber,
      userGender: userGender,
      userRoleInCompany: userRoleInCompany,
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
