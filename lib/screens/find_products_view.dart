import 'package:ecommerce/bottom_navigation_bar.dart';
import 'package:ecommerce/find_products_card.dart';
import 'package:flutter/material.dart';

class FindProductsView extends StatelessWidget {
  const FindProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchFieldController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Find Products",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchFieldController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: "Search store"),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      FindProductCard(
                        ImgPath:
                            "assets/images/findproductimages/freshfruits&veggies.png",
                        title: "Fresh Fruits & Vegitables",
                        bordercolor: Color.fromARGB(
                          100,
                          83,
                          177,
                          117,
                        ),
                        maincolor: Color.fromARGB(
                          50,
                          83,
                          177,
                          117,
                        ),
                      ),
                      FindProductCard(
                        ImgPath:
                            "assets/images/findproductimages/cookingoil.png",
                        title: "Cooking Oil & Ghee",
                        bordercolor: Color.fromARGB(
                          200,
                          248,
                          164,
                          76,
                        ),
                        maincolor: Color.fromARGB(50, 248, 164, 76),
                      )
                    ],
                  ), //first
                  Row(
                    children: [
                      FindProductCard(
                          ImgPath:
                              "assets/images/findproductimages/meat&fish.png",
                          title: "Meat & Fish",
                          bordercolor: Color.fromARGB(200, 247, 165, 147),
                          maincolor: Color.fromARGB(50, 247, 165, 147)),
                      FindProductCard(
                          ImgPath:
                              "assets/images/findproductimages/bakery&snacks.png",
                          title: "Bakery & Snacks",
                          bordercolor: Color.fromARGB(200, 211, 176, 224),
                          maincolor: Color.fromARGB(50, 211, 176, 224))
                    ],
                  ), //secod
                  Row(
                    children: [
                      FindProductCard(
                          ImgPath: "assets/images/findproductimages/dairy.png",
                          title: "Dairy & Eggs",
                          bordercolor: Color.fromARGB(200, 253, 229, 152),
                          maincolor: Color.fromARGB(50, 253, 229, 152)),
                      FindProductCard(
                          ImgPath:
                              "assets/images/findproductimages/beverages.png",
                          title: "Beverages",
                          bordercolor: Color.fromARGB(200, 183, 223, 245),
                          maincolor: Color.fromARGB(50, 183, 223, 245))
                    ],
                  ), //third
                ],
              ),
            ), //scrollable column
          )),
          BottomNavigationbar()
        ],
      ), //main body column
    );
  }
}
