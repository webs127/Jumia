import 'package:flutter/material.dart';
import 'package:jumia/Presentation/Resources/color_manager.dart';

class CameraView extends StatelessWidget {
  const CameraView({Key? key}) : super(key: key);

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
            icon: const Icon(Icons.arrow_back_ios, size: 30,),
            color: ColorManager.white,
          ),
        actions: [
          IconButton(
            onPressed: () {
              //Navigator.pop(context);
            },
            icon: const Icon(Icons.help_outline, size: 30),
            color: ColorManager.white,
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
                    onTap: () {},
                      child: Text("Select From Camera",style: TextStyle(color: ColorManager.blue, fontSize: 30),)),
                  Divider(color: ColorManager.white1,),
                  InkWell(
                      onTap: () {},
                      child: Text("Select From Photos",style: TextStyle(color: ColorManager.blue, fontSize: 30),)),
                  Divider(color: ColorManager.white1,),
                  InkWell(
                    hoverColor: Colors.grey,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel",style: TextStyle(color: ColorManager.blue, fontSize: 30),))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
