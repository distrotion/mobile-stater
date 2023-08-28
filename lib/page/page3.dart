import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/ChangePageEvent.dart';
import '../mainBody.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page3Body();
  }
}

class Page3Body extends StatelessWidget {
  const Page3Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          MainBodyContext.read<ChangePage_Bloc>().ChangePage_nodrower(2);
        },
        child: Container(
          height: 100,
          width: 100,
          color: Colors.green,
          child: const Text("PAGE 3"),
        ),
      ),
    );
  }
}
