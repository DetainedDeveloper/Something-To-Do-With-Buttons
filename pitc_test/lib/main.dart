import 'package:flutter/material.dart';
import 'package:pitc_test/core/routes.dart';
import 'package:pitc_test/project/controller/button_controller.dart';
import 'package:provider/provider.dart';

void main() => runApp(const PITCTestApp());

class PITCTestApp extends StatelessWidget {
  const PITCTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Providing [TestController] to be passed down the widget tree

    return ChangeNotifierProvider<ButtonController>(
      create: (_) => ButtonController.instance,
      child: MaterialApp(
        title: 'PITC Test',

        /// ThemeData could be in a separate file but there is no need here
        theme: ThemeData(
          primarySwatch: Colors.blue,
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.all(16.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 18.0),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  horizontal: 64.0,
                  vertical: 12.0,
                ),
              ),
            ),
          ),
        ),
        routes: Routes.routes,
        initialRoute: Routes.first,
      ),
    );
  }
}
