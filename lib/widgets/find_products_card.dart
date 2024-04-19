import 'package:flutter/material.dart';

class FindProductCard extends StatefulWidget {
  final String ImgPath;
  final String title;
  final Color bordercolor;
  final Color maincolor;

  const FindProductCard(
      {super.key,
      required this.ImgPath,
      required this.title,
      required this.bordercolor,
      required this.maincolor});

  @override
  State<FindProductCard> createState() => _FindProductCardState();
}

class _FindProductCardState extends State<FindProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: SizedBox(
        width: 180,
        child: Card(
          color: widget.maincolor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: widget.bordercolor,
                width: 1.0), // Set border color and width
            borderRadius: BorderRadius.circular(10.0), // Set border radius
          ),
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              children: [
                Container(
                  width: 130,
                  height: 100,
                  child: Image.asset(
                    widget.ImgPath,
                    scale: 0.5,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    width: 130,
                    child: Text(
                      widget.title,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    )),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
