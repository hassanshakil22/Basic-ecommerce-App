import 'package:ecommerce/screens/cart_view.dart';
import 'package:ecommerce/screens/find_products_view.dart';
import 'package:flutter/material.dart';

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({super.key});

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(elevation: 0),
          child: const Icon(
            Icons.home_outlined,
            size: 30,
            color: Colors.black,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FindProductsView()));
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
          ),
          child: const Icon(
            Icons.manage_search_rounded,
            size: 30,
            color: Colors.black,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
          },
          style: ElevatedButton.styleFrom(elevation: 0),
          child: const Icon(
            Icons.shopping_cart_outlined,
            size: 30,
            color: Colors.black,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(elevation: 0),
          child: Icon(
            Icons.favorite_border_outlined,
            size: 30,
            color: Colors.black,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(elevation: 0),
          child: const Icon(
            Icons.account_circle_outlined,
            size: 30,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
