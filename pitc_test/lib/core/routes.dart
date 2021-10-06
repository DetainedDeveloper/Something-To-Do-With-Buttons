import 'package:flutter/widgets.dart';
import 'package:pitc_test/project/view/screens/screens.dart';

class Routes {
  static const String first = '/';
  static const String second = '/second';

  static Map<String, WidgetBuilder> routes = {
    first: (_) => const FirstScreen(),
    second: (_) => const SecondScreen(),
  };
}
