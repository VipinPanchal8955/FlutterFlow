const axios = require("axios").default;
const qs = require("qs");

/// Start Firebase Collection API For Admin Group Code

function createFirebaseCollectionAPIForAdminGroup() {
  return {
    baseUrl: `https://asia-south1-anvatrix-1wjj3q.cloudfunctions.net/firestoreCRUD-1?`,
    headers: {
      "Content-Type": `application/json`,
      "x-api-key": `93584023827626948094`,
    },
  };
}

async function _gETCompaniesCollectionAdminCall(context, ffVariables) {
  const firebaseCollectionAPIForAdminGroup =
    createFirebaseCollectionAPIForAdminGroup();

  var url = `${firebaseCollectionAPIForAdminGroup.baseUrl}collection=companies`;
  var headers = {
    "Content-Type": `application/json`,
    "x-api-key": `93584023827626948094`,
  };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _gETUserCollectionAdminCall(context, ffVariables) {
  const firebaseCollectionAPIForAdminGroup =
    createFirebaseCollectionAPIForAdminGroup();

  var url = `${firebaseCollectionAPIForAdminGroup.baseUrl}collection=users`;
  var headers = {
    "Content-Type": `application/json`,
    "x-api-key": `93584023827626948094`,
  };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _gETBranchCollectionAdminCall(context, ffVariables) {
  const firebaseCollectionAPIForAdminGroup =
    createFirebaseCollectionAPIForAdminGroup();

  var url = `${firebaseCollectionAPIForAdminGroup.baseUrl}collection=companies_branches`;
  var headers = {
    "Content-Type": `application/json`,
    "x-api-key": `93584023827626948094`,
  };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _gETDepartmentCollectionAdminCall(context, ffVariables) {
  const firebaseCollectionAPIForAdminGroup =
    createFirebaseCollectionAPIForAdminGroup();

  var url = `${firebaseCollectionAPIForAdminGroup.baseUrl}collection=companies_departments`;
  var headers = {
    "Content-Type": `application/json`,
    "x-api-key": `93584023827626948094`,
  };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _gETDesignationCollectionAdminCall(context, ffVariables) {
  const firebaseCollectionAPIForAdminGroup =
    createFirebaseCollectionAPIForAdminGroup();

  var url = `${firebaseCollectionAPIForAdminGroup.baseUrl}collection=companies_designations`;
  var headers = {
    "Content-Type": `application/json`,
    "x-api-key": `93584023827626948094`,
  };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _gETTaskManagentCollectionCall(context, ffVariables) {
  const firebaseCollectionAPIForAdminGroup =
    createFirebaseCollectionAPIForAdminGroup();

  var url = `${firebaseCollectionAPIForAdminGroup.baseUrl}collection=task_management`;
  var headers = {
    "Content-Type": `application/json`,
    "x-api-key": `93584023827626948094`,
  };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _pOSTTaskManagentCollectionCall(context, ffVariables) {
  var employeeId = ffVariables["employeeId"];
  var employeeName = ffVariables["employeeName"];
  var taskFrequency = ffVariables["taskFrequency"];
  var employeeTask = ffVariables["employeeTask"];
  var taskAssignedDate = ffVariables["taskAssignedDate"];
  var taskAssignedByName = ffVariables["taskAssignedByName"];
  var taskAssignedByNumber = ffVariables["taskAssignedByNumber"];
  var employeeNumber = ffVariables["employeeNumber"];
  var taskDoc = ffVariables["taskDoc"];
  var compnayDoc = ffVariables["compnayDoc"];
  var usersDoc = ffVariables["usersDoc"];
  var companyName = ffVariables["companyName"];
  var branchName = ffVariables["branchName"];
  var departmentName = ffVariables["departmentName"];
  var designationName = ffVariables["designationName"];
  const firebaseCollectionAPIForAdminGroup =
    createFirebaseCollectionAPIForAdminGroup();

  var url = `${firebaseCollectionAPIForAdminGroup.baseUrl}collection=task_management`;
  var headers = {
    "Content-Type": `application/json`,
    "x-api-key": `93584023827626948094`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "employee_id": "${escapeStringForJson(employeeId)}",
  "employee_name": "${escapeStringForJson(employeeName)}",
  "task_frequency": "${escapeStringForJson(taskFrequency)}",
  "employee_task": "${escapeStringForJson(employeeTask)}",
  "task_assigned_date": "${escapeStringForJson(taskAssignedDate)}",
  "task_assigned_by_name": "${escapeStringForJson(taskAssignedByName)}",
  "task_assigned_by_number": "${escapeStringForJson(taskAssignedByNumber)}",
  "employee_number": "${escapeStringForJson(employeeNumber)}",
  "task_doc": "${escapeStringForJson(taskDoc)}",
  "compnay_doc": "${escapeStringForJson(compnayDoc)}",
  "users_doc": "${escapeStringForJson(usersDoc)}",
  "company_name": "${escapeStringForJson(companyName)}",
  "branch_name": "${escapeStringForJson(branchName)}",
  "department_name": "${escapeStringForJson(departmentName)}",
  "designation_name": "${escapeStringForJson(designationName)}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

/// End Firebase Collection API For Admin Group Code

/// Start Firebase Collection API For Owner Group Code

function createFirebaseCollectionAPIForOwnerGroup() {
  return {
    baseUrl: `https://asia-south1-anvatrix-1wjj3q.cloudfunctions.net/firestoreCRUD-1?`,
    headers: {
      "Content-Type": `application/json`,
      "x-api-key": `93584023827626948094`,
    },
  };
}

async function _gETCompaniesCollectionOwnerCall(context, ffVariables) {
  var companyDoc = ffVariables["companyDoc"];
  const firebaseCollectionAPIForOwnerGroup =
    createFirebaseCollectionAPIForOwnerGroup();

  var url = `${firebaseCollectionAPIForOwnerGroup.baseUrl}collection=companies`;
  var headers = {
    "Content-Type": `application/json`,
    "x-api-key": `93584023827626948094`,
  };
  var params = { company_doc: companyDoc };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _gETUserCollectionOwnerCall(context, ffVariables) {
  var companyDoc = ffVariables["companyDoc"];
  const firebaseCollectionAPIForOwnerGroup =
    createFirebaseCollectionAPIForOwnerGroup();

  var url = `${firebaseCollectionAPIForOwnerGroup.baseUrl}collection=users`;
  var headers = {
    "Content-Type": `application/json`,
    "x-api-key": `93584023827626948094`,
  };
  var params = { company_doc: companyDoc };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _gETBranchCollectionOwnerCall(context, ffVariables) {
  var companyDoc = ffVariables["companyDoc"];
  const firebaseCollectionAPIForOwnerGroup =
    createFirebaseCollectionAPIForOwnerGroup();

  var url = `${firebaseCollectionAPIForOwnerGroup.baseUrl}collection=companies_branches`;
  var headers = {
    "Content-Type": `application/json`,
    "x-api-key": `93584023827626948094`,
  };
  var params = { company_doc: companyDoc };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _gETDepartmentsCollectionOwnerCall(context, ffVariables) {
  var companyDoc = ffVariables["companyDoc"];
  const firebaseCollectionAPIForOwnerGroup =
    createFirebaseCollectionAPIForOwnerGroup();

  var url = `${firebaseCollectionAPIForOwnerGroup.baseUrl}collection=companies_departments`;
  var headers = {
    "Content-Type": `application/json`,
    "x-api-key": `93584023827626948094`,
  };
  var params = { company_doc: companyDoc };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _gETDesignationsCollectionOwnerCall(context, ffVariables) {
  var companyDoc = ffVariables["companyDoc"];
  const firebaseCollectionAPIForOwnerGroup =
    createFirebaseCollectionAPIForOwnerGroup();

  var url = `${firebaseCollectionAPIForOwnerGroup.baseUrl}collection=companies_designations`;
  var headers = {
    "Content-Type": `application/json`,
    "x-api-key": `93584023827626948094`,
  };
  var params = { company_doc: companyDoc };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

/// End Firebase Collection API For Owner Group Code

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    GETCompaniesCollectionAdminCall: _gETCompaniesCollectionAdminCall,
    GETUserCollectionAdminCall: _gETUserCollectionAdminCall,
    GETBranchCollectionAdminCall: _gETBranchCollectionAdminCall,
    GETDepartmentCollectionAdminCall: _gETDepartmentCollectionAdminCall,
    GETDesignationCollectionAdminCall: _gETDesignationCollectionAdminCall,
    GETTaskManagentCollectionCall: _gETTaskManagentCollectionCall,
    POSTTaskManagentCollectionCall: _pOSTTaskManagentCollectionCall,
    GETCompaniesCollectionOwnerCall: _gETCompaniesCollectionOwnerCall,
    GETUserCollectionOwnerCall: _gETUserCollectionOwnerCall,
    GETBranchCollectionOwnerCall: _gETBranchCollectionOwnerCall,
    GETDepartmentsCollectionOwnerCall: _gETDepartmentsCollectionOwnerCall,
    GETDesignationsCollectionOwnerCall: _gETDesignationsCollectionOwnerCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
  isStreamingApi,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      responseType: isStreamingApi ? "stream" : "json",
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
        isStreamingApi: isStreamingApi,
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}
function escapeStringForJson(val) {
  if (typeof val !== "string") {
    return val;
  }
  return val
    .replace(/[\\]/g, "\\\\")
    .replace(/["]/g, '\\"')
    .replace(/[\n]/g, "\\n")
    .replace(/[\t]/g, "\\t");
}

module.exports = { makeApiCall };
