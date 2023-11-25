import 'package:flutter/material.dart';

Color backgroundColor = const Color.fromARGB(137, 93, 88, 88);
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

TextStyle titleStyle =
    const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20);

TextStyle categoryStyle =
    const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17);

TextStyle priceStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 15);

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
    return Column(
      children: [
        SizedBox(
          height: 200,
         width: 200,
          child: Image.network(imageUrl, fit: BoxFit.fill,)),
        Text(productTitle),
        
      ],
    );
  }
}
