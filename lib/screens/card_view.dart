import 'dart:ffi';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:givestarreviews/givestarreviews.dart';
import 'package:ecommerce/data.dart';
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
  int cardAddition = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.ios_share_sharp))
        ],
      ),
      body: Column(
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
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
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
                      // products[widget.index]["is_favourite"] = false ;
                      favourites.remove(products[widget.index]);
                      isFavourite = false;

                      products[widget.index]["is_favourite"] = false;
                    }
                    print(favourites);
                    print(products);
                    setState(() {});
                  },
                  icon: isFavourite
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
                  style: TextStyle(fontWeight: FontWeight.w300),
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
                      child: Text(
                        cardAddition.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cardAddition++;
                      setState(() {});
                    },
                    icon: const Icon(Icons.add),
                    iconSize: 25,
                  ),
                ],
              ),
              const Spacer(),
              Container(
                  margin: EdgeInsets.only(right: 8),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: ExpandableText(
                  widget.productDetail,
                  expandText: "read more",
                  collapseText: "show Less",
                ),
              )
            ],
          ) //product detail column
          ,
          SizedBox(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Spacer(),
                    const Text(
                      "100gr",
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
                    ),
                    IconButton(
                        onPressed: () {
                          isPressedNutrition = !isPressedNutrition;

                          setState(() {});
                        },
                        icon: isPressedNutrition
                            ? Icon(Icons.arrow_back_ios_new)
                            : Icon(Icons.arrow_forward_ios))
                  ],
                ), //nutrition
                Row(
                  children: [
                    const Text(
                      "Review",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Spacer(),
                    StarRating(
                      onChanged: (rate) {},
                    ),
                    IconButton(
                        onPressed: () {
                          isPressedreview = !isPressedreview;

                          setState(() {});
                        },
                        icon: isPressedreview
                            ? Icon(Icons.arrow_back_ios_new)
                            : Icon(Icons.arrow_forward_ios))
                  ],
                )
              ],
            ),
          ), //   nutrition/review column
          FloatingActionButton.extended(
            onPressed: () {},
            backgroundColor: Color.fromARGB(200, 83, 177, 117),
            label: Container(
              width: 250,
              child: Center(
                child: const Text(
                  "Add to Basket",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            elevation: 0,
          )
        ],
      ), //main body column
    );
  }
}
