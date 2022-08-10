import 'package:blueboxinfosoft/resources/string_resources.dart';
import 'package:flutter/material.dart';
import '../resources/routes.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController? text;
  bool? _validate;
  bool? _navigate = true;

  @override
  void initState() {
    text = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    text?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: TextField(
                    controller: text,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: StringResources.hintText,
                      errorText: _validate == true ? _validateInput : null,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: 120.0,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _validate = true;
                      });
                      // text!.value.text.isNotEmpty ? _submit : null;
                      _submit();
                    },
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    child: const Text(
                      StringResources.submitText,
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? get _validateInput {
    final data = text!.value.text;
    if (data.isNotEmpty) {
      if (int.parse(data) >= 25) {
        return StringResources.errorGreaterThanText;
      } else if (int.parse(data) == 0) {
        return StringResources.errorZeroNumText;
      }
    } else if (data.isEmpty) {
      return StringResources.errorText;
    }

    return null;
  }

  void _submit() {
    print('in submit');
    if (_validateInput == null) {
      Navigator.of(context).pushNamed(Routes.secondScreen, arguments: {
        'data': text!.value.text,
      });
    }
  }
}
