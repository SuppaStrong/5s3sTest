import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final int price;
  final GestureTapCallback onTap;

  const FoodCard({
    Key? key,
    required this.imagePath,
    required this.productName,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 280,
            height: 200,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(254, 254, 254, 1),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(27, 50, 95, 0.08),
                  offset: Offset(0, 8),
                  blurRadius: 30,
                )
              ],
            ),
            child: Stack(children: [
              Positioned.fill(
                child: FittedBox(
                    fit: BoxFit.contain, child: Image.network(imagePath)),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          productName,
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "\$$price.00",
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ))
            ]),
          ),
          // Text(
          //   productName,
          //   style: const TextStyle(
          //       overflow: TextOverflow.ellipsis,
          //       fontSize: 14,
          //       fontWeight: FontWeight.w500,
          //       color: Color.fromRGBO(51, 51, 51, 1)),
          // ),
          // Text(
          //   "\$$price",
          //   style: const TextStyle(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w500,
          //       color: Color.fromRGBO(130, 130, 130, 1)),
          // ),
        ],
      ),
    );
  }
}
