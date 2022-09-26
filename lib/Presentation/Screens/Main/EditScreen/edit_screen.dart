import 'package:flutter/material.dart';
import 'package:jumia/Service/database_service.dart';
import 'package:jumia/Widgets/loading.dart';
import 'package:provider/provider.dart';
import '../../../../Model/user.dart';
import '../../../Resources/color_manager.dart';

class EditScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String address;
  const EditScreen(
      {required this.address,
      required this.firstName,
      required this.lastName,
      Key? key})
      : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  bool isLoading = false;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController firstName =
        TextEditingController(text: widget.firstName);
    TextEditingController lastName =
        TextEditingController(text: widget.lastName);
    TextEditingController address = TextEditingController(text: widget.address);
    TextEditingController nickName = TextEditingController();
    final user = Provider.of<UserID?>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: ColorManager.splash,
        title: const Text("Edit Profile"),
      ),
      body: (isLoading)
          ? const LoadingWidget()
          : Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
              child: Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: firstName,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "firstName",
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
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: nickName,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "NickName",
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
                        textInputAction: TextInputAction.done,
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
                      RawMaterialButton(
                        fillColor: ColorManager.splash,
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await DataBaseService(uid: user!.uid)
                              .updateUserPreferences(
                                  firstName: firstName.text,
                                  lastName: lastName.text,
                                  nickName: nickName.text,
                                  address: address.text);
                          Navigator.pop(context);
                        },
                        child: const Text("Save"),
                      )
                    ],
                  )),
            ),
    );
  }
}
