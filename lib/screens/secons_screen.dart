import 'package:flutter/material.dart';
import 'dart:math';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String? data = arg['data'];
    var item = int.parse(data as String);
    var rnd = Random().nextInt(10 - 1);
    print(rnd);

    return SafeArea(
      child: Scaffold(
        body: Wrap(
          children: [
            for (int i = 0; i < item; i++) buildButton(index: i, rndNum: rnd),
          ],
        ),
      ),
    );
  }

  Padding buildButton({required int index, required int rndNum}) {
    bool? enableBtnClicked = false;
    Color clr = index == rndNum ? Colors.blue : Colors.white;
    Map<int, dynamic> selected = {};

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: SizedBox(
        height: 80,
        width: 80,
        child: ElevatedButton(
          onPressed: () {
            if (index == rndNum) {
              // setState(() {
              enableBtnClicked = true;
              print('rndbtn clicked \n enableBtnClicked : $enableBtnClicked');
              // clr = Colors.green;
              // });
            } else {
              null;
              print('not rndbtn');
            }
          },
          style: ElevatedButton.styleFrom(
            primary: index == rndNum
                ? enableBtnClicked == true
                    ? Colors.green
                    : clr
                : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            side: const BorderSide(color: Colors.black),
          ),
          child: null,
        ),
      ),
    );
  }
}
