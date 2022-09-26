import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jumia/Model/document.dart';
import 'package:jumia/Presentation/Resources/color_manager.dart';
import 'package:jumia/Presentation/Resources/constants.dart';
import 'package:jumia/Presentation/Screens/Main/EditScreen/edit_screen.dart';
import 'package:jumia/Service/auth_service.dart';
import 'package:jumia/Service/database_service.dart';
import 'package:jumia/Widgets/loading.dart';
import 'package:provider/provider.dart';

import '../../../../Model/user.dart';

class AccountView extends StatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final AuthService _service = AuthService();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserID?>(context);
    return (isLoading)
        ? const LoadingWidget()
        : SafeArea(
            child: StreamBuilder<DocumentSnapshot?>(
                stream: DataBaseService(uid: user!.uid).documentSnapShots(),
                builder: (context, AsyncSnapshot<DocumentSnapshot?> snapshot) {
                  if (snapshot.hasData) {
                    Map<String, dynamic>? data =
                        snapshot.data?.data() as Map<String, dynamic>?;
                    DocumentData doc = DocumentData.fromJson(data ?? {});
                    return Scaffold(
                      appBar: AppBar(
                        elevation: 0,
                        backgroundColor: ColorManager.splash,
                        title: Text("Hi, ${doc.firstName}"),
                        actions: [
                          IconButton(
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                await _service.signOut();
                              },
                              icon: const Icon(Icons.logout))
                        ],
                      ),
                      body: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(TextConstants.text1,
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w700)),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.drive_file_rename_outline,
                                        size: 33,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text("${doc.lastName} ${doc.firstName}",
                                          style: const TextStyle(fontSize: 18)),
                                      const SizedBox(
                                        width: 50 * 3.5,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => EditScreen(
                                                      address: doc.address,
                                                      firstName: doc.firstName,
                                                      lastName: doc.lastName)));
                                        },
                                        child: Text("Edit",
                                            style: TextStyle(
                                                color: ColorManager.splash,
                                                fontSize: 18)),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.face_outlined,
                                        size: 33,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(doc.gender,
                                          style: const TextStyle(fontSize: 18))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.person,
                                        size: 33,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text("${doc.age}",
                                          style: const TextStyle(fontSize: 18))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.phone_in_talk_outlined,
                                        size: 33,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(doc.phoneNumber,
                                          style: const TextStyle(fontSize: 18))
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 45,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(TextConstants.text2,
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w700)),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 33,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        doc.address,
                                        style: const TextStyle(fontSize: 18),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Scaffold(
                      body: Center(child: Text("no data found")),
                    );
                  } else {
                    return const Center(child: LoadingWidget());
                  }
                }),
          );
  }
}
