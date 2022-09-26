import 'package:flutter/material.dart';
import 'package:jumia/Service/auth_service.dart';
import 'package:jumia/Widgets/loading.dart';
import '../../../Resources/color_manager.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isLoading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _key = GlobalKey<FormState>();
  final AuthService _service = AuthService();
  @override
  Widget build(BuildContext context) {
    return (isLoading)
        ? const LoadingWidget()
        : Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
            child: Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: email,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Email",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: ColorManager.splash))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Required";
                        }
                        if (!value.contains("@")) {
                          return "require @ symbol";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: password,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Password",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: ColorManager.splash))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RawMaterialButton(
                      fillColor: ColorManager.splash,
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          dynamic result =
                              await _service.signInWithEmailAndPassword(
                                  email: email.text, password: password.text);
                          if (result == null) {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        } else {
                          isLoading = false;
                        }
                      },
                      child: const Text("Login"),
                    )
                  ],
                )),
          );
  }
}
