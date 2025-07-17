import 'package:collection/collection.dart';

enum UsersStatus {
  Active,
  Inactive,
  Terminate,
}

enum CmpaniesStatus {
  Active,
  Inactive,
  Terminate,
  Suspended,
}

enum Roles {
  Master,
  Admin,
  User,
  Owner,
}

enum RoleForCompany {
  Owner,
  User,
}

enum ChatRole {
  user,
  assistant,
}

enum AIAgentAction {
  Create,
  Edit,
  Delete,
  Query,
}

enum AIAgentActionConfirmation {
  Yes,
  No,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (UsersStatus):
      return UsersStatus.values.deserialize(value) as T?;
    case (CmpaniesStatus):
      return CmpaniesStatus.values.deserialize(value) as T?;
    case (Roles):
      return Roles.values.deserialize(value) as T?;
    case (RoleForCompany):
      return RoleForCompany.values.deserialize(value) as T?;
    case (ChatRole):
      return ChatRole.values.deserialize(value) as T?;
    case (AIAgentAction):
      return AIAgentAction.values.deserialize(value) as T?;
    case (AIAgentActionConfirmation):
      return AIAgentActionConfirmation.values.deserialize(value) as T?;
    default:
      return null;
  }
}
