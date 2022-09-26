import 'package:flutter/material.dart';
import 'package:jumia/Presentation/Resources/color_manager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.halfTriangleDot(
            color: ColorManager.splash, size: 50));
  }
}
