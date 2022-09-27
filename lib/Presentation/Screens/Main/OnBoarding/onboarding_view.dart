import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jumia/Presentation/Resources/color_manager.dart';
import 'package:jumia/Presentation/Resources/constants.dart';
import 'package:jumia/Presentation/Resources/route_manager.dart';
import '../../../../Widgets/stack_container.dart';
import '../../../Resources/variables.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int dotIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: ColorManager.black1,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: ColorManager.white,
              hintText: "Search On Jumia",
              prefixIcon: Icon(
                Icons.search,
                color: ColorManager.black1,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteManager.camera);
                },
                icon: const Icon(Icons.camera_alt_outlined),
                color: ColorManager.black1,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: ColorManager.grey2,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 45,
              color: ColorManager.red,
              child: const Center(
                  child: Image(
                width: 300,
                height: 80,
                image: AssetImage(ImageConstants.freeDelivery),
              )),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 220,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (context, index, pageIndex) {
                        dotIndex = index;

                        return const SizedBox(
                          height: 180,
                          child: StackContainer(),
                        );
                      },
                      options: CarouselOptions(
                          initialPage: dotIndex,
                          autoPlay: true,
                          height: 180,
                          viewportFraction: .70)),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 70,
                    height: 10,
                    child: Center(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Container(
                                width: 10,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: (index == dotIndex)
                                      ? ColorManager.splash
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 170,
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: images1.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                child: Image(
                              image: AssetImage(
                                images1[i],
                              ),
                              width: 105,
                              height: 105,
                              fit: BoxFit.cover,
                            )),
                            SizedBox(
                              height: (i == 1) ? 5 : 10,
                            ),
                            SizedBox(
                                height: (i == 1) ? 21 : 12,
                                width: (i == 1) ? 90 : 74,
                                child: Image(
                                    height: 30, image: AssetImage(texts[i]))),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 56.8,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(ImageConstants.rec15),
                  Positioned(
                      top: -60,
                      left: 10,
                      child: Image.asset(
                        ImageConstants.group5,
                        width: 42,
                        height: 170,
                      )),
                  Positioned(
                      top: 7,
                      left: 20 * 3,
                      child: Image.asset(
                        ImageConstants.sales,
                        width: 175,
                        height: 17,
                      )),
                  Positioned(
                      top: 27,
                      left: 20 * 3,
                      child: Image.asset(
                        ImageConstants.timeLeft,
                        width: 155,
                        height: 17,
                      )),
                  Positioned(
                      top: 7,
                      right: 3,
                      child: Image.asset(
                        ImageConstants.seeAll,
                        width: 80,
                        height: 12,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: ColorManager.white,
              width: double.infinity,
              height: 300,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                  itemCount: images2.length,
                  itemBuilder: (context, i) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Image(
                          fit: BoxFit.fill,
                            height: 180,
                            width: 170,
                            image: AssetImage(images2[i])),
                        ),
                        Image(
                            height: 30,
                            width: (i == 2) ? 100: 150,
                            image: AssetImage(images3[i])),
                        Image(
                            height: 30,
                            width: 60,
                            image: AssetImage(images4[i])),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorManager.red,
        child: Image.asset(ImageConstants.gift),
      ),
    );
  }
}
