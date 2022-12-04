import 'package:flutter/material.dart';

import '../data/global.dart';
import '../mainBody.dart';
import 'TEST.dart';

bool isChecked = false;

class Page0 extends StatelessWidget {
  const Page0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page0Body();
  }
}

class Page0Body extends StatelessWidget {
  const Page0Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(token);
    if (token != '') {
      return const Center(
        child: FILEpicfunction(),
      );
    } else {
      return Loginbody();
    }
  }
}

// child: Container(
//     height: 100,
//     width: 200,
//     color: Colors.orange,
//     child: const Center(
//     child: Text("initial Page \nor do something wrong"))),