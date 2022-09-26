import 'package:flutter/material.dart';
import 'package:jumia/Presentation/Resources/color_manager.dart';

import '../../../Resources/variables.dart';
import 'CategoriesItemsView/categories_item_view.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.black1,
        centerTitle: true,
        title: Text("Categories",
            style: TextStyle(
              color: ColorManager.white,
            )),
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: GridView.builder(
              itemCount: colors.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 100,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemBuilder: (context, i) {
                return GridTile(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => CategoriesItemsView(
                                      itemName: gridText[i],
                                    )));
                  },
                  child: Container(
                      width: 200,
                      height: 200,
                      color: colors[i],
                      child: Center(
                          child: Text(
                        gridText[i],
                        style:
                            TextStyle(color: ColorManager.white, fontSize: 20),
                      ))),
                ));
              }),
        ),
      ),
    );
  }
}
