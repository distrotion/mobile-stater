import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/Loading.dart';
import '../cubit/ChangePageEvent.dart';
import '../cubit/NotificationEvent.dart';

//-------------------------------------------------

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
late Future<String> tokenSP;

abstract class LoginEvent {}

class LoginPage extends LoginEvent {}

class ReLogin extends LoginEvent {}

class Logout extends LoginEvent {}

class Logout_drower extends LoginEvent {}

//_Logout_Function_drower

class Login_Bloc extends Bloc<LoginEvent, String> {
  Login_Bloc() : super('') {
    on<LoginPage>((event, emit) {
      return _LoginPage_Function(state, emit);
    });
    on<ReLogin>((event, emit) {
      return _ReLogin_Function(state, emit);
    });
    on<Logout>((event, emit) {
      return _Logout_Function(state, emit);
    });
    on<Logout_drower>((event, emit) {
      return _Logout_Function_drower(state, emit);
    });
  }

  Future<void> _LoginPage_Function(String toAdd, Emitter<String> emit) async {
    final SharedPreferences prefs = await _prefs;
    // token = (prefs.getString('token') ?? '');
    token = 'test';
    USERDATA.UserLV = 1;

    tokenSP = prefs.setString("tokenSP", token).then((bool success) {
      return state;
    });

    if (token != '') {
      MainBodyContext.read<ChangePage_Bloc>().ChangePage_nodrower(1);
      BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
          "Success", "Login OK", enumNotificationlist.Success);
    } else {
      BlocProvider.of<BlocNotification>(contextGB).UpdateNotification("Error",
          "user or password have some problem", enumNotificationlist.Error);
    }

    emit(token);
  }

  Future<void> _ReLogin_Function(String toAdd, Emitter<String> emit) async {
    final SharedPreferences prefs = await _prefs;
    FreeLoading(LoginContext);
    await Future.delayed(const Duration(seconds: 1));
    token = (prefs.getString('tokenSP') ?? '');
    USERDATA.UserLV = 1;
    Navigator.pop(LoginContext);
    if (token != '') {
      MainBodyContext.read<ChangePage_Bloc>().ChangePage_nodrower(1);
    }

    emit(token);
  }

  Future<void> _Logout_Function(String toAdd, Emitter<String> emit) async {
    final SharedPreferences prefs = await _prefs;
    token = '';
    USERDATA.UserLV = 0;

    tokenSP = prefs.setString("tokenSP", token).then((bool success) {
      return state;
    });

    if (token == '') {
      MainBodyContext.read<ChangePage_Bloc>().ChangePage_nodrower(0);
      BlocProvider.of<BlocNotification>(contextGB)
          .UpdateNotification("", "Logout", enumNotificationlist.Success);
    }

    emit('');
  }

  Future<void> _Logout_Function_drower(
      String toAdd, Emitter<String> emit) async {
    final SharedPreferences prefs = await _prefs;
    token = '';
    USERDATA.UserLV = 0;

    tokenSP = prefs.setString("tokenSP", token).then((bool success) {
      return state;
    });

    if (token == '') {
      MainBodyContext.read<ChangePage_Bloc>().ChangePage(0);
      BlocProvider.of<BlocNotification>(contextGB)
          .UpdateNotification("", "Logout", enumNotificationlist.Success);
    }

    emit('');
  }
}
