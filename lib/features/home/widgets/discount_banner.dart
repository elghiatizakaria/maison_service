import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20
      ),
      width: double.infinity,
      //height: 90,
      decoration: BoxDecoration(
        color: Colors.blue,//Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          text: "Offres specials\n",
          style: TextStyle(color: Colors.white, height: 1.3),
          children: [
            TextSpan(
              text: "Reduction 20%",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            
            )
          ]
        ),
      ),
    );
  }
}