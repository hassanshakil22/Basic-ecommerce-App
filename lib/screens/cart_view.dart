import 'package:ecommerce/data.dart';
import 'package:ecommerce/widgets/bottom_navigation_bar.dart';

import 'package:ecommerce/widgets/cart_card.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  void _removeItem(int index) {
    setState(() {
      cart.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return CartCard(
                  index: index,
                  id: cart[index]["id"],
                  productdetail: cart[index]["description"],
                  baraname: cart[index]["Bara_name"],
                  title: cart[index]["name"],
                  quantity: cart[index]["quantity"],
                  imgPath: cart[index]["imagesrc"],
                  price: cart[index]["price"],
                  removeItem: _removeItem,
                );
              },
            ),
          ),
          BottomNavigationbar(),
        ],
      ),
    );
  }
}
