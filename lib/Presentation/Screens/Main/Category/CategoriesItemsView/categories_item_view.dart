import 'package:flutter/material.dart';
import '../../../../Resources/color_manager.dart';
import '../../../../Resources/variables.dart';

class CategoriesItemsView extends StatefulWidget {
  final String itemName;
  const CategoriesItemsView({required this.itemName, Key? key})
      : super(key: key);

  @override
  State<CategoriesItemsView> createState() => _CategoriesItemsViewState();
}

class _CategoriesItemsViewState extends State<CategoriesItemsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorManager.white1,
              size: 30,
            )),
        backgroundColor: ColorManager.black1,
        title: Text(widget.itemName,
            style: TextStyle(
              color: ColorManager.white,
            )),
        actions: [
          IconButton(
            onPressed: () {
              //Navigator.pop(context);
            },
            icon: const Icon(Icons.shopping_cart_outlined, size: 28),
            color: ColorManager.grey2,
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 1,
          ),
          Container(
              height: 70,
              color: ColorManager.white,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 70,
                          color: ColorManager.black1,
                          child: Icon(Icons.widgets,
                              color: ColorManager.white, size: 30))),
                  const SizedBox(
                    width: 1,
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: ColorManager.black1,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Popularity".toUpperCase(),
                                  style: TextStyle(
                                      color: ColorManager.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                              Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: ColorManager.white1,
                              )
                            ],
                          ),
                        ),
                      )),
                  const SizedBox(
                    width: 1,
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: ColorManager.black1,
                        child: Center(
                          child: Text("Filters".toUpperCase(),
                              style: TextStyle(
                                  color: ColorManager.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                        ),
                      )),
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: SizedBox(
              width: double.infinity,
              height: 800,
              child: GridView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 380,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, i) {
                    return GridTile(
                        child: InkWell(
                      onTap: () {},
                      child: Container(
                        //width: 200,
                        height: 200,
                        color: ColorManager.white,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 15,
                              top: 5,
                              child: Image(
                                  width: 190,
                                  height: 210,
                                  fit: BoxFit.fill,
                                  image: AssetImage(gridImages[i])),
                            ),
                            Positioned(
                                bottom: 130,
                                left: 15,
                                child: Text(
                                  gridTexts[i],
                                  softWrap: true,
                                  style: TextStyle(
                                      color: ColorManager.white1,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                )),
                            Positioned(
                                bottom: 100,
                                left: 15,
                                child: Text(prices[i],
                                    softWrap: true,
                                    style: TextStyle(
                                        color: ColorManager.black0,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w900))),
                            Positioned(
                              bottom: 85,
                              left: 15,
                              child: SizedBox(
                                width: 130,
                                height: 10,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(right: 12),
                                        width: 10,
                                        height: 3,
                                        child: Icon(
                                          Icons.star,
                                          color: ColorManager.splash,
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 15,
                              child: RawMaterialButton(
                                fillColor: ColorManager.splash,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 35),
                                onPressed: () {},
                                child: Text(
                                  "ADD TO CART",
                                  style: TextStyle(
                                      color: ColorManager.white2, fontSize: 20),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
