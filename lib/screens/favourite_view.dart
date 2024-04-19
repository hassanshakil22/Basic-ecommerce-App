import 'package:flutter/material.dart';
import 'package:ecommerce/data.dart';
import 'package:ecommerce/screens/card_view.dart';

class FavouriteView extends StatefulWidget {
  // final Map product;
  const FavouriteView({
    super.key,
  });

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text("Favourites", style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: favourites.length,
          itemBuilder: (context, index) => Card(
              child: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CardView(
                          id: favourites[index]["id"],
                          imagePath: favourites[index]["imagesrc"],
                          index: index,
                          price: favourites[index]["price"],
                          productDetail: favourites[index]["description"],
                          quantity: favourites[index]["quantity"],
                          title: favourites[index]["Bara_name"],
                        ))),
            child: Container(
                height: 100,
                color: Colors.white,
                child: Row(children: [
                  Container(
                      height: 80,
                      width: 80,
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        favourites[index]["imagesrc"],
                        width: 30.91,
                        height: 54.9,
                      )),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          favourites[index]["name"],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          favourites[index]["quantity"],
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                  Spacer(),
                  Text(
                    "\$${favourites[index]["price"].toString()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {
                        favourites.removeAt(index);
                        print(favourites);
                        setState(() {});
                      },
                      icon: Icon(Icons.close))
                ])),
          )),
        ));
  }
}
