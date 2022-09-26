import 'package:flutter/material.dart';

import '../Presentation/Resources/constants.dart';
class StackContainer extends StatelessWidget {
  const StackContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Image(image: AssetImage(ImageConstants.rec4)),
        Positioned(
          right: 0,
          child: Image(
              width: 85,
              fit: BoxFit.fitHeight,
              image: AssetImage(
                ImageConstants.rec9,
              )),
        ),
        Positioned(
          right: 0,
          bottom: -20,
          child: Image(
              width: 175,
              height: 167,
              image: AssetImage(
                ImageConstants.image3,
              )),
        ),
        Positioned(
          left: 10,
          top: 0,
          child: Image(
              width: 181,
              image: AssetImage(
                ImageConstants.group2,
              )),
        ),
        Positioned(
          left: 10,
          top: 90,
          child: Image(
              width: 199,
              image: AssetImage(
                ImageConstants.thousand,
              )),
        ),
        Positioned(
          left: 0,
          bottom: 15,
          child: Image(
              width: 186,
              height: 22,
              image: AssetImage(
                ImageConstants.rec8,
              )),
        ),
        Positioned(
          left: 10,
          bottom: 21,
          child: Image(
              width: 151,
              image: AssetImage(
                ImageConstants.just,
              )),
        ),
      ],
    );
  }
}
