import 'package:blueboxinfosoft/resources/string_resources.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../resources/routes.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var rnd;
  var item;
  bool _hasBeenPressed = false;
  final _selected = <int>{};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String? data = arg['data'];
    item = int.parse(data as String);
    if (!(_selected.length == item)) {
      rnd = generateRandom(item);
    }
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

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(StringResources.endOfGameTitle),
        content: const Text(StringResources.endOfGameMsg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context)
                .pushNamedAndRemoveUntil(Routes.firstScreen, (route) => false),
            child: const Text(StringResources.endOfGameAction),
          ),
        ],
      ),
    );
  }

  Padding buildButton({required int index, required int rndNum}) {
    bool? enableBtnClicked = false;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: SizedBox(
        height: 80,
        width: 80,
        child: ElevatedButton(
          onPressed:
              index == rndNum ? () => customOnPress(index, rndNum) : () {},
          style: ElevatedButton.styleFrom(
            primary: getColor(index, rndNum),
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

  int generateRandom(int max) {
    int ranDom = Random().nextInt(max);
    if (_selected.isNotEmpty) {
      if (_selected.contains(ranDom)) {
        ranDom = generateRandom(max);
        return ranDom;
      } else {
        return ranDom;
      }
    }
    return ranDom;
  }

  Color? getColor(int index, int rndNum) {
    return _selected.contains(index)
        ? Colors.green
        : index == rndNum
            ? Colors.blue
            : Colors.white;
  }

  void customOnPress(int index, int rndNum) {
    setState(() {
      if (_selected.isEmpty) {
        _selected.add(index);
        print(_selected);
      } else if (!_selected.contains(index)) {
        _selected.add(index);
        print(_selected);
      }
    });
    if (_selected.length == item) {
      print('show dialog');
      buildShowDialog(context);
    }
  }
}
