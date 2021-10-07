import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:pitc_test/core/enums.dart';
import 'package:pitc_test/core/utils.dart';
import 'package:pitc_test/project/model/button_model.dart';

class ButtonController extends ChangeNotifier {
  ButtonController._();

  static final ButtonController _instance = ButtonController._();

  static ButtonController get instance => _instance;

  /// Get total button count from model
  int get totalButtons => ButtonModel.totalButtons;

  bool setTotal(String input) {

    /// Try to parse the input to an integer
    try {
      int number = int.parse(input);

      if (Utils.numberIsValid(number)) {

        /// If it is a valid number [non-zero and less than 25]
        /// 1. Set [total] button count
        ButtonModel.setTotalButtons(number);

        /// 2. Recreate the existing list with size of new [total]
        ButtonModel.generateButtonStateList(number);

        /// 3. Reset Green Button count
        ButtonModel.resetGreenCount();

        /// 4. Turn any random button in range into blue
        ButtonModel.setButtonState(Random().nextInt(number), ButtonState.blue);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // TODO : Display a message if try doesn't succeed
      print('Error : $e}');
      return false;
    }
  }

  /// Get a Button's state by index
  ButtonState getButtonState(int index) => ButtonModel.getButtonState(index);

  /// Get count of total Green Buttons
  int get greenButtonCount => ButtonModel.greenButtonCount;
  
  void changeButtonState(int current) {

    /// Check if the button pressed [current] by the user is blue or not
    if (getButtonState(current) == ButtonState.blue) {
      
      /// If it is blue, then make it green
      ButtonModel.setButtonState(current, ButtonState.green);
      
      /// Increase green count by 1
      ButtonModel.increaseGreenCount();

      /// Generate a new random button's index
      /// [next] meaning the next button that is going to become blue
      int next = Random().nextInt(totalButtons);

      /// While green button count is lower than total buttons
      while (greenButtonCount < totalButtons) {
        
        /// Check if the button at generated new index [next] is green
        if (getButtonState(next) == ButtonState.green) {
          
          /// If it is, generate a new random button less than [totalButtons]
          next = Random().nextInt(totalButtons);
        } else {
          
          /// If it's not green, turn the new one into blue!
          /// And break the loop
          ButtonModel.setButtonState(next, ButtonState.blue);
          break;
        }
      }
    }

    /// Notify listeners when button state is changed
    notifyListeners();
  }
}
