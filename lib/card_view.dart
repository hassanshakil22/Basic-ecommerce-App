import 'dart:ffi';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  bool isExpanded = false;
  bool isFavourite = false;
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
                "assets/images/apple card.png",
              ),
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  "Natural Red Apple",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    isFavourite = !isFavourite;
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
          const Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "1kg,Price",
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
                    onPressed: () {},
                    icon: const Icon(Icons.remove),
                    iconSize: 25,
                  ),
                  Card(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      child: Text(
                        "1",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    iconSize: 25,
                  ),
                ],
              ),
              const Spacer(),
              Container(
                  margin: EdgeInsets.only(right: 8),
                  child: const Text(
                    "\$4,99",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ],
          ), //add to cart icon
          const Column(
            children: [
              Row(
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: ExpandableText(
                  "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
                  expandText: "read more",
                  collapseText: "show Less",
                ),
              )
            ],
          ) //product detail column
          ,
        ],
      ), //main body column
    );
  }
}
