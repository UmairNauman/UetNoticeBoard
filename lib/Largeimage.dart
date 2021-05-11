import 'package:flutter/material.dart';

class LargeImage extends StatelessWidget {
  final String image;
  LargeImage(this.image);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Hero(tag: 'image', child: Image.network(image)),
      ),
    );
  }
}
