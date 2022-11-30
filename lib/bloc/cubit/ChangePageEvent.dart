import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../mainBody.dart';
import '../../page/page0.dart';
import '../../page/page1.dart';
import '../../page/page10.dart';
import '../../page/page2.dart';
import '../../page/page3.dart';
import '../../page/page4.dart';
import '../../page/page5.dart';
import '../../page/page6.dart';
import '../../page/page7.dart';
import '../../page/page8.dart';
import '../../page/page9.dart';
import '../../widget/menu/mainmenu.dart';
import 'NotificationEvent.dart';
//-------------------------------------------------

// abstract class ChangePage_Event {}

class ChangePage_Bloc extends Cubit<Widget> {
  ChangePage_Bloc() : super(Page0());
  Future<void> ChangePage(int input) async {
    Widget output = Page0();

    if (permission(input)) {
      output = pagechange(input);
    } else {
      output = Page0();
      BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
          "Error", "No have permission", enumNotificationlist.Error);
    }

    print(permission(input));
    Navigator.pop(MenuContext);
    emit(output);
  }

  Future<void> ChangePage_nodrower(int input) async {
    Widget output = Page0();

    if (permission(input)) {
      output = pagechange(input);
    } else {
      output = Page0();
      BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
          "Error", "No have permission", enumNotificationlist.Error);
    }

    emit(output);
  }
}

Widget pagechange(int input) {
  if (input == 1) {
    return Page1();
  } else if (input == 2) {
    return Page2();
  } else if (input == 3) {
    return Page3();
  } else if (input == 4) {
    return Page4();
  } else if (input == 5) {
    return Page5();
  } else if (input == 6) {
    return Page6();
  } else if (input == 7) {
    return Page7();
  } else if (input == 8) {
    return Page8();
  } else if (input == 9) {
    return Page9();
  } else if (input == 10) {
    return Page10();
  } else {
    return Page0();
  }
}

bool permission(int input) {
  if (input == 1) {
    return USERDATA.UserLV >= 0;
  } else if (input == 2) {
    return USERDATA.UserLV >= 1;
  } else if (input == 3) {
    return USERDATA.UserLV >= 0;
  } else if (input == 4) {
    return USERDATA.UserLV >= 1;
  } else if (input == 5) {
    return USERDATA.UserLV >= 0;
  } else if (input == 6) {
    return USERDATA.UserLV >= 1;
  } else if (input == 7) {
    return USERDATA.UserLV >= 1;
  } else if (input == 8) {
    return USERDATA.UserLV >= 1;
  } else {
    return false;
  }
}
