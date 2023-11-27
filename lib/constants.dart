import 'package:flutter/material.dart';

Color backgroundColor = Color.fromARGB(78, 0, 0, 0);
Color boxColor = const Color.fromARGB(255, 255, 255, 255);

PreferredSizeWidget? app_Bar(String title) {
  return AppBar(
    backgroundColor: backgroundColor,
    title: Text(title),
    centerTitle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
    ),
  );
}

TextStyle titleStyle = const TextStyle(
    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20);

TextStyle categoryStyle = const TextStyle(
    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17);

TextStyle priceStyle =
const TextStyle(fontWeight: FontWeight.bold, fontSize: 15);

class productCard extends StatelessWidget {
  String imageUrl;
  String productTitle;
  String category;
  dynamic price;
  productCard({
    super.key,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.productTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        clipBehavior: Clip.hardEdge,
        decoration:  BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
            borderRadius: BorderRadius.all(Radius.circular(20))),
        height: 180,
        width: 180,
        child: ClipRect(
          child: Material(
            shadowColor: Colors.black,
            elevation: 100,
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
              isAntiAlias: true,
            ),
          ),
        ));
  }
}
