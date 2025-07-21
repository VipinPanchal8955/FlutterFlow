import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'edit_company_form_model.dart';
export 'edit_company_form_model.dart';

class EditCompanyFormWidget extends StatefulWidget {
  const EditCompanyFormWidget({
    super.key,
    required this.editcompany,
    this.editCompnayCallBack,
  });

  final CompaniesRecord? editcompany;
  final Future Function()? editCompnayCallBack;

  @override
  State<EditCompanyFormWidget> createState() => _EditCompanyFormWidgetState();
}

class _EditCompanyFormWidgetState extends State<EditCompanyFormWidget> {
  late EditCompanyFormModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditCompanyFormModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.editCompayDoc =
          await CompaniesRecord.getDocumentOnce(widget.editcompany!.reference);
      safeSetState(() {
        _model.companyNameTextController?.text =
            _model.editCompayDoc!.businessName;
      });
      safeSetState(() {
        _model.companyAddressTextController?.text =
            _model.editCompayDoc!.address;
      });
      safeSetState(() {
        _model.statusValueController?.value =
            _model.editCompayDoc!.companiesStatus;
      });
      safeSetState(() {
        _model.countryNameValueController?.value =
            _model.editCompayDoc!.country;
      });
      safeSetState(() {
        _model.stateNameValueController?.value = _model.editCompayDoc!.state;
      });
      safeSetState(() {
        _model.cityNameValueController?.value = _model.editCompayDoc!.city;
      });
      _model.countyList = await CountriesDataAPIGroup.countriesCall.call();

      if ((_model.countyList?.succeeded ?? true)) {
        _model.countyListDataType = ((_model.countyList?.jsonBody ?? '')
                .toList()
                .map<CountryListStruct?>(CountryListStruct.maybeFromMap)
                .toList() as Iterable<CountryListStruct?>)
            .withoutNulls
            .toList()
            .cast<CountryListStruct>();
        _model.selectdCountyISO = _model.countyListDataType
            .where((e) => _model.countryNameValue == e.name)
            .toList()
            .firstOrNull
            ?.iso2;
        safeSetState(() {});
        _model.stateList = await CountriesDataAPIGroup.statesCall.call(
          ciso: _model.selectdCountyISO,
        );

        if ((_model.stateList?.succeeded ?? true)) {
          _model.stateListDataType = ((_model.stateList?.jsonBody ?? '')
                  .toList()
                  .map<StateListStruct?>(StateListStruct.maybeFromMap)
                  .toList() as Iterable<StateListStruct?>)
              .withoutNulls
              .toList()
              .cast<StateListStruct>();
          _model.selectdStateISO = _model.stateListDataType
              .where((e) => _model.stateNameValue == e.name)
              .toList()
              .firstOrNull
              ?.iso2;
          safeSetState(() {});
          _model.cityList = await CountriesDataAPIGroup.citiesCall.call(
            ciso: _model.selectdCountyISO,
            siso: _model.selectdStateISO,
          );

          if ((_model.cityList?.succeeded ?? true)) {
            _model.cityListDataType = ((_model.cityList?.jsonBody ?? '')
                    .toList()
                    .map<CityListStruct?>(CityListStruct.maybeFromMap)
                    .toList() as Iterable<CityListStruct?>)
                .withoutNulls
                .toList()
                .cast<CityListStruct>();
            _model.selectedCityName = _model.cityListDataType
                .where((e) => _model.cityNameValue == e.name)
                .toList()
                .firstOrNull
                ?.name;
            safeSetState(() {});
            return;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Something went wrong.',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Anwatrix_Font',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        letterSpacing: 0.0,
                      ),
                  textAlign: TextAlign.center,
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
              ),
            );
            return;
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Something went wrong.',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Anwatrix_Font',
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      letterSpacing: 0.0,
                    ),
                textAlign: TextAlign.center,
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            ),
          );
          return;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Something went wrong.',
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Anwatrix_Font',
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    letterSpacing: 0.0,
                  ),
              textAlign: TextAlign.center,
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          ),
        );
        return;
      }
    });

    _model.companyNameTextController ??= TextEditingController();
    _model.companyNameFocusNode ??= FocusNode();

    _model.companyAddressTextController ??= TextEditingController();
    _model.companyAddressFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 50.0, 12.0, 0.0),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 450.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x25090F13),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Container(
                        width: 60.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 44.0,
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Edit Company Form',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                'Please enter company details below to edit their profile.',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Anwatrix_Font',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 24.0,
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Container(
                          width: 370.0,
                          child: TextFormField(
                            controller: _model.companyNameTextController,
                            focusNode: _model.companyNameFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.companyNameTextController',
                              Duration(milliseconds: 100),
                              () => safeSetState(() {}),
                            ),
                            autofocus: true,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelText: 'Company Name',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Anwatrix_Font',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            maxLength: 50,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            keyboardType: TextInputType.name,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.companyNameTextControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              if (!isAndroid && !isiOS)
                                TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                  return TextEditingValue(
                                    selection: newValue.selection,
                                    text: newValue.text.toCapitalization(
                                        TextCapitalization.words),
                                  );
                                }),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Container(
                          width: 370.0,
                          child: TextFormField(
                            controller: _model.companyAddressTextController,
                            focusNode: _model.companyAddressFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.companyAddressTextController',
                              Duration(milliseconds: 100),
                              () => safeSetState(() {}),
                            ),
                            autofocus: true,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelText: 'Address',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Anwatrix_Font',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            maxLength: 100,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            keyboardType: TextInputType.streetAddress,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model
                                .companyAddressTextControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              if (!isAndroid && !isiOS)
                                TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                  return TextEditingValue(
                                    selection: newValue.selection,
                                    text: newValue.text.toCapitalization(
                                        TextCapitalization.characters),
                                  );
                                }),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.countryNameValueController ??=
                              FormFieldController<String>(null),
                          options: _model.countyListDataType
                              .unique((e) => e.name)
                              .map((e) => e.name)
                              .toList(),
                          onChanged: (val) async {
                            safeSetState(() => _model.countryNameValue = val);
                            var _shouldSetState = false;
                            _model.selectdCountyISO = _model.countyListDataType
                                .where((e) => e.name == _model.countryNameValue)
                                .toList()
                                .firstOrNull
                                ?.iso2;
                            safeSetState(() {});
                            _model.selectedCountryState =
                                await CountriesDataAPIGroup.statesCall.call(
                              ciso: _model.selectdCountyISO,
                            );

                            _shouldSetState = true;
                            if ((_model.selectedCountryState?.succeeded ??
                                true)) {
                              _model.stateListDataType =
                                  ((_model.selectedCountryState?.jsonBody ?? '')
                                              .toList()
                                              .map<StateListStruct?>(
                                                  StateListStruct.maybeFromMap)
                                              .toList()
                                          as Iterable<StateListStruct?>)
                                      .withoutNulls
                                      .toList()
                                      .cast<StateListStruct>();
                              safeSetState(() {});
                              if (_shouldSetState) safeSetState(() {});
                              return;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Something went wrong.',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Anwatrix_Font',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              );
                              if (_shouldSetState) safeSetState(() {});
                              return;
                            }

                            if (_shouldSetState) safeSetState(() {});
                          },
                          width: 370.0,
                          height: 50.0,
                          maxHeight: 200.0,
                          searchHintTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          searchTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                  ),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          hintText: 'Company Name',
                          searchHintText: '',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          elevation: 3.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 12.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: true,
                          isMultiSelect: false,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (_model.countryNameValue != null &&
                              _model.countryNameValue != '') {
                            return;
                          }

                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Country Required'),
                                content: Text(
                                    '\tPlease select a country before choosing a state.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.stateNameValueController ??=
                                    FormFieldController<String>(null),
                                options: _model.stateListDataType
                                    .unique((e) => e.name)
                                    .map((e) => e.name)
                                    .toList(),
                                onChanged: (val) async {
                                  safeSetState(
                                      () => _model.stateNameValue = val);
                                  var _shouldSetState = false;
                                  _model.selectdStateISO = _model
                                      .stateListDataType
                                      .where((e) =>
                                          e.name == _model.stateNameValue)
                                      .toList()
                                      .firstOrNull
                                      ?.iso2;
                                  safeSetState(() {});
                                  _model.selectedStateCity =
                                      await CountriesDataAPIGroup.citiesCall
                                          .call(
                                    ciso: _model.selectdCountyISO,
                                    siso: _model.selectdStateISO,
                                  );

                                  _shouldSetState = true;
                                  if ((_model.selectedStateCity?.succeeded ??
                                      true)) {
                                    _model.cityListDataType = ((_model
                                                        .selectedStateCity
                                                        ?.jsonBody ??
                                                    '')
                                                .toList()
                                                .map<CityListStruct?>(
                                                    CityListStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<CityListStruct?>)
                                        .withoutNulls
                                        .toList()
                                        .cast<CityListStruct>();
                                    safeSetState(() {});
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Something went wrong.',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Anwatrix_Font',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                      ),
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                                width: 370.0,
                                height: 50.0,
                                maxHeight: 200.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Anwatrix_Font',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                searchTextStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Anwatrix_Font',
                                      letterSpacing: 0.0,
                                    ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Anwatrix_Font',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                hintText: 'State Name',
                                searchHintText: '',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                elevation: 3.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 12.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: true,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if ((_model.countryNameValue != null &&
                                  _model.countryNameValue != '') &&
                              (_model.stateNameValue != null &&
                                  _model.stateNameValue != '')) {
                            return;
                          }

                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Country & Sate Required'),
                                content: Text(
                                    'Please select both country and state before choosing a city.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.cityNameValueController ??=
                                    FormFieldController<String>(null),
                                options: _model.cityListDataType
                                    .unique((e) => e.name)
                                    .map((e) => e.name)
                                    .toList(),
                                onChanged: (val) async {
                                  safeSetState(
                                      () => _model.cityNameValue = val);
                                  _model.selectedCityName = _model
                                      .cityListDataType
                                      .where(
                                          (e) => e.name == _model.cityNameValue)
                                      .toList()
                                      .firstOrNull
                                      ?.name;
                                  safeSetState(() {});
                                },
                                width: 370.0,
                                height: 50.0,
                                maxHeight: 200.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Anwatrix_Font',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                searchTextStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Anwatrix_Font',
                                      letterSpacing: 0.0,
                                    ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Anwatrix_Font',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                hintText: 'Cty Name',
                                searchHintText: '',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                elevation: 3.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 12.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: true,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.statusValueController ??=
                              FormFieldController<String>(null),
                          options:
                              CmpaniesStatus.values.map((e) => e.name).toList(),
                          onChanged: (val) =>
                              safeSetState(() => _model.statusValue = val),
                          width: 370.0,
                          height: 50.0,
                          searchHintTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          searchTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                  ),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Anwatrix_Font',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          hintText: 'Status',
                          searchHintText: '',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          elevation: 3.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 12.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: true,
                          isMultiSelect: false,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 24.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  _model.compnayAddForm = true;
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    safeSetState(
                                        () => _model.compnayAddForm = false);
                                    return;
                                  }
                                  if (_model.countryNameValue == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Country Name can’t be empty.',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Anwatrix_Font',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                    _model.compnayAddForm = false;
                                    safeSetState(() {});
                                    return;
                                  }
                                  if (_model.stateNameValue == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'State Name can’t be empty.',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Anwatrix_Font',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                    _model.compnayAddForm = false;
                                    safeSetState(() {});
                                    return;
                                  }
                                  if (_model.cityNameValue == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'City Name can’t be empty.',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Anwatrix_Font',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                    _model.compnayAddForm = false;
                                    safeSetState(() {});
                                    return;
                                  }
                                  if (_model.statusValue == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Status can’t be empty.',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Anwatrix_Font',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                    _model.compnayAddForm = false;
                                    safeSetState(() {});
                                    return;
                                  }

                                  await widget.editcompany!.reference.update({
                                    ...createCompaniesRecordData(
                                      businessName:
                                          _model.companyNameTextController.text,
                                      country: _model.countryNameValue,
                                      state: _model.stateNameValue,
                                      companiesStatus: _model.statusValue,
                                      city: _model.cityNameValue,
                                      address: _model
                                          .companyAddressTextController.text,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'edit_time':
                                            FieldValue.serverTimestamp(),
                                      },
                                    ),
                                  });
                                  await widget.editCompnayCallBack?.call();
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Changes saved—company profile updated.',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Anwatrix_Font',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              letterSpacing: 0.0,
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).success,
                                    ),
                                  );

                                  safeSetState(() {});
                                },
                                text: 'Save',
                                icon: Icon(
                                  Icons.save_rounded,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: 150.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Anwatrix_Font',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                  hoverColor:
                                      FlutterFlowTheme.of(context).success,
                                  hoverBorderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  hoverTextColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  hoverElevation: 3.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
