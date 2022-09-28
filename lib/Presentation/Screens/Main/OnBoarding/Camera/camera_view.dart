import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jumia/Presentation/Resources/color_manager.dart';
import 'package:jumia/Presentation/Screens/Main/OnBoarding/Camera/camera_repo.dart';

class CameraView extends StatefulWidget {
  const CameraView({Key? key}) : super(key: key);

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  final CameraRepo _cameraRepo = CameraRepo();
  XFile? _xFile;
  String? path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black0,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.black0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
          ),
          color: ColorManager.grey,
        ),
        actions: [
          IconButton(
            onPressed: () {
              //Navigator.pop(context);
            },
            icon: const Icon(Icons.help_outline, size: 30),
            color: ColorManager.grey,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 300,
              height: 230,
              decoration: BoxDecoration(
                color: ColorManager.black1,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () async{
                        _xFile = await _cameraRepo.cameraImage;
                        setState(() {
                          path = _xFile!.path;
                        });
                      },
                      child: Text(
                        "Select From Camera",
                        style:
                            TextStyle(color: ColorManager.blue, fontSize: 30),
                      )),
                  Divider(
                    thickness: 2,
                    color: ColorManager.white1,
                  ),

                  InkWell(
                      onTap: () async{
                        _xFile = await _cameraRepo.galleryImage;
                        setState(() {
                          path = _xFile!.path;
                        });
                      },
                      child: Text(
                        "Select From Photos",
                        style:
                            TextStyle(color: ColorManager.blue, fontSize: 30),
                      )),
                  Divider(
                    color: ColorManager.white1,
                    thickness: 2,
                  ),
                  InkWell(
                      hoverColor: Colors.grey,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style:
                            TextStyle(color: ColorManager.blue, fontSize: 30),
                      ))
                ],
              ),
            ),
          ),
          (_xFile != null) ? Image.file(
              File(path!), width: 300, height: 300,) : const Text("")
        ],
      ),
    );
  }
}
