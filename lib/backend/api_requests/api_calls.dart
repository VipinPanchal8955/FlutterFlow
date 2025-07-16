import 'dart:convert';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Countries Data API Group Code

class CountriesDataAPIGroup {
  static String getBaseUrl() => 'https://api.countrystatecity.in/v1';
  static Map<String, String> headers = {
    'X-CSCAPI-KEY': 'SmxLVkl1OURXNmpnNE1QNFRzakViRFA1QXRjaU03T1pQeVN3ZFFkSw==',
  };
  static CountriesCall countriesCall = CountriesCall();
  static StatesCall statesCall = StatesCall();
  static CitiesCall citiesCall = CitiesCall();
}

class CountriesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = CountriesDataAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'countries',
      apiUrl: '${baseUrl}/countries',
      callType: ApiCallType.GET,
      headers: {
        'X-CSCAPI-KEY':
            'SmxLVkl1OURXNmpnNE1QNFRzakViRFA1QXRjaU03T1pQeVN3ZFFkSw==',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? countryName(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? iso2(dynamic response) => (getJsonField(
        response,
        r'''$[:].iso2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? allData(dynamic response) => getJsonField(
        response,
        r'''$[:] ''',
        true,
      ) as List?;
}

class StatesCall {
  Future<ApiCallResponse> call({
    String? ciso = '',
  }) async {
    final baseUrl = CountriesDataAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'states',
      apiUrl: '${baseUrl}/countries/${ciso}/states',
      callType: ApiCallType.GET,
      headers: {
        'X-CSCAPI-KEY':
            'SmxLVkl1OURXNmpnNE1QNFRzakViRFA1QXRjaU03T1pQeVN3ZFFkSw==',
      },
      params: {
        'ciso': ciso,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? stateName(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? iso2(dynamic response) => (getJsonField(
        response,
        r'''$[:].iso2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CitiesCall {
  Future<ApiCallResponse> call({
    String? ciso = '',
    String? siso = '',
  }) async {
    final baseUrl = CountriesDataAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'cities',
      apiUrl: '${baseUrl}/countries/${ciso}/states/${siso}/cities',
      callType: ApiCallType.GET,
      headers: {
        'X-CSCAPI-KEY':
            'SmxLVkl1OURXNmpnNE1QNFRzakViRFA1QXRjaU03T1pQeVN3ZFFkSw==',
      },
      params: {
        'ciso': ciso,
        'siso': ciso,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? cityName(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End Countries Data API Group Code

/// Start TaskManagment Group Code

class TaskManagmentGroup {
  static String getBaseUrl({
    String? apiKey,
  }) {
    apiKey ??= FFAppConstants.GeminiAP;
    return 'https://generativelanguage.googleapis.com/v1beta/';
  }

  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'X-goog-api-key': 'AIzaSyClVT3aXltFt2BjPaClMLbHvLCZebO8NAo',
  };
  static TaskListCall taskListCall = TaskListCall();
}

class TaskListCall {
  Future<ApiCallResponse> call({
    String? message = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.GeminiAP;
    final baseUrl = TaskManagmentGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "contents": [
    {
      "role": "system",
      "parts": [
        {
          "text": "Your role is to identify which department the user's request is most closely related to.\\nReturn your answer strictly in the following JSON format:\\n{\\n  \\"department\\": \\"department_name\\"\\n}\\nOnly return valid JSON. Do not include explanations or extra text."
        }
      ]
    },
    {
      "role": "user",
      "parts": [
        {
          "text": "${escapeStringForJson(message)}"
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TaskList',
      apiUrl: '${baseUrl}models/gemini-2.0-flash:generateContent?key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-goog-api-key': 'AIzaSyClVT3aXltFt2BjPaClMLbHvLCZebO8NAo',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? textResponse(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.candidates[:].content.parts[:].text''',
      ));
}

/// End TaskManagment Group Code

/// Start Firebase Collection API For Admin Group Code

class FirebaseCollectionAPIForAdminGroup {
  static GETCompaniesCollectionAdminCall gETCompaniesCollectionAdminCall =
      GETCompaniesCollectionAdminCall();
  static GETUserCollectionAdminCall gETUserCollectionAdminCall =
      GETUserCollectionAdminCall();
  static GETBranchCollectionAdminCall gETBranchCollectionAdminCall =
      GETBranchCollectionAdminCall();
  static GETDepartmentCollectionAdminCall gETDepartmentCollectionAdminCall =
      GETDepartmentCollectionAdminCall();
  static GETDesignationCollectionAdminCall gETDesignationCollectionAdminCall =
      GETDesignationCollectionAdminCall();
  static GETTaskManagentCollectionCall gETTaskManagentCollectionCall =
      GETTaskManagentCollectionCall();
  static POSTTaskManagentCollectionCall pOSTTaskManagentCollectionCall =
      POSTTaskManagentCollectionCall();
}

class GETCompaniesCollectionAdminCall {
  Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GETCompaniesCollectionAdminCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? businessname(dynamic response) => (getJsonField(
        response,
        r'''$[:].business_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? country(dynamic response) => (getJsonField(
        response,
        r'''$[:].country''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? state(dynamic response) => (getJsonField(
        response,
        r'''$[:].state''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companiesstatus(dynamic response) => (getJsonField(
        response,
        r'''$[:].companies_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? gstnumber(dynamic response) => (getJsonField(
        response,
        r'''$[:].gst_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? city(dynamic response) => (getJsonField(
        response,
        r'''$[:].city''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$[:].address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companiescreatedtime(dynamic response) => (getJsonField(
        response,
        r'''$[:].companies_created_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companydocPath(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_docPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companydoc(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_doc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GETUserCollectionAdminCall {
  Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GETUserCollectionAdminCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? employeeid(dynamic response) => (getJsonField(
        response,
        r'''$[:].employeeid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? displayname(dynamic response) => (getJsonField(
        response,
        r'''$[:].display_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? phonenumber(dynamic response) => (getJsonField(
        response,
        r'''$[:].phone_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? photourl(dynamic response) => (getJsonField(
        response,
        r'''$[:].photo_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? gender(dynamic response) => (getJsonField(
        response,
        r'''$[:].gender''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userscreatedbyname(dynamic response) => (getJsonField(
        response,
        r'''$[:].users_created_by_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userscreatedbynumber(dynamic response) => (getJsonField(
        response,
        r'''$[:].users_created_by_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userrole(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_role''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userbranchname(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_branch_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userdepartmentname(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_department_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userdesignationname(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_designation_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userstatus(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companydoc(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_doc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companydocPath(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_docPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userscreatedtime(dynamic response) => (getJsonField(
        response,
        r'''$[:].users_created_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userslastactivetime(dynamic response) => (getJsonField(
        response,
        r'''$[:].users_last_active_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? usersdocPath(dynamic response) => (getJsonField(
        response,
        r'''$[:].users_docPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? usersdoc(dynamic response) => (getJsonField(
        response,
        r'''$[:].users_doc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GETBranchCollectionAdminCall {
  Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GETBranchCollectionAdminCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? branchname(dynamic response) => (getJsonField(
        response,
        r'''$[:].branch_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companydocPath(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_docPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companydoc(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_doc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? branchcreatedtime(dynamic response) => (getJsonField(
        response,
        r'''$[:].branch_created_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? branchdocPath(dynamic response) => (getJsonField(
        response,
        r'''$[:].branch_docPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? branchdoc(dynamic response) => (getJsonField(
        response,
        r'''$[:].branch_doc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GETDepartmentCollectionAdminCall {
  Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GETDepartmentCollectionAdminCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? departmentsname(dynamic response) => (getJsonField(
        response,
        r'''$[:].departments_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companydocPath(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_docPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companydoc(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_doc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? departmentscreatedtime(dynamic response) => (getJsonField(
        response,
        r'''$[:].departments_created_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? departmentsdocPath(dynamic response) => (getJsonField(
        response,
        r'''$[:].departments_docPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? departmentsdoc(dynamic response) => (getJsonField(
        response,
        r'''$[:].departments_doc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GETDesignationCollectionAdminCall {
  Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GETDesignationCollectionAdminCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? designationsname(dynamic response) => (getJsonField(
        response,
        r'''$[:].designations_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companydocPath(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_docPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companydoc(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_doc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? designationscreatedtime(dynamic response) => (getJsonField(
        response,
        r'''$[:].designations_created_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? designationsdocPath(dynamic response) => (getJsonField(
        response,
        r'''$[:].designations_docPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? designationsdoc(dynamic response) => (getJsonField(
        response,
        r'''$[:].designations_doc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GETTaskManagentCollectionCall {
  Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GETTaskManagentCollectionCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class POSTTaskManagentCollectionCall {
  Future<ApiCallResponse> call({
    String? employeeId = '',
    String? employeeName = '',
    String? taskFrequency = '',
    String? employeeTask = '',
    String? taskAssignedDate = '',
    String? taskAssignedByName = '',
    String? taskAssignedByNumber = '',
    String? employeeNumber = '',
    String? taskDoc = '',
    String? compnayDoc = '',
    String? usersDoc = '',
    String? companyName = '',
    String? branchName = '',
    String? departmentName = '',
    String? designationName = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'POSTTaskManagentCollectionCall',
        'variables': {
          'employeeId': employeeId,
          'employeeName': employeeName,
          'taskFrequency': taskFrequency,
          'employeeTask': employeeTask,
          'taskAssignedDate': taskAssignedDate,
          'taskAssignedByName': taskAssignedByName,
          'taskAssignedByNumber': taskAssignedByNumber,
          'employeeNumber': employeeNumber,
          'taskDoc': taskDoc,
          'compnayDoc': compnayDoc,
          'usersDoc': usersDoc,
          'companyName': companyName,
          'branchName': branchName,
          'departmentName': departmentName,
          'designationName': designationName,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

/// End Firebase Collection API For Admin Group Code

/// Start Firebase Collection API For Owner Group Code

class FirebaseCollectionAPIForOwnerGroup {
  static GETCompaniesCollectionOwnerCall gETCompaniesCollectionOwnerCall =
      GETCompaniesCollectionOwnerCall();
  static GETUserCollectionOwnerCall gETUserCollectionOwnerCall =
      GETUserCollectionOwnerCall();
  static GETBranchCollectionOwnerCall gETBranchCollectionOwnerCall =
      GETBranchCollectionOwnerCall();
  static GETDepartmentsCollectionOwnerCall gETDepartmentsCollectionOwnerCall =
      GETDepartmentsCollectionOwnerCall();
  static GETDesignationsCollectionOwnerCall gETDesignationsCollectionOwnerCall =
      GETDesignationsCollectionOwnerCall();
}

class GETCompaniesCollectionOwnerCall {
  Future<ApiCallResponse> call({
    String? companyDoc = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GETCompaniesCollectionOwnerCall',
        'variables': {
          'companyDoc': companyDoc,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? businessname(dynamic response) => (getJsonField(
        response,
        r'''$[:].business_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? country(dynamic response) => (getJsonField(
        response,
        r'''$[:].country''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? state(dynamic response) => (getJsonField(
        response,
        r'''$[:].state''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companiesstatus(dynamic response) => (getJsonField(
        response,
        r'''$[:].companies_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? gstnumber(dynamic response) => (getJsonField(
        response,
        r'''$[:].gst_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? city(dynamic response) => (getJsonField(
        response,
        r'''$[:].city''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$[:].address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companiescreatedtime(dynamic response) => (getJsonField(
        response,
        r'''$[:].companies_created_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companydocPath(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_docPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companydoc(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_doc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GETUserCollectionOwnerCall {
  Future<ApiCallResponse> call({
    String? companyDoc = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GETUserCollectionOwnerCall',
        'variables': {
          'companyDoc': companyDoc,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? employeeid(dynamic response) => (getJsonField(
        response,
        r'''$[:].employeeid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? displayname(dynamic response) => (getJsonField(
        response,
        r'''$[:].display_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? phonenumber(dynamic response) => (getJsonField(
        response,
        r'''$[:].phone_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? photourl(dynamic response) => (getJsonField(
        response,
        r'''$[:].photo_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? gender(dynamic response) => (getJsonField(
        response,
        r'''$[:].gender''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userscreatedbyname(dynamic response) => (getJsonField(
        response,
        r'''$[:].users_created_by_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userbranchname(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_branch_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userscreatedbynumber(dynamic response) => (getJsonField(
        response,
        r'''$[:].users_created_by_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userrole(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_role''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userdepartmentname(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_department_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userdesignationname(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_designation_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userstatus(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userscreatedtime(dynamic response) => (getJsonField(
        response,
        r'''$[:].users_created_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? usersdocPath(dynamic response) => (getJsonField(
        response,
        r'''$[:].users_docPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? userslastactivetime(dynamic response) => (getJsonField(
        response,
        r'''$[:].users_last_active_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companydocPath(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_docPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companydoc(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_doc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? usersdoc(dynamic response) => (getJsonField(
        response,
        r'''$[:].users_doc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GETBranchCollectionOwnerCall {
  Future<ApiCallResponse> call({
    String? companyDoc = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GETBranchCollectionOwnerCall',
        'variables': {
          'companyDoc': companyDoc,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? branchname(dynamic response) => (getJsonField(
        response,
        r'''$[:].branch_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companydocPath(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_docPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? branchcreatedtime(dynamic response) => (getJsonField(
        response,
        r'''$[:].branch_created_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? branchdocPath(dynamic response) => (getJsonField(
        response,
        r'''$[:].branch_docPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companydoc(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_doc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? branchdoc(dynamic response) => (getJsonField(
        response,
        r'''$[:].branch_doc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GETDepartmentsCollectionOwnerCall {
  Future<ApiCallResponse> call({
    String? companyDoc = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GETDepartmentsCollectionOwnerCall',
        'variables': {
          'companyDoc': companyDoc,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GETDesignationsCollectionOwnerCall {
  Future<ApiCallResponse> call({
    String? companyDoc = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GETDesignationsCollectionOwnerCall',
        'variables': {
          'companyDoc': companyDoc,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? designationsname(dynamic response) => (getJsonField(
        response,
        r'''$[:].designations_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companydocPath(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_docPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? companydoc(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_doc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? designationscreatedtime(dynamic response) => (getJsonField(
        response,
        r'''$[:].designations_created_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? designationsdocPath(dynamic response) => (getJsonField(
        response,
        r'''$[:].designations_docPath''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? designationsdoc(dynamic response) => (getJsonField(
        response,
        r'''$[:].designations_doc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End Firebase Collection API For Owner Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
