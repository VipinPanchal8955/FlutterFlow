import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'employee_list_dropdown_widget.dart' show EmployeeListDropdownWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class EmployeeListDropdownModel
    extends FlutterFlowModel<EmployeeListDropdownWidget> {
  ///  Local state fields for this component.

  String? searchText;

  List<UsersRecord> selectedUsers = [];
  void addToSelectedUsers(UsersRecord item) => selectedUsers.add(item);
  void removeFromSelectedUsers(UsersRecord item) => selectedUsers.remove(item);
  void removeAtIndexFromSelectedUsers(int index) =>
      selectedUsers.removeAt(index);
  void insertAtIndexInSelectedUsers(int index, UsersRecord item) =>
      selectedUsers.insert(index, item);
  void updateSelectedUsersAtIndex(int index, Function(UsersRecord) updateFn) =>
      selectedUsers[index] = updateFn(selectedUsers[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for searchEmployeeTaskFom widget.
  FocusNode? searchEmployeeTaskFomFocusNode;
  TextEditingController? searchEmployeeTaskFomTextController;
  String? Function(BuildContext, String?)?
      searchEmployeeTaskFomTextControllerValidator;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, UsersRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // State field(s) for Checkbox widget.
  Map<UsersRecord, bool> checkboxValueMap = {};
  List<UsersRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchEmployeeTaskFomFocusNode?.dispose();
    searchEmployeeTaskFomTextController?.dispose();

    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, UsersRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, UsersRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, UsersRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryUsersRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 100,
          isStream: true,
        ),
      );
  }
}
