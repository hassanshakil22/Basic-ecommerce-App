import 'package:toast/toast.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:givestarreviews/givestarreviews.dart';
import 'package:ecommerce/data.dart';

class CardView extends StatefulWidget {
  final int id;
  final String imagePath;
  final String title;
  final String quantity;
  final num price;
  final String productDetail;
  final int index;

  const CardView({
    super.key,
    required this.imagePath,
    required this.title,
    required this.quantity,
    required this.price,
    required this.productDetail,
    required this.id,
    required this.index,
  });

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  bool isExpanded = false;
  bool isFavourite = false;
  bool isPressedNutrition = false;
  bool isPressedreview = false;

  @override
  Widget build(BuildContext context) {
    int cardAddition = products[widget.index]['selected'];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, widget.index);
          },
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.ios_share_sharp))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.white),

              height: 250,
              width: double.infinity,
              // color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      // isFavourite = !isFavourite;

                      if (products[widget.index]["is_favourite"] == false) {
                        favourites.add(products[widget.index]);
                        isFavourite = true;
                        products[widget.index]["is_favourite"] = true;
                      } else {
                        favourites.remove(products[widget.index]);
                        isFavourite = false;

                        products[widget.index]["is_favourite"] = false;
                      }
                      setState(() {});
                    },
                    icon: products[widget.index]["is_favourite"]
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_border,
                          ))
              ],
            ), //title row
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    widget.quantity,
                    style: const TextStyle(fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ), //Row widget for price and rating
            Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (cardAddition > 1) {
                          cardAddition--;
                          products[widget.index]['selected'] = cardAddition;
                          setState(() {});
                        }
                      },
                      icon: const Icon(Icons.remove),
                      iconSize: 25,
                    ),
                    Card(
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Text(
                          cardAddition.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        cardAddition++;
                        products[widget.index]['selected'] = cardAddition;
                        setState(() {});
                      },
                      icon: const Icon(Icons.add),
                      iconSize: 25,
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: Text(
                      "\$${widget.price}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )),
              ],
            ), //add to cart icon
            Column(
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Product detail",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ExpandableText(
                    widget.productDetail,
                    expandText: "read more",
                    collapseText: "show Less",
                  ),
                )
              ],
            ) //product detail column
            ,
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Nutrition",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const Spacer(),
                      const Text(
                        "100gr",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 10),
                      ),
                      IconButton(
                          onPressed: () {
                            isPressedNutrition = !isPressedNutrition;

                            setState(() {});
                          },
                          icon: isPressedNutrition
                              ? const Icon(Icons.arrow_back_ios_new)
                              : const Icon(Icons.arrow_forward_ios))
                    ],
                  ), //nutrition
                  Row(
                    children: [
                      const Text(
                        "Review",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const Spacer(),
                      StarRating(
                        onChanged: (rate) {},
                      ),
                      IconButton(
                          onPressed: () {
                            isPressedreview = !isPressedreview;

                            setState(() {});
                          },
                          icon: isPressedreview
                              ? const Icon(Icons.arrow_back_ios_new)
                              : const Icon(Icons.arrow_forward_ios))
                    ],
                  )
                ],
              ),
            ), //   nutrition/review column
            FloatingActionButton.extended(
              onPressed: () {
                if (cart.any((element) => element == products[widget.index])) {
                  Toast.show(
                    "already Added to Cart",
                    duration: Toast.lengthShort,
                    gravity: Toast.bottom,
                  );
                } else {
                  cart.add(products[widget.index]);

                  Toast.show(
                    "Added to Cart",
                    duration: Toast.lengthShort,
                    gravity: Toast.bottom,
                  );
                  // print(cart);
                }
              },
              backgroundColor: const Color.fromARGB(200, 83, 177, 117),
              label: Container(
                width: 250,
                child: const Center(
                  child: Text(
                    "Add to Basket",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              elevation: 0,
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ), //main body column
    );
  }
}
