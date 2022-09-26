import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jumia/Model/user.dart';
import 'package:jumia/Presentation/Resources/route_manager.dart';
import 'package:jumia/Service/auth_service.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserID?>.value(
      value: AuthService().getUserChanges(),
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.getRoutes,
        initialRoute: RouteManager.splash,
        title: 'Jumia',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
      ),
    );
  }
}
