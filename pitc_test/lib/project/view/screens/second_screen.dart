import 'package:flutter/material.dart';
import 'package:pitc_test/project/controller/button_controller.dart';
import 'package:pitc_test/project/view/widgets/button.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  String _title(int buttonsLeft) {
    if (buttonsLeft == 0) {
      return 'All Buttons turned to green!';
    } else {
      return '$buttonsLeft Buttons to go!';
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Get the Controller's instance passed earlier in MaterialApp
    final ButtonController _controller = Provider.of<ButtonController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_title(_controller.totalButtons - _controller.greenButtonCount)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            
            return SingleChildScrollView(
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 16.0,
                runSpacing: 16.0,

                /// Generate a list of buttons of same amount as input
                children: List.generate(
                  _controller.totalButtons,
                  (index) => Button(
                    size: (constraints.maxWidth / 3) - 12,
                    buttonState: _controller.getButtonState(index),
                    onPressed: () => _controller.changeButtonState(index),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
