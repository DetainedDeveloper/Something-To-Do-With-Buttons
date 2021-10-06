import 'package:flutter/material.dart';
import 'package:pitc_test/core/enums.dart';

class Button extends StatelessWidget {
  final double size;
  final ButtonState buttonState;
  final Function()? onPressed;

  const Button({
    Key? key,
    required this.size,
    required this.buttonState,
    required this.onPressed,
  }) : super(key: key);

  /// Assign a color depending on Button's state
  static Color _buttonColor(ButtonState buttonState) {
    switch (buttonState) {
      case ButtonState.inactive:
        return Colors.white;

      case ButtonState.blue:
        return Colors.blue;

      case ButtonState.green:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(_buttonColor(buttonState)),
        ),
        child: const SizedBox.shrink(),
        onPressed: onPressed,
      ),
    );
  }
}
