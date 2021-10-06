import 'package:flutter/material.dart';
import 'package:pitc_test/core/routes.dart';
import 'package:pitc_test/project/controller/button_controller.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  static final TextEditingController _totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /// Input
            TextField(
              controller: _totalController,
              style: const TextStyle(fontSize: 20.0),
              keyboardType: const TextInputType.numberWithOptions(signed: true),
              maxLength: 2,
              maxLines: 1,
            ),

            /// Submit Button
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  bool result = ButtonController.instance.setTotal(_totalController.text);

                  /// If number is valid, navigate to second screen
                  /// Else show message
                  if (result) {
                    _totalController.clear();
                    Navigator.pushNamed(context, Routes.second);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Provide a non-zero number less than 25'),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
