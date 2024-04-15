import 'package:ecommerce/cart_card.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return CartCard(
                title: "organic Bananas",
                quantity: "12pcs,price",
                imgPath: "assets/images/banana.png",
                price: 4.99);
          },
        ));
  }
}
