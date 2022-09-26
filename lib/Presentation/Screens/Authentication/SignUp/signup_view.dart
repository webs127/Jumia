import 'package:flutter/material.dart';
import 'package:jumia/Presentation/Resources/color_manager.dart';
import 'package:jumia/Service/auth_service.dart';
import 'package:jumia/Widgets/loading.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isLoading = false;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController password = TextEditingController();
  final _key = GlobalKey<FormState>();
  final AuthService _service = AuthService();
  @override
  Widget build(BuildContext context) {
    return (isLoading) ? const LoadingWidget() : SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
        child: Form(
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: firstName,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "FirstName",
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
                TextFormField(
                  controller: lastName,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "LastName",
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
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        controller: gender,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Gender",
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
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: age,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: const TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Age",
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: ColorManager.splash))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required";
                          }
                          if (int.parse(value) < 15) {
                            return "User must be at least 15";
                          }
                          return null;
                        },
                      ),
                    ),

                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: phoneNumber,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Phone Number",
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
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        controller: country,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Country",
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
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: state,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "State",
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: address,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Address",
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
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: email,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  controller: password,
                  obscureText: true,
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
                    if (value.length < 5) {
                      return "weak password";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: confirmPassword,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Confirm Password",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: ColorManager.splash))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    }
                    if (value != password.text) {
                      return "password does not correspond";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                RawMaterialButton(
                  fillColor: ColorManager.splash,

                  onPressed: () async{
                    if (_key.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      dynamic result = await _service.registerWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                          firstName: firstName.text,
                          lastName: lastName.text,
                          gender: gender.text,
                          age: int.parse(age.text),
                          phoneNumber: phoneNumber.text,
                          country: country.text,
                          state: state.text,
                          address: address.text);
                      if(result != null) {
                      }
                      else {
                        setState(() {
                          isLoading = false;
                        });
                        print(_service.errorMessage);
                      }
                    } else {
                      isLoading = false;
                    }
                  },
                  child: const Text("Register"),
                )
              ],
            )),
      ),
    );
  }
}

