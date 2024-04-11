import 'package:ecommerce/home_card_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController searchFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  size: 20,
                ),
                Text("Karachi,Pakistan")
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
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
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          elevation: 1,
                          shadowColor: Colors.black45,
                          child: Image.asset(
                              'assets/images/home page vegitables.png'),
                        ),
                        Card(
                          color: Colors.amber,
                          elevation: 1,
                          shadowColor: Colors.black45,
                          child: Image.asset(
                              'assets/images/home page vegitables.png'),
                        ),
                        Card(
                          color: Colors.amber,
                          elevation: 1,
                          shadowColor: Colors.black45,
                          child: Image.asset(
                              'assets/images/home page vegitables.png'),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Exclusive Offers",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "See all",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 23, 122, 27)),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: 250,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            const HomeCards(
                              price: 4.99,
                              title: "Bananas",
                              sourceImage: "assets/images/banana.png",
                              quantity: "12pcs",
                            ),
                            const HomeCards(
                              price: 5.99,
                              title: "Apples",
                              sourceImage: "assets/images/appleImage.png",
                              quantity: "1kg",
                            ),
                            HomeCards(
                                title: "garlic",
                                price: 10.05,
                                sourceImage: "assets/images/garlic.png",
                                quantity: "1Kg")
                          ],
                        ),
                      )
                    ],
                  ),
                  // ------------------------ exclusive offer column

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Best Selling",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "See all",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 23, 122, 27)),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: 250,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            const HomeCards(
                              price: 4.99,
                              title: "Bananas",
                              sourceImage: "assets/images/banana.png",
                              quantity: "12pcs",
                            ),
                            const HomeCards(
                              price: 5.99,
                              title: "Apples",
                              sourceImage: "assets/images/appleImage.png",
                              quantity: "1kg",
                            ),
                            HomeCards(
                                title: "garlic",
                                price: 10.05,
                                sourceImage: "assets/images/garlic.png",
                                quantity: "1Kg")
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ), //scrollable content
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.manage_search_rounded, size: 30),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined, size: 30),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border_outlined, size: 30),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.account_circle_outlined, size: 30),
                ),
              ],
            ),
          )
        ],
      ), //body parent column
    );
  }
}
