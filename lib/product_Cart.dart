import 'package:flutter/material.dart';
class ProductCart extends StatelessWidget {
  // assigning the value of cart
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;


  const ProductCart({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundColor, // constructor

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),


      ),

      margin:const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 5),
            Text(
              '\$$price',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 5),
            Center(
                child: Image.asset(image, height: 175)),

          ],
        ),
      ),
    );
  }
}

