import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String? formatCompanyDataForAI(List<CompnayListStruct>? companies) {
  if (companies == null || companies.isEmpty) {
    return '[]'; // empty JSON array
  }

  // helper: pick first element if list, else string, else 'N/A'
  String _first(dynamic v) {
    if (v is List && v.isNotEmpty) return v.first.toString();
    if (v is String && v.isNotEmpty) return v;
    return 'N/A';
  }

  final flattened = companies.map((c) {
    final m = c.toMap(); // original map <String,dynamic>
    return {
      'id': _first(m['id']),
      'business_name': _first(m['business_name']),
      'country': _first(m['country']),
      'state': _first(m['state']),
      'city': _first(m['city']),
      'companies_status': _first(m['companies_status']),
      'gst_number': _first(m['gst_number']),
      'address': _first(m['address']),
      'company_doc': _first(m['company_doc']),
      'edit_time': _first(m['edit_time']),
      'companies_created_time': _first(m['companies_created_time']),
    };
  }).toList();

  return jsonEncode(flattened);
}

String? formateUserDataForAI(List<UsersListStruct>? users) {
  if (users == null || users.isEmpty) {
    return '[]'; // empty JSON array
  }

  // helper: pick first element if list, else string, else 'N/A'
  String _first(dynamic v) {
    if (v is List && v.isNotEmpty) return v.first.toString();
    if (v is String && v.isNotEmpty) return v;
    return 'N/A';
  }

  final flattened = users.map((u) {
    final m = u.toMap(); // original map <String,dynamic>
    return {
      'id': _first(m['id']), // <-- New field added here
      'employeeid': _first(m['employeeid']),
      'display_name': _first(m['display_name']),
      'phone_number': _first(m['phone_number']),
      'photo_url': _first(m['photo_url']),
      'gender': _first(m['gender']),
      'users_created_time': _first(m['users_created_time']),
      'users_created_by_name': _first(m['users_created_by_name']),
      'users_created_by_number': _first(m['users_created_by_number']),
      'users_last_active_time': _first(m['users_last_active_time']),
      'user_role': _first(m['user_role']),
      'user_branch_name': _first(m['user_branch_name']),
      'user_department_name': _first(m['user_department_name']),
      'user_designation_name': _first(m['user_designation_name']),
      'user_status': _first(m['user_status']),
      'company_doc': _first(m['company_doc']),
      'users_doc': _first(m['users_doc']),
      'users_edit_time': _first(m['users_edit_time']),
      'user_inactive_date': _first(m['user_inactive_date']),
      'users_edit_by_name': _first(m['users_edit_by_name']),
      'users_edit_by_number': _first(m['users_edit_by_number']),
    };
  }).toList();

  return jsonEncode(flattened);
}

String? formateDepartmentDataForAI(List<DepartmentsListStruct>? departments) {
  if (departments == null || departments.isEmpty) {
    return '[]'; // empty JSON array
  }

  // helper: pick first element if list, else string, else 'N/A'
  String _first(dynamic v) {
    if (v is List && v.isNotEmpty) return v.first.toString();
    if (v is String && v.isNotEmpty) return v;
    return 'N/A';
  }

  final flattened = departments.map((d) {
    final m = d.toMap(); // original map <String,dynamic>
    return {
      'departments_name': _first(m['departments_name']),
      'departments_created_time': _first(m['departments_created_time']),
      'company_doc': _first(m['company_doc']),
      'departments_doc': _first(m['departments_doc']),
    };
  }).toList();

  return jsonEncode(flattened);
}

String? formateBranchDataForAI(List<BranchesListStruct>? branches) {
  if (branches == null || branches.isEmpty) {
    return '[]'; // empty JSON array
  }

  // helper: pick first element if list, else string, else 'N/A'
  String _first(dynamic v) {
    if (v is List && v.isNotEmpty) return v.first.toString();
    if (v is String && v.isNotEmpty) return v;
    return 'N/A';
  }

  final flattened = branches.map((b) {
    final m = b.toMap(); // original map <String,dynamic>
    return {
      'branch_name': _first(m['branch_name']),
      'branch_created_time': _first(m['branch_created_time']),
      'company_doc': _first(m['company_doc']),
      'branch_doc': _first(m['branch_doc']),
    };
  }).toList();

  return jsonEncode(flattened);
}

String? formateDesignationDataForAI(
    List<DesignationsListStruct>? designations) {
  if (designations == null || designations.isEmpty) {
    return '[]'; // empty JSON array
  }

  // helper: pick first element if list, else string, else 'N/A'
  String _first(dynamic v) {
    if (v is List && v.isNotEmpty) return v.first.toString();
    if (v is String && v.isNotEmpty) return v;
    return 'N/A';
  }

  final flattened = designations.map((d) {
    final m = d.toMap(); // original map <String,dynamic>
    return {
      'designations_name': _first(m['designations_name']),
      'designations_created_time': _first(m['designations_created_time']),
      'company_doc': _first(m['company_doc']),
      'designations_doc': _first(m['designations_doc']),
    };
  }).toList();

  return jsonEncode(flattened);
}
