import 'package:flutter/material.dart';
import 'second_root_view.dart';
import 'package:navigator/routes.dart';

class SecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case Routes.secondRoot:
            return MaterialPageRoute(builder: (_) => SecondRootView());
          default:
            return null;
        }
      },
      initialRoute: Routes.secondRoot,
    );
  }
}
