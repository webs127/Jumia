import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jumia/Presentation/Resources/color_manager.dart';

class CameraView extends StatefulWidget {
  const CameraView({Key? key}) : super(key: key);

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  final ImagePicker _picker = ImagePicker();
  XFile? xFile;
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
                      onTap: () {
                        getImageFromCamera();
                      },
                      child: Text(
                        "Select From Camera",
                        style:
                            TextStyle(color: ColorManager.blue, fontSize: 30),
                      )),
                  Divider(
                    color: ColorManager.white1,
                  ),
                  InkWell(
                      onTap: () {
                        getImageFromGallery();
                        print(xFile!.path);
                      },
                      child: Text(
                        "Select From Photos",
                        style:
                            TextStyle(color: ColorManager.blue, fontSize: 30),
                      )),
                  Divider(
                    color: ColorManager.white1,
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
          )
        ],
      ),
    );
  }

  void getImageFromGallery() async {
    final XFile? selectImage =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      xFile = selectImage;
    });
  }

  void getImageFromCamera() async {
    final XFile? selectImage =
        await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      xFile = selectImage;
    });
  }
}
