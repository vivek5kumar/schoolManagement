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
              decoration: InputDecoration(
                  labelText: 'ABC1234',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              style: Theme.of(context).textTheme.bodyText2,
              controller: panCtrl,
              focusNode: myFocusNode,
              textCapitalization: TextCapitalization.characters,
              keyboardType: (panCtrl.text.length >= 5)
                  ? TextInputType.number
                  : TextInputType.name,
              onChanged: (text) {
                if (panCtrl.text != text.toUpperCase()) {
                  panCtrl.value =
                      panCtrl.value.copyWith(text: text.toUpperCase());
                }
                if (panCtrl.text.length == 5) {
                  setState(() {
                    myFocusNode.unfocus();
                    Future.delayed(const Duration(milliseconds: 50))
                        .then((value) {
                      myFocusNode.requestFocus();
                    });
                  });
                }
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
