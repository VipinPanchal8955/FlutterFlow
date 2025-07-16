import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_company_form_widget.dart' show EditCompanyFormWidget;
import 'package:flutter/material.dart';

class EditCompanyFormModel extends FlutterFlowModel<EditCompanyFormWidget> {
  ///  Local state fields for this component.

  List<CountryListStruct> countyListDataType = [];
  void addToCountyListDataType(CountryListStruct item) =>
      countyListDataType.add(item);
  void removeFromCountyListDataType(CountryListStruct item) =>
      countyListDataType.remove(item);
  void removeAtIndexFromCountyListDataType(int index) =>
      countyListDataType.removeAt(index);
  void insertAtIndexInCountyListDataType(int index, CountryListStruct item) =>
      countyListDataType.insert(index, item);
  void updateCountyListDataTypeAtIndex(
          int index, Function(CountryListStruct) updateFn) =>
      countyListDataType[index] = updateFn(countyListDataType[index]);

  List<StateListStruct> stateListDataType = [];
  void addToStateListDataType(StateListStruct item) =>
      stateListDataType.add(item);
  void removeFromStateListDataType(StateListStruct item) =>
      stateListDataType.remove(item);
  void removeAtIndexFromStateListDataType(int index) =>
      stateListDataType.removeAt(index);
  void insertAtIndexInStateListDataType(int index, StateListStruct item) =>
      stateListDataType.insert(index, item);
  void updateStateListDataTypeAtIndex(
          int index, Function(StateListStruct) updateFn) =>
      stateListDataType[index] = updateFn(stateListDataType[index]);

  String? selectdCountyISO;

  String? selectdStateISO;

  List<CityListStruct> cityListDataType = [];
  void addToCityListDataType(CityListStruct item) => cityListDataType.add(item);
  void removeFromCityListDataType(CityListStruct item) =>
      cityListDataType.remove(item);
  void removeAtIndexFromCityListDataType(int index) =>
      cityListDataType.removeAt(index);
  void insertAtIndexInCityListDataType(int index, CityListStruct item) =>
      cityListDataType.insert(index, item);
  void updateCityListDataTypeAtIndex(
          int index, Function(CityListStruct) updateFn) =>
      cityListDataType[index] = updateFn(cityListDataType[index]);

  String? selectedCityName;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in Edit_Company_form widget.
  CompaniesRecord? editCompayDoc;
  // Stores action output result for [Backend Call - API (countries)] action in Edit_Company_form widget.
  ApiCallResponse? countyList;
  // Stores action output result for [Backend Call - API (states)] action in Edit_Company_form widget.
  ApiCallResponse? stateList;
  // Stores action output result for [Backend Call - API (cities)] action in Edit_Company_form widget.
  ApiCallResponse? cityList;
  // State field(s) for Company_Name widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameTextController;
  String? Function(BuildContext, String?)? companyNameTextControllerValidator;
  String? _companyNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Company Name is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }
    if (val.length > 50) {
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Company_Address widget.
  FocusNode? companyAddressFocusNode;
  TextEditingController? companyAddressTextController;
  String? Function(BuildContext, String?)?
      companyAddressTextControllerValidator;
  String? _companyAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Address is required';
    }

    if (val.length < 5) {
      return 'Enter at least 5 characters';
    }
    if (val.length > 100) {
      return 'Address cannot exceed 100 characters';
    }

    return null;
  }

  // State field(s) for Country_Name widget.
  String? countryNameValue;
  FormFieldController<String>? countryNameValueController;
  // Stores action output result for [Backend Call - API (states)] action in Country_Name widget.
  ApiCallResponse? selectedCountryState;
  // State field(s) for State_Name widget.
  String? stateNameValue;
  FormFieldController<String>? stateNameValueController;
  // Stores action output result for [Backend Call - API (cities)] action in State_Name widget.
  ApiCallResponse? selectedStateCity;
  // State field(s) for City_Name widget.
  String? cityNameValue;
  FormFieldController<String>? cityNameValueController;
  // State field(s) for Status widget.
  String? statusValue;
  FormFieldController<String>? statusValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? compnayAddForm;

  @override
  void initState(BuildContext context) {
    companyNameTextControllerValidator = _companyNameTextControllerValidator;
    companyAddressTextControllerValidator =
        _companyAddressTextControllerValidator;
  }

  @override
  void dispose() {
    companyNameFocusNode?.dispose();
    companyNameTextController?.dispose();

    companyAddressFocusNode?.dispose();
    companyAddressTextController?.dispose();
  }
}
