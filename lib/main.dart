import 'package:flutter/material.dart';
import 'package:apogee_leaders_app/core/services/navigation_service.dart';
import 'package:apogee_leaders_app/core/utilities/router.dart' as router;
import 'package:apogee_leaders_app/ui/login_view.dart';
import 'locator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await setupLocator();
  runApp(ApogeeLeadersApp());
}

class ApogeeLeadersApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: (settings) => router.Router.generateRoute(context, settings),
      home: LoginView(),
    );
  }
}
