import 'package:ecommerce/data.dart';
import 'package:ecommerce/screens/card_view.dart';
import 'package:flutter/material.dart';

class CartCard extends StatefulWidget {
  final String title;
  final String quantity;
  final String imgPath;
  final num price;
  final String baraname;
  final String productdetail;
  final int id;
  final int index;
  final Function(int) removeItem;
  const CartCard({
    super.key,
    required this.title,
    required this.quantity,
    required this.imgPath,
    required this.price,
    required this.baraname,
    required this.productdetail,
    required this.id,
    required this.index,
    required this.removeItem,
  });

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    int cardAddition = products[widget.index]['selected'];

    return Card(
      child: GestureDetector(
        onTap: () async {
          final updatedIndex = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => CardView(
                    imagePath: widget.imgPath,
                    title: widget.baraname,
                    quantity: widget.quantity,
                    price: widget.price,
                    productDetail: widget.productdetail,
                    id: widget.id,
                    index: widget.index,
                  )),
            ),
          );
          if (updatedIndex != null) {
            setState(() {});
          }
        },
        child: Container(
          height: 130,
          color: Colors.white,
          child: Row(
            children: [
              Container(
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.all(10),
                  child: Image.asset(widget.imgPath)),
              Column(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    widget.quantity,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (cardAddition > 1) {
                              setState(() {
                                cardAddition--;
                                products[widget.index]['selected'] =
                                    cardAddition;
                              });
                            }
                          },
                          icon: const Icon(Icons.remove),
                          iconSize: 20,
                        ),
                        Card(
                          elevation: 0,
                          color: Colors.white,
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            child: Text(
                              cardAddition.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              cardAddition++;
                              products[widget.index]['selected'] = cardAddition;
                            });
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Color.fromARGB(200, 83, 177, 117),
                          ),
                          iconSize: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ), //detail column
              Spacer(),
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.removeItem(widget.index);
                          products[widget.index]['selected'] = 0;
                        });
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey,
                      )),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " \$${widget.price}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  )
                ],
              ), //last column
            ],
          ), //main row
        ),
      ), //main container
    );
  }
}
