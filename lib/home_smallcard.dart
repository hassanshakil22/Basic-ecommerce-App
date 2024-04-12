import 'package:flutter/material.dart';

class SmallCard extends StatefulWidget {
  final String sourceImage;
  final String title;

  const SmallCard({super.key, required this.sourceImage, required this.title});

  @override
  State<SmallCard> createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                widget.sourceImage,
              ),
            ),
            Text(widget.title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      ),
    );
  }
}
