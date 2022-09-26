import 'package:flutter/material.dart';
import 'package:jumia/Model/user.dart';
import 'package:jumia/Presentation/Screens/Authentication/auth.dart';
import 'package:jumia/Presentation/Screens/Main/main_view.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserID?>(context);
    return (user == null) ? const Authentication() : const MainView();
  }
}
