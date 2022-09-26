import 'package:flutter/material.dart';
import 'package:jumia/Presentation/Resources/color_manager.dart';
import 'package:jumia/Presentation/Screens/Authentication/SignIn/signin_view.dart';
import 'package:jumia/Presentation/Screens/Authentication/SignUp/signup_view.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool changeView = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorManager.splash,
          actions: [
            RawMaterialButton(onPressed: () {
              setState(() {
                changeView = !changeView;
              });
            },
              child: Text((changeView) ? "Login" : "Register", style: TextStyle(fontSize: 20, color: ColorManager.white, fontWeight:FontWeight.w600)),
            )
          ],
          automaticallyImplyLeading: false,
        ),
          body: (changeView) ? const SignUpView() : const SignInScreen()
      ),
    );
  }
}
