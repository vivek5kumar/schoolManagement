import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PanVerifyPage extends StatefulWidget {
  PanVerifyPage({super.key});

  @override
  State<PanVerifyPage> createState() => _PanVerifyPageState();
}

class _PanVerifyPageState extends State<PanVerifyPage> {
  final _panKey = GlobalKey<FormState>();

  var keyboardType = TextInputType.text;

  final panCtrl = TextEditingController();
  late FocusNode myFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Form(
      key: _panKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Pan Card Verification"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (val) {
                if (val!.isEmpty) {
                  return "required";
                }
              },
              decoration: InputDecoration(
                  labelText: 'ABC1234',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              style: Theme.of(context).textTheme.bodyText2,
              controller: panCtrl,
              focusNode: myFocusNode,
              textCapitalization: TextCapitalization.characters,
              keyboardType: keyboardType,
              onChanged: (text) {
                if (panCtrl.text.length > 4 && panCtrl.text.length < 6) {
                  setState(() {
                    myFocusNode.unfocus();
                    Future.delayed(const Duration(milliseconds: 50))
                        .then((value) {
                      myFocusNode.requestFocus();
                    });
                    keyboardType = TextInputType.number;
                  });
                } else if (panCtrl.text.length > 8) {
                  setState(() {
                    myFocusNode.unfocus();
                    Future.delayed(const Duration(milliseconds: 50))
                        .then((value) {
                      myFocusNode.requestFocus();
                    });
                    keyboardType = TextInputType.text;
                  });
                }
                // if (panCtrl.text.length < 6 && panCtrl.text.length > 4) {
                //   setState(() {
                //     myFocusNode.unfocus();
                //     Future.delayed(const Duration(milliseconds: 50))
                //         .then((value) {
                //       myFocusNode.requestFocus();
                //     });
                //     keyboardType = TextInputType.number;
                //   });
                // } else if (panCtrl.text.length < 10 &&
                //     panCtrl.text.length > 8) {
                //   setState(() {
                //     myFocusNode.unfocus();
                //     Future.delayed(const Duration(milliseconds: 50))
                //         .then((value) {
                //       myFocusNode.requestFocus();
                //     });
                //     keyboardType = TextInputType.text;
                //   });
                // } else if (panCtrl.text.length < 10 &&
                //     panCtrl.text.length < 10) {
                //   setState(() {
                //     myFocusNode.unfocus();
                //     Future.delayed(const Duration(microseconds: 500))
                //         .then((value) {
                //       myFocusNode.requestFocus();
                //     });
                //     keyboardType = TextInputType.number;
                //   });
                // }

                if (panCtrl.text != text.toUpperCase()) {
                  panCtrl.value =
                      panCtrl.value.copyWith(text: text.toUpperCase());
                }
                // if (panCtrl.text.length == 5) {
                //   setState(() {
                //     myFocusNode.unfocus();
                //     Future.delayed(const Duration(milliseconds: 50))
                //         .then((value) {
                //       myFocusNode.requestFocus();
                //     });
                //   });
                // }
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_panKey.currentState!.validate()) {}
              },
              child: Text("Submit"))
        ],
      ),
    ));
  }
}
