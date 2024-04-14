import 'package:ecommerce/card_view.dart';
import 'package:flutter/material.dart';

class HomeCards extends StatefulWidget {
  final String title;
  final String quantity;
  final num price;
  final String sourceImage;
// ------------------
// cardview parameters (extra ones)
  final String cardImagePath;
  final String cardTitle;
  final String productDetail;

  const HomeCards(
      {super.key,
      required this.title,
      required this.price,
      required this.sourceImage,
      required this.quantity,
      required this.cardImagePath,
      required this.cardTitle,
      required this.productDetail});
  @override
  State<HomeCards> createState() => _HomeCardsState();
}

class _HomeCardsState extends State<HomeCards> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CardView(
                      imagePath: widget.cardImagePath,
                      price: widget.price,
                      productDetail: widget.productDetail,
                      quantity: widget.quantity,
                      title: widget.cardTitle,
                    )));
      },
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 80,
                  width: 100,
                  child: Image.asset(
                    widget.sourceImage,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 18),
                ),
              ),
              Text(widget.quantity),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.price} ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Icon(Icons.add),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(200, 83, 177, 117),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
