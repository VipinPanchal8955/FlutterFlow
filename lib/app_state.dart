import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_CurentUserLogin')) {
        try {
          final serializedData = prefs.getString('ff_CurentUserLogin') ?? '{}';
          _CurentUserLogin =
              LoginUserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  LoginUserStruct _CurentUserLogin = LoginUserStruct();
  LoginUserStruct get CurentUserLogin => _CurentUserLogin;
  set CurentUserLogin(LoginUserStruct value) {
    _CurentUserLogin = value;
    prefs.setString('ff_CurentUserLogin', value.serialize());
  }

  void updateCurentUserLoginStruct(Function(LoginUserStruct) updateFn) {
    updateFn(_CurentUserLogin);
    prefs.setString('ff_CurentUserLogin', _CurentUserLogin.serialize());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
