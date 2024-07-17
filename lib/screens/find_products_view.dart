import 'package:ecommerce/data.dart';
import 'package:ecommerce/widgets/bottom_navigation_bar.dart';
import 'package:ecommerce/widgets/find_products_card.dart';
import 'package:ecommerce/widgets/home_card.dart';
import 'package:flutter/material.dart';

class FindProductsView extends StatefulWidget {
  const FindProductsView({super.key});

  @override
  State<FindProductsView> createState() => _FindProductsViewState();
}

class _FindProductsViewState extends State<FindProductsView> {
  TextEditingController searchFieldController = TextEditingController();
  List<Map<String, dynamic>> filteredProducts = products;
  FocusNode searchFocusNode = FocusNode();

  void filterProducts(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredProducts = products;
      });
    } else {
      setState(() {
        filteredProducts = products.where((product) {
          return product['name'].toLowerCase().contains(query.toLowerCase());
        }).toList();
      });
    }
  } // sets the products equal to the filtered products

  @override
  void initState() {
    super.initState();
    searchFocusNode.requestFocus();
    searchFieldController.addListener(() {
      filterProducts(searchFieldController
          .text); // listens constantly to the filterproduct function i made
    });
  }

  @override
  void dispose() {
    searchFieldController.dispose();
    searchFocusNode.dispose(); // Dispose of FocusNode
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
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
              focusNode: searchFocusNode,
              decoration: const InputDecoration(
                  icon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: "Search store"),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) => HomeCards(
                      id: filteredProducts[index]["id"],
                      title: filteredProducts[index]["name"],
                      price: filteredProducts[index]["price"],
                      sourceImage: filteredProducts[index]["imagesrc"],
                      quantity: filteredProducts[index]["quantity"],
                      cardTitle: filteredProducts[index]["Bara_name"],
                      productDetail: filteredProducts[index]["description"],
                      index: index,
                    ),
                  ),
                ),
                Padding(
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
                              ImgPath:
                                  "assets/images/findproductimages/dairy.png",
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
                      ),
                      //third
                    ],
                  ),
                ),
              ],
            ), //scrollable column
          )),
          BottomNavigationbar()
        ],
      ), //main body column
    );
  }
}
