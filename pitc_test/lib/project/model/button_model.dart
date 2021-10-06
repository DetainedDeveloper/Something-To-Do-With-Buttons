import 'package:pitc_test/core/enums.dart';

abstract class ButtonModel {

  /// Creating getters and setters so there is no other way of manipulating variables
  /// [_totalButtons] keeps count of total buttons to show

  static int _totalButtons = 0;

  static int get totalButtons => _totalButtons;

  static void setTotalButtons(int total) => _totalButtons = total;

  /// [_buttonStateList] keeps a list of state of all buttons

  static List<ButtonState> _buttonStateList = List.generate(_totalButtons, (index) => ButtonState.inactive);

  static List<ButtonState> get buttonStateList => _buttonStateList;

  /// [_buttonStateList] should be generated everytime a new [_totalButtons] value is given
  static void generateButtonStateList(int total) => _buttonStateList = List.generate(total, (index) => ButtonState.inactive);

  /// Get Button's State at given index
  static ButtonState getButtonState(int index) => _buttonStateList[index];

  /// Change Button's State
  static void setButtonState(int index, ButtonState state) => _buttonStateList[index] = state;

  /// Keep count of Green Buttons
  /// So we don't accidentally change a green one back to blue!
  static int _greenButtonCount = 0;

  static int get greenButtonCount => _greenButtonCount;

  /// Increase Green Button count when Blue Button is turned into green
  static void increaseGreenCount() => _greenButtonCount += 1;

  /// Reset Green Button count when a new [_totalButtons] is given
  static void resetGreenCount() => _greenButtonCount = 0;
}
